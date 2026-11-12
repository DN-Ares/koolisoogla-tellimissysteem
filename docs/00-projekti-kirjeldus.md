# Projekti kirjeldus: SööklaTellimus

## Probleem

Koolisööklas tekivad lõunavahetunnil pikad järjekorrad. Õpilastel jääb söömiseks aega vähe, sööklal ei ole eelnevalt teada, mitu portsjonit millist toitu valmistada, ning üle jäänud toitu läheb raisku.

## Lahendus

Veebirakendus **SööklaTellimus**, kus õpilane näeb päeva menüüd, tellib toidu ette kindlaks lõunaajaks ja tuleb selle järele valmis tellimusega. Söökla näeb tellimuste koondit ning teab, kui palju kokata.

## Sidusrühmad ja rollid

| Roll | Kes see on | Mida vajab |
|---|---|---|
| Õpilane | Põhikasutaja (~600 inimest) | Kiire menüü ülevaade, lihtne tellimine, allergeenid |
| Sööklatöötaja | Kokk / müüja | Tellimuste koondlist, tellimuse staatuse muutmine |
| Administraator | Söökla juhataja | Menüü haldus, aruanded |
| Kooli IT | Tugi | Kooli kontoga sisselogimine, lihtne hooldus |

## Funktsionaalsed nõuded (kokkuvõte)

1. Sisselogimine kooli e-posti kontoga.
2. Päeva ja nädala menüü vaatamine koos hinna ja allergeenidega.
3. Tellimuse esitamine valitud lõunaajaks (tähtaeg: 09:30 samal päeval).
4. Tellimuse tühistamine enne tähtaega.
5. Sööklatöötaja näeb tellimuste koondit ja märgib tellimuse valmis / väljastatud.
6. Administraator haldab menüüd.
7. Teavitus tellimuse valmimisest (e-kiri).

## Mittefunktsionaalsed nõuded

- **Kasutatavus:** töötab telefonis ja arvutis (responsiivne).
- **Jõudlus:** menüü leht avaneb alla 2 sekundiga ~600 kasutaja korral.
- **Turvalisus:** ainult kooli kontoga sisenemine; isikuandmeid hoitakse minimaalselt (GDPR).
- **Hooldatavus:** koodi saab hooldada väike meeskond, lihtne paigaldada ühele serverile.
- **Kättesaadavus:** tellimine peab töötama tööpäeviti 07:00–15:00.

## Piirangud ja eeldused

- Makseid esimeses versioonis ei ole: tasutakse kohapeal olemasoleva kooli kaardiga.
- Projekti teeb üks arendaja kuni ~40 tundi kahe nädala kohta.
- Kooli konto pakkuja toetab OpenID Connect (OIDC) protokolli.

## Väljaspool ulatust (esimeses versioonis)

Veebimaksed, laoseisu haldus, lojaalsusprogramm, mobiilirakendus.
