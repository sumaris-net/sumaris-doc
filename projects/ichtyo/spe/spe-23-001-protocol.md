# Cas d'utilisation

## Documentation

- [Documentation Gwaleen](https://github.com/aptatio/gwaleen-docs)

---

## CU 1 - Saisie depuis SUMARiS Android, sans l'App Gwaleen

1. L'utilisateur lance SUMARiS Android
2. SUMARiS se connecte à la règle
3. SUMARiS récupère : 
  - niveau de batterie (commande `&q#`)
  - metadonnées (nom de la règle, sa version)
    * TODO - à valider (stockage ?) 
4. L'utilisateur effectue une mesure sur la règle
5. SUMARiS réceptionne la valeur (et bip), et actualise le tableau de saisie
6. L'utilisateur valide les mesures
7. SUMARiS se déconnecte (à valider)

> cf tableau des commandes (bluetooth serial)
> ex: `&q#` pour charge de batterie
> 
> Format de réponse : `%q:<response>,0#` avec `<response>` la charge utile (entier unsigned, format string)

---

## CU 2 - Saisie depuis SUMARiS, via l'App Gwaleen

1. L'utilisateur lance SUMARiS
2. SUMARiS ouvre l'App Gwaleen :
 - Prépare le protocole de saisie
 - Ouvrir l'URI : 
   * https://gwaleen.aptatio.com/<command>?<queryParams>
    > URI command :
    > - `/configure?`
    >   * `protocol=<serialize_protocol | protocol_file_uri>`
    >   * `callback_uri=<URI_CALLBACK>` : `?response=<serialize_response>`

 - Partage Android (Share Intent), avec un fichier (MIME_TYPE `application/ichthyometer`)
   * L'App Gwaleen doit declaré ce mime type
 - Intent Android : plus complexe car plusieurs version de l'App

3. L'utilisateur saisie dans Gwaleen

---

### Format protocol `application/ichthyometer`

Format `json`

```
[
    {
        id: 'discard_or_landing'
        type: 'enum',
        values: [
            {id: 'LAN', label: 'Landing'},
            {id: 'DIS', label: 'Discard'}
        ]
    },
    {
        id: 'taxonGroup'
        type: 'enum',
        values: [
            {id: '1', label: 'Lophius budegassa'},
            {id: '2', label: 'Lophius piscatorius'}
        ]
    },
    {
        id: 'length'
        type: 'integer',
        min: 0,
        max: 100
    },
    {
        id: 'discard_reason'
        type: 'enum',
        multiple: true,
        values: [
            {id: '1', label: 'out of size'},
            {id: '2', label: 'not saleable'}
        ],
        rules: // ... if 'discard_or_landing' = 'discard'
    },
    {
        id: 'dead_or_alive'
        type: 'enum',
         values: [
            {id: 'true', label: 'True'},
            {id: 'false', label: 'False'}
        ],
        rules: // ... depending on 'taxonGroup' value
    },
]
```

type : 'integer'|'string'|'enum'|'photo'|'timestamp'|'gps'

- timestamp: string ISO8601
- gps: `[lat,lon]`
- enum: `<id>`

Validation du fichier : par JSON-schema ?

Rules (v2) :
 - precondition: true/false
 - children
 - operator (=, in)
 - values

---

## CU 3 - Saisie depuis l'App Gwaleen, via un paramètrage SUMARiS

TODO