# Évaluation développeur full-stack

**Objectif** : Évaluer rapidement les connaissances techniques d'un développeur, en 20 minutes.

## 1. Architecture d'un SI (2 minutes)

Complétez les espaces vides pour décrire le flux de données dans une architecture en couches classique :

La requête client arrive d'abord dans la couche __________________ (1), qui transmet la demande à la couche __________________ (2) via des __________________ (3). La couche __________________ (4) contient la logique métier et utilise la couche __________________ (5) pour interagir avec la base de données.

**Question ouverte**: Expliquez brièvement l'intérêt de séparer une application en différentes couches :

-
-
-


## 2. Spring Boot (4 minutes)

### Injection de dépendances

Complétez le code suivant pour injecter un service dans un contrôleur:

```java
@__________________(1)
public class UserController {

    private final UserService userService;
    
    @__________________(2)
    public UserController(UserService userService) {
        this.userService = userService;
    }
}
```

### Services et Repositories

Pour créer un service Spring, on utilise l'annotation __________________ (3). Pour créer un repository Spring Data JPA, on étend l'interface __________________ (4).

### Transactions

Pour déclarer qu'une méthode doit s'exécuter dans une transaction, on utilise l'annotation __________________ (5).

### Gestion du cache

Complétez: Pour activer le cache dans Spring Boot, on ajoute l'annotation __________________ (6) dans la classe de configuration.

### Controllers REST

Complétez ce contrôleur REST :

```java
@__________________(7)
@RequestMapping("/api/users")
public class UserController {
    @__________________(8)("/")
    public List<User> getAllUsers() {
        return userService.findAll();
    }

    @__________________(9)("/{id}")
    public User getUserById(@__________________(10) @PathVariable Long id) {
        return userService.findById(id);
    }
}
```

**Question ouverte**: Expliquez comment vous géreriez les exceptions dans une API REST Spring Boot.

-
-
-


## 3. Base de données Oracle (4 minutes)

### Schéma des tables

Soit le modèle de données suivant :

```plantuml
@startuml
    entity "employees" {
      * employee_id : number <<PK>>
      * name : varchar2
      * last_name : varchar2
      * salary : number
      * hire_date : date
      * active : char(1)
      * department_id : number <<FK>>
    }
    
    entity "departments" {
      * department_id : number <<PK>>
      --
      * department_name : varchar2
    }
    
    employees "*" -- "1"" departments : department_id

@enduml
```

### SQL - jointure

Complétez la requête SQL suivante pour obtenir la liste des employés avec leur département, même pour les employés sans département:

```sql
SELECT e.name, d.name as department_name
FROM employees e
__________________(1) JOIN departments d ON __________________(2)
WHERE e.salary > 5000
ORDER BY __________________(3)
```

### SQL - conditions

Complétez la requête SQL suivante qui utilise des conditions pour catégoriser les employés selon leur salaire et leur service :

```sql
SELECT
    employee_id,
    last_name,
    salary,
    __________________(1)
        WHEN salary < 5000 THEN 'Junior'
        WHEN salary BETWEEN 5000 AND 10000 THEN 'Confirmé'
        __________________(2) 'Senior'
    END AS niveau,
    __________________(3)(department_id,
        10, 'Finance',
        20, 'Marketing',
        30, 'IT',
        'Autre') AS service_name
FROM employees
WHERE hire_date > TO_DATE('01-01-2020', __________________(4))
```

### SQL - Agrégations

Complétez la requête SQL suivante qui utilise des fonctions d'agrégation, pour obtenir des statistiques par service :

```sql
SELECT
    d.department_name,
    __________________(1)(e.employee_id) AS nombre_employes,
    __________________(2)(e.salary) AS salaire_minimum,
    ROUND(AVG(e.salary), 2) AS salaire_moyen
FROM
    employees e
JOIN
    departments d ON e.department_id = d.department_id
WHERE
    e.active = 'Y'
__________________(3) d.department_name
HAVING
    COUNT(e.employee_id) > 5
ORDER BY
    COUNT(e.employee_id) DESC
```

