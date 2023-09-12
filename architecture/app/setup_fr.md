# App > Configuration de l'environement de développement

## Pré-requis 
### Générer une clef SSH
Sous Windows, dans un terminal Git Bash :
`ssh-keygen -t ed25519 -C "user@domain.com"`

Puis, ajouter le clef publique dans github (settings du compte:  https://github.com/settings/keys) et ajouter une clef SSH en copiant le contenu du fichier ~/.ssh/id_ed25519.pub

### Installer Node JS
Windows :
- <https://nodejs.org/dist/v16.17.0/node-v16.17.0-x64.msi>
- ou <https://nodejs.org/dist/v16.17.0/node-v16.17.0-win-x64.zip>

Linux :
- <https://nodejs.org/dist/v16.17.0/node-v16.17.0-linux-x64.tar.xz>

## Compilation et lancement de l'App (sumaris-app)
Récupérer le projet sous git :
- `git clone https://gitlab.ifremer.fr/sih/sumaris/sumaris-app.git`

Puis, dans le projet sumaris-app, lancer ces commandes:
- `npm install`
- `npm run start`
- Une fois le pod démarré, on peut se connecter sur <http://localhost:4200> (en tant que admin@sumaris.net/admin) en sélectionnant le nœud réseau <http://localhost:8080>
