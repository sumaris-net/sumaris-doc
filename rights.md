# Rights

## User Profiles

##

: Only if explicitly declared as observer.

P
: Only if recorder person.

D
: Only if recorder department.

## In progress

| State    | Privileges | Profiles      | Create | Update |  View  | State Change |
|----------|------------|---------------|:------:|:------:|:------:|:------------:|
| Progress | Observer   | Observer      |  yes   | (1,2)  | yes:PO | -> Terminate |
| Progress | Observer   | Supervisor    |  yes   | yes:D  | yes:D  |    yes:D     |
| Progress | Observer   | Administrator |  yes   |  yes   |  yes   |     yes      |
| Progress | Manager    | Observer      |  yes   |  yes   |  yes   |     yes      |
| Progress | Manager    | Supervisor    |  yes   |  yes   |  yes   |     yes      |
| Progress | Manager    | Administrator |  yes   |  yes   |  yes   |     yes      |
| Progress | Qualifier  | Observer      |        |        |        |              |
| Progress | Qualifier  | Supervisor    |        |        |        |              |
| Progress | Qualifier  | Administrator |        |        |        |              |
| Progress | Validator  | Observer      |        |        |        |              |
| Progress | Validator  | Supervisor    |        |        |        |              |
| Progress | Validator  | Administrator |        |        |        |              |
| Progress | Viewer     | Observer      |   no   |   no   |  yes   |      no      |
| Progress | Viewer     | Supervisor    |  yes   | yes:D  | yes:D  |    yes:D     |
| Progress | Viewer     | Administrator |  yes   |  yes   |  yes   |     yes      |

## Complete

| State    | Privileges | Profiles      | Create |   Update   |  View  | Upgrade/Downgrade |
|----------|------------|---------------|:------:|:----------:|:------:|:-----------------:|
| Finished | Observer   | Observer      |   -    |   yes:PO   | yes:PO |      yes:PO       |
| Finished | Observer   | Supervisor    |   -    |   yes:D    | yes:D  |       yes:D       |
| Finished | Observer   | Administrator |   -    |    yes     |  yes   |        yes        |
| Finished | Manager    | Observer      |   -    |    yes     |  yes   |        yes        |
| Finished | Manager    | Supervisor    |   -    |    yes     |  yes   |        yes        |
| Finished | Manager    | Administrator |   -    |    yes     |  yes   |        yes        |
| Finished | Qualifier  | Observer      |   -    |            |        |                   |
| Finished | Qualifier  | Supervisor    |   -    |            |        |                   |
| Finished | Qualifier  | Administrator |   -    |            |        |                   |
| Finished | Validator  | Observer      |   -    |            |        |                   |
| Finished | Validator  | Supervisor    |   -    |            |        |                   |
| Finished | Validator  | Administrator |   -    |            |        |                   |
| Finished | Viewer     | Observer      |   -    |     no     |  yes   |        no         |
| Finished | Viewer     | Supervisor    |   -    |   yes:D    | yes:D  |       yes:D       |
| Finished | Viewer     | Administrator |   -    |    yes     |  yes   |        yes        |

| State    | Privileges | Profiles      | Recorder | Department | Observer | Create | Update |  Show  | Upgrade/Downgrade |
|----------|------------|---------------|:--------:|:----------:|:--------:|:------:|:------:|:------:|:-----------------:|
| Progress | Observer   | Observer      |    no    |     no     |    no    |  yes   |   no   |   no   |        no         |
| Progress | Observer   | Observer      |   yes    |     no     |    no    |  yes   |  yes   |  yes   |        yes        |
| Progress | Observer   | Observer      |    no    |    yes     |    no    |  yes   |  yes   |  yes   |        yes        |
| Progress | Observer   | Observer      |    no    |     no     |   yes    |  yes   |  yes   |  yes   |        yes        |
| Progress | Observer   | Supervisor    |    no    |     no     |    no    |  yes   |   no   | yes:D  |       yes:D       |
| Progress | Observer   | Supervisor    |          |            |          |  yes   | yes:D  | yes:D  |       yes:D       |
| Progress | Observer   | Supervisor    |          |            |          |  yes   | yes:D  | yes:D  |       yes:D       |
| Progress | Observer   | Supervisor    |          |            |          |  yes   | yes:D  | yes:D  |       yes:D       |
| Progress | Observer   | Administrator |          |            |          |  yes   |  yes   |  yes   |        yes        |
| Progress | Manager    | Observer      |          |            |          |  yes   |  yes   |  yes   |        yes        |
| Progress | Manager    | Supervisor    |          |            |          |  yes   |  yes   |  yes   |        yes        |
| Progress | Manager    | Administrator |          |            |          |  yes   |  yes   |  yes   |        yes        |
| Progress | Qualifier  | Observer      |          |            |          |        |        |        |                   |
| Progress | Qualifier  | Supervisor    |          |            |          |        |        |        |                   |
| Progress | Qualifier  | Administrator |          |            |          |        |        |        |                   |
| Progress | Validator  | Observer      |          |            |          |        |        |        |                   |
| Progress | Validator  | Supervisor    |          |            |          |        |        |        |                   |
| Progress | Validator  | Administrator |          |            |          |        |        |        |                   |
| Progress | Viewer     | Observer      |          |            |          |   no   |   no   |  yes   |        no         |
| Progress | Viewer     | Supervisor    |          |            |          |  yes   | yes:D  | yes:D  |       yes:D       |
| Progress | Viewer     | Administrator |          |            |          |  yes   |  yes   |  yes   |        yes        |
| Finished | Observer   | Observer      |          |            |          |   -    | yes:PO | yes:PO |      yes:PO       |
| Finished | Observer   | Supervisor    |          |            |          |   -    | yes:D  | yes:D  |       yes:D       |
| Finished | Observer   | Administrator |          |            |          |   -    |  yes   |  yes   |        yes        |
| Finished | Manager    | Observer      |          |            |          |   -    |  yes   |  yes   |        yes        |
| Finished | Manager    | Supervisor    |          |            |          |   -    |  yes   |  yes   |        yes        |
| Finished | Manager    | Administrator |          |            |          |   -    |  yes   |  yes   |        yes        |
| Finished | Qualifier  | Observer      |          |            |          |   -    |        |        |                   |
| Finished | Qualifier  | Supervisor    |          |            |          |   -    |        |        |                   |
| Finished | Qualifier  | Administrator |          |            |          |   -    |        |        |                   |
| Finished | Validator  | Observer      |          |            |          |   -    |        |        |                   |
| Finished | Validator  | Supervisor    |          |            |          |   -    |        |        |                   |
| Finished | Validator  | Administrator |          |            |          |   -    |        |        |                   |
| Finished | Viewer     | Observer      |          |            |          |   -    |   no   |  yes   |        no         |
| Finished | Viewer     | Supervisor    |          |            |          |   -    | yes:D  | yes:D  |       yes:D       |
| Finished | Viewer     | Administrator |          |            |          |   -    |  yes   |  yes   |        yes        |
