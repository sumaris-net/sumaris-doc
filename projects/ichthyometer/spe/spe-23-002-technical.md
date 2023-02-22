# Spécifications techniques
---

## Commandes bluetooth

- Envoi de commandes par `bluetooth serial`
- Liste des commandes: [voir la documentation](https://github.com/aptatio/gwaleen-docs)

> Exemple: 
>  - `&q#` pour charge de batterie
> 
> Format de réponse : 
> - `%q:<response>,0#`
> - `<response>` = charge utile (entier unsigned, en string)

---

## Intents Android pour passer le protocole (1/2) 

- URI (ex: https://gwaleen.aptatio.com/<command>?<queryParams>)

> Exemple de commande :
> - `/configure?`
>   * `protocol=<serialize_protocol | protocol_file_uri>`
>   * `callback_uri=<URI_CALLBACK>` : `?response=<serialize_response>`

---

## Intents Android pour passer le protocole (2/2)

- Via Share Intent, depuis un fichier partagé

> Questions :
> - mime type spécifique ? (ex: `application/ichthyometer`)
> - ou via [json-schema]((www.json-schema.org)) ?

---

## Format d'échange du protocole 

Plusieurs possibilités (à étudier) :
 - Un format de fichier spécifique
 - Utilisation de la norme JSON-schema
 
---

####  Format spécifique (1/3)

- Mime type: `application/ichthyometer` (à valider)
- Format `json`

- Exemple (à valider) :
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

---
####  Format spécifique (2/3)

- type de champ : `'integer'|'string'|'enum'|'photo'|'timestamp'|'gps'`
- valeurs retournées :
  - timestamp: String ISO8601
  - gps: `[lat,lon]`
  - enum: `<id>`

---
####  Format spécifique (3/3)

- règles de contrôle (dans une v2 ?) :
  - precondition: boolean
  - blocking: boolean
  - message: boolean (0..1)
  - children: rules (0..*)
  - operator: `'='|'!='|'>'|'>='|'<'|'<='|'in'|'not in'|'null'|'not null'`
  - values: (0..*)

- validation du fichier de protocole :
    - via un JSON-schema (à écrire)
 
---
#### Utilisation de la norme JSON-Schema

- Documentation : [json-schema.org](https://json-schema.org/)

> Questions : 
> - Valider la faisabilité/complexité de la norme, vis à vis du besoin