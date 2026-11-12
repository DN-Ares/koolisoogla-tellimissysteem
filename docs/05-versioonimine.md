# 5. Git ja versioonimine

## 5.1 Git-i kasutus selles repositooriumis

- **Commit'id** on väikesed ja sisulised, üks muudatus korraga. Sõnum on käskivas kõneviisis ja ütleb, *mida* muudeti (nt "Lisa Scrumi metoodika, backlog ja Sprint 1 plaan").
- **Harud (branches)** võimaldavad töötada eraldi `main` harust, et pooleli töö ei lõhuks stabiilset versiooni:
  - `main` – alati stabiilne, väljalaske kõlbulik;
  - `feature/<nimi>` – uue funktsiooni arendus (nt `feature/order-cancel`);
  - `fix/<nimi>` – vea parandus;
  - `docs/<nimi>` – dokumentide muudatus.
  Valmis haru liidetakse `main`-i (Pull Request, ülevaatus, `merge`).
- **Sildid (tags)** märgivad väljalaske, nt `v1.0.0`.

## 5.2 Semantiline versioonimine (SemVer): MAJOR.MINOR.PATCH

| Osa | Millal suurendada | Näide SööklaTellimuse puhul |
|---|---|---|
| **MAJOR** | Muudatus, mis **ei ole tagasiühilduv** (lõhub olemasolevaid kliente/API-d) | API vastuse struktuur muutub (nt tellimuse `pickupTime` asendub `pickupSlot` objektiga); `/api/v1` asendub `/api/v2`-ga |
| **MINOR** | **Uus tagasiühilduv funktsioon** | Lisandub allergeenide filter või e-posti teavitus; vana kasutaja jätkab muutusteta |
| **PATCH** | **Tagasiühilduv veaparandus** | Parandatakse viga, mis lubas tellida pärast kella 09:30 |

Reeglid:

- Kui suurendad MAJOR-it, nullid MINOR ja PATCH (`1.4.2 → 2.0.0`).
- Kui suurendad MINOR-it, nullid PATCH (`1.4.2 → 1.5.0`).
- Versioonid `0.y.z` tähendavad arendusfaasi: API võib muutuda ja `1.0.0` märgib esimest stabiilset väljalaset.
- Vabatekstina võib lisada eelväljalaske: `1.0.0-rc.1`.

## 5.3 Versiooniplaan

| Versioon | Sisu | Backlog | Sprint | Staatus |
|---|---|---|---|---|
| **0.1.0** | Menüü vaatamine, menüü haldus, sisselogimine (sisemine demo) | T-01, US-01, US-02, US-03 | 1 | Plaanis |
| **0.2.0** | Tellimine ja tellimuste koond | US-04, US-05 | 2 | Plaanis |
| **0.2.1** | Võimalikud vead pilootkasutusest (PATCH) | – | 2–3 | Vajadusel |
| **0.3.0** | Tühistamine, allergeenid, tellimuse staatus | US-06, US-07, US-08 | 3 | Plaanis |
| **1.0.0** | Esimene stabiilne väljalase koolile, API `v1` külmutatakse | Pilootkasutuse parandused | 3–4 | Plaanis |
| **1.0.1** | Veaparandus pärast väljalaset (PATCH) | – | – | Vajadusel |
| **1.1.0** | E-posti teavitus ja müügiaruanne | US-09, US-10 | 4 | Plaanis |
| **1.2.0** | "Korda eelmist tellimust" | US-11 | Hiljem | Plaanis |
| **2.0.0** | Tagasiühildumatu API muutus (nt veebimaksed muudavad tellimuse struktuuri, `v2`) | Tulevikus | – | Idee |

## 5.4 Näited, millal mis muutub

| Olukord | Praegune | Järgmine |
|---|---|---|
| Parandame vea: tühistatud tellimus kuvatakse koondis | 1.0.0 | **1.0.1** (PATCH) |
| Lisame uue funktsiooni "korda eelmist tellimust", vana API töötab edasi | 1.0.1 | **1.1.0** (MINOR) |
| Eemaldame vana `/api/v1/orders` lõpp-punkti ja asendame uuega | 1.4.2 | **2.0.0** (MAJOR) |
| Lisame valikulise välja `comment` tellimuse päringusse | 1.1.0 | **1.2.0** (MINOR) |
| Muudame sisemist koodi, väline käitumine ei muutu | 1.2.0 | **1.2.1** (PATCH) |

## 5.5 Kuidas versiooninumbreid väljalaskel kasutaksin

1. **Arenduse ajal** liigub töö feature-harudest `main`-i. Versioon `0.x.y`.
2. **Väljalaske ettevalmistus:** loon haru `release/1.0` või käsitlen `main`-i; testin; uuendan `CHANGELOG.md`-i.
3. **Versiooni märkimine:** uuendan versiooninumbri (nt `pom.xml` / `package.json`) ja teen sildi:
   ```bash
   git tag -a v1.0.0 -m "Esimene stabiilne väljalase"
   git push origin v1.0.0
   ```
4. **GitHub Release:** loon sildi põhjal väljalaske koos muudatuste kirjeldusega (*Release notes*).
5. **Kasutuselevõtt:** paigaldan sildistatud versiooni serverisse; versiooni saab kontrollida endpoint'ist `/api/version` või lehe jaluses.
6. **Hotfix:** kriitilise vea korral loon haru `fix/...` väljalaske sildist, parandan, väljastan `1.0.1`.
7. **API versioon** on URL-is (`/api/v1/...`): MAJOR-muudatuse korral saab vana ja uut API-d mõnda aega paralleelselt hoida, et kliendid (nt tulevane mobiilirakendus) jõuaksid üle minna.

**Commit'i sõnumid** võib kirjutada [Conventional Commits](https://www.conventionalcommits.org/) stiilis (`feat:`, `fix:`, `docs:`), mis aitab versiooni määrata: `fix` → PATCH, `feat` → MINOR, `feat!` → MAJOR.
