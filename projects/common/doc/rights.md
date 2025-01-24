# Rights

## User profiles

##

O
: Only if explicitly declared as observer.

P
: Only if recorder person.

D
: Only if recorder department.

## Ongoing data collection

| State    | Privileges | Profiles      | Create | Update  |  View  | State change |
|----------|------------|---------------|:------:|:-------:|:------:|:------------:|
| Dirty    | Observer   | Observer      |  yes   |  *(1,2) | yes:PO | -> Terminate |
| Dirty    | Observer   | Supervisor    |  yes   |  yes:D  | yes:D  |    yes:D     |
| Dirty    | Observer   | Administrator |  yes   |   yes   |  yes   |     yes      |
| Dirty    | Manager    | Observer      |  yes   |   yes   |  yes   |     yes      |
| Dirty    | Manager    | Supervisor    |  yes   |   yes   |  yes   |     yes      |
| Dirty    | Manager    | Administrator |  yes   |   yes   |  yes   |     yes      |
| Dirty    | Qualifier  | Observer      |        |         |        |              |
| Dirty    | Qualifier  | Supervisor    |        |         |        |              |
| Dirty    | Qualifier  | Administrator |        |         |        |              |
| Dirty    | Validator  | Observer      |        |         |        |              |
| Dirty    | Validator  | Supervisor    |        |         |        |              |
| Dirty    | Validator  | Administrator |        |         |        |              |
| Dirty    | Viewer     | Observer      |   no   |   no    |  yes   |      no      |
| Dirty    | Viewer     | Supervisor    |  yes   |  yes:D  | yes:D  |    yes:D     |
| Dirty    | Viewer     | Administrator |  yes   |   yes   |  yes   |     yes      |

## Resumed data collection

| State      | Privileges | Profiles      | Create |   Update   |  View  | Upgrade/Downgrade |
|------------|------------|---------------|:------:|:----------:|:------:|:-----------------:|
| Controlled | Observer   | Observer      |   -    |   yes:PO   | yes:PO |      yes:PO       |
| Controlled | Observer   | Supervisor    |   -    |   yes:D    | yes:D  |       yes:D       |
| Controlled | Observer   | Administrator |   -    |    yes     |  yes   |        yes        |
| Controlled | Manager    | Observer      |   -    |    yes     |  yes   |        yes        |
| Controlled | Manager    | Supervisor    |   -    |    yes     |  yes   |        yes        |
| Controlled | Manager    | Administrator |   -    |    yes     |  yes   |        yes        |
| Controlled | Qualifier  | Observer      |   -    |            |        |                   |
| Controlled | Qualifier  | Supervisor    |   -    |            |        |                   |
| Controlled | Qualifier  | Administrator |   -    |            |        |                   |
| Controlled | Validator  | Observer      |   -    |            |        |                   |
| Controlled | Validator  | Supervisor    |   -    |            |        |                   |
| Controlled | Validator  | Administrator |   -    |            |        |                   |
| Controlled | Viewer     | Observer      |   -    |     no     |  yes   |        no         |
| Controlled | Viewer     | Supervisor    |   -    |   yes:D    | yes:D  |       yes:D       |
| Controlled | Viewer     | Administrator |   -    |    yes     |  yes   |        yes        |

| State      | Privileges | Profiles      | Recorder  | Department |  Observer   | Create | Update |  Show  | Upgrade/Downgrade |
|------------|------------|---------------|:---------:|:----------:|:-----------:|:------:|:------:|:------:|:-----------------:|
| Dirty      | Observer   | Observer      |    no     |     no     |     no      |  yes   |   no   |   no   |        no         |
| Dirty      | Observer   | Observer      |    yes    |     no     |     no      |  yes   |  yes   |  yes   |        yes        |
| Dirty      | Observer   | Observer      |    no     |    yes     |     no      |  yes   |  yes   |  yes   |        yes        |
| Dirty      | Observer   | Observer      |    no     |     no     |     yes     |  yes   |  yes   |  yes   |        yes        |
| Dirty      | Observer   | Supervisor    |    no     |     no     |     no      |  yes   |   no   | yes:D  |       yes:D       |
| Dirty      | Observer   | Supervisor    |           |            |             |  yes   | yes:D  | yes:D  |       yes:D       |
| Dirty      | Observer   | Supervisor    |           |            |             |  yes   | yes:D  | yes:D  |       yes:D       |
| Dirty      | Observer   | Supervisor    |           |            |             |  yes   | yes:D  | yes:D  |       yes:D       |
| Dirty      | Observer   | Administrator |           |            |             |  yes   |  yes   |  yes   |        yes        |
| Dirty      | Manager    | Observer      |           |            |             |  yes   |  yes   |  yes   |        yes        |
| Dirty      | Manager    | Supervisor    |           |            |             |  yes   |  yes   |  yes   |        yes        |
| Dirty      | Manager    | Administrator |           |            |             |  yes   |  yes   |  yes   |        yes        |
| Dirty      | Qualifier  | Observer      |           |            |             |        |        |        |                   |
| Dirty      | Qualifier  | Supervisor    |           |            |             |        |        |        |                   |
| Dirty      | Qualifier  | Administrator |           |            |             |        |        |        |                   |
| Dirty      | Validator  | Observer      |           |            |             |        |        |        |                   |
| Dirty      | Validator  | Supervisor    |           |            |             |        |        |        |                   |
| Dirty      | Validator  | Administrator |           |            |             |        |        |        |                   |
| Dirty      | Viewer     | Observer      |           |            |             |   no   |   no   |  yes   |        no         |
| Dirty      | Viewer     | Supervisor    |           |            |             |  yes   | yes:D  | yes:D  |       yes:D       |
| Dirty      | Viewer     | Administrator |           |            |             |  yes   |  yes   |  yes   |        yes        |
| Controlled | Observer   | Observer      |           |            |             |   -    | yes:PO | yes:PO |      yes:PO       |
| Controlled | Observer   | Supervisor    |           |            |             |   -    | yes:D  | yes:D  |       yes:D       |
| Controlled | Observer   | Administrator |           |            |             |   -    |  yes   |  yes   |        yes        |
| Controlled | Manager    | Observer      |           |            |             |   -    |  yes   |  yes   |        yes        |
| Controlled | Manager    | Supervisor    |           |            |             |   -    |  yes   |  yes   |        yes        |
| Controlled | Manager    | Administrator |           |            |             |   -    |  yes   |  yes   |        yes        |
| Controlled | Qualifier  | Observer      |           |            |             |   -    |        |        |                   |
| Controlled | Qualifier  | Supervisor    |           |            |             |   -    |        |        |                   |
| Controlled | Qualifier  | Administrator |           |            |             |   -    |        |        |                   |
| Controlled | Validator  | Observer      |           |            |             |   -    |        |        |                   |
| Controlled | Validator  | Supervisor    |           |            |             |   -    |        |        |                   |
| Controlled | Validator  | Administrator |           |            |             |   -    |        |        |                   |
| Controlled | Viewer     | Observer      |           |            |             |   -    |   no   |  yes   |        no         |
| Controlled | Viewer     | Supervisor    |           |            |             |   -    | yes:D  | yes:D  |       yes:D       |
| Controlled | Viewer     | Administrator |           |            |             |   -    |  yes   |  yes   |        yes        |