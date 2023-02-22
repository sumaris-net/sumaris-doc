# Spécifications - Cas d'utilisation

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

---

## CU 2 - Saisie depuis SUMARiS, via l'App Gwaleen

1. L'utilisateur lance SUMARiS
2. SUMARiS ouvre l'App Gwaleen :
  - En envoyant le protocole de saisie (cf specification technique)
3. L'utilisateur saisie les mesures dans Gwaleen
4. L'utilisateur valide ses mesures
6. SUMARiS s'actualise les données recues par l'App Gwaleen
5. L'app Gwaleen se ferme

---

## CU 3 - Saisie depuis l'App Gwaleen, qui demande le protocole à SUMARiS

Scénario à priori moins pertinent, car pas de saisie de métadonénes complexes dans l'App Gwaleen (marées, operations, etc).
