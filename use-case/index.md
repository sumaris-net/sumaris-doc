# Cas d'utilisation fonctionnels

 - [Administration des référentiels]()
 - [Collecte des données]()
    * [CU Saisir une observation au débarquement]()
    * [CU Saisir un débarquement observé]()
    * [CU Saisir des captures débarquées]()
    * [CU Saisir des ventes]()
    * [CU Saisir des dépenses]()
    
## Administration des référentiels

(à venir)

## Collecte des données

### CU "Saisir une observation au débarquement"

![observed-location](../dist/use-case/collect/observed-location-uc.svg)

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

![observed-location-ui-new](../dist/use-case/collect/observed-location-ui-new.svg)

NB: Information technique :
    * Date/heure de saisie

3. Il peut ensuite ajouter/supprimer des navires observés :

Lister l'ensemble des navires à ré-appeler par la suite pour chaque marée.

![observed-location-ui-new](../dist/use-case/collect/observed-location-ui-vessels.svg)
  
(Le choix se pose de saisir une nouvelle observation ou de poursuivre sur cette observation et 
d'entrer l'effort)
 
### CU "Saisir une marée (= fishing trip dans SFA ObsDeb)"

Objectif :

![landing](../dist/use-case/collect/landing-uc.svg)

#### Scénario principal

1. L'observateur demande la création d'une nouvelle marée, rattaché à une observation sur site.

2. Il choisit :
    * Le navire observé (parmi la liste des navires identifiés précédemment)

3. Il saisie :
    * Date/heure de début de la marée (TIME OPTIONNEL ???)
    * Date/heure de fin de la marée (TIME OPTIONNEL ???)
    * Date/Heure de début de débarquement (TIME OPTIONNEL ???) = Date /Heure de la fin de la marée (CONFIRMATION SUR BESOIN ???)
    * Les autres caractéristiques/paramètres collectés pour le programme 
    * Un commentaire (optionnel)

![landing-ui-new](../dist/use-case/collect/landing-ui-new.svg)

4. Il peut ensuite saisir l'effort de pêche par métier :
    * Nombre d'engin
    * Paramètre propre à l'engin : Nombre d'hameçons ou longueur de filet ou nombre de casiers
    * Temps passé à pêcher (en jour de mer)
    * Profondeur minimum de l'engin (m)
    * Profondeur maximum de l'engin (m)
    * Un commentaire (optionnel)
    * Il peut ensuite saisir la capture débarquée par métier (cf point 5)

#### Variantes

##### Variante 1.a - Marée sans observation parente (assez rare pour SFA) --> Autre programme différent d'ObsDeb

1. L'observateur demande la création d'une nouvelle marée, sans
   rattachement à une observation sur site (ex: collecte opportuniste, sans observation liée à la pêche artisanale)
   --> Si c'est fait, ce sera dans un programme différent avec une liste de parapètre différente (sûrement simplifiée)
   --> Retire tous les filtres présents dans la partie débarquement ObsDeb, cad ouvrir le choix à tous les types d'engin, de métiers, etc.

2. Il saisit :

    * Le programme de collecte
    * Le navire observé
    * Le lieu du débarquement
    * Date/heure de début de la marée (TIME OPTIONNEL ???)
    * Date/heure de fin de la marée (TIME OPTIONNEL ???)
    * Date/Heure de début de débarquement (TIME OPTIONNEL ???)
    * Les observateurs (au moins un obligatoire)
    * Les autres caractéristiques/paramètres, collectés pour le programme
    * Un commentaire (optionnel)

\[Retour au 3]

![landing-ui-new](../dist/use-case/collect/landing-ui-samples.svg)

##### Variante 3.a - Caractéristiques/paramètres de collecte pour SFA ObsDeb

* Autres caractéristiques/paramètres
    * Métiers observés
    * Nombre d'hommes à bord
    * Principale zone de pêche (optionnel car données rarement utilisées car mise sous silence des sites de pêche)
    * Gradient de distance à la côte (optionnel car données rarement utilisées car mise sous silence des sites de pêche)
    * Force du vent
    * Force du courant

### CU "Saisir des captures débarquées"

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
            
2. L'utilisateur sauvegarde ses modifications puis peut saisir la partie vente

### CU "Saisir des ventes"

Les ventes sont automatiquement créées pour chaque capture individuelle et en paquet.

1. Il peut ensuite ajouter/supprimer une vente.
    
   * Estimation du coût de revient de la vente totale
   * Le coût de revient total de la vente est calculé automatiquement en fonction des informations saisient ci-dessous :
    * Pour les captures individuelles :
       * Type de vente (= Disposition : bouyon, poissonnier, hôtel et restaurant, marché, pêcheries océan, Publique, centre de poisson impétueux,
                                        récolte de la mer, inconnu)
       * Prix moyen estimé de l'espèce au poids (SR/kg)
       * Prix moyen estimé de l'espèce par packaging (SR/packaging)
       * Prix total estimé de l'espèce (SR = Roupie Seychellois)
    * Pour les captures en paquets :
       * Type de vente (= Disposition : bouyon, poissonnier, hôtel et restaurant, marché, pêcheries océan, Publique, centre de poisson impétueux,
                                        récolte de la mer, inconnu)
       * Prix moyen estimé de l'espèce par paquet (SR/packet)
       * Prix total estimé de l'espèce (SR = Roupie Seychellois)

2 L'utilisateur sauvegarde ses modifications puis peut saisir la partie dépenses           

### CU "Saisir des dépenses"

1. Il saisit :

   * Estimation des dépenses totales pour la marée
   * Le coût total des dépenses de la marée est calculé automatiquement en fonction des informations de dépenses détaillées :
    * Dépenses en fluides de fonctionnement :
      Pour chaque fluide : Carburant (le type de carburant est à préciser), huile de moteur, huile hydraulique, préciser :
       * Volume utilisé pour la marée (l)
       * Prix moyen par litre (SR/L)
       * Prix total dépensé (SR = Roupie Seychellois)
    * Dépenses en frais annexes  :
       * Frais de débarquement (SR)
       * Alimentation  (SR)
       * Perte d'engin (SR)
       * Autre (SR)
       * Commentaire (optionnel)
    * La glace utilisée :
       * Quantité de glace 
       * Unité (au kg ou par sac)
       * Coût de la glace (SR = Roupie Seychellois)
    * Appâts :
       * Type d'appâts (3 types maximum)
       * Nombre d'appâts 
       * Unité pour compter les appâts (au kg, à l'unité, au sac ou au paquet)
       * Coût des appâts

2. L'utilisateur sauvegarde ses modifications.
           
### CU "Weekly report"