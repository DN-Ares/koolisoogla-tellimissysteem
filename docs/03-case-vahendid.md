# 3. CASE-vahendid

**CASE** (Computer-Aided Software Engineering) vahendid toetavad tarkvaraarenduse tegevusi: modelleerimist, planeerimist, koodi haldust ja dokumenteerimist. Need aitavad hoida disaini ühtsena, vähendavad käsitööd ja muudavad skeemid ning plaanid jagatavaks.

## 3.1 Kasutatavad vahendid

| Vahend | Tüüp | Mida selle projekti jaoks tehakse | Arendustegevus |
|---|---|---|---|
| **diagrams.net (draw.io)** | Modelleerimise/disaini CASE-vahend | Arhitektuuriskeem ([architecture.drawio](../diagrams/architecture.drawio)) | Disain, arhitektuur |
| **PlantUML** | Modelleerimise/disaini CASE-vahend (tekstipõhine UML) | Kasutusjuhud, ER-mudel, jadadiagramm, arhitektuuri tekstiversioon ([diagrams/](../diagrams/)) | Nõuete analüüs, disain, dokumenteerimine |
| **GitHub Projects** | Projektihaldus | Backlog, sprindi tahvel, prioriteedid | Planeerimine, jälgimine |
| **Git + GitHub** | Versioonihaldus | Dokumentide ja skeemide ajalugu | Versioonimine, koostöö |

## 3.2 Mida vahendid võimaldavad

- **Nõuete analüüs:** kasutusjuhtude diagramm ([usecase.puml](../diagrams/usecase.puml)) näitab, kes mida süsteemiga teeb.
- **Disain:** ER-mudel ([er-model.puml](../diagrams/er-model.puml)) kirjeldab andmebaasi struktuuri enne kodeerimist. Jadadiagramm ([sequence-order.puml](../diagrams/sequence-order.puml)) näitab komponentide koostööd.
- **Arhitektuur:** komponentide skeem näitab osad ja seosed ning on arutelu aluseks.
- **Planeerimine:** backlog ja tahvel muudavad töö nähtavaks.
- **Dokumenteerimine:** skeemid on Gitis, seega nende muutmist saab jälgida.

## 3.3 Võrdlus: diagrams.net vs PlantUML

| Kriteerium | diagrams.net (draw.io) | PlantUML |
|---|---|---|
| Töötamise viis | Visuaalne, lohistades kujundeid | Tekstipõhine, skeem kirjutatakse koodina |
| Õppimiskõver | Madal, intuitiivne | Vajab süntaksi tundmist |
| Paigutuse kontroll | Täielik käsitsi kontroll | Automaatne, raskem täpselt kontrollida |
| Versioonihaldus (Git) | Fail on XML, muudatuste võrdlemine raskem | Lihtne tekst, selged diff'id |
| Kiirus muutmisel | Aeglasem suurte muudatuste puhul | Kiire: muuda rida ja uuenda |
| UML-i tugi | Üldotstarbeline joonistusvahend, UML on kujundite komplekt | Spetsiaalselt UML-i jaoks, kontrollib süntaksit |
| Hind | Tasuta | Tasuta |
| Sobib | Arhitektuuriskeemid, visandid, vabakujulised diagrammid | UML-diagrammid (kasutusjuhud, jada, klassid), mida peab sageli muutma |

**Visual Paradigm (kolmas võrdluseks):** põhjalik UML/ER-modelleerimise vahend koodi genereerimise ja andmebaasi sünkroniseerimisega; kuid keeruline ja tasuline (tasuta versioon piiratud). Väikese projekti jaoks on see liiga raske.

**Minu valik:** arhitektuuriskeem on diagrams.net-is (visuaalne ülevaade, lihtne kaitsmisel muuta); UML-diagrammid PlantUML-is (kiire muuta, hästi Gitis versioonitav).

## 3.4 Kasutamise näited

### Arhitektuuriskeemi muutmine diagrams.net-is

1. Ava <https://app.diagrams.net> → **Open Existing Diagram** → vali `diagrams/architecture.drawio`.
2. Lisa uus kast: lohista vasakult kujund või topeltklõps tühjal alal; kirjuta nimi.
3. Ühenda: hõlju üle kasti, tõmba noolt teise kasti.
4. Salvesta (**File → Save** / Ctrl+S) ja tee Gitis commit.

### UML-i muutmine PlantUML-is

1. Ava `.puml` fail VS Code'is (laiendus *PlantUML*) või <https://www.plantuml.com/plantuml>.
2. Muuda tekst, näiteks lisa `[MobileApp] --> ctrl : REST` arhitektuuri.
3. Eelvaade uueneb; salvesta ja commit'i.

### Tööde haldamine GitHub Projects'is

Backlog'i lood on issue'd; tahvlil liigutatakse neid veergude vahel (vt [metoodika](02-metoodika-ja-backlog.md#25-projektihaldusvahend-github-projects)).
