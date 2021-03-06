# Cas d'utilisation fonctionnels

## Collecte des données

 - Observations au débarquement (ObdDeb) :
    * [CU Saisir une observation au débarquement](#CU_Saisir_une_observation_au_débarquement)
    * [CU Saisir une marée observée au débarquement](#CU_Saisir_marée_observée_au_débarquement)
    * [CU Saisir des captures débarquées](#CU_Saisir_des_captures_débarquées)
    * [CU Saisir des ventes](#CU_Saisir_des_ventes)
    * [CU Saisir des dépenses](#CU_Saisir_des_dépenses)
    * [CU Saisir un calendrier hebdomadaire](#CU_Saisir_un_calendrier_hebdomadaire)

### CU Saisir une observation au débarquement

![observed-location](landing/observed-location-uc.svg)

Différenciation des donnees principales = donnée chapeau ou racine (observations, fishing trip, weekly report...) 
de celles qui ne le sont pas (effort, capture...):
* 1 observation = terme globale pour indiquer quel est l'observation sans précision
* 1 programme = terme pour préciser quel est la raison de l'observation. Différents 
      écrans sont disponibles selon les programmes

Dans la page principale, un Menu est présent à gauche avec les différentes données chapeaux.
Chaque type de données donne accès :
* à une liste de données déjà saisies et 
* à un bouton "+" permettant de saisir une nouvelle donnée
    
#### Scénario principal

1. L'observateur demande la création d'une nouvelle observation au débarquement : bouton +

2. Il saisit : 

    * Programme de collecte
    * Lieu d'observation = Landing sites (Navigation optionnelle calculée par le logiciel : ile et district sont 2 niveaux de lieux qui servent surtout à faire la recherche du lieu d'observation dans SFA ObsDeb)
    * Date/heure de début de l'observation de tel ou tel navire
    * Date/heure de fin (optionnel/invisible - suivant la configuration du programme)
    * Un ou plusieurs observateurs (au moins un obligatoire)
    * Les autres caractéristiques/paramètres, collectés pour le programme
    * Commentaire (optionnel)

    ![observed-location-ui-new](landing/observed-location-ui-new.svg)

   NB: Information technique :
   * Date/heure de saisie (automatique)
   * Position géographique (X,Y) où se situe l'observateur au moment de la saisie 
   (Cette information sera stockée, mais ne sera pas affichée systématiquement, sauf pour le status administrateurs)

    ![technical-information](landing/observed-location-ui-technical-information.svg)
    
3. Il peut ensuite ajouter/supprimer des navires observés :

    Lister l'ensemble des navires à ré-appeler par la suite pour chaque marée.
    Pré-documentation des navires basée sur les précédentes observations sur le même lieu.

    ![observed-location-ui-vessels](landing/observed-location-ui-vessels.svg)
 
    L'observateur peut :
    * saisir un nouveau navire : bouton "+"
        
    ![observed-location-ui-vessels-new](landing/observed-location-ui-vessels-new.svg)
    
    * supprimer un navire identifié : bouton "poubelle"
    * Chercher dans le registre : bouton "loupe". Faire une recherche par le numéro d'immatriculation du navire. Le navire recherché vient s'ajouter à la liste
    * Tous les navires de la liste des navires observés les 12 derniers mois sont apparents et désélectionnés par défaut. 
      Ils peuvent tous être sélectionnés si nécessaire et les navires non présents seront désélectionnés un à un.

    ![observed-location-ui-vessels-liste](landing/observed-location-ui-vessels-liste.svg)
 
### CU Saisir marée observée au débarquement

Objectif :

![landing](trip/landing-uc.svg)

#### Scénario principal

1. L'observateur demande la création d'une nouvelle marée, rattaché à une observation sur site.

2. Il choisit pour cette marée:
    * Le programme de collecte : information obligatoire et déjà pré-rempli selon le choix fait 
      précédemment
    * Le navire observé (parmi la liste des navires identifiés précédemment)
    * Le lieu de débarquement : information obligatoire et déjà pré-rempli selon le choix fait 
      précédemment

3. Il saisie :
    * Date/heure de début de la marée (obligatoire ; si pas saisi, sauvegarde impossible) 
      (à terme, voir si pas saisi, possibilité d'indiquer d'office date d'observation et 00h)
    * Date/heure de fin de la marée (obligatoire ; si pas saisi, sauvegarde impossible
      (à terme, voir si pas saisi, possibilité d'indiquer d'office date de début de marée et 23h59)
    * Les autres caractéristiques/paramètres collectés pour le programme 
    * Un commentaire (optionnel)

    ![landing-ui-new](trip/landing-ui-new.svg)

4. Il peut ensuite saisir l'effort de pêche pour le navire identifié :
        
    * Code du métier
    * Nombre d'engin
    * Les autres caractéristiques d'effort propres à chaque métier/engin
    * Paramètre propre à l'engin : 
        * Nombre d'hameçons 
        * longueur de filet 
        * Nombre de casiers
    * Temps passé à pêcher (en jour de mer)
    * Profondeur minimum de l'engin (m)
    * Profondeur maximum de l'engin (m)
    * Un commentaire (optionnel)
    * Il peut ensuite saisir la capture débarquée par métier pour chaque métier (cf point 5)

<ins>Mode bureau : </ins>
    
![landing-ui-effort-desktop](trip/landing-ui-effort-desktop.svg)
    
<ins>Mode tablette : </ins>
    
![landing-ui-effort-tablet](trip/landing-ui-effort-tablet.svg)

#### Variantes

##### Variante 1.a - Marée sans observation parente (assez rare pour SFA) --> Autre programme différent d'ObsDeb
A REVOIR

L'observateur demande la création d'une nouvelle marée, sans
   rattachement à une observation sur site (ex: collecte opportuniste, sans observation liée à la pêche artisanale)
   --> Si c'est fait, ce sera dans un programme différent avec une liste de paramètre différente (sûrement simplifiée)
   --> Retire tous les filtres présents dans la partie débarquement ObsDeb, cad ouvrir le choix à tous les types d'engin, de métiers, etc.

1. Il saisit :

    * Le programme de collecte
    * Le navire observé
    * Le lieu du débarquement
    * Date/heure de début de la marée (optionnel ; si pas saisie, d'office indique 00h) A CONFIRMER
    * Date/heure de fin de la marée (optionnel ; si pas saisie, d'office indique 23h59) A CONFIRMER
    * Les observateurs (au moins un obligatoire)
    * Un commentaire (optionnel)

    ![landing-ui-var1a](trip/landing-ui-var1a.svg)

2. L'observateur :
    * choisit le navire observé (parmi la liste des navires identifiés précédemment) 
    * demande la création d'une nouvelle marée

\[Retour au 3]

##### Variante 3.a - Caractéristiques/paramètres de collecte pour SFA ObsDeb

* Autres caractéristiques/paramètres
    * Métiers observés (le 1er dans la liste est le principal, les autres sont secondaires) / possibilité d'en ajouter plusieurs
    Pour la recherche de métier : ouverture d'une fenêtre pop-up en mode dynamique avec les métiers + une zone de recherche
    * Nombre d'hommes à bord
    * Principale zone de pêche (optionnel car données rarement utilisées car mise sous silence des sites de pêche)
    * Gradient de distance à la côte (optionnel car données rarement utilisées car mise sous silence des sites de pêche)
    * Force du vent
    * Force du courant 

![landing-ui-var3a](trip/landing-ui-var3a.svg)

Ouverture de la liste de la combo métier :
(Une combo identique peut être créees pour une liste observateur)

![landing-ui-list-metier](trip/landing-ui-list-metier.svg)

\[Retour au 4]

### CU Saisir des captures débarquées

Objectif :

#### Scénario principal

1. Il peut ensuite ajouter/supprimer des captures:
    * Pour les captures individuelles :
        * Espèce (référentiel des espèces commerciales avec quelques variantes pour la SFA, mais pas d'arbre hiérarchisé comme dans SIH) 
        * Poids (kg)
        * Nombre d'individus
        * Type de packaging
        * Type de préservation (champs obligatoire)
        
    * Pour les captures en paquets : 
        * Différencier les paquets homogènes (une seule espèce),des paquets hétérogènes (composition de différentes espèces)
          (1 ligne par type de composition de paquets)
        * Echantillonner de 1 à 6 paquets par type de paquet, puis compléter par composition de paquet (tableau de regroupement) :
          (Pas de règle de saisie)
            * Nombre total de paquets comptés par type de composition;
            * Ajouter les espèces qui composent le paquet (1 ligne = 1 espèce);
            * Ajouter le poids des paquets échantillons (1 colonne = 1 paquet échantillon);
            * Ajouter la proportion (%) de présence de chaque espèce (ligne) par paquet (colonne)
            
                * La somme des % = 100 % : OK
                * Si somme des % < 100 % : message erreur
                * Si somme des % > 100 % : message erreur
                
            * Le poids total (kg) de chaque espèce est calculé par composition de paquet

    <ins>Mode bureau : </ins>
    
    ![landing-ui-samples-desktop](trip/landing-ui-samples-desktop.svg)
    
    <ins>Mode tablette : </ins>
    
    ![landing-ui-samples-tablet](trip/landing-ui-samples-tablet.svg)

    L'utilisateur entre la composition par paquet

    <ins>Mode bureau : </ins>
    
    ![landing-ui-composition-desktop](trip/landing-ui-composition-desktop.svg)

    <ins>Mode tablette : </ins>
    
    ![landing-ui-composition-tablet](trip/landing-ui-composition-tablet.svg)
   

2. L'utilisateur sauvegarde ses modifications puis peut saisir la partie vente

### CU Saisir des ventes

Note : Ecran optionel
Objectif : 

#### Scénario principal

Les ventes sont automatiquement créées pour chaque capture individuelle et en paquet.

1. Il peut ensuite affecter un type de vente à une capture individuelle ou un paquet 
   Et aussi catégoriser différent type de vente pour une même capture (en ajoutant/supprimant un type de vente)
    
   * Estimation du coût de revient de la vente totale (optionnel si pas de détail)
   * Le coût de revient total de la vente est calculé automatiquement en fonction des informations saisient ci-dessous :
    * Pour les captures individuelles :
       * Type de vente (= Disposition : bouyon, poissonnier, hôtel et restaurant, marché, pêcheries océan, Publique, centre de poisson impétueux,
                                        récolte de la mer, inconnu)
       (2 éléments ci-dessous sont nécessaires pour que le 3em élément se calcule automatiquement)
       * Prix moyen estimé de l'espèce au poids (devise/kg)
       * ou Prix moyen estimé de l'espèce par packaging (devise/packaging)
       * ou Prix total estimé de l'espèce (devise)
    * Pour les captures en paquets :
       * Type de vente (= Disposition : bouyon, poissonnier, hôtel et restaurant, marché, pêcheries océan, Publique, centre de poisson impétueux,
                                        récolte de la mer, inconnu)
       * Prix moyen estimé de l'espèce par paquet (devise/packet)
       * ou Prix total estimé du paquet (devise)

2. L'utilisateur sauvegarde ses modifications puis peut saisir la partie dépenses  

    <ins>Mode bureau : </ins>
    
    ![landing-ui-sales-desktop](sales-expenses/landing-ui-sales-desktop.svg)     

    <ins>Mode tablette : </ins>
    
    ![landing-ui-sales-tablet](sales-expenses/landing-ui-sales-tablet.svg)   

    Si plusieurs type de vente à saisir pour une même marée, alors, possibilité d'en ajouter :

    <ins>Mode tablette : </ins>
    
    ![landing-ui-sales-plus-tablet](sales-expenses/landing-ui-sales-plus-tablet.svg)  

### CU Saisir des dépenses

Note : Ecran optionel

#### Scénario principal

1. Il peut saisir:

   * Estimation des dépenses totales pour la marée
   * Le coût total des dépenses de la marée est calculé automatiquement en fonction des informations de dépenses détaillées :
    * Dépenses en fluides de fonctionnement :
      Pour chaque fluide : Carburant (le type de carburant est à préciser), huile de moteur, huile hydraulique, préciser :
       (2 éléments ci-dessous sont nécessaires pour que le 3em élément se calcule automatiquement)
       * Volume utilisé pour la marée (l) (optionnel)
       * Prix moyen par litre (devise/L) (optionnel)
       * Prix total dépensé (devise)  (optionnel)
       
    * Dépenses en frais annexes  :
       * Frais de débarquement (devise)
       * Alimentation  (devise)
       * Perte d'engin (devise)
       * Autre (devise)
       * Commentaire (optionnel)
    * La glace utilisée :
       * Quantité de glace 
       * Unité (au kg ou par sac)
       * Coût de la glace (devise)
    * Appâts :
       * Type d'appâts (pas plus de 3 types maximum pour la SFA)
       * Nombre d'appâts 
       * Unité de conditionnement des appâts (au kg, à l'unité, au sac ou au paquet)
       * Coût des appâts

2. L'utilisateur sauvegarde ses modifications.

    ![landing-ui-expenses](sales-expenses/landing-ui-expenses.svg)  
           
### CU Saisir un calendrier hebdomadaire

L'observateur demande la création d'une nouveau calendrier hebdomadaire

1. Il saisit :

    * Le programme de collecte
    * Le navire observé : entrer l'ensemble des navires observés sur le même lieu à la même date
    * Le lieu du débarquement
    * Date/heure de début de la semaine (heure est d'office 00h00)
    * Date/heure de fin de la semaine saisie automatiquement J+6 (heure est d'office 23h59)
    * Les observateurs (au moins un obligatoire)
    * Un commentaire (optionnel)

    ![weekly-ui-new](weekly/weekly-ui-new.svg)

2. Caractérisation des situations propres à chaque navire chaque jour de la semaine

    La saisie s'effectue jour par jour : l'observateur chaque jour commence, sur un lieu donné à 
    sélectionner la situation pour chaque navire présent et précédemment identifié.
    Les métiers s'affichent donc automatiquement. Il est cependant possible d'en ajouter des nouveaux.
    
    L'observateur est quasiment exaustif en terme d'identification des navires et de leur situation sur un lieu donné.
    
    Initiales des situations utilisées sur le formulaire terrain :
    
    * DP- boat departing that day
    * IN- boat in at site
    * LD- boat landed fish that day
    * DL- one day trip (boat departed and landed same day)
    * NA- boat not active
    * OUT- boat out fishing
    * BR- break down
    * NS- boat not seen at site
    * LS- Boat landed fish that day and was sample
    * UR- boat under repair

    <u>Association Métier / Situation</u>:
    
    Un même navire peut être observé dans différentes situations au cours de la même journée.
    Un observateur peux ne pas effectuer d'observations au cours d'une journée (maladie, empêchement, etc.) ; 
    dans ce cas, il ne saisie aucune situation.
    
    <ins>Mode bureau : </ins>
    
    ![weekly-ui-situation-desktop](weekly/weekly-ui-situation-desktop.svg)
    
    En mode bureau, l'ensemble de la semaine est affichée. Le jour de l'observation est activé en gras.
    Il est possible de modifier une saisie antérieure au jour d'observation. Par contre, il n'est pas possible d'anticiper
    les situations des jours postérieurs au jour de d'observation.
    
    <ins>Mode tablette : </ins>
    
    ![weekly-ui-situation-tablet](weekly/weekly-ui-situation-tablet.svg) 
            
    En mode tablette, seul le jour d'observation est affiché. Cependant, la flèche "précédent" et la flèche "suivant" 
    de chaque côté du jour de l'observation permet de revenir sur les jours antérieurs au jour d'observation pour 
    consulter ou modifier une saisie précédente. Par contre, pas de possibilité de saisir en avance des jours postérieurs 
    au jour de d'observation.
        
3. Caractérisation de l'activité des navires chaque jour de la semaine

    Si un navire n'a pas de situation, on ne peut pas saisir d'activité.
    
    L'observateur n'est pas exaustif en terme d'identification des navires et des métiers sur un lieu donné.
    
    Par défaut, le jour effectif correspond au jour de la saisie. Il est possible de sélectionner 
    l'affichage par jour ou semaine : cliquer sur le bouton calendrier en haut à droite.
    
    Un jour effectif est activé, alors qu'un jour qui n'a pas eu lieu reste inactif.
    Si le suivi n'est pas fait un jour de la semaine effectif, le jour est tout de 
    même actif, mais il n'y a pas de situation entrée.
    
    <u>Recherche par critère</u> : les marées d'un navire qui a pratiqué un metier sont associées automatiquement
    à l'activité correspondante pour un navire, à la même date.
    Si la marée n'existe pas, elle peut être créée à partir d'ici
    
    Bouton oeil : Quand on affiche le calendrier d'activité, L'outil va rechercher toutes les marées de la 
    semaine pour chaque navire --> Oeil en gras = activé, sinon inactif

    <ins>Mode bureau : </ins>
    
    ![weekly-ui-activity-desktop](weekly/weekly-ui-activity-desktop.svg) 
    
    Pour un même navire, autant de lignes situations sont crées atomatiquement, qu'il y a de situations 
    pré-indiquées à l'étape précédente. L'observateur indique dans cet étape le(s) métier(s) observé(s) par 
    navire et situation chaque jour de la semaine activé.
    
    <ins>Mode tablette : </ins> affichage journalier
    
    ![weekly-ui-activity-tablet-day](weekly/weekly-ui-activity-tablet-day.svg)


    

