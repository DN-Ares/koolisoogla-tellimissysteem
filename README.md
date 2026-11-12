# SööklaTellimus – koolisöökla toitude tellimise süsteem

Tarkvaraarenduse planeerimisülesanne (VIKK, tarkvaraarenduse õpe). Repositoorium sisaldab rakenduse **kavandamise dokumente ja skeeme**; rakendust ei programmeerita.

**Idee:** õpilane tellib lõunasöögi veebirakenduses ette ja tuleb selle järele ilma järjekorras seismata; söökla teab ette, palju kokata.

## Kust mida leida

| Nõue | Dokument / fail |
|---|---|
| Projekti kirjeldus ja nõuded | [docs/00-projekti-kirjeldus.md](docs/00-projekti-kirjeldus.md) |
| **1. Arendusprotsess** (etapid, mudelite võrdlus, valik, nõuete muutumine) | [docs/01-arendusprotsess.md](docs/01-arendusprotsess.md) |
| **2. Metoodika** (Scrum), kasutajalood, prioriteedid, Sprint 1 | [docs/02-metoodika-ja-backlog.md](docs/02-metoodika-ja-backlog.md) |
| Backlog (CSV, 11 lugu) | [backlog/backlog.csv](backlog/backlog.csv) |
| Viide tööde haldamise keskkonnale (GitHub Projects) | _[lisa link siia pärast tahvli loomist]_ (juhend: [docs/02 §2.5](docs/02-metoodika-ja-backlog.md#25-projektihaldusvahend-github-projects)) |
| **3. CASE-vahendid** (võrdlus, kasutusnäited) | [docs/03-case-vahendid.md](docs/03-case-vahendid.md) |
| **4. Arhitektuur** (valik, andmevoog, võrdlus mikroteenustega) | [docs/04-arhitektuur.md](docs/04-arhitektuur.md) |
| Arhitektuuriskeem, **muudetav** (diagrams.net) | [diagrams/architecture.drawio](diagrams/architecture.drawio) |
| Arhitektuuriskeem, muudetav (PlantUML) | [diagrams/architecture.puml](diagrams/architecture.puml) |
| Kasutusjuhud, ER-mudel, andmevoo jadadiagramm | [usecase.puml](diagrams/usecase.puml), [er-model.puml](diagrams/er-model.puml), [sequence-order.puml](diagrams/sequence-order.puml) |
| **5. Git ja versioonimine**, SemVer versiooniplaan | [docs/05-versioonimine.md](docs/05-versioonimine.md), [CHANGELOG.md](CHANGELOG.md) |
| Ettevalmistus kaitsmiseks | [docs/06-kaitsmiseks.md](docs/06-kaitsmiseks.md) |

## Peamised valikud lühidalt

- **Arendusmudel:** iteratiivne-inkrementaalne
- **Metoodika:** Scrum, 2-nädalased sprindid, projektihaldus GitHub Projects'is
- **Rakenduse tüüp:** veebirakendus (React SPA + REST API)
- **Arhitektuur:** kihiline monoliit (Spring Boot, PostgreSQL)
- **CASE-vahendid:** diagrams.net, PlantUML, GitHub Projects
- **Versioonimine:** SemVer, esimene stabiilne väljalase 1.0.0

## Skeemide avamine ja muutmine

- `.drawio` – ava <https://app.diagrams.net> (*Open Existing Diagram*) või VS Code'i laiendusega *Draw.io Integration*.
- `.puml` – VS Code'i laiendus *PlantUML* või <https://www.plantuml.com/plantuml>.

## AI kasutamine

Selgituste, kasutajalugude ja skeemide mustandite koostamisel on kasutatud AI abi (Claude). Valikud on läbi vaadatud ja neid on võimalik iseseisvalt põhjendada ning muuta.
