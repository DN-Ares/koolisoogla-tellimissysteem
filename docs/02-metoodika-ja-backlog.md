# 2. Arendusmetoodika, backlog ja sprindi planeerimine

## 2.1 Valitud metoodika: Scrum

Scrum on agiilne raamistik, kus töö tehakse fikseeritud pikkusega **sprintides** (siin 2 nädalat), iga sprindi lõpus on töötav versioon.

### Miks Scrum sobib SööklaTellimusele

| Vajadus | Kuidas Scrum aitab |
|---|---|
| Nõuded täpsustuvad töö käigus | Backlog on elav; prioriteete vaadatakse üle iga sprindi alguses |
| Vaja kiiret tagasisidet sööklalt | Sprindi lõpus toimub ülevaatus (review), kus tulemust näidatakse |
| Väärtust saab anda osade kaupa | Iga sprint annab kasutatava lisandi (sprint 1: menüü; sprint 2: tellimine) |
| Üks arendaja, vähe ressurssi | Fikseeritud sprindi maht väldib ülekoormust, hinnangud (story points) aitavad realistlikult planeerida |
| Selged tähtajad (õppeaasta algus) | Sprindid annavad rütmi ja aitavad tähtaega jälgida |

Rollid selles projektis: **Product Owner** – söökla juhataja (otsustab prioriteedid); **Scrum Master** ja **arendaja** – õpilane (ühes isikus, mis väikeses projektis on tavaline).

### Scrum vs Kanban

| Kriteerium | Scrum | Kanban |
|---|---|---|
| Rütm | Fikseeritud sprindid (1–4 nädalat) | Pidev voog, tähtaegu pole |
| Planeerimine | Sprindi planeerimine: valitakse töö sprindi jaoks | Töö võetakse, kui tekib vaba maht |
| Piirang | Sprindi maht (velocity) | WIP-limiit (korraga pooleli olevate tööde arv) |
| Rollid | Product Owner, Scrum Master, arendajad | Ametlikke rolle pole |
| Muudatused | Töötava sprindi ajal tavaliselt ei muudeta | Töid võib igal ajal lisada ja ümber prioriseerida |
| Sobib | Uue toote arendus, kus on vaja tulemusi etappide kaupa | Hooldus, tugi, pidevalt tulevad väikesed ülesanded |

**Järeldus:** arenduse ajal kasutan Scrumi. Kui süsteem on kasutuses ja on peamiselt hooldus (väikesed vead, menüümuudatused), võib minna üle Kanbanile.

## 2.2 Backlog