**Question ouverte**: Expliquez la différence entre un filtre dans la clause WHERE et un filtre dans la clause HAVING, et dans quel contexte utiliser l'un plutôt que l'autre.

-
-
-

**Question ouverte**: Comment optimiseriez-vous une requête SQL qui prend trop de temps à s'exécuter?

-
-
-


Citez deux commandes/outils pour analyser les performances d'une requête Oracle:
- (1) ____________________________________________________
- (2) ____________________________________________________


## 4. Frontend (3 minutes)

### RxJS

Complétez le code suivant pour créer un Observable, s'y abonner et se désabonner proprement:

```typescript
import { __________________(1) } from 'rxjs';
import { map, filter } from 'rxjs/operators';
const observable = __________________(2).create(observer => {
  observer.next(1);
  observer.next(2);
  observer.complete();
});
const subscription = observable.pipe(
  __________________(3)(x => x > 1)
).subscribe(
  value => console.log(value),
  error => console.error(error),
  () => console.log('Completed')
);
// Pour se désabonner
__________________(4);
```

### Découpage en composants
Découper l'écran suivant en composants (en les entourant) :
![SUMARiS Trip screen](./img/sumaris-trip-screenshot.png)

Si besoin, expliquer ci-dessous :

-
-
-

**Question ouverte**: Quels critères utilisez-vous pour décider de créer un nouveau composant réutilisable dans une application frontend ?

-
-
-

## 5. Frontend - Angular 18+ (5 minutes)

### Partie 1: Template avec champs de formulaire
Complétez le template suivant qui utilise les nouvelles directives structurelles et les contrôles de formulaire Angular Material:

```html
<div class="user-form-container">
  <form [__________________(1)]="userForm">
    <h2>Profil utilisateur</h2>

    @__________________(2) (userForm.get('firstName')?.hasError('required') && userForm.get('firstName')?.touched) {
      <div class="error-message">Le prénom est obligatoire</div>
    }
    
    <mat-form-field appearance="outline">
      <mat-label>Prénom</mat-label>
      <input matInput __________________(3)="firstName">
      <mat-error *ngIf="userForm.get('firstName')?.hasError('required')">
        Ce champ est obligatoire
      </mat-error>
    </mat-form-field>
    
    <mat-form-field appearance="outline">
      <mat-label>Nom</mat-label>
      <input matInput formControlName="lastName">
    </mat-form-field>
    
    <div formGroupName="address">
      <h3>Adresse</h3>
      @__________________(4) (addresses.length > 0; as hasAddresses) {
        <div class="addresses-container">
          @__________________(5) (address of addresses; track address.id) {
            <div class="address-card">
              <p>{{address.street}}, {{address.city}}</p>
              <button mat-icon-button (click)="removeAddress(address.id)">
                <mat-icon>delete</mat-icon>
              </button>
            </div>
          }
        </div>
      } @else {
        <p>Aucune adresse enregistrée</p>
      }
      
      <button mat-raised-button color="primary" [__________________(6)]="!userForm.valid">
        Enregistrer
      </button>
    </div>
  </form>
</div>
```

### Partie 2: Composant avec formulaire et validateurs
Complétez le code du composant associé:

```typescript
import { Component, OnInit, __________________(1) } from '@angular/core';
import { FormGroup, FormBuilder, __________________(2), Validators } from '@angular/forms';
import { UserService } from '../../services/user.service';
@Component({
  selector: 'app-user-profile',
  templateUrl: './user-profile.component.html',
  styleUrls: ['./user-profile.component.scss']
})
export class UserProfileComponent implements __________________(3), AfterViewInit {
  userForm: FormGroup;
  addresses: {id: number, street: string, city: string}[] = [];

  constructor(
    private __________________(4): FormBuilder,
    private userService: UserService
  ) { }

  __________________(5)() {
    this.userForm = this.fb.group({
      firstName: ['', [Validators.required, Validators.minLength(2)]],
      lastName: ['', [Validators.required]],
      email: ['', [Validators.required, __________________(6)]],
      address: this.fb.group({
        street: [''],
        city: [''],
        zipCode: ['', [Validators.pattern(/^\d{5}$/)]]
      })
    });

    this.loadAddresses();
  }

  ngAfterViewInit() {
    // Souscription aux changements du formulaire
    this.userForm.valueChanges.__________________(7)((value) => {
      console.log('Form value changed:', value);
    });
  }

  loadAddresses() {
    this.userService.getUserAddresses().subscribe({
      next: (addresses) => {
        this.addresses = addresses;
      },
      error: (err) => console.error('Erreur lors du chargement des adresses', err)
    });
  }

  removeAddress(id: number) {
    this.userService.__________________(8)(id).subscribe({
      next: () => {
        this.addresses = this.addresses.filter(address => address.id !== id);
      },
      error: (err) => console.error('Erreur lors de la suppression', err)
    });
  }

  onSubmit() {
    if (this.userForm.__________________(9)) {
      this.userService.saveUser(this.userForm.value).subscribe({
        next: (response) => {
          console.log('Utilisateur enregistré', response);
        },
        error: (err) => console.error('Erreur lors de l\'enregistrement', err)
      });
    }
  }

  __________________(10)() {
    // Nettoyage des souscriptions
    this.subscriptions.unsubscribe();
  }
}
```

### Partie 3: Service et Gestion d'État
```typescript
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { BehaviorSubject, Observable } from 'rxjs';
import { User } from '../models/user.model';
import { tap, catchError } from 'rxjs/operators';
@Injectable({
  providedIn: '__________________(1)'
})
export class UserService {
  private userSubject = new __________________(2)<User | null>(null);
  user$ = this.userSubject.asObservable();

  constructor(private http: HttpClient) { }

  getUserAddresses(): Observable<any[]> {
    return this.http.get<any[]>('/api/addresses');
  }

  deleteAddress(id: number): Observable<void> {
    return this.http.delete<void>(`/api/addresses/${id}`);
  }

  saveUser(userData: any): Observable<User> {
    return this.http.post<User>('/api/users', userData).pipe(
      __________________(3)((user) => {
        this.userSubject.next(user);
      }),
      catchError((error) => {
        console.error('Erreur lors de la sauvegarde de l\'utilisateur', error);
        throw error;
      })
    );
  }
}
```

### Partie 4: Module et Routing

```typescript
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { __________________(1) } from '@angular/forms';
import { MatInputModule } from '@angular/material/input';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { RouterModule } from '@angular/router';
import { UserProfileComponent } from './components/user-profile/user-profile.component';
import { UserService } from './services/user.service';

@NgModule({
  declarations: [
    UserProfileComponent
  ],
  imports: [
    CommonModule,
    __________________(2),
    MatInputModule,
    MatFormFieldModule,
    MatButtonModule,
    MatIconModule,
    RouterModule.forChild([
      {
        path: 'profile',
        component: __________________(3)
      }
    ])
  ],
  providers: [
    __________________(4)
  ]
})
export class UserModule { }
```

**Question ouverte**: Expliquez la différence entre les approches Template-driven Forms et Reactive Forms dans Angular. Dans quel contexte préférez-vous utiliser l'une plutôt que l'autre?

-
-
-

**Question ouverte**: Comment gérez-vous les validations asynchrones dans un formulaire Angular (par exemple, vérifier si un nom d'utilisateur est déjà pris)?

-
-
-


## 6. CI/CD - GitLab CI (2 minutes)

Dans un pipeline GitLab CI, le fichier de configuration s'appelle __________________ (1).

Complétez les éléments manquants dans cette structure de pipeline GitLab CI :
```yaml
stages:
  - ________________(1)
  - build
  - ________________(2)
  - deploy

________________(3) :
  stage: ________________(4)
  script:
    - ________________(5)

build:
  stage: ________________(6)
  script:
    - mvn ________________(7)

test:
  stage: ________________(8)
  script:
    - mvn test
deploy_staging:
  stage: deploy
  ________________(9): staging
  script:
    - deploy-production.sh
  ________________(10) :
    - master
    - develop
```