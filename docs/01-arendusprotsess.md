# 1. Tarkvara arendusprotsess

## 1.1 Arendusprotsessi etapid

| # | Etapp | Eesmärk | Mida SööklaTellimuse puhul teeme | Tulemus |
|---|---|---|---|---|
| 1 | Idee ja teostatavus | Selgitada, kas probleem on lahendamist väärt ja kas see on teostatav | Räägime söökla juhataja ja õpilasesindusega, mõõdame järjekorra pikkust, hindame kulu ja aega | Projekti kirjeldus, otsus "jätkame" |
| 2 | Nõuete analüüs | Panna kirja, mida süsteem peab tegema | Intervjuud, kasutajalood, mittefunktsionaalsed nõuded | Nõuete nimekiri, backlog |
| 3 | Disain / projekteerimine | Otsustada, kuidas süsteem ehitatakse | Arhitektuur, andmemudel (ER), UML-skeemid, kasutajaliidese visandid | Arhitektuuriskeem, andmemudel |
| 4 | Realiseerimine | Kirjutada töötav kood | Java + Spring Boot API, React kasutajaliides, PostgreSQL | Töötav tarkvaraversioon |
| 5 | Testimine | Kontrollida, et süsteem vastab nõuetele ja ei sisalda kriitilisi vigu | Ühiktestid, integratsioonitestid, kasutajate vastuvõtutest söökla töötajatega | Testiaruanne, parandatud vead |
| 6 | Kasutuselevõtt | Viia süsteem päris kasutajateni | Paigaldus kooli serverisse, kasutajate koolitus (õpilased, kokad), plakatid | Töötav süsteem tootmises |
| 7 | Hooldus | Hoida süsteem töökorras ja arendada edasi | Vigade parandamine, menüü/allergeenide muudatused, uued soovid, varukoopiad | Uued versioonid (PATCH/MINOR) |

Etapid ei ole ühekordsed: iteratiivse mudeli puhul läbitakse etapid 2–6 iga arendusperioodi (sprindi) jooksul väikeses mahus.

## 1.2 Arendusprotsessi mudelite võrdlus

### Koskmudel (waterfall)

Etapid järgnevad üksteisele lineaarselt: nõuded → disain → kood → test → kasutuselevõtt. Eelmisse etappi tagasi minemine on kallis.

### Iteratiivne ja inkrementaalne mudel

Süsteem valmib osade kaupa lühikestes tsüklites (iteratsioon). Iga tsükli lõpus on töötav täiendatud versioon, mille kohta saab tagasisidet.

| Kriteerium | Koskmudel | Iteratiivne mudel |
|---|---|---|
| Nõuete muutmine | Raske ja kallis | Oodatud ja lihtne (iga iteratsiooni alguses) |
| Esimene töötav versioon | Alles projekti lõpus | Juba esimeste nädalate järel |
| Tagasiside kliendilt | Peamiselt alguses ja lõpus | Pidevalt |
| Planeerimine | Üksikasjalik ette | Üldplaan ette, detailid jooksvalt |
| Riskid | Vead avastatakse hilja | Vead avastatakse vara |
| Dokumentatsioon | Mahukas, ette valmis | Minimaalne, kasvab töö käigus |
| Sobib, kui | Nõuded on kindlad ja muutumatud (nt tööstuse juhtimissüsteem, reguleeritud valdkond) | Nõuded ei ole täielikult selged või muutuvad |
| Peamine puudus | Kui nõuded muutuvad, tuleb palju ümber teha | Eelarvet ja lõppmahtu on raskem ette täpselt öelda |

## 1.3 Valitud mudel: iteratiivne ja inkrementaalne

**Valik:** iteratiivne-inkrementaalne mudel, mida rakendatakse Scrumi raamistikuga (vt [metoodika](02-metoodika-ja-backlog.md)).

**Põhjendus:**

1. **Nõuded ei ole alguses täielikult teada.** Söökla töötajad ei oska ette öelda, kuidas tellimuste koondit tahavad näha. Seda saab selgeks teha alles prototüübi peal.
2. **Kasutajate tagasiside on kriitiline.** Kui õpilastele on tellimine liiga keeruline, ei kasuta nad süsteemi. Seda peab nägema vara, mitte pärast poolt aastat arendust.
3. **Väärtust saab anda osade kaupa.** Isegi pelgalt menüü vaatamine (esimene versioon) on juba kasulik ja seda saab kasutusele võtta enne tellimise valmimist.
4. **Madal risk.** Väike rakendus, üks arendaja ja lühikesed tsüklid võimaldavad kiiresti suunda muuta.
5. **Koskmudel ei sobi**, sest õppeaasta jooksul võivad söökla töökorraldus (nt tellimise tähtaeg) ja õpilaste soovid muutuda.

**Kus koskmudeli elemente siiski kasutan:** enne esimest sprinti teen lühikese algfaasi (nõuete ülevaade, üldarhitektuur, andmemudel), sest arhitektuuri hilisem muutmine on kallis. See on mõistlik kompromiss: "piisav disain ette".

## 1.4 Mida teeksin, kui klient muudab arenduse keskel nõudeid

Näide: kolmanda sprindi keskel soovib söökla juhataja, et tellida saaks ka terve nädala ette.

**Protseduur:**

1. **Võta muudatus vastu ja kirjuta üles.** Muudatus läheb backlog'i kasutajalooks (mitte ei hakata kohe koodima).
2. **Hinda mõju.** Kui palju tööd? Mis olemasolevat koodi ja andmemudelit see mõjutab? Mis riske toob (nt tellimuse tähtaja loogika)?
3. **Anna kliendile valik.** Näitan hinnangut ja ütlen, mis jääb ära, kui see lisandub. Klient ehk Product Owner otsustab väärtuse põhjal.
4. **Pane prioriteeti.** Muudatus läheb backlog'i õigesse kohta.
5. **Planeeri sobivasse kohta.**
   - Tavaline muudatus: tuleb järgmise sprindi planeerimisele.
   - Kiire ja kriitiline muudatus: töötav sprint ei muutu. Kui on tõesti vaja, vahetatakse sprindis olev sama suurusega töö välja uue vastu (ja klient teab, mis jääb tegemata).
   - Põhimõtteline muudatus (sprindi eesmärk kaotab mõtte): sprindi võib katkestada ja planeerida uuesti.
6. **Uuenda dokumente.** Arhitektuuriskeem, andmemudel ja versiooniplaan vastavalt muudatusele.
7. **Hinda tagasiside põhjal.** Sprindi lõpu ülevaatuses (review) näitan kliendile tulemust ja uuesti kokku lepitakse prioriteedid.

**Põhimõte:** muudatus ei ole viga, vaid tavaline osa arendusest; oluline on, et see oleks nähtav, hinnatud ja kliendi poolt teadlikult prioriseeritud.
