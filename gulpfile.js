'use strict';

const gulp = require('gulp'),
  fs = require("fs"),
  useref = require('gulp-useref'),
  filter = require('gulp-filter'),
  uglify = require('gulp-uglify-es').default,
  sourcemaps = require('gulp-sourcemaps'),
  lazypipe = require('lazypipe'),
  gulpif = require('gulp-if'),
  zip = require('gulp-zip'),
  merge = require('merge2'),
  csso = require('gulp-csso'),
  replace = require('gulp-replace'),
  log = require('fancy-log'),
  del = require('del'),
  colors = require('ansi-colors'),
  {argv} = require('yargs'),
  browserSync = require('browser-sync').create(),
  header = require('gulp-header'),
  footer = require('gulp-footer')
;

const uglifyBaseOptions = {
  toplevel: true,
  warnings: true,
  mangle: {
    reserved: ['App']
  },
  compress: {
    global_defs: {
      "@console.log": "alert"
    },
    passes: 2
  },
  output: {
    beautify: false,
    preamble: "/* minified */",
    max_line_len: 120000
  }
};

/* --------------------------------------------------------------------------
   -- Serve
   --------------------------------------------------------------------------*/

const paths = {
  resources: ['src/**/*.md', 'src/images*/**/*', 'src/data*/**/*', 'src/about.html'],
  doc_md: ['user-manual*/**/*.md', 'architecture*/**/*.md', 'model*/**/*.md', 'use-case*/**/*.md'],
  src_html: ['src/**/*.html'],
  src_css: ['src/css/*.css'],
  src_js: ['src/**/*.js'],
  src_layout: ['src/layout/*.html']
};

function watch() {

  // Watch resources
  gulp.watch(paths.resources, appCopyResources);

  // Watch doc md
  gulp.watch(paths.doc_md, appCopyDocResources);

  // Watch JS + html
  gulp.watch([...paths.src_html, ...paths.src_js, ...paths.src_css, ...paths.src_layout], appHtml);
}


function serve(cb) {
  // Launch browser
  browserSync.init({
    watch: true,
    server: "./dist",
    watchOptions: {
      ignoreInitial: true
    }
  });
  cb();
}

/* --------------------------------------------------------------------------
   -- Build the web (ZIP) artifact
   --------------------------------------------------------------------------*/

function parsePackage() {
  return JSON.parse(fs.readFileSync('./package.json', 'utf8'));
}


function appClean() {
  return del([
    'dist/'
  ]);
}
function appCopyResources() {

  log(colors.green('Copy resources files...'));
  // Copy files to dist
  return  gulp.src(paths.resources)
  .pipe(gulp.dest('dist'))
  .pipe(browserSync.stream());
}


function appCopyDocResources() {

  log(colors.green('Copy md files...'));
  // Copy files to dist
  return  gulp.src(paths.doc_md)
      .pipe(gulp.dest('dist'))
      .pipe(browserSync.stream());
}

function appCopyExternalResources() {

  log(colors.green('Copy external resources files...'));
  return merge(

    // Copy files to dist
    gulp.src([
      'node_modules/katex/dist/*fonts/**',
      'node_modules/reveal.js-plugins/menu/menu.css',
      'node_modules/reveal.js-plugins/menu/font-awesome*/**/*'
    ])
    .pipe(gulp.dest('dist')),

    // Copy to dist/lib
    gulp.src([
      'node_modules/reveal.js-plugins/chalkboard/img*/*',
    ])
    .pipe(gulp.dest('dist/lib')),

    // Copy dist/css
    gulp.src([
      'node_modules/reveal.js/dist/theme/fonts/source-sans-pro/**',
      'node_modules/reveal.js/dist/theme*/*.css'
    ])
    .pipe(gulp.dest('dist/css'))
  );
}

function appHtml() {
  const enableUglify = argv.release || argv.uglify || false;
  const pkg = parsePackage();

  log(colors.green('Processing HTML files...'));

  const htmlPaths = [...paths.src_html, '!src/layout/*.*', '!src/about.html'];
  const htmlFilter = filter(htmlPaths, {restore: true});
  const minifiedFiles = [];

  // Process index.html
  return gulp.src(htmlPaths)

    .pipe(header(fs.readFileSync('src/layout/header.html', 'utf8'), {title: pkg.description}))
    .pipe(footer(fs.readFileSync('src/layout/footer.html', 'utf8'), {version: pkg.version}))

    // Concatenate JS and CSS files (using gulp-useref)
    //.pipe(useref())
    .pipe(useref({}, lazypipe().pipe(sourcemaps.init, { loadMaps: true })))

      // Minify JS files
    .pipe(gulpif((file) => {
      if (!enableUglify || !file.path.endsWith('.js') || file.path.endsWith('.min.js')) return false; // Skip
      if (minifiedFiles.includes(file.path)) return false; // Skip: already exists

      minifiedFiles.push(file.path);
      log(colors.grey('Minifying ' + colors.bold(file.path) + '... '));

      file.path = file.path.replace('.js', '.min.js');
      return true;
    }, uglify(uglifyBaseOptions)))

    // Process CSS
    .pipe(gulpif('*.css', csso())) // Minify any CSS sources

    .pipe(htmlFilter)
      // Use minified JS files
    .pipe(gulpif(enableUglify,replace(/"(lib\/[a-zA-Z0-9.]+)\.js"/g, '"$1.min.js"')))
      // Add version to JS files (to force the browser to refresh, after a new version)
    .pipe(replace(/"(lib\/[a-zA-Z0-9.]+)\.js"/g, '"$1.js?v=' + pkg.version + '"'))
    .pipe(replace(/"(css\/default)\.css"/g, '"$1.css" id="theme"'))
    .pipe(replace(/"(css\/[a-zA-Z0-9]+)\.css"/g, '"$1.css?v=' + pkg.version + '"'))
    .pipe(htmlFilter.restore)

    .pipe(sourcemaps.write('maps'))

    .pipe(gulp.dest('dist'))
    .pipe(browserSync.stream());
}


function appZip() {
  const packageObj = parsePackage();
  const projectName = packageObj.name;
  const version = packageObj.version;

  return gulp.src(['dist/**/*.*', '!dist/*.zip'])
    .pipe(zip(projectName + '-v'+version+'.zip'))
    .pipe(gulp.dest('dist'));
}

function buildSuccess(done) {
  const packageObj = parsePackage();
  const projectName = packageObj.name;
  const version = packageObj.version;
  log(colors.green("Archive created at: 'dist/"+ projectName +"-v" + version + ".zip'"));
  if (done) done();
}

function help() {
  log(colors.green("Usage: gulp {clean|build} OPTIONS"));
  log(colors.green(""));
  log(colors.green("NAME"));
  log(colors.green(""));
  log(colors.green("  clean                       Clean build directory"));
  log(colors.green("  build                       Build from sources (HTML, CSS and JS)"));
  log(colors.green(""));
  log(colors.green("OPTIONS"));
  log(colors.green(""));
  log(colors.green("  --release                   Release build (with uglify and sourcemaps)"));
  log(colors.green("  --uglify                    Build using uglify plugin"));
}

/* --------------------------------------------------------------------------
   -- Define public tasks
   --------------------------------------------------------------------------*/

const prepare = gulp.parallel(appCopyResources, appCopyDocResources, appCopyExternalResources);
const compile = gulp.series(prepare, appHtml);
const build = gulp.series(appClean, compile, appZip, buildSuccess);

exports.help = help;
exports.clean = appClean;
exports.build = build;
exports.compile = compile;
exports.serve =  gulp.series(compile, serve, watch)

exports.default = compile;