Täielik nimekiri: [backlog/backlog.csv](../backlog/backlog.csv) (import GitHub Projects'i, vt allpool). Kasutajalood on kujul "Rollina soovin ... et ...".

| ID | Kasutajalugu (lühidalt) | Prioriteet | Punktid | Sprint |
|---|---|---|---|---|
| T-01 | Tehniline karkass (CI, DB migratsioonid, projekt) | Must | 3 | 1 |
| US-01 | Õpilasena näen päeva ja nädala menüüd | Must | 3 | 1 |
| US-02 | Õpilasena login sisse kooli kontoga | Must | 5 | 1 |
| US-03 | Administraatorina haldan menüüd | Must | 5 | 1 |
| US-04 | Õpilasena tellin toidu ette lõunaajaks | Must | 8 | 2 |
| US-05 | Sööklatöötajana näen tellimuste koondit | Must | 5 | 2 |
| US-06 | Õpilasena tühistan tellimuse enne tähtaega | Should | 3 | 3 |
| US-07 | Õpilasena näen ja filtreerin allergeene | Should | 3 | 3 |
| US-08 | Sööklatöötajana märgin tellimuse valmis/väljastatud | Should | 3 | 3 |
| US-09 | Õpilasena saan e-posti teavituse valmimisest | Could | 5 | 4 |
| US-10 | Administraatorina näen müügiaruannet | Could | 5 | 4 |
| US-11 | Õpilasena kordan eelmist tellimust | Won't (praegu) | 3 | Hiljem |

Hinnangud on **story points** (Fibonacci: 1, 2, 3, 5, 8). Suhteline hinnang: US-01 (3) on referentsülesanne, ülejäänud võrdlen sellega.

### Prioriteetide määramine (MoSCoW + sõltuvused)

- **Must** – ilma selleta ei ole süsteem kasutatav (menüü, sisselogimine, tellimine, koond).
- **Should** – oluline, aga esimene versioon töötab ka ilma (tühistamine, allergeenid, staatus).
- **Could** – meeldiv lisa (teavitus, aruanne).
- **Won't (praegu)** – teadlikult hilisemaks.

Järjekorra määramisel arvestan lisaks **väärtust, riski ja sõltuvusi**. Näiteks US-04 (tellimine) vajab US-02 (kasutaja) ja US-03 (menüü andmeid), seega need tulevad enne. Kõrge riskiga asja (sisselogimine OIDC-ga) teen vara.

### Valmisoleku definitsioon (Definition of Done)

Töö on valmis, kui: kood on koodiülevaatuses (või isikliku kontrollitud), automaattestid läbivad, vastuvõtukriteeriumid on täidetud, dokumentatsioon on uuendatud, muudatus on `main` harus ja töötab testkeskkonnas.

## 2.3 Esimese arendusperioodi (Sprint 1) plaan

- **Kestus:** 2 nädalat, **16.11.2026 – 27.11.2026**
- **Maht:** 16 story pointi (eeldus: ~40 tundi, 1 punkt ≈ 2,5 h)
- **Sprindi eesmärk:** *Administraator saab sisestada menüü ja sisse logitud õpilane näeb seda.*

| Järjekord | Lugu | Ülesanded (hinnang) | Tunnid |
|---|---|---|---|
| 1 | T-01 Tehniline karkass | Repo ja haruloogika; Spring Boot projekt; React projekt; PostgreSQL + Flyway; CI (GitHub Actions) | 8 |
| 2 | US-03 Menüü haldus | `MenuItem` andmemudel ja migratsioon; REST API (CRUD); admin-leht; testid | 12 |
| 3 | US-01 Menüü vaatamine | API menüü päringuks kuupäeva järgi; menüü leht (responsiivne); testid | 7 |
| 4 | US-02 Sisselogimine | OIDC seadistus; kasutaja salvestamine; rollikontroll; väljalogimine; testid | 12 |
| | **Kokku** | | **39** |

### Sprindi sündmused

| Sündmus | Millal | Kestus | Mida tehakse |
|---|---|---|---|
| Sprindi planeerimine | Sprindi esimene päev | ~1,5 h | Valitakse backlog'ist lood, jagatakse ülesanneteks, lepitakse sprindi eesmärk |
| Igapäevane kokkuvõte (Daily) | Iga päev | 5–10 min | Mis tegin, mida teen täna, mis segab (üksi: lühike märge töölauale) |
| Sprindi ülevaatus (Review) | Viimane päev | ~45 min | Näidatakse tulemust söökla juhatajale, kogutakse tagasisidet |
| Tagasivaade (Retrospective) | Pärast review'd | ~30 min | Mis läks hästi, mida parandada, 1–2 konkreetset muudatust |

## 2.4 Kuidas töid planeeritakse ja jälgitakse

**Planeerimine:**

1. Product Owner koos arendajaga hoiab backlog'i järjestatuna (ülal kõige olulisem).
2. Sprindi alguses võetakse ülevalt nii palju lugusid, kui mahutub **velocity** järgi (eelmise sprindi tegelik valmis punktide arv; esimesel sprindil eeldus).
3. Iga lugu jagatakse ülesanneteks ja hinnatakse tundides.

**Jälgimine:**

- **Tahvel** (GitHub Projects): veerud *Backlog → Sprint backlog → In progress → Review/Test → Done*.
- **Burndown-diagramm:** järelejäänud punktid päevade kaupa; näitab, kas sprint on graafikus.
- **Velocity:** valmis punktid sprindi kohta, kasutatakse järgmise sprindi mahu planeerimiseks.
- **WIP** hoian väikesena (max 2 lugu korraga pooleli), et vältida pooleliolevaid töid.

## 2.5 Projektihaldusvahend: GitHub Projects

Valisin GitHub Projects'i, sest see on integreeritud koodirepositooriumiga (Issue'd, Pull Request'id, automaatsed staatused) ja on tasuta.

**Seadistus (ühekordne):**

1. GitHubis: repositooriumi **Projects → New project → Board**, nimi "SööklaTellimus".
2. Lisa väljad: `Priority` (Must/Should/Could/Won't), `Points` (number), `Sprint` (iteration, 2 nädalat).
3. Loo veerud: Backlog, Sprint backlog, In progress, Review/Test, Done.
4. Loo kasutajalood issue'tena skriptiga [scripts/create-github-issues.ps1](../scripts/create-github-issues.ps1) (loeb `backlog/backlog.csv`), seejärel lisa issue'd projekti ("Add item" või workflow "Auto-add").
5. Tõsta Sprint 1 lood veergu *Sprint backlog* ja määra `Sprint = Sprint 1`.

> Viide tööde haldamise keskkonnale (lisa pärast projekti loomist): **GitHub Projects: _[lisa link siia]_**

Ekraanitõmmis tahvlist lisatakse kausta `docs/img/` pärast tahvli seadistamist.
