# Rights

## User Profiles

##

: Only if explicitly declared as observer.

P
: Only if recorder person.

D
: Only if recorder department.

## En cours de saisis

| State    | Privileges | Profiles   | Create | Update  |  View  | State Change |
|----------|------------|------------|:------:|:-------:|:------:|:------------:|
| Progress | Observer   | Observer   |  yes   |  *(1,2) | yes:PO | -> Terminate |
| Progress | Observer   | Supervisor |  yes   |  yes:D  | yes:D  |    yes:D     |
| Progress | Observer   | Admin      |  yes   |   yes   |  yes   |     yes      |
| Progress | Manager    | Observer   |  yes   |   yes   |  yes   |     yes      |
| Progress | Manager    | Supervisor |  yes   |   yes   |  yes   |     yes      |
| Progress | Manager    | Admin      |  yes   |   yes   |  yes   |     yes      |
| Progress | Qualifier  | Observer   |        |         |        |              |
| Progress | Qualifier  | Supervisor |        |         |        |              |
| Progress | Qualifier  | Admin      |        |         |        |              |
| Progress | Validator  | Observer   |        |         |        |              |
| Progress | Validator  | Supervisor |        |         |        |              |
| Progress | Validator  | Admin      |        |         |        |              |
| Progress | Viewer     | Observer   |   no   |   no    |  yes   |      no      |
| Progress | Viewer     | Supervisor |  yes   |  yes:D  | yes:D  |    yes:D     |
| Progress | Viewer     | Admin      |  yes   |   yes   |  yes   |     yes      |

## Terminate

| State    | Privileges | Profiles   | Create |   Update   |  View  | Upgrade/Downgrade |
|----------|------------|------------|:------:|:----------:|:------:|:-----------------:|
| Finished | Observer   | Observer   |   -    |   yes:PO   | yes:PO |      yes:PO       |
| Finished | Observer   | Supervisor |   -    |   yes:D    | yes:D  |       yes:D       |
| Finished | Observer   | Admin      |   -    |    yes     |  yes   |        yes        |
| Finished | Manager    | Observer   |   -    |    yes     |  yes   |        yes        |
| Finished | Manager    | Supervisor |   -    |    yes     |  yes   |        yes        |
| Finished | Manager    | Admin      |   -    |    yes     |  yes   |        yes        |
| Finished | Qualifier  | Observer   |   -    |            |        |                   |
| Finished | Qualifier  | Supervisor |   -    |            |        |                   |
| Finished | Qualifier  | Admin      |   -    |            |        |                   |
| Finished | Validator  | Observer   |   -    |            |        |                   |
| Finished | Validator  | Supervisor |   -    |            |        |                   |
| Finished | Validator  | Admin      |   -    |            |        |                   |
| Finished | Viewer     | Observer   |   -    |     no     |  yes   |        no         |
| Finished | Viewer     | Supervisor |   -    |   yes:D    | yes:D  |       yes:D       |
| Finished | Viewer     | Admin      |   -    |    yes     |  yes   |        yes        |

| State    | Privileges | Profiles   | Recoreder | Departement | Observateur | Create | Update |  Show  | Upgrade/Downgrade |
|----------|------------|------------|:---------:|:-----------:|:-----------:|:------:|:------:|:------:|:-----------------:|
| Progress | Observer   | Observer   |    no     |     no      |     no      |  yes   |   no   |   no   |        no         |
| Progress | Observer   | Observer   |    yes    |     no      |     no      |  yes   |  yes   |  yes   |        yes        |
| Progress | Observer   | Observer   |    no     |     yes     |     no      |  yes   |  yes   |  yes   |        yes        |
| Progress | Observer   | Observer   |    no     |     no      |     yes     |  yes   |  yes   |  yes   |        yes        |
| Progress | Observer   | Supervisor |    no     |     no      |     no      |  yes   |   no   | yes:D  |       yes:D       |
| Progress | Observer   | Supervisor |           |             |             |  yes   | yes:D  | yes:D  |       yes:D       |
| Progress | Observer   | Supervisor |           |             |             |  yes   | yes:D  | yes:D  |       yes:D       |
| Progress | Observer   | Supervisor |           |             |             |  yes   | yes:D  | yes:D  |       yes:D       |
| Progress | Observer   | Admin      |           |             |             |  yes   |  yes   |  yes   |        yes        |
| Progress | Manager    | Observer   |           |             |             |  yes   |  yes   |  yes   |        yes        |
| Progress | Manager    | Supervisor |           |             |             |  yes   |  yes   |  yes   |        yes        |
| Progress | Manager    | Admin      |           |             |             |  yes   |  yes   |  yes   |        yes        |
| Progress | Qualifier  | Observer   |           |             |             |        |        |        |                   |
| Progress | Qualifier  | Supervisor |           |             |             |        |        |        |                   |
| Progress | Qualifier  | Admin      |           |             |             |        |        |        |                   |
| Progress | Validator  | Observer   |           |             |             |        |        |        |                   |
| Progress | Validator  | Supervisor |           |             |             |        |        |        |                   |
| Progress | Validator  | Admin      |           |             |             |        |        |        |                   |
| Progress | Viewer     | Observer   |           |             |             |   no   |   no   |  yes   |        no         |
| Progress | Viewer     | Supervisor |           |             |             |  yes   | yes:D  | yes:D  |       yes:D       |
| Progress | Viewer     | Admin      |           |             |             |  yes   |  yes   |  yes   |        yes        |
| Finished | Observer   | Observer   |           |             |             |   -    | yes:PO | yes:PO |      yes:PO       |
| Finished | Observer   | Supervisor |           |             |             |   -    | yes:D  | yes:D  |       yes:D       |
| Finished | Observer   | Admin      |           |             |             |   -    |  yes   |  yes   |        yes        |
| Finished | Manager    | Observer   |           |             |             |   -    |  yes   |  yes   |        yes        |
| Finished | Manager    | Supervisor |           |             |             |   -    |  yes   |  yes   |        yes        |
| Finished | Manager    | Admin      |           |             |             |   -    |  yes   |  yes   |        yes        |
| Finished | Qualifier  | Observer   |           |             |             |   -    |        |        |                   |
| Finished | Qualifier  | Supervisor |           |             |             |   -    |        |        |                   |
| Finished | Qualifier  | Admin      |           |             |             |   -    |        |        |                   |
| Finished | Validator  | Observer   |           |             |             |   -    |        |        |                   |
| Finished | Validator  | Supervisor |           |             |             |   -    |        |        |                   |
| Finished | Validator  | Admin      |           |             |             |   -    |        |        |                   |
| Finished | Viewer     | Observer   |           |             |             |   -    |   no   |  yes   |        no         |
| Finished | Viewer     | Supervisor |           |             |             |   -    | yes:D  | yes:D  |       yes:D       |
| Finished | Viewer     | Admin      |           |             |             |   -    |  yes   |  yes   |        yes        |
