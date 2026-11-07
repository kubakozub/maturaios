# Matura: iOS

Gra do nauki angielskiego słownictwa w zakresie matury podstawowej. Port wersji
na Androida: **ten sam silnik, to samo słownictwo, ta sama mechanika**, napisane
od nowa w Swifcie i SwiftUI.

**Wersja 0.8.0** (build 9) · 102 zestawy · 2084 hasła · 14 działów matury podstawowej

- Wersja na Androida: **[github.com/kubakozub/Matura](https://github.com/kubakozub/Matura)**
- Demo przeglądarkowe: **[kubakozub.github.io/Matura](https://kubakozub.github.io/Matura)**

---

## Jak się gra

Na środku planszy stoi działko. Z obu boków nadchodzą potworki, każdy
z angielskim słowem nad głową. Wpisujesz polskie tłumaczenie: działko obraca się
i strzela. Potworek, który dojdzie do działka, zabiera życie.

Pisanie działa po przedrostku: `cie` podświetla i `ciekawość`, i `cierpki`. Enter
strzela, gdy tekst pasuje dokładnie; przy kilku pasujących ginie najbliższy.

## Układ projektu

```
Package.swift              pakiet SPM z MaturaCore
Sources/MaturaCore/        cała mechanika, bez SwiftUI i bez UIKit
  Models.swift             zestawy, hasła, opcje, profil, wyniki, odznaki
  Matching.swift           normalizacja i dopasowanie odpowiedzi
  GameEngine.swift         symulacja trybu CLASSIC
  SetSearch.swift          wyszukiwanie zestawów po nazwie i po hasłach
  BuiltInSets.swift        wygenerowane słownictwo: nie edytować ręcznie
  Strings.swift            napisy PL/EN
  Repository.swift         zapis stanu do JSON-a
Tests/MaturaCoreTests/     58 testów, te same co po stronie Androida
App/                       warstwa SwiftUI
  MaturaApp.swift          punkt wejścia i stos ekranów
  AppState.swift           stan aplikacji, zapis i odczyt
  PixelArt.swift           ładowanie grafiki, kafle, dobór sprite'ów
  Views/                   ekrany, plansza, klawiatura
  Assets.xcassets          97 obrazków w rozdzielczości natywnej
Matura.xcodeproj           projekt dla Xcode
```

**`MaturaCore` celowo nie zna SwiftUI ani UIKit.** Dzięki temu cała mechanika gry
kompiluje się i testuje bez symulatora: także na Linuksie, zwykłym
`swift test`. To ta sama decyzja co po stronie Androida, gdzie silnik jest
czystym Kotlinem bez typów Androida, i z tego samego powodu: testy, które
wymagają emulatora, uruchamia się rzadko, więc przestają cokolwiek chronić.

## Budowanie

Aplikacja na iOS wymaga **macOS i Xcode 15**: inaczej się nie da, to nie jest
ograniczenie tego projektu, tylko Apple.

```bash
open Matura.xcodeproj          # cel „Matura", dowolny symulator iPhone'a
```

Sam silnik można zbudować i przetestować **na dowolnym systemie ze Swiftem**,
także na Linuksie:

```bash
swift build
swift test                     # 58 testów
```

Właśnie tak jest sprawdzany ten port: silnik przechodzi pełny zestaw testów poza
macOS-em, warstwa SwiftUI została sprawdzona składniowo (`swiftc -parse`).
**Na symulatorze nie była jeszcze uruchomiona**: to pierwsza rzecz do zrobienia
przy pierwszym otwarciu na Macu.

## Co jest przeniesione, a co nie

| Element | Stan |
|---|---|
| Silnik CLASSIC z pełną progresją trudności | tak, identyczny |
| Dopasowanie odpowiedzi z pomijaniem ogonków | tak, identyczne |
| Wyszukiwanie zestawów po nazwie i po hasłach | tak |
| Tempo gry CALM / NORM / FAST | tak |
| 102 zestawy, 2084 hasła | tak, generowane z tego samego źródła |
| Własne zestawy, edytor, kasowanie | tak |
| Osiągnięcia i ranking lokalny | tak |
| Klawiatura A-Z rysowana w grze | tak |
| Grafika pikselowa bez wygładzania | tak |
| **Font bitmapowy** | **nie**, napisy idą systemowym krojem o stałej szerokości |
| Dźwięk | nie, opcja jest, ale nic jeszcze nie gra |

Font bitmapowy to jedyna świadoma różnica wobec Androida. Renderowanie własnego
arkusza glifów w SwiftUI wymaga cięcia obrazu przez CoreGraphics i własnego
układu tekstu; do pierwszego uruchomienia na sprzęcie nie było tego jak sprawdzić,
więc lepiej, żeby wersja startowa wyglądała trochę inaczej, niż żeby napisy
wychodziły przesunięte o kilka pikseli.

## Tempo gry

Odstęp między falami to **6,5 s** na pierwszym poziomie, skracany o 0,14 s na
poziom aż do 2,6 s. Te liczby nie są z sufitu: średnia odpowiedź w zestawach ma
osiem liter, a przy trzech literach na sekundę na klawiaturze ekranowej plus
chwili na przypomnienie sobie słowa jeden potworek zajmuje graczowi około
czterech sekund. Wcześniejsza wersja wypuszczała je co 3,4 s, czyli szybciej,
niż dało się je zdejmować, i to już na pierwszym poziomie.

Opcja **Tempo** rozciąga te odstępy o 35% (CALM) albo ściska o 25% (FAST),
bo różnica między piszącym dwie a cztery litery na sekundę jest dwukrotna
i jedno ustawienie nie może pasować wszystkim.

## Prywatność

Aplikacja nie ma dostępu do sieci, nie zbiera żadnych danych i nie ma logowania.
Wszystko leży w prywatnym katalogu aplikacji i znika razem z nią.

## Licencja

Kod: do własnego użytku autora. Grafika pochodzi z zakupionego pakietu pixel art
i nie jest objęta licencją na redystrybucję.
