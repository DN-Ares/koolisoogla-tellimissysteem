# 6. Ettevalmistus kaitsmiseks

Märkmed, mitte vastuste päheõppimiseks: kaitsmisel tuleb muudatus teha **päriselt** (skeem, backlog), seega harjuta draw.io-s ja PlantUML-is.

## A. Oma projekti selgitamine (5 min)

| Küsimus | Lühivastus | Kus on kirjas |
|---|---|---|
| Miks iteratiivne mudel ja Scrum? | Nõuded täpsustuvad kasutajate tagasisidega, väärtust saab anda osade kaupa; koskmudeli puhul tuleks viga välja alles lõpus | [01](01-arendusprotsess.md), [02](02-metoodika-ja-backlog.md) |
| Miks kihiline monoliit? | Väike süsteem (~600 kasutajat), üks arendaja; lihtne arendada ja paigaldada; mikroteenused oleksid liigne keerukus | [04](04-arhitektuur.md) |
| Milliseid CASE-vahendeid kasutasin? | draw.io arhitektuuri visuaalseks skeemiks, PlantUML UML-i jaoks (tekst, Git-sõbralik), GitHub Projects planeerimiseks | [03](03-case-vahendid.md) |
| Kuidas liiguvad andmed UI-st andmebaasini? | React → HTTPS → Nginx → kontroller (+turvafilter) → teenus (äriloogika) → repository → PostgreSQL ja tagasi | [04 §4.4](04-arhitektuur.md) |
| Mis juhtub, kui klient muudab nõudeid? | Muudatus backlog'i, mõjuhinnang, PO prioriseerib, planeeritakse järgmisesse sprinti; töötavat sprinti ei muudeta, v.a vahetus sama suure tööga | [01 §1.4](01-arendusprotsess.md) |

## B. Ootamatu muudatus (10 min) – ettevalmistatud mõtted

### Olukord 1: lisandub mobiilirakendus

- **Arhitektuurimuutus:** lisa skeemile komponent "Mobiilirakendus", mis kasutab **sama REST API-t** nagu React SPA (nool otse Nginx/kontrollerisse). Server ei muutu põhimõtteliselt.
- **Taaskasutatav:** kogu ärikiht, andmepöördus, andmebaas, turvalisus (OIDC), REST API. Kasutajaliides tuleb uuesti teha (React Native / Flutter) või teha PWA.
- **Uued tööd backlog'i:** mobiili tehnoloogia valik; mobiilne sisselogimine (OIDC PKCE); menüü ekraan; tellimuse ekraan; push-teavitused (NotificationService laiendus); poodi avaldamine; API muudatused, mis on vajalikud (nt tokeni kehtivus).
- **Mõju protsessile:** uus suur epic → hinnata, pane prioriteeti, jaga väikesteks lugudeks; versioon MINOR (nt 1.3.0), kui API on tagasiühilduv; lisandub testimine seadmetel.

### Olukord 2: tähtaeg lüheneb poole võrra

- **Backlog:** hoia ainult **Must**: T-01, US-01, US-02, US-03, US-04, US-05 (kokku 29 punkti; algne plaan on 4 sprinti, poole lühema tähtajaga jääb 2 sprinti ≈ 32 punkti, seega Must mahub). Kui aega on veel vähem: US-03 võib ajutiselt asendada käsitsi andmebaasi täitmisega, US-02 lihtsa kooli konto sisselogimisega.
- **Teise versiooni jaoks:** US-06, US-07, US-08, US-09, US-10, US-11.
- **Metoodika:** Scrum lubab backlog'i ümber prioriseerida igal sprindi planeerimisel, väiksed iteratsioonid annavad kasutatava versiooni varem, hinnangud ja velocity näitavad, mis jõuame.
- **Kokkulepe kliendiga:** vähenda mahtu (scope), mitte kvaliteeti (testid jäävad).

### Olukord 3: kasutajaid 100 korda rohkem (~60 000)

- **Pudelikaelad:** (1) andmebaas, eriti ühel ajal tellimused enne 09:30 (tipukoormus kirjutamisel); (2) üksik rakendusserver; (3) OIDC sisselogimine; (4) e-posti saatmine ärikihis sünkroonselt.
- **Võimalikud muudatused:** mitu rakendusserveri koopiat koormusjaguri (load balancer) taga (rakendus on *stateless*, token-põhine); vahemälu (Redis) menüü jaoks; andmebaasi lugemisreplikad ja indeksid; e-kirjad järjekorra (message queue) kaudu asünkroonselt; vajadusel `OrderService` eraldi teenuseks (samm mikroteenuste suunas); CDN staatilistele failidele.
- **Skeemi muutus:** lisa Load Balancer, mitu App-instantsi, Redis, järjekord, DB primary + replica.
- **Põhjendus:** alustada vähima muutusega (skaleerimine horisontaalselt, vahemälu), mitte kohe mikroteenustele üle minna; mõõta enne optimeerimist.

## C. Teadmiste kontroll – kiired vastused

- **Koskmudel vs iteratiivne:** koskmudel läbib etapid üks kord järjest, nõuete muutmine kallis; iteratiivne teeb väikeseid tsükleid, annab pidevalt töötava versiooni ja lubab muutusi.
- **Scrum vs Kanban:** Scrumil on fikseeritud sprindid, rollid ja sündmused; Kanban on pidev voog WIP-limiidiga ja ilma sprintideta.
- **Mida CASE-vahend lahendab:** hoiab disaini nähtavana ja ühtsena, vähendab käsitööd, parandab suhtlust ja dokumenteerimist, aitab koodi/skeemi genereerida või versioonida.
- **Monoliit vs mikroteenused:** monoliit on üks paigaldatav üksus (lihtne, skaleeritakse tervikuna); mikroteenused on väikesed sõltumatud teenused (paindlik skaleerimine ja tiimid, kuid keeruline).
- **Miks harud Gitis:** et arendada funktsioone eraldi `main`-ist, töötada paralleelselt ja liita alles siis, kui töö on valmis ja ülevaadatud.
- **Versioon 2.4.1:** veaparandus → **2.4.2**; uus tagasiühilduv funktsioon → **2.5.0**; avalikku API-d lõhkuv muudatus → **3.0.0**.
