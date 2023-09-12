# Pod > Development environment setup

## Prerequisites
### Generate an SSH key
On Windows, in a Git Bash terminal:
`ssh-keygen -t ed25519 -C "user@domain.com"`

Then, add the public key to GitHub (account settings:  https://github.com/settings/keys) and add an SSH key by copying the contents of the file ~/.ssh/id_ed25519.pub.

## Compile and Launch

Clone the project from git:
- `git clone https://gitlab.ifremer.fr/sih/sumaris/sumaris-pod.git`
- `cd sumaris-pod`

> Documentation page is available in `/src/site/markdown/pod.md`

Compile the pod:
- `mvn install -DskipTests`
- Watch out for the Java version if a certificate error occurs!

### Launch on HSQLDB Test Database

Start the HSQLDB database:
- Generate the local database (with at least one test): `mvn install -pl sumaris-core`
- Then start it:
    - `cd sumaris-core/src/test/scripts`
    - Run `startServer.bat` on Windows (if an error occurs on "replace", comment out the Copy test DB part)

The database will then be accessible, for example with DBeaver (HSQLDB Server driver): `jdbc:hsqldb:hsql://localhost:9001/sumaris`

Launch the pod:
- `cd sumaris-server`
- `mvn spring-boot:run -Dspring-boot.run.fork=false -Duser.timezone=UTC -Dsumaris.name=IMAGINE` **(don't forget to start the database!)**

### Launch on Oracle Database

- Locally retrieve the desired Oracle property file from the [isi-sih-sumaris](https://gitlab.ifremer.fr/dev_ops/shared_docker_image_factory/isi-sih-sumaris) project (list of property files in the `sumaris-server` directory).
- Execute the command `spring-boot:run -Dspring-boot.run.fork=false -Doracle.net.tns_admin=\\brest\tnsnames -Dspring.config.location=path-to-file\application-test.properties`
<details><summary>previous command</summary>
spring-boot:run -Dspring-boot.run.fork=false -Doracle.net.tns_admin=\\brest\tnsnames -Dspring.config.location=C:\dev\application-test.properties -Dsumaris.name=IMAGiNE -Dspring.profiles.active=oracle -Duser.timezone=UTC -Doracle.jdbc.timezoneAsRegion=false -Dspring.security.ldap.enabled=true -Dspring.security.ldap.baseDn=ou=directory -Dspring.security.ldap.url=ldap://ldap.ifremer.fr/dc=ifremer,dc=fr
</details>

The server is accessible at <http://localhost:8080>

### From IntelliJ

To install, compile, and run the pod in IntelliJ:
- Start IntelliJ
- Go to "File" > "New" > "Project from version control" > "Git"
- Select `https://gitlab.ifremer.fr/sih/sumaris/sumaris-pod.git`
- The project is automatically created locally with a sub-project structure
- OPTIONAL: for each sub-project, right-click on the pom.xml and select "Add as Maven project"
- Install the Lombok plugin via "File" > "Settings" > "Plugins" to recognize Lombok annotations
- Add a launch configuration in IntelliJ of type Maven with "working directory" set to the parent project folder and execute `install -DskipTests`. Run it.
- Add a launch configuration in IntelliJ of type Maven with "working directory" set to the "sumaris-core" sub-project and execute `install` (WITHOUT skipTests). Run it to compile and execute unit tests to generate the local database.
- Start the local database by:
    - `cd sumaris-core/src/test/scripts`
    - Running `./startServer.bat` (or .bat on Windows, if an error occurs on "replace", comment out the Copy test DB part)
- Add a launch configuration in IntelliJ of type Maven with "working directory" set to the "sumaris-server" sub-project and execute `spring-boot:run -Dspring-boot.run.fork=false -Duser.timezone=UTC -Dsumaris.name=IMAGINE`. Run it.

## Install the Documentation (sumaris-doc)

Clone the project:
- `git clone https://gitlab.ifremer.fr/sih/sumaris/sumaris-doc.git`

Open the sumaris-doc project in IntelliJ and install the PlantUML plugin.

### Install GraphViz:

- Download link: <https://www2.graphviz.org/Packages/stable/windows/10/cmake/Release/x64/>
- Install GraphViz from the downloaded executable
- Open a terminal with admin rights in the directory "C:\Program Files\Graphviz 2.44.1\bin" and run the command `dot.exe -c`
- In IntelliJ, complete the PlantUML settings and fill in the "Graphviz dot executable" field: `C:/Program Files/Graphviz 2.44.1/bin/dot.exe`

### Generate Documentation (svg):
- Execute the `generate.bat` file
