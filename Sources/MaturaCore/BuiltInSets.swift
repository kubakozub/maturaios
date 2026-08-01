import Foundation

/// Wbudowane słownictwo — wygenerowane, nie edytować ręcznie.
///
/// Źródłem jest ten sam plik, z którego powstaje wersja na Androida, więc obie
/// aplikacje mają identyczną zawartość co do hasła. Jedna funkcja na zestaw
/// zamiast jednej wielkiej tablicy: sprawdzanie typów w Swifcie na literale
/// z dwoma tysiącami elementów potrafi się ciągnąć minutami.
public enum BuiltInSets {

    public static func all() -> [WordSet] {
        [
            set000(),
            set001(),
            set002(),
            set003(),
            set004(),
            set005(),
            set006(),
            set007(),
            set008(),
            set009(),
            set010(),
            set011(),
            set012(),
            set013(),
            set014(),
            set015(),
            set016(),
            set017(),
            set018(),
            set019(),
            set020(),
            set021(),
            set022(),
            set023(),
            set024(),
            set025(),
            set026(),
            set027(),
            set028(),
            set029(),
            set030(),
            set031(),
            set032(),
            set033(),
            set034(),
            set035(),
            set036(),
            set037(),
            set038(),
            set039(),
            set040(),
            set041(),
            set042(),
            set043(),
            set044(),
            set045(),
            set046(),
            set047(),
            set048(),
            set049(),
            set050(),
            set051(),
            set052(),
            set053(),
            set054(),
            set055(),
            set056(),
            set057(),
            set058(),
            set059(),
            set060(),
            set061(),
            set062(),
            set063(),
            set064(),
            set065(),
            set066(),
            set067(),
            set068(),
            set069(),
            set070(),
            set071(),
            set072(),
            set073(),
            set074(),
            set075(),
            set076(),
            set077(),
            set078(),
            set079(),
            set080(),
            set081(),
            set082(),
            set083(),
            set084(),
            set085(),
            set086(),
            set087(),
            set088(),
            set089(),
            set090(),
            set091(),
            set092(),
            set093(),
            set094(),
            set095(),
            set096(),
            set097(),
            set098(),
            set099(),
            set100(),
            set101(),
        ]
    }

    private static func set000() -> WordSet {
        WordSet(
            id: "set000",
            title: "Człowiek · Charakter: dojrzałość",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("mature", "dojrzały"),
                Entry("immature", "niedojrzały"),
                Entry("modest", "skromny"),
                Entry("immodest", "nieskromny"),
                Entry("neat", "schludny"),
                Entry("open-minded", "otwarty"),
                Entry("narrow-minded", "ograniczony"),
                Entry("reliable", "godny zaufania"),
                Entry("responsible", "odpowiedzialny"),
                Entry("irresponsible", "nieodpowiedzialny"),
                Entry("self-confident", "pewny siebie"),
                Entry("sensible", "rozsądny"),
                Entry("shallow", "płytki"),
                Entry("wise", "mądry"),
                Entry("naive", "naiwny"),
                Entry("thoughtful", "rozważny"),
                Entry("thoughtless", "bezmyślny"),
                Entry("serious", "poważny"),
                Entry("childish", "dziecinny"),
                Entry("balanced", "zrównoważony"),
            ],
            builtIn: true
        )
    }

    private static func set001() -> WordSet {
        WordSet(
            id: "set001",
            title: "Człowiek · Charakter: temperament",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("easy-going", "wyluzowany"),
                Entry("funny", "zabawny"),
                Entry("lively", "pełen życia"),
                Entry("patient", "cierpliwy"),
                Entry("impatient", "niecierpliwy"),
                Entry("peaceful", "spokojny"),
                Entry("quiet", "cichy"),
                Entry("relaxed", "zrelaksowany"),
                Entry("rebellious", "buntowniczy"),
                Entry("sensitive", "wrażliwy"),
                Entry("insensitive", "niewrażliwy"),
                Entry("apologetic", "przepraszający"),
                Entry("insecure", "niepewny"),
                Entry("dependent", "zależny"),
                Entry("independent", "niezależny"),
                Entry("irony", "ironia"),
                Entry("moody", "humorzasty"),
                Entry("cheerful", "pogodny"),
                Entry("nervous", "nerwowy"),
                Entry("spontaneous", "spontaniczny"),
            ],
            builtIn: true
        )
    }

    private static func set002() -> WordSet {
        WordSet(
            id: "set002",
            title: "Człowiek · Charakter: w relacjach",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("friendly", "przyjazny"),
                Entry("unfriendly", "nieprzyjazny"),
                Entry("kind", "uprzejmy"),
                Entry("unkind", "niemiły"),
                Entry("kind-hearted", "życzliwy"),
                Entry("loyal", "lojalny"),
                Entry("disloyal", "nielojalny"),
                Entry("polite", "uprzejmy"),
                Entry("impolite", "nieuprzejmy"),
                Entry("politeness", "uprzejmość"),
                Entry("sociable", "towarzyski, kontaktowy"),
                Entry("unsociable", "nietowarzyski"),
                Entry("outgoing", "towarzyski"),
                Entry("reserved", "powściągliwy"),
                Entry("shy", "nieśmiały"),
                Entry("talkative", "gadatliwy"),
                Entry("tolerant", "tolerancyjny"),
                Entry("intolerant", "nietolerancyjny"),
                Entry("selfless", "bezinteresowny"),
                Entry("personality", "osobowość"),
            ],
            builtIn: true
        )
    }

    private static func set003() -> WordSet {
        WordSet(
            id: "set003",
            title: "Człowiek · Charakter: wady",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("aggressive", "agresywny"),
                Entry("argumentative", "kłótliwy"),
                Entry("arrogant", "arogancki"),
                Entry("bossy", "władczy"),
                Entry("careless", "nieostrożny"),
                Entry("cold", "oschły"),
                Entry("conceited", "zarozumiały"),
                Entry("cruel", "okrutny"),
                Entry("dishonest", "nieuczciwy"),
                Entry("dull", "nudny"),
                Entry("lazy", "leniwy"),
                Entry("mean", "skąpy, złośliwy"),
                Entry("messy", "bałaganiarski"),
                Entry("nasty", "wstrętny"),
                Entry("rude", "niegrzeczny"),
                Entry("selfish", "samolubny"),
                Entry("stubborn", "uparty"),
                Entry("stupid", "głupi"),
                Entry("vain", "próżny"),
                Entry("violent", "gwałtowny"),
            ],
            builtIn: true
        )
    }

    private static func set004() -> WordSet {
        WordSet(
            id: "set004",
            title: "Człowiek · Charakter: zalety",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("ambitious", "ambitny"),
                Entry("artistic", "artystyczny"),
                Entry("brave", "odważny"),
                Entry("bright", "bystry"),
                Entry("calm", "spokojny"),
                Entry("careful", "ostrożny"),
                Entry("caring", "troskliwy"),
                Entry("cheerful", "radosny"),
                Entry("clever", "mądry"),
                Entry("compassionate", "współczujący"),
                Entry("confident", "pewny siebie"),
                Entry("disciplined", "zdyscyplinowany"),
                Entry("generous", "hojny"),
                Entry("gentle", "łagodny"),
                Entry("hard-working", "pracowity"),
                Entry("helpful", "pomocny"),
                Entry("honest", "uczciwy"),
                Entry("hospitable", "gościnny"),
                Entry("intelligent", "inteligentny"),
                Entry("wise", "mądry"),
            ],
            builtIn: true
        )
    }

    private static func set005() -> WordSet {
        WordSet(
            id: "set005",
            title: "Człowiek · Ciało",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("ankle", "kostka"),
                Entry("arm", "ręka"),
                Entry("back", "plecy"),
                Entry("body", "ciało"),
                Entry("bottom", "pupa"),
                Entry("chest", "klatka piersiowa"),
                Entry("elbow", "łokieć"),
                Entry("fist", "pięść"),
                Entry("foot", "stopa"),
                Entry("feet", "stopy"),
                Entry("forearm", "przedramię"),
                Entry("hand", "ręka"),
                Entry("head", "głowa"),
                Entry("heel", "pięta"),
                Entry("hip", "biodro"),
                Entry("knee", "kolano"),
                Entry("leg", "noga"),
                Entry("neck", "szyja"),
                Entry("shoulder", "ramię"),
                Entry("skin", "skóra"),
                Entry("stomach", "brzuch"),
                Entry("thigh", "udo"),
                Entry("thumb", "kciuk"),
                Entry("waist", "talia"),
                Entry("wrist", "nadgarstek"),
            ],
            builtIn: true
        )
    }

    private static func set006() -> WordSet {
        WordSet(
            id: "set006",
            title: "Człowiek · Dane osobowe",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("age", "wiek"),
                Entry("birth", "narodziny"),
                Entry("citizen", "obywatel"),
                Entry("divorced", "rozwiedziony"),
                Entry("female", "kobieta"),
                Entry("male", "mężczyzna"),
                Entry("first name", "imię"),
                Entry("job", "zawód"),
                Entry("marital status", "stan cywilny"),
                Entry("married", "żonaty/zamężna"),
                Entry("nationality", "narodowość"),
                Entry("personal details", "dane osobowe"),
                Entry("sex", "płeć"),
                Entry("single", "stanu wolnego"),
                Entry("surname", "nazwisko"),
                Entry("widow", "wdowa"),
                Entry("widower", "wdowiec"),
                Entry("birthday", "urodziny"),
                Entry("birthplace", "miejsce urodzenia"),
                Entry("signature", "podpis"),
            ],
            builtIn: true
        )
    }

    private static func set007() -> WordSet {
        WordSet(
            id: "set007",
            title: "Człowiek · Dodatki i obuwie",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("accessories", "akcesoria"),
                Entry("belt", "pasek"),
                Entry("boots", "kozaki"),
                Entry("bracelet", "bransoletka"),
                Entry("briefcase", "teczka, aktówka"),
                Entry("earrings", "kolczyki"),
                Entry("glasses", "okulary"),
                Entry("gloves", "rękawiczki"),
                Entry("handbag", "torebka"),
                Entry("hat", "kapelusz"),
                Entry("jewellery", "biżuteria"),
                Entry("necklace", "naszyjnik"),
                Entry("sandals", "sandały"),
                Entry("scarf", "szalik"),
                Entry("shoes", "buty"),
                Entry("sneakers", "tenisówki"),
                Entry("sunglasses", "okulary przeciwsłoneczne"),
                Entry("trainers", "buty sportowe"),
                Entry("woolly hat", "czapka zimowa"),
                Entry("watch", "zegarek"),
            ],
            builtIn: true
        )
    }

    private static func set008() -> WordSet {
        WordSet(
            id: "set008",
            title: "Człowiek · Emocje i nastroje",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("annoyed", "rozdrażniony"),
                Entry("annoying", "denerwujący"),
                Entry("bored", "znudzony"),
                Entry("boring", "nudne"),
                Entry("depressed", "przygnębiony"),
                Entry("depressing", "przygnębiający"),
                Entry("disappointed", "rozczarowany"),
                Entry("disappointing", "rozczarowujący"),
                Entry("embarrassed", "zawstydzony"),
                Entry("embarrassing", "żenujący"),
                Entry("excited", "podekscytowany"),
                Entry("exciting", "ekscytujący"),
                Entry("frightened", "przerażony"),
                Entry("frightening", "przerażający"),
                Entry("frustrated", "sfrustrowany"),
                Entry("frustrating", "frustrujący"),
                Entry("miserable", "przygnębiony"),
                Entry("moved", "poruszony"),
                Entry("moving", "poruszający"),
                Entry("pleased", "zadowolony"),
                Entry("surprised", "zaskoczony"),
                Entry("surprising", "zaskakujący"),
                Entry("worried", "zaniepokojony"),
                Entry("worrying", "niepokojący"),
            ],
            builtIn: true
        )
    }

    private static func set009() -> WordSet {
        WordSet(
            id: "set009",
            title: "Człowiek · Odzież codzienna i bielizna",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("clothes", "ubrania"),
                Entry("jumper", "sweter, bluza"),
                Entry("sweater", "sweter"),
                Entry("top", "bluzka"),
                Entry("trousers", "spodnie"),
                Entry("shorts", "spodenki"),
                Entry("socks", "skarpetki"),
                Entry("tights", "rajstopy"),
                Entry("pyjamas", "piżama"),
                Entry("bra", "biustonosz"),
                Entry("boxer shorts", "bokserki"),
                Entry("pants", "majtki"),
                Entry("underpants", "slipy"),
                Entry("underwear", "bielizna"),
                Entry("get dressed", "ubrać się"),
                Entry("polish shoes", "wypastować buty"),
                Entry("t-shirt", "koszulka"),
                Entry("leggings", "legginsy"),
                Entry("slippers", "kapcie"),
                Entry("swimsuit", "kostium kąpielowy"),
            ],
            builtIn: true
        )
    }

    private static func set010() -> WordSet {
        WordSet(
            id: "set010",
            title: "Człowiek · Odzież wierzchnia i formalna",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("anorak", "kurtka przeciwdeszczowa"),
                Entry("coat", "płaszcz"),
                Entry("jacket", "kurtka"),
                Entry("suit", "garnitur"),
                Entry("dress", "sukienka"),
                Entry("skirt", "spódnica"),
                Entry("shirt", "koszula"),
                Entry("blouse", "bluzka"),
                Entry("tie", "krawat"),
                Entry("school uniform", "mundurek szkolny"),
                Entry("tracksuit", "dres sportowy"),
                Entry("sweatshirt", "bluza sportowa"),
                Entry("sweatpants", "spodnie dresowe"),
                Entry("waistcoat", "kamizelka"),
                Entry("raincoat", "płaszcz przeciwdeszczowy"),
                Entry("blazer", "marynarka"),
                Entry("cardigan", "sweter rozpinany"),
                Entry("hoodie", "bluza"),
                Entry("evening dress", "suknia wieczorowa"),
                Entry("uniform", "mundur"),
            ],
            builtIn: true
        )
    }

    private static func set011() -> WordSet {
        WordSet(
            id: "set011",
            title: "Człowiek · Styl i moda",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("casual", "codzienny"),
                Entry("classy", "szykowny"),
                Entry("smart", "elegancki"),
                Entry("fashionable", "modny"),
                Entry("formal", "formalny"),
                Entry("label", "metka"),
                Entry("outfit", "strój"),
                Entry("good quality", "dobrej jakości"),
                Entry("poor quality", "kiepskiej jakości"),
                Entry("stunning", "olśniewający"),
                Entry("style", "styl"),
                Entry("stylish", "stylowy"),
                Entry("informal", "nieformalny"),
                Entry("unfashionable", "niemodny"),
                Entry("designer label", "znana marka"),
                Entry("trend", "trend"),
                Entry("catwalk", "wybieg"),
                Entry("collection", "kolekcja"),
                Entry("elegant", "elegancki"),
                Entry("scruffy", "niechlujny"),
            ],
            builtIn: true
        )
    }

    private static func set012() -> WordSet {
        WordSet(
            id: "set012",
            title: "Człowiek · Twarz",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("cheek", "policzek"),
                Entry("chin", "podbródek"),
                Entry("ear", "ucho"),
                Entry("eye", "oko"),
                Entry("eyebrow", "brew"),
                Entry("eyelash", "rzęsa"),
                Entry("face", "twarz"),
                Entry("forehead", "czoło"),
                Entry("jaw", "szczęka"),
                Entry("lip", "warga"),
                Entry("mouth", "usta"),
                Entry("nose", "nos"),
                Entry("throat", "gardło"),
                Entry("tongue", "język"),
                Entry("tooth", "ząb"),
                Entry("teeth", "zęby"),
                Entry("beard", "broda"),
                Entry("dimple", "dołeczek"),
                Entry("nostril", "nozdrze"),
                Entry("eyelid", "powieka"),
            ],
            builtIn: true
        )
    }

    private static func set013() -> WordSet {
        WordSet(
            id: "set013",
            title: "Człowiek · Ubrania: materiały",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("baggy", "workowaty"),
                Entry("checked", "w kratkę"),
                Entry("comfortable", "wygodny"),
                Entry("cotton", "bawełniany"),
                Entry("denim", "dżinsowy"),
                Entry("leather", "skórzany"),
                Entry("lightweight", "lekki"),
                Entry("patterned", "we wzory"),
                Entry("silk", "jedwabny"),
                Entry("sleeveless", "bez rękawów"),
                Entry("striped", "w paski"),
                Entry("tight", "obcisły"),
                Entry("waterproof", "wodoodporny"),
                Entry("woolly", "wełniany"),
                Entry("match", "dopasować"),
                Entry("wear", "nosić"),
                Entry("linen", "lniany"),
                Entry("velvet", "aksamitny"),
                Entry("plain", "gładki"),
                Entry("loose", "luźny"),
            ],
            builtIn: true
        )
    }

    private static func set014() -> WordSet {
        WordSet(
            id: "set014",
            title: "Człowiek · Wiek i sylwetka",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("child", "dziecko"),
                Entry("children", "dzieci"),
                Entry("old", "stary"),
                Entry("teenager", "nastolatek"),
                Entry("young", "młody"),
                Entry("height", "wzrost"),
                Entry("short", "niski"),
                Entry("tall", "wysoki"),
                Entry("broad shoulders", "szerokie ramiona"),
                Entry("athletic build", "sportowa sylwetka"),
                Entry("fat", "gruby"),
                Entry("fit", "wysportowany"),
                Entry("muscular arms", "umięśnione ręce"),
                Entry("overweight", "z nadwagą"),
                Entry("plump", "puszysty"),
                Entry("skinny", "bardzo chudy"),
                Entry("thin", "chudy"),
                Entry("slim", "szczupły"),
                Entry("well-built", "dobrze zbudowany"),
                Entry("adult", "dorosły"),
            ],
            builtIn: true
        )
    }

    private static func set015() -> WordSet {
        WordSet(
            id: "set015",
            title: "Człowiek · Wygląd: ocena i upodobania",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("attractive", "atrakcyjny"),
                Entry("beautiful", "piękny"),
                Entry("good-looking", "ładny"),
                Entry("gorgeous", "olśniewający"),
                Entry("handsome", "przystojny"),
                Entry("pretty", "śliczny"),
                Entry("scruffy", "niechlujny"),
                Entry("ugly", "brzydki"),
                Entry("can't stand", "nie znosić"),
                Entry("cheer up", "rozweselić"),
                Entry("grow up", "dorastać"),
                Entry("admire", "podziwiać"),
                Entry("adore", "uwielbiać"),
                Entry("detest", "nie znosić"),
                Entry("dislike", "nie lubić"),
                Entry("hate", "nienawidzić"),
                Entry("like", "lubić"),
                Entry("reject", "odrzucić"),
                Entry("respect", "szanować"),
                Entry("charming", "czarujący"),
            ],
            builtIn: true
        )
    }

    private static func set016() -> WordSet {
        WordSet(
            id: "set016",
            title: "Człowiek · Wygląd: szczegóły",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("appearance", "wygląd"),
                Entry("beard", "broda"),
                Entry("pale complexion", "blada cera"),
                Entry("tanned complexion", "opalona cera"),
                Entry("freckles", "piegi"),
                Entry("go bald", "łysieć"),
                Entry("looks", "uroda"),
                Entry("make-up", "makijaż"),
                Entry("moustache", "wąsy"),
                Entry("scar", "blizna"),
                Entry("smile", "uśmiech"),
                Entry("lovely smile", "ładny uśmiech"),
                Entry("tattoo", "tatuaż"),
                Entry("wrinkles", "zmarszczki"),
                Entry("dimple", "dołek"),
                Entry("mole", "pieprzyk"),
                Entry("piercing", "kolczyk"),
                Entry("eyelashes", "rzęsy"),
                Entry("complexion", "cera"),
                Entry("glasses", "okulary"),
            ],
            builtIn: true
        )
    }

    private static func set017() -> WordSet {
        WordSet(
            id: "set017",
            title: "Człowiek · Włosy",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("bald", "łysy"),
                Entry("curly", "kręcone"),
                Entry("dark", "ciemne"),
                Entry("dyed", "farbowane"),
                Entry("fair", "jasne"),
                Entry("fringe", "grzywka"),
                Entry("ginger", "rude"),
                Entry("grey", "siwe"),
                Entry("ponytail", "kucyk"),
                Entry("shiny", "lśniące"),
                Entry("shoulder-length", "do ramion"),
                Entry("spiky", "nastroszone"),
                Entry("straight", "proste"),
                Entry("wavy", "falowane"),
                Entry("blonde", "blond"),
                Entry("brunette", "brunetka"),
                Entry("plait", "warkocz"),
                Entry("bun", "kok"),
                Entry("highlights", "pasemka"),
                Entry("thinning", "przerzedzone"),
            ],
            builtIn: true
        )
    }

    private static func set018() -> WordSet {
        WordSet(
            id: "set018",
            title: "Edukacja · Cechy ucznia i nauczyciela",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("active", "aktywny"),
                Entry("demanding", "wymagający"),
                Entry("unfair", "niesprawiedliwy"),
                Entry("gifted", "utalentowany"),
                Entry("imaginative", "pomysłowy"),
                Entry("lenient", "pobłażliwy"),
                Entry("motivated", "zmotywowany"),
                Entry("motivating", "motywujący"),
                Entry("passive", "bierny"),
                Entry("professional", "profesjonalny"),
                Entry("punctual", "punktualny"),
                Entry("strict", "surowy"),
                Entry("systematic", "systematyczny"),
                Entry("weak", "słaby"),
                Entry("hard-working", "pracowity"),
                Entry("attentive", "uważny"),
                Entry("distracted", "rozkojarzony"),
                Entry("cooperative", "współpracujący"),
                Entry("fair", "sprawiedliwy"),
                Entry("experienced", "doświadczony"),
            ],
            builtIn: true
        )
    }

    private static func set019() -> WordSet {
        WordSet(
            id: "set019",
            title: "Edukacja · Egzaminy i oceny",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("exam", "egzamin"),
                Entry("test", "sprawdzian"),
                Entry("quiz", "kartkówka"),
                Entry("mark", "ocena"),
                Entry("grade", "stopień"),
                Entry("report card", "świadectwo"),
                Entry("certificate", "dyplom"),
                Entry("degree", "dyplom uczelni"),
                Entry("scholarship", "stypendium"),
                Entry("pass", "zdać"),
                Entry("fail", "oblać"),
                Entry("resit", "poprawka"),
                Entry("cheat", "ściągać"),
                Entry("attendance", "frekwencja"),
                Entry("truancy", "wagary"),
                Entry("break", "przerwa"),
                Entry("lesson", "lekcja"),
                Entry("term", "semestr"),
                Entry("cheat sheet", "ściąga"),
                Entry("retake", "poprawka"),
            ],
            builtIn: true
        )
    }

    private static func set020() -> WordSet {
        WordSet(
            id: "set020",
            title: "Edukacja · Ludzie w szkole",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("examiner", "egzaminator"),
                Entry("deputy head", "wicedyrektor"),
                Entry("form teacher", "wychowawca"),
                Entry("headmaster", "dyrektor"),
                Entry("headmistress", "dyrektorka"),
                Entry("lecturer", "wykładowca"),
                Entry("professor", "profesor"),
                Entry("schoolboy", "uczeń"),
                Entry("schoolgirl", "uczennica"),
                Entry("secretary", "sekretarka"),
                Entry("student", "uczeń, student"),
                Entry("teacher", "nauczyciel"),
                Entry("teaching staff", "grono pedagogiczne"),
                Entry("classmate", "kolega"),
                Entry("schoolmate", "rówieśnik"),
                Entry("pupil", "uczeń"),
                Entry("tutor", "korepetytor"),
                Entry("caretaker", "woźny"),
                Entry("nurse", "pielęgniarka szkolna"),
                Entry("graduate", "absolwent"),
            ],
            builtIn: true
        )
    }

    private static func set021() -> WordSet {
        WordSet(
            id: "set021",
            title: "Edukacja · Praca ucznia",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("homework", "praca domowa"),
                Entry("essay", "wypracowanie"),
                Entry("project", "projekt"),
                Entry("presentation", "prezentacja"),
                Entry("revision", "powtórka"),
                Entry("study", "uczyć się"),
                Entry("learn", "nauczyć się"),
                Entry("memorise", "zapamiętywać"),
                Entry("concentrate", "skupiać się"),
                Entry("repeat", "powtarzać"),
                Entry("answer", "odpowiadać"),
                Entry("explain", "wyjaśniać"),
                Entry("teach", "uczyć kogoś"),
                Entry("graduate", "ukończyć studia"),
                Entry("enrol", "zapisać się"),
                Entry("holidays", "wakacje"),
                Entry("timetable", "rozkład zajęć"),
                Entry("note", "notatka"),
                Entry("summary", "streszczenie"),
                Entry("draft", "brudnopis"),
            ],
            builtIn: true
        )
    }

    private static func set022() -> WordSet {
        WordSet(
            id: "set022",
            title: "Edukacja · Przedmioty",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("Art", "plastyka"),
                Entry("Biology", "biologia"),
                Entry("Chemistry", "chemia"),
                Entry("English", "angielski"),
                Entry("foreign languages", "języki obce"),
                Entry("Geography", "geografia"),
                Entry("humanities", "nauki humanistyczne"),
                Entry("History", "historia"),
                Entry("IT", "informatyka"),
                Entry("Maths", "matematyka"),
                Entry("Music", "muzyka"),
                Entry("PE", "WF"),
                Entry("Physics", "fizyka"),
                Entry("Polish", "polski"),
                Entry("RE", "religia"),
                Entry("Science", "nauki ścisłe"),
                Entry("subject", "przedmiot szkolny"),
                Entry("Civics", "WOS"),
                Entry("Economics", "ekonomia"),
                Entry("Philosophy", "filozofia"),
            ],
            builtIn: true
        )
    }

    private static func set023() -> WordSet {
        WordSet(
            id: "set023",
            title: "Edukacja · Przybory szkolne",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("notebook", "zeszyt"),
                Entry("exercise book", "ćwiczeniówka"),
                Entry("textbook", "podręcznik"),
                Entry("dictionary", "słownik"),
                Entry("pencil case", "piórnik"),
                Entry("pen", "długopis"),
                Entry("pencil", "ołówek"),
                Entry("rubber", "gumka"),
                Entry("ruler", "linijka"),
                Entry("sharpener", "temperówka"),
                Entry("scissors", "nożyczki"),
                Entry("glue", "klej"),
                Entry("highlighter", "zakreślacz"),
                Entry("felt-tip", "flamaster"),
                Entry("schoolbag", "tornister"),
                Entry("backpack", "plecak"),
                Entry("calculator", "kalkulator"),
                Entry("compass", "cyrkiel"),
                Entry("stapler", "zszywacz"),
                Entry("folder", "segregator"),
            ],
            builtIn: true
        )
    }

    private static func set024() -> WordSet {
        WordSet(
            id: "set024",
            title: "Edukacja · Typy szkół",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("academy", "uczelnia"),
                Entry("college", "szkoła wyższa"),
                Entry("primary school", "szkoła podstawowa"),
                Entry("fee-paying school", "płatna szkoła"),
                Entry("high school", "liceum"),
                Entry("independent school", "szkoła społeczna"),
                Entry("kindergarten", "przedszkole"),
                Entry("mixed school", "szkoła koedukacyjna"),
                Entry("private school", "szkoła prywatna"),
                Entry("single-sex school", "szkoła żeńska/męska"),
                Entry("public school", "szkoła publiczna"),
                Entry("university", "uniwersytet"),
                Entry("vocational school", "szkoła zawodowa"),
                Entry("nursery", "żłobek"),
                Entry("secondary school", "szkoła średnia"),
                Entry("boarding school", "internat"),
                Entry("state school", "szkoła państwowa"),
                Entry("language school", "szkoła językowa"),
                Entry("art school", "szkoła artystyczna"),
                Entry("evening school", "szkoła wieczorowa"),
            ],
            builtIn: true
        )
    }

    private static func set025() -> WordSet {
        WordSet(
            id: "set025",
            title: "Edukacja · Wyposażenie szkoły",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("blackboard", "tablica"),
                Entry("whiteboard", "biała tablica"),
                Entry("chalk", "kreda"),
                Entry("board rubber", "gąbka"),
                Entry("timetable", "plan lekcji"),
                Entry("locker", "szafka"),
                Entry("projector", "projektor"),
                Entry("classroom", "klasa"),
                Entry("gym", "sala gimnastyczna"),
                Entry("library", "biblioteka"),
                Entry("canteen", "stołówka"),
                Entry("staffroom", "pokój nauczycielski"),
                Entry("playground", "boisko"),
                Entry("laboratory", "laboratorium"),
                Entry("corridor", "korytarz"),
                Entry("cloakroom", "szatnia"),
                Entry("staff room", "pokój nauczycielski"),
                Entry("sports hall", "hala sportowa"),
                Entry("noticeboard", "tablica ogłoszeń"),
                Entry("desk", "ławka"),
            ],
            builtIn: true
        )
    }

    private static func set026() -> WordSet {
        WordSet(
            id: "set026",
            title: "Kultura · Film",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("film", "film"),
                Entry("cinema", "kino"),
                Entry("screen", "ekran"),
                Entry("comedy", "komedia"),
                Entry("thriller", "thriller"),
                Entry("horror", "horror"),
                Entry("cartoon", "kreskówka"),
                Entry("documentary", "film dokumentalny"),
                Entry("science fiction", "fantastyka naukowa"),
                Entry("plot", "fabuła"),
                Entry("character", "postać"),
                Entry("scene", "scena"),
                Entry("subtitles", "napisy"),
                Entry("soundtrack", "ścieżka dźwiękowa"),
                Entry("drama", "dramat"),
                Entry("romance", "romans"),
                Entry("western", "western"),
                Entry("sequel", "kontynuacja"),
                Entry("premiere", "premiera"),
                Entry("special effects", "efekty specjalne"),
            ],
            builtIn: true
        )
    }

    private static func set027() -> WordSet {
        WordSet(
            id: "set027",
            title: "Kultura · Media",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("media", "media"),
                Entry("press", "prasa"),
                Entry("newspaper", "gazeta"),
                Entry("magazine", "czasopismo"),
                Entry("article", "artykuł"),
                Entry("headline", "nagłówek"),
                Entry("journalist", "dziennikarz"),
                Entry("editor", "redaktor"),
                Entry("interview", "wywiad"),
                Entry("news", "wiadomości"),
                Entry("broadcast", "transmisja"),
                Entry("channel", "kanał"),
                Entry("programme", "program"),
                Entry("series", "serial"),
                Entry("episode", "odcinek"),
                Entry("advert", "reklama"),
                Entry("commercial", "reklama telewizyjna"),
                Entry("viewer", "widz"),
                Entry("listener", "słuchacz"),
                Entry("reader", "czytelnik"),
                Entry("podcast", "podcast"),
                Entry("blog", "blog"),
                Entry("influencer", "influencer"),
            ],
            builtIn: true
        )
    }

    private static func set028() -> WordSet {
        WordSet(
            id: "set028",
            title: "Kultura · Muzyka i literatura",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("music", "muzyka"),
                Entry("song", "piosenka"),
                Entry("album", "album"),
                Entry("concert", "koncert"),
                Entry("gig", "koncert klubowy"),
                Entry("orchestra", "orkiestra"),
                Entry("guitar", "gitara"),
                Entry("piano", "pianino"),
                Entry("drums", "perkusja"),
                Entry("violin", "skrzypce"),
                Entry("book", "książka"),
                Entry("novel", "powieść"),
                Entry("poem", "wiersz"),
                Entry("poetry", "poezja"),
                Entry("short story", "opowiadanie"),
                Entry("chapter", "rozdział"),
                Entry("bestseller", "bestseller"),
                Entry("library", "biblioteka"),
                Entry("publisher", "wydawca"),
                Entry("choir", "chór"),
            ],
            builtIn: true
        )
    }

    private static func set029() -> WordSet {
        WordSet(
            id: "set029",
            title: "Kultura · Sztuki plastyczne",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("culture", "kultura"),
                Entry("art", "sztuka"),
                Entry("artist", "artysta"),
                Entry("painting", "obraz"),
                Entry("sculpture", "rzeźba"),
                Entry("gallery", "galeria"),
                Entry("museum", "muzeum"),
                Entry("exhibition", "wystawa"),
                Entry("photographer", "fotograf"),
                Entry("designer", "projektant"),
                Entry("architect", "architekt"),
                Entry("drawing", "rysunek"),
                Entry("portrait", "portret"),
                Entry("landscape", "pejzaż"),
                Entry("canvas", "płótno"),
                Entry("brush", "pędzel"),
                Entry("frame", "rama"),
                Entry("statue", "posąg"),
                Entry("curator", "kurator"),
                Entry("mural", "mural"),
            ],
            builtIn: true
        )
    }

    private static func set030() -> WordSet {
        WordSet(
            id: "set030",
            title: "Kultura · Teatr, scena i twórcy",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("theatre", "teatr"),
                Entry("play", "sztuka teatralna"),
                Entry("stage", "scena"),
                Entry("actor", "aktor"),
                Entry("actress", "aktorka"),
                Entry("director", "reżyser"),
                Entry("audience", "publiczność"),
                Entry("performance", "przedstawienie"),
                Entry("ticket", "bilet"),
                Entry("review", "recenzja"),
                Entry("critic", "krytyk"),
                Entry("author", "autor"),
                Entry("poet", "poeta"),
                Entry("novelist", "powieściopisarz"),
                Entry("composer", "kompozytor"),
                Entry("singer", "piosenkarz"),
                Entry("band", "zespół"),
                Entry("costume", "kostium"),
                Entry("rehearsal", "próba"),
                Entry("applause", "brawa"),
            ],
            builtIn: true
        )
    }

    private static func set031() -> WordSet {
        WordSet(
            id: "set031",
            title: "Miejsce zamieszkania · Elementy budynku i otoczenie",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("ceiling", "sufit"),
                Entry("low ceiling", "niski sufit"),
                Entry("high ceiling", "wysoki sufit"),
                Entry("chimney", "komin"),
                Entry("back door", "tylne drzwi"),
                Entry("front door", "drzwi wejściowe"),
                Entry("drive", "podjazd"),
                Entry("fence", "płot"),
                Entry("wooden floor", "drewniana podłoga"),
                Entry("tile floor", "wykafelkowana podłoga"),
                Entry("flowerbed", "klomb"),
                Entry("garage", "garaż"),
                Entry("gate", "furtka"),
                Entry("lawn", "trawnik"),
                Entry("path", "ścieżka"),
                Entry("porch", "ganek"),
                Entry("roof", "dach"),
                Entry("wall", "ściana"),
                Entry("window", "okno"),
                Entry("underground garage", "garaż podziemny"),
            ],
            builtIn: true
        )
    }

    private static func set032() -> WordSet {
        WordSet(
            id: "set032",
            title: "Miejsce zamieszkania · Kuchnia",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("cooker", "kuchenka"),
                Entry("electric cooker", "kuchenka elektryczna"),
                Entry("crockery", "zastawa stołowa"),
                Entry("cupboard", "szafka kuchenna"),
                Entry("cutlery", "sztućce"),
                Entry("dishwasher", "zmywarka"),
                Entry("freezer", "zamrażarka"),
                Entry("fridge", "lodówka"),
                Entry("kettle", "czajnik"),
                Entry("electric kettle", "czajnik elektryczny"),
                Entry("kitchen table", "stół kuchenny"),
                Entry("microwave oven", "kuchenka mikrofalowa"),
                Entry("oven", "piekarnik"),
                Entry("running water", "bieżąca woda"),
                Entry("sink", "zlew"),
                Entry("toaster", "toster"),
                Entry("pan", "patelnia"),
                Entry("pot", "garnek"),
                Entry("plate", "talerz"),
                Entry("mug", "kubek"),
            ],
            builtIn: true
        )
    }

    private static func set033() -> WordSet {
        WordSet(
            id: "set033",
            title: "Miejsce zamieszkania · Okolica",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("area", "obszar"),
                Entry("capital", "stolica"),
                Entry("city", "miasto"),
                Entry("conveniently located", "dogodnie położony"),
                Entry("district", "dzielnica"),
                Entry("home town", "miasto rodzinne"),
                Entry("housing estate", "osiedle mieszkaniowe"),
                Entry("inhabitant", "mieszkaniec"),
                Entry("neighbour", "sąsiad"),
                Entry("neighbourhood", "sąsiedztwo"),
                Entry("old town", "starówka"),
                Entry("residential area", "dzielnica mieszkaniowa"),
                Entry("rural", "wiejski"),
                Entry("slums", "dzielnice nędzy"),
                Entry("suburbs", "przedmieścia"),
                Entry("tourist resort", "kurort"),
                Entry("tourist town", "miasto turystyczne"),
                Entry("town", "miasteczko"),
                Entry("underground station", "stacja metra"),
                Entry("urban", "miejski"),
                Entry("next to", "obok"),
            ],
            builtIn: true
        )
    }

    private static func set034() -> WordSet {
        WordSet(
            id: "set034",
            title: "Miejsce zamieszkania · Opis mieszkania",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("parking garage", "parking podziemny"),
                Entry("ancient", "starożytny"),
                Entry("bare", "pusty"),
                Entry("uncomfortable", "niewygodny"),
                Entry("cosy", "przytulny"),
                Entry("furnished", "umeblowany"),
                Entry("unfurnished", "nieumeblowany"),
                Entry("modern", "nowoczesny"),
                Entry("old-fashioned", "staromodny"),
                Entry("renovated", "odnowiony"),
                Entry("roomy", "przestronny"),
                Entry("tidy", "uporządkowany"),
                Entry("tiny", "malutki"),
                Entry("collapse", "zawalić się"),
                Entry("redecorate", "remontować"),
                Entry("spacious", "obszerny"),
                Entry("bright", "jasny"),
                Entry("dark", "ciemny"),
                Entry("noisy", "hałaśliwy"),
                Entry("quiet", "cichy"),
            ],
            builtIn: true
        )
    }

    private static func set035() -> WordSet {
        WordSet(
            id: "set035",
            title: "Miejsce zamieszkania · Pomieszczenia w domu",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("attic", "strych"),
                Entry("loft", "poddasze"),
                Entry("balcony", "balkon"),
                Entry("bathroom", "łazienka"),
                Entry("bedroom", "sypialnia"),
                Entry("corridor", "korytarz"),
                Entry("hall", "przedpokój"),
                Entry("kitchen", "kuchnia"),
                Entry("laundry", "pralnia"),
                Entry("living room", "salon"),
                Entry("games room", "pomieszczenie rekreacyjne"),
                Entry("study", "gabinet"),
                Entry("toilet", "toaleta"),
                Entry("WC", "ubikacja"),
                Entry("staircase", "klatka schodowa"),
                Entry("stairs", "schody"),
                Entry("step", "schodek"),
                Entry("downstairs", "na dole"),
                Entry("upstairs", "na górze"),
                Entry("doorway", "wejście"),
            ],
            builtIn: true
        )
    }

    private static func set036() -> WordSet {
        WordSet(
            id: "set036",
            title: "Miejsce zamieszkania · Prace domowe",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("clean", "czyścić"),
                Entry("cook", "gotować"),
                Entry("vacuum", "odkurzać"),
                Entry("clean up", "posprzątać"),
                Entry("iron clothes", "prasować ubrania"),
                Entry("move house", "przeprowadzać się"),
                Entry("move in", "wprowadzić się"),
                Entry("move out", "wyprowadzić się"),
                Entry("wash clothes", "prać ubrania"),
                Entry("wash up", "zmywać"),
                Entry("ironing", "prasowanie"),
                Entry("shopping", "zakupy"),
                Entry("make beds", "ścielić łóżka"),
                Entry("mow", "kosić"),
                Entry("dust", "ścierać kurze"),
                Entry("mop", "myć podłogę"),
                Entry("tidy up", "porządkować"),
                Entry("water plants", "podlewać rośliny"),
                Entry("empty bin", "opróżnić kosz"),
                Entry("hang washing", "wieszać pranie"),
            ],
            builtIn: true
        )
    }

    private static func set037() -> WordSet {
        WordSet(
            id: "set037",
            title: "Miejsce zamieszkania · Rodzaje budynków",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("flat", "mieszkanie"),
                Entry("office building", "biurowiec"),
                Entry("residential building", "budynek mieszkalny"),
                Entry("bungalow", "dom parterowy"),
                Entry("castle", "zamek"),
                Entry("cottage", "domek wiejski"),
                Entry("detached house", "dom wolnostojący"),
                Entry("tower block", "wieżowiec"),
                Entry("houseboat", "łódź mieszkalna"),
                Entry("mansion", "luksusowa rezydencja"),
                Entry("semi-detached house", "bliźniak"),
                Entry("skyscraper", "drapacz chmur"),
                Entry("studio flat", "kawalerka"),
                Entry("terraced house", "szeregowiec"),
                Entry("two-roomed flat", "mieszkanie dwupokojowe"),
                Entry("three-roomed flat", "mieszkanie trzypokojowe"),
                Entry("block", "blok"),
                Entry("farmhouse", "dom wiejski"),
                Entry("penthouse", "apartament"),
                Entry("shed", "szopa"),
            ],
            builtIn: true
        )
    }

    private static func set038() -> WordSet {
        WordSet(
            id: "set038",
            title: "Miejsce zamieszkania · Sypialnia",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("bunk bed", "łóżko piętrowe"),
                Entry("double bed", "łóżko dwuosobowe"),
                Entry("bedding", "pościel"),
                Entry("bedside table", "szafka nocna"),
                Entry("blanket", "koc"),
                Entry("chair", "krzesło"),
                Entry("desk", "biurko"),
                Entry("dressing table", "toaletka"),
                Entry("duvet", "kołdra"),
                Entry("lamp", "lampa"),
                Entry("mattress", "materac"),
                Entry("pillow", "poduszka"),
                Entry("rug", "dywanik"),
                Entry("bedsheet", "prześcieradło"),
                Entry("shelf", "półka"),
                Entry("wardrobe", "szafa"),
                Entry("fitted wardrobe", "szafa wnękowa"),
                Entry("alarm clock", "budzik"),
                Entry("cot", "łóżeczko"),
                Entry("bedside lamp", "lampka nocna"),
            ],
            builtIn: true
        )
    }

    private static func set039() -> WordSet {
        WordSet(
            id: "set039",
            title: "Miejsce zamieszkania · Wynajem",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("accomodation", "zakwaterowanie"),
                Entry("amenities", "udogodnienia"),
                Entry("estate agent", "agent nieruchomości"),
                Entry("flatmate", "współlokator"),
                Entry("for sale", "na sprzedaż"),
                Entry("landlady", "właścicielka"),
                Entry("landlord", "właściciel"),
                Entry("location", "położenie"),
                Entry("per month", "miesięcznie"),
                Entry("per week", "tygodniowo"),
                Entry("public transport", "transport publiczny"),
                Entry("reasonable price", "rozsądna cena"),
                Entry("rent", "czynsz"),
                Entry("roommate", "współlokator"),
                Entry("spare room", "pokój gościnny"),
                Entry("tenant", "lokator"),
                Entry("to let", "do wynajęcia"),
                Entry("view", "widok"),
                Entry("bills", "rachunki"),
                Entry("lease", "umowa najmu"),
            ],
            builtIn: true
        )
    }

    private static func set040() -> WordSet {
        WordSet(
            id: "set040",
            title: "Miejsce zamieszkania · Wyposażenie",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("blind", "żaluzja"),
                Entry("central heating", "centralne ogrzewanie"),
                Entry("clock", "zegar"),
                Entry("curtain", "zasłona"),
                Entry("door handle", "klamka"),
                Entry("doormat", "wycieraczka"),
                Entry("electrical appliances", "urządzenia elektryczne"),
                Entry("fitted carpet", "wykładzina dywanowa"),
                Entry("fitting", "element instalacji, armatura"),
                Entry("antique furniture", "zabytkowe meble"),
                Entry("household appliances", "sprzęt AGD"),
                Entry("light", "światło"),
                Entry("light bulb", "żarówka"),
                Entry("net curtain", "firanka"),
                Entry("house plant", "roślina doniczkowa"),
                Entry("radiator", "kaloryfer"),
                Entry("vacuum cleaner", "odkurzacz"),
                Entry("wallpaper", "tapeta"),
                Entry("windowsill", "parapet"),
                Entry("mirror", "lustro"),
            ],
            builtIn: true
        )
    }

    private static func set041() -> WordSet {
        WordSet(
            id: "set041",
            title: "Miejsce zamieszkania · Łazienka i salon",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("bath", "wanna"),
                Entry("mirror", "lustro"),
                Entry("shower", "prysznic"),
                Entry("shower cabin", "kabina prysznicowa"),
                Entry("soap", "mydło"),
                Entry("tap", "kran"),
                Entry("toilet seat", "deska sedesowa"),
                Entry("towel", "ręcznik"),
                Entry("washbasin", "umywalka"),
                Entry("washing machine", "pralka"),
                Entry("armchair", "fotel"),
                Entry("audio system", "sprzęt audio"),
                Entry("bookcase", "biblioteczka"),
                Entry("carpet", "dywan"),
                Entry("CD player", "odtwarzacz CD"),
                Entry("coffee table", "stolik kawowy"),
                Entry("couch", "kanapa"),
                Entry("cushion", "poduszka dekoracyjna"),
                Entry("dining table", "stół jadalny"),
                Entry("fireplace", "kominek"),
                Entry("TV set", "telewizor"),
            ],
            builtIn: true
        )
    }

    private static func set042() -> WordSet {
        WordSet(
            id: "set042",
            title: "Nauka i technika · Badania naukowe",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("science", "nauka"),
                Entry("scientist", "naukowiec"),
                Entry("research", "badania"),
                Entry("experiment", "eksperyment"),
                Entry("laboratory", "laboratorium"),
                Entry("theory", "teoria"),
                Entry("test", "testować"),
                Entry("prove", "udowodnić"),
                Entry("discover", "odkryć"),
                Entry("invent", "wynaleźć"),
                Entry("develop", "rozwijać"),
                Entry("microscope", "mikroskop"),
                Entry("telescope", "teleskop"),
                Entry("gene", "gen"),
                Entry("data", "dane"),
                Entry("sample", "próbka"),
                Entry("result", "wynik"),
                Entry("conclusion", "wniosek"),
                Entry("method", "metoda"),
                Entry("evidence", "dowód"),
            ],
            builtIn: true
        )
    }

    private static func set043() -> WordSet {
        WordSet(
            id: "set043",
            title: "Nauka i technika · Internet i konta",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("password", "hasło"),
                Entry("username", "nazwa użytkownika"),
                Entry("account", "konto"),
                Entry("internet", "internet"),
                Entry("website", "strona internetowa"),
                Entry("browser", "przeglądarka"),
                Entry("search engine", "wyszukiwarka"),
                Entry("link", "link"),
                Entry("email", "e-mail"),
                Entry("attachment", "załącznik"),
                Entry("network", "sieć"),
                Entry("virus", "wirus"),
                Entry("hacker", "haker"),
                Entry("social media", "media społecznościowe"),
                Entry("download", "pobierać"),
                Entry("upload", "wysyłać"),
                Entry("click", "klikać"),
                Entry("log in", "logować się"),
                Entry("streaming", "transmisja"),
                Entry("cookie", "ciasteczko"),
            ],
            builtIn: true
        )
    }

    private static func set044() -> WordSet {
        WordSet(
            id: "set044",
            title: "Nauka i technika · Komputer: sprzęt i pliki",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("computer", "komputer"),
                Entry("laptop", "laptop"),
                Entry("tablet", "tablet"),
                Entry("keyboard", "klawiatura"),
                Entry("mouse", "myszka"),
                Entry("monitor", "monitor"),
                Entry("hard drive", "dysk twardy"),
                Entry("memory", "pamięć"),
                Entry("software", "oprogramowanie"),
                Entry("hardware", "sprzęt"),
                Entry("program", "program"),
                Entry("app", "aplikacja"),
                Entry("file", "plik"),
                Entry("folder", "folder"),
                Entry("save", "zapisywać"),
                Entry("print", "drukować"),
                Entry("delete", "usuwać"),
                Entry("install", "instalować"),
                Entry("webcam", "kamerka"),
                Entry("backup", "kopia zapasowa"),
            ],
            builtIn: true
        )
    }

    private static func set045() -> WordSet {
        WordSet(
            id: "set045",
            title: "Nauka i technika · Odkrycia, postęp i kosmos",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("discovery", "odkrycie"),
                Entry("invention", "wynalazek"),
                Entry("inventor", "wynalazca"),
                Entry("progress", "postęp"),
                Entry("development", "rozwój"),
                Entry("technology", "technologia"),
                Entry("energy", "energia"),
                Entry("electricity", "elektryczność"),
                Entry("fuel", "paliwo"),
                Entry("space", "kosmos"),
                Entry("planet", "planeta"),
                Entry("spacecraft", "statek kosmiczny"),
                Entry("astronaut", "astronauta"),
                Entry("patent", "patent"),
                Entry("innovation", "innowacja"),
                Entry("breakthrough", "przełom"),
                Entry("satellite", "satelita"),
                Entry("orbit", "orbita"),
                Entry("rocket", "rakieta"),
                Entry("galaxy", "galaktyka"),
            ],
            builtIn: true
        )
    }

    private static func set046() -> WordSet {
        WordSet(
            id: "set046",
            title: "Nauka i technika · Urządzenia i sprzęt",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("device", "urządzenie"),
                Entry("machine", "maszyna"),
                Entry("engine", "silnik"),
                Entry("tool", "narzędzie"),
                Entry("camera", "aparat"),
                Entry("phone", "telefon"),
                Entry("smartphone", "smartfon"),
                Entry("headphones", "słuchawki"),
                Entry("speaker", "głośnik"),
                Entry("printer", "drukarka"),
                Entry("scanner", "skaner"),
                Entry("robot", "robot"),
                Entry("satellite", "satelita"),
                Entry("drone", "dron"),
                Entry("torch", "latarka"),
                Entry("remote control", "pilot"),
                Entry("microwave", "mikrofalówka"),
                Entry("projector", "projektor"),
                Entry("sensor", "czujnik"),
                Entry("keyboard", "klawiatura"),
            ],
            builtIn: true
        )
    }

    private static func set047() -> WordSet {
        WordSet(
            id: "set047",
            title: "Nauka i technika · Zasilanie i obsługa",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("battery", "bateria"),
                Entry("charger", "ładowarka"),
                Entry("cable", "kabel"),
                Entry("plug", "wtyczka"),
                Entry("socket", "gniazdko"),
                Entry("switch", "włącznik"),
                Entry("screen", "ekran"),
                Entry("button", "przycisk"),
                Entry("turn on", "włączyć"),
                Entry("turn off", "wyłączyć"),
                Entry("plug in", "podłączyć"),
                Entry("charge", "ładować"),
                Entry("break down", "zepsuć się"),
                Entry("repair", "naprawiać"),
                Entry("power supply", "zasilanie"),
                Entry("adapter", "przejściówka"),
                Entry("wireless", "bezprzewodowy"),
                Entry("update", "aktualizacja"),
                Entry("settings", "ustawienia"),
                Entry("fault", "usterka"),
            ],
            builtIn: true
        )
    }

    private static func set048() -> WordSet {
        WordSet(
            id: "set048",
            title: "Podróże · Bilety i rozkład",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("ticket", "bilet"),
                Entry("one-way", "jednokierunkowy"),
                Entry("return ticket", "bilet powrotny"),
                Entry("timetable", "rozkład jazdy"),
                Entry("departure", "odlot"),
                Entry("arrival", "przylot"),
                Entry("delay", "opóźnienie"),
                Entry("flight", "lot"),
                Entry("take off", "startować"),
                Entry("land", "lądować"),
                Entry("board", "wsiadać"),
                Entry("miss", "przegapić"),
                Entry("change", "przesiadać się"),
                Entry("single ticket", "bilet jednorazowy"),
                Entry("season ticket", "bilet okresowy"),
                Entry("fare", "opłata"),
                Entry("connection", "przesiadka"),
                Entry("cancellation", "odwołanie"),
                Entry("boarding", "wejście"),
                Entry("destination", "cel podróży"),
            ],
            builtIn: true
        )
    }

    private static func set049() -> WordSet {
        WordSet(
            id: "set049",
            title: "Podróże · Dworzec i lotnisko",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("airport", "lotnisko"),
                Entry("station", "dworzec"),
                Entry("bus stop", "przystanek"),
                Entry("platform", "peron"),
                Entry("terminal", "terminal"),
                Entry("gate", "bramka"),
                Entry("check-in", "odprawa"),
                Entry("boarding pass", "karta pokładowa"),
                Entry("passport", "paszport"),
                Entry("visa", "wiza"),
                Entry("customs", "odprawa celna"),
                Entry("luggage", "bagaż"),
                Entry("suitcase", "walizka"),
                Entry("hand luggage", "bagaż podręczny"),
                Entry("departure lounge", "poczekalnia"),
                Entry("security", "kontrola"),
                Entry("trolley", "wózek"),
                Entry("baggage claim", "odbiór bagażu"),
                Entry("duty-free", "strefa bezcłowa"),
                Entry("announcement", "komunikat"),
            ],
            builtIn: true
        )
    }

    private static func set050() -> WordSet {
        WordSet(
            id: "set050",
            title: "Podróże · Nocleg",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("hotel", "hotel"),
                Entry("hostel", "hostel"),
                Entry("guesthouse", "pensjonat"),
                Entry("campsite", "kemping"),
                Entry("tent", "namiot"),
                Entry("caravan", "przyczepa"),
                Entry("room", "pokój"),
                Entry("single room", "pokój jednoosobowy"),
                Entry("double room", "pokój dwuosobowy"),
                Entry("reception", "recepcja"),
                Entry("booking", "rezerwacja"),
                Entry("full board", "pełne wyżywienie"),
                Entry("half board", "dwa posiłki"),
                Entry("vacancy", "wolny pokój"),
                Entry("bed linen", "pościel"),
                Entry("suite", "apartament"),
                Entry("lift", "winda"),
                Entry("check-out", "wymeldowanie"),
                Entry("housekeeping", "obsługa pokoi"),
                Entry("en suite", "z łazienką"),
            ],
            builtIn: true
        )
    }

    private static func set051() -> WordSet {
        WordSet(
            id: "set051",
            title: "Podróże · Pojazdy",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("car", "samochód"),
                Entry("bus", "autobus"),
                Entry("coach", "autokar"),
                Entry("tram", "tramwaj"),
                Entry("train", "pociąg"),
                Entry("underground", "metro"),
                Entry("plane", "samolot"),
                Entry("ship", "statek"),
                Entry("ferry", "prom"),
                Entry("boat", "łódź"),
                Entry("bicycle", "rower"),
                Entry("motorbike", "motocykl"),
                Entry("lorry", "ciężarówka"),
                Entry("van", "furgonetka"),
                Entry("taxi", "taksówka"),
                Entry("helicopter", "helikopter"),
                Entry("lorry driver", "kierowca ciężarówki"),
                Entry("scooter", "skuter"),
                Entry("cable car", "kolejka linowa"),
                Entry("sledge", "sanki"),
            ],
            builtIn: true
        )
    }

    private static func set052() -> WordSet {
        WordSet(
            id: "set052",
            title: "Podróże · Ruch drogowy",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("driver", "kierowca"),
                Entry("passenger", "pasażer"),
                Entry("traffic", "ruch uliczny"),
                Entry("traffic jam", "korek"),
                Entry("road", "droga"),
                Entry("motorway", "autostrada"),
                Entry("crossroads", "skrzyżowanie"),
                Entry("roundabout", "rondo"),
                Entry("pavement", "chodnik"),
                Entry("bridge", "most"),
                Entry("tunnel", "tunel"),
                Entry("petrol", "benzyna"),
                Entry("licence", "prawo jazdy"),
                Entry("seat belt", "pas bezpieczeństwa"),
                Entry("speed limit", "ograniczenie prędkości"),
                Entry("traffic lights", "sygnalizacja"),
                Entry("car park", "parking"),
                Entry("toll", "opłata drogowa"),
                Entry("breakdown", "awaria"),
                Entry("detour", "objazd"),
            ],
            builtIn: true
        )
    }

    private static func set053() -> WordSet {
        WordSet(
            id: "set053",
            title: "Podróże · Zwiedzanie i wyjazdy",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("tourist", "turysta"),
                Entry("guide", "przewodnik"),
                Entry("sightseeing", "zwiedzanie"),
                Entry("trip", "wycieczka"),
                Entry("journey", "podróż"),
                Entry("voyage", "rejs"),
                Entry("cruise", "rejs wycieczkowy"),
                Entry("holiday", "wakacje"),
                Entry("souvenir", "pamiątka"),
                Entry("map", "mapa"),
                Entry("landmark", "zabytek"),
                Entry("abroad", "za granicą"),
                Entry("pack", "pakować"),
                Entry("unpack", "rozpakować"),
                Entry("explore", "zwiedzać"),
                Entry("excursion", "wycieczka fakultatywna"),
                Entry("monument", "pomnik"),
                Entry("viewpoint", "punkt widokowy"),
                Entry("itinerary", "plan podróży"),
                Entry("backpacking", "turystyka plecakowa"),
            ],
            builtIn: true
        )
    }

    private static func set054() -> WordSet {
        WordSet(
            id: "set054",
            title: "Praca · Kompetencje i ocena pracy",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("duties", "obowiązki"),
                Entry("skills", "umiejętności"),
                Entry("experience", "doświadczenie"),
                Entry("qualifications", "kwalifikacje"),
                Entry("training", "szkolenie"),
                Entry("stressful", "stresujący"),
                Entry("well-paid", "dobrze płatny"),
                Entry("badly-paid", "źle płatny"),
                Entry("rewarding", "satysfakcjonujący"),
                Entry("challenging", "wymagający"),
                Entry("teamwork", "praca zespołowa"),
                Entry("deadline", "termin"),
                Entry("responsibility", "odpowiedzialność"),
                Entry("efficiency", "wydajność"),
                Entry("motivation", "motywacja"),
                Entry("reference", "referencje"),
                Entry("probation", "okres próbny"),
                Entry("appraisal", "ocena pracownika"),
                Entry("workload", "obciążenie"),
                Entry("flexible", "elastyczny"),
            ],
            builtIn: true
        )
    }

    private static func set055() -> WordSet {
        WordSet(
            id: "set055",
            title: "Praca · Ludzie i miejsce pracy",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("boss", "szef"),
                Entry("colleague", "współpracownik"),
                Entry("employee", "pracownik"),
                Entry("employer", "pracodawca"),
                Entry("staff", "personel"),
                Entry("team", "zespół"),
                Entry("office", "biuro"),
                Entry("factory", "fabryka"),
                Entry("workshop", "warsztat"),
                Entry("company", "firma"),
                Entry("branch", "oddział"),
                Entry("career", "kariera"),
                Entry("manager", "kierownik"),
                Entry("director", "dyrektor"),
                Entry("secretary", "sekretarka"),
                Entry("intern", "stażysta"),
                Entry("client", "klient"),
                Entry("warehouse", "magazyn"),
                Entry("laboratory", "laboratorium"),
                Entry("headquarters", "siedziba"),
            ],
            builtIn: true
        )
    }

    private static func set056() -> WordSet {
        WordSet(
            id: "set056",
            title: "Praca · Szukanie pracy",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("job advert", "ogłoszenie"),
                Entry("application", "podanie"),
                Entry("application form", "formularz zgłoszeniowy"),
                Entry("CV", "życiorys"),
                Entry("cover letter", "list motywacyjny"),
                Entry("interview", "rozmowa kwalifikacyjna"),
                Entry("candidate", "kandydat"),
                Entry("reference", "referencje"),
                Entry("vacancy", "wakat"),
                Entry("apply", "ubiegać się"),
                Entry("hire", "zatrudnić"),
                Entry("employ", "zatrudniać"),
                Entry("earn", "zarabiać"),
                Entry("resign", "zrezygnować"),
                Entry("quit", "rzucić pracę"),
                Entry("fire", "zwolnić"),
                Entry("dismiss", "zwalniać"),
                Entry("retired", "emerytowany"),
                Entry("unemployed", "bezrobotny"),
                Entry("unemployment", "bezrobocie"),
                Entry("self-employed", "samozatrudniony"),
                Entry("volunteer", "wolontariusz"),
                Entry("trainee", "stażysta"),
                Entry("internship", "staż"),
            ],
            builtIn: true
        )
    }

    private static func set057() -> WordSet {
        WordSet(
            id: "set057",
            title: "Praca · Warunki zatrudnienia",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("full-time", "pełny etat"),
                Entry("part-time", "pół etatu"),
                Entry("shift", "zmiana"),
                Entry("overtime", "nadgodziny"),
                Entry("salary", "pensja"),
                Entry("wage", "wynagrodzenie"),
                Entry("bonus", "premia"),
                Entry("pay rise", "podwyżka"),
                Entry("promotion", "awans"),
                Entry("holiday", "urlop"),
                Entry("sick leave", "zwolnienie lekarskie"),
                Entry("pension", "emerytura"),
                Entry("contract", "umowa"),
                Entry("notice", "wypowiedzenie"),
                Entry("dismissal", "zwolnienie"),
                Entry("redundancy", "zwolnienie grupowe"),
                Entry("benefits", "świadczenia"),
                Entry("night shift", "nocna zmiana"),
                Entry("flexitime", "ruchomy czas"),
                Entry("remote work", "praca zdalna"),
            ],
            builtIn: true
        )
    }

    private static func set058() -> WordSet {
        WordSet(
            id: "set058",
            title: "Praca · Zawody: specjaliści",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("accountant", "księgowy"),
                Entry("actor", "aktor"),
                Entry("architect", "architekt"),
                Entry("dentist", "dentysta"),
                Entry("doctor", "lekarz"),
                Entry("engineer", "inżynier"),
                Entry("farmer", "rolnik"),
                Entry("firefighter", "strażak"),
                Entry("journalist", "dziennikarz"),
                Entry("judge", "sędzia"),
                Entry("lawyer", "prawnik"),
                Entry("librarian", "bibliotekarz"),
                Entry("nurse", "pielęgniarka"),
                Entry("painter", "malarz"),
                Entry("pilot", "pilot"),
                Entry("policeman", "policjant"),
                Entry("programmer", "programista"),
                Entry("scientist", "naukowiec"),
                Entry("soldier", "żołnierz"),
                Entry("translator", "tłumacz"),
                Entry("vet", "weterynarz"),
                Entry("writer", "pisarz"),
            ],
            builtIn: true
        )
    }

    private static func set059() -> WordSet {
        WordSet(
            id: "set059",
            title: "Praca · Zawody: usługi i rzemiosło",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("baker", "piekarz"),
                Entry("builder", "budowlaniec"),
                Entry("butcher", "rzeźnik"),
                Entry("carpenter", "stolarz"),
                Entry("chef", "kucharz"),
                Entry("cleaner", "sprzątacz"),
                Entry("driver", "kierowca"),
                Entry("electrician", "elektryk"),
                Entry("hairdresser", "fryzjer"),
                Entry("mechanic", "mechanik"),
                Entry("plumber", "hydraulik"),
                Entry("postman", "listonosz"),
                Entry("salesman", "sprzedawca"),
                Entry("shop assistant", "ekspedient"),
                Entry("tailor", "krawiec"),
                Entry("waiter", "kelner"),
                Entry("waitress", "kelnerka"),
                Entry("receptionist", "recepcjonista"),
                Entry("barber", "fryzjer męski"),
                Entry("courier", "kurier"),
            ],
            builtIn: true
        )
    }

    private static func set060() -> WordSet {
        WordSet(
            id: "set060",
            title: "Przyroda · Ekologia",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("environment", "środowisko"),
                Entry("pollution", "zanieczyszczenie"),
                Entry("smog", "smog"),
                Entry("waste", "odpady"),
                Entry("rubbish", "śmieci"),
                Entry("litter", "śmieci uliczne"),
                Entry("recycling", "recykling"),
                Entry("recycle", "przetwarzać"),
                Entry("global warming", "globalne ocieplenie"),
                Entry("climate change", "zmiana klimatu"),
                Entry("greenhouse effect", "efekt cieplarniany"),
                Entry("emissions", "emisje"),
                Entry("deforestation", "wylesianie"),
                Entry("extinction", "wymieranie"),
                Entry("endangered", "zagrożony"),
                Entry("species", "gatunek"),
                Entry("renewable", "odnawialny"),
                Entry("solar energy", "energia słoneczna"),
                Entry("wind farm", "farma wiatrowa"),
                Entry("save water", "oszczędzać wodę"),
                Entry("protect", "chronić"),
                Entry("pollute", "zanieczyszczać"),
                Entry("destroy", "niszczyć"),
                Entry("eco-friendly", "ekologiczny"),
                Entry("sustainable", "zrównoważony"),
            ],
            builtIn: true
        )
    }

    private static func set061() -> WordSet {
        WordSet(
            id: "set061",
            title: "Przyroda · Opis pogody",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("temperature", "temperatura"),
                Entry("sunny", "słonecznie"),
                Entry("cloudy", "pochmurno"),
                Entry("rainy", "deszczowo"),
                Entry("snowy", "śnieżnie"),
                Entry("windy", "wietrznie"),
                Entry("foggy", "mgliście"),
                Entry("humid", "wilgotno"),
                Entry("dry", "sucho"),
                Entry("warm", "ciepło"),
                Entry("hot", "gorąco"),
                Entry("cool", "chłodno"),
                Entry("cold", "zimno"),
                Entry("freezing", "lodowato"),
                Entry("mild", "łagodnie"),
                Entry("stormy", "burzowo"),
                Entry("chilly", "chłodno"),
                Entry("breeze", "wietrzyk"),
                Entry("heatwave", "fala upałów"),
                Entry("changeable", "zmienna"),
            ],
            builtIn: true
        )
    }

    private static func set062() -> WordSet {
        WordSet(
            id: "set062",
            title: "Przyroda · Owady i rośliny",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("insect", "owad"),
                Entry("bee", "pszczoła"),
                Entry("ant", "mrówka"),
                Entry("spider", "pająk"),
                Entry("butterfly", "motyl"),
                Entry("plant", "roślina"),
                Entry("tree", "drzewo"),
                Entry("bush", "krzew"),
                Entry("grass", "trawa"),
                Entry("flower", "kwiat"),
                Entry("rose", "róża"),
                Entry("leaf", "liść"),
                Entry("branch", "gałąź"),
                Entry("root", "korzeń"),
                Entry("seed", "nasiono"),
                Entry("fly", "mucha"),
                Entry("mosquito", "komar"),
                Entry("wasp", "osa"),
                Entry("herb", "zioło"),
                Entry("moss", "mech"),
            ],
            builtIn: true
        )
    }

    private static func set063() -> WordSet {
        WordSet(
            id: "set063",
            title: "Przyroda · Ukształtowanie terenu",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("nature", "przyroda"),
                Entry("landscape", "krajobraz"),
                Entry("mountain", "góra"),
                Entry("hill", "wzgórze"),
                Entry("valley", "dolina"),
                Entry("cliff", "klif"),
                Entry("cave", "jaskinia"),
                Entry("desert", "pustynia"),
                Entry("island", "wyspa"),
                Entry("volcano", "wulkan"),
                Entry("earthquake", "trzęsienie ziemi"),
                Entry("rock", "skała"),
                Entry("soil", "gleba"),
                Entry("sand", "piasek"),
                Entry("jungle", "dżungla"),
                Entry("plain", "równina"),
                Entry("glacier", "lodowiec"),
                Entry("crater", "krater"),
                Entry("canyon", "kanion"),
                Entry("peak", "szczyt"),
            ],
            builtIn: true
        )
    }

    private static func set064() -> WordSet {
        WordSet(
            id: "set064",
            title: "Przyroda · Wody, lasy i pora dnia",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("coast", "wybrzeże"),
                Entry("beach", "plaża"),
                Entry("sea", "morze"),
                Entry("ocean", "ocean"),
                Entry("lake", "jezioro"),
                Entry("river", "rzeka"),
                Entry("stream", "strumień"),
                Entry("waterfall", "wodospad"),
                Entry("pond", "staw"),
                Entry("forest", "las"),
                Entry("wood", "zagajnik"),
                Entry("field", "pole"),
                Entry("meadow", "łąka"),
                Entry("sunrise", "wschód słońca"),
                Entry("sunset", "zachód słońca"),
                Entry("bay", "zatoka"),
                Entry("swamp", "bagno"),
                Entry("dawn", "świt"),
                Entry("dusk", "zmierzch"),
                Entry("shore", "brzeg"),
            ],
            builtIn: true
        )
    }

    private static func set065() -> WordSet {
        WordSet(
            id: "set065",
            title: "Przyroda · Zjawiska pogodowe",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("weather", "pogoda"),
                Entry("forecast", "prognoza"),
                Entry("sun", "słońce"),
                Entry("cloud", "chmura"),
                Entry("rain", "deszcz"),
                Entry("shower", "przelotny deszcz"),
                Entry("drizzle", "mżawka"),
                Entry("snow", "śnieg"),
                Entry("hail", "grad"),
                Entry("wind", "wiatr"),
                Entry("storm", "burza"),
                Entry("thunder", "grzmot"),
                Entry("lightning", "błyskawica"),
                Entry("fog", "mgła"),
                Entry("frost", "mróz"),
                Entry("ice", "lód"),
                Entry("climate", "klimat"),
                Entry("drought", "susza"),
                Entry("flood", "powódź"),
                Entry("rainbow", "tęcza"),
            ],
            builtIn: true
        )
    }

    private static func set066() -> WordSet {
        WordSet(
            id: "set066",
            title: "Przyroda · Zwierzęta domowe i gospodarskie",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("animal", "zwierzę"),
                Entry("pet", "zwierzę domowe"),
                Entry("dog", "pies"),
                Entry("cat", "kot"),
                Entry("horse", "koń"),
                Entry("cow", "krowa"),
                Entry("pig", "świnia"),
                Entry("sheep", "owca"),
                Entry("goat", "koza"),
                Entry("rabbit", "królik"),
                Entry("mouse", "mysz"),
                Entry("hamster", "chomik"),
                Entry("hen", "kura"),
                Entry("duck", "kaczka"),
                Entry("bird", "ptak"),
                Entry("puppy", "szczeniak"),
                Entry("kitten", "kociak"),
                Entry("donkey", "osioł"),
                Entry("goose", "gęś"),
                Entry("turkey", "indyk"),
            ],
            builtIn: true
        )
    }

    private static func set067() -> WordSet {
        WordSet(
            id: "set067",
            title: "Przyroda · Zwierzęta dzikie",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("eagle", "orzeł"),
                Entry("owl", "sowa"),
                Entry("fish", "ryba"),
                Entry("shark", "rekin"),
                Entry("whale", "wieloryb"),
                Entry("dolphin", "delfin"),
                Entry("frog", "żaba"),
                Entry("snake", "wąż"),
                Entry("lizard", "jaszczurka"),
                Entry("bear", "niedźwiedź"),
                Entry("wolf", "wilk"),
                Entry("fox", "lis"),
                Entry("deer", "jeleń"),
                Entry("lion", "lew"),
                Entry("tiger", "tygrys"),
                Entry("elephant", "słoń"),
                Entry("monkey", "małpa"),
                Entry("hedgehog", "jeż"),
                Entry("squirrel", "wiewiórka"),
                Entry("seal", "foka"),
            ],
            builtIn: true
        )
    }

    private static func set068() -> WordSet {
        WordSet(
            id: "set068",
            title: "Sport · Dyscypliny: hala i boisko",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("football", "piłka nożna"),
                Entry("basketball", "koszykówka"),
                Entry("volleyball", "siatkówka"),
                Entry("handball", "piłka ręczna"),
                Entry("tennis", "tenis"),
                Entry("table tennis", "tenis stołowy"),
                Entry("badminton", "badminton"),
                Entry("golf", "golf"),
                Entry("chess", "szachy"),
                Entry("gymnastics", "gimnastyka"),
                Entry("boxing", "boks"),
                Entry("wrestling", "zapasy"),
                Entry("judo", "judo"),
                Entry("fitness", "fitness"),
                Entry("yoga", "joga"),
                Entry("rugby", "rugby"),
                Entry("baseball", "baseball"),
                Entry("squash", "squash"),
                Entry("darts", "rzutki"),
                Entry("weightlifting", "podnoszenie ciężarów"),
            ],
            builtIn: true
        )
    }

    private static func set069() -> WordSet {
        WordSet(
            id: "set069",
            title: "Sport · Dyscypliny: woda, śnieg, teren",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("swimming", "pływanie"),
                Entry("diving", "nurkowanie"),
                Entry("rowing", "wioślarstwo"),
                Entry("sailing", "żeglarstwo"),
                Entry("surfing", "surfing"),
                Entry("skiing", "narciarstwo"),
                Entry("snowboarding", "snowboard"),
                Entry("skating", "łyżwiarstwo"),
                Entry("cycling", "kolarstwo"),
                Entry("running", "bieganie"),
                Entry("jogging", "jogging"),
                Entry("athletics", "lekkoatletyka"),
                Entry("horse riding", "jazda konna"),
                Entry("climbing", "wspinaczka"),
                Entry("hiking", "piesze wędrówki"),
                Entry("canoeing", "kajakarstwo"),
                Entry("windsurfing", "windsurfing"),
                Entry("ice hockey", "hokej"),
                Entry("marathon", "maraton"),
                Entry("sledging", "saneczkarstwo"),
            ],
            builtIn: true
        )
    }

    private static func set070() -> WordSet {
        WordSet(
            id: "set070",
            title: "Sport · Ludzie w sporcie",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("sportsman", "sportowiec"),
                Entry("player", "zawodnik"),
                Entry("team", "drużyna"),
                Entry("coach", "trener"),
                Entry("referee", "sędzia"),
                Entry("fan", "kibic"),
                Entry("supporter", "zwolennik"),
                Entry("champion", "mistrz"),
                Entry("winner", "zwycięzca"),
                Entry("loser", "przegrany"),
                Entry("opponent", "przeciwnik"),
                Entry("goalkeeper", "bramkarz"),
                Entry("captain", "kapitan"),
                Entry("substitute", "rezerwowy"),
                Entry("spectator", "widz"),
                Entry("commentator", "komentator"),
                Entry("sponsor", "sponsor"),
                Entry("amateur", "amator"),
                Entry("professional", "zawodowiec"),
                Entry("runner-up", "wicemistrz"),
            ],
            builtIn: true
        )
    }

    private static func set071() -> WordSet {
        WordSet(
            id: "set071",
            title: "Sport · Rozgrywki i wyniki",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("match", "mecz"),
                Entry("game", "gra"),
                Entry("competition", "zawody"),
                Entry("tournament", "turniej"),
                Entry("championship", "mistrzostwa"),
                Entry("league", "liga"),
                Entry("cup", "puchar"),
                Entry("medal", "medal"),
                Entry("record", "rekord"),
                Entry("score", "wynik"),
                Entry("draw", "remis"),
                Entry("win", "wygrać"),
                Entry("lose", "przegrać"),
                Entry("beat", "pokonać"),
                Entry("train", "trenować"),
                Entry("practise", "ćwiczyć"),
                Entry("injury", "kontuzja"),
                Entry("doping", "doping"),
                Entry("penalty", "rzut karny"),
                Entry("final", "finał"),
            ],
            builtIn: true
        )
    }

    private static func set072() -> WordSet {
        WordSet(
            id: "set072",
            title: "Sport · Sprzęt i obiekty",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("ball", "piłka"),
                Entry("racket", "rakieta"),
                Entry("bat", "kij"),
                Entry("net", "siatka"),
                Entry("goal", "bramka"),
                Entry("helmet", "kask"),
                Entry("gloves", "rękawice"),
                Entry("skis", "narty"),
                Entry("skates", "łyżwy"),
                Entry("board", "deska"),
                Entry("bike", "rower"),
                Entry("stadium", "stadion"),
                Entry("pitch", "boisko"),
                Entry("court", "kort"),
                Entry("swimming pool", "basen"),
                Entry("gym", "siłownia"),
                Entry("track", "bieżnia"),
                Entry("changing room", "szatnia"),
                Entry("sports centre", "ośrodek sportowy"),
                Entry("slope", "stok"),
                Entry("rink", "lodowisko"),
                Entry("equipment", "sprzęt"),
                Entry("kit", "strój sportowy"),
                Entry("trainers", "buty sportowe"),
            ],
            builtIn: true
        )
    }

    private static func set073() -> WordSet {
        WordSet(
            id: "set073",
            title: "Zakupy · Bank i operacje",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("credit card", "karta kredytowa"),
                Entry("bank account", "konto bankowe"),
                Entry("cash machine", "bankomat"),
                Entry("transfer", "przelew"),
                Entry("loan", "pożyczka"),
                Entry("debt", "dług"),
                Entry("savings", "oszczędności"),
                Entry("budget", "budżet"),
                Entry("pay", "płacić"),
                Entry("spend", "wydawać"),
                Entry("save", "oszczędzać"),
                Entry("borrow", "pożyczać od"),
                Entry("lend", "pożyczać komuś"),
                Entry("owe", "być winnym"),
                Entry("afford", "pozwolić sobie"),
                Entry("waste", "marnować"),
                Entry("interest", "odsetki"),
                Entry("withdraw", "wypłacać"),
                Entry("deposit", "wpłacać"),
                Entry("balance", "saldo"),
            ],
            builtIn: true
        )
    }

    private static func set074() -> WordSet {
        WordSet(
            id: "set074",
            title: "Zakupy · Pieniądze i ceny",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("money", "pieniądze"),
                Entry("cash", "gotówka"),
                Entry("coin", "moneta"),
                Entry("note", "banknot"),
                Entry("change", "reszta"),
                Entry("price", "cena"),
                Entry("cost", "koszt"),
                Entry("value", "wartość"),
                Entry("cheap", "tani"),
                Entry("expensive", "drogi"),
                Entry("free", "darmowy"),
                Entry("bill", "rachunek"),
                Entry("wallet", "portfel"),
                Entry("purse", "portmonetka"),
                Entry("currency", "waluta"),
                Entry("exchange rate", "kurs walut"),
                Entry("total", "suma"),
                Entry("deposit", "zaliczka"),
                Entry("instalment", "rata"),
                Entry("worth", "wart"),
            ],
            builtIn: true
        )
    }

    private static func set075() -> WordSet {
        WordSet(
            id: "set075",
            title: "Zakupy · Rodzaje sklepów",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("shop", "sklep"),
                Entry("shopping centre", "centrum handlowe"),
                Entry("department store", "dom towarowy"),
                Entry("supermarket", "supermarket"),
                Entry("grocery", "spożywczy"),
                Entry("bakery", "piekarnia"),
                Entry("butcher's", "mięsny"),
                Entry("chemist's", "apteka"),
                Entry("bookshop", "księgarnia"),
                Entry("newsagent's", "kiosk"),
                Entry("market", "targ"),
                Entry("stall", "stoisko"),
                Entry("counter", "lada"),
                Entry("shelf", "półka"),
                Entry("checkout", "kasa"),
                Entry("queue", "kolejka"),
                Entry("florist's", "kwiaciarnia"),
                Entry("jeweller's", "jubiler"),
                Entry("boutique", "butik"),
                Entry("kiosk", "kiosk"),
            ],
            builtIn: true
        )
    }

    private static func set076() -> WordSet {
        WordSet(
            id: "set076",
            title: "Zakupy · Usługi",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("service", "usługa"),
                Entry("post office", "poczta"),
                Entry("bank", "bank"),
                Entry("hairdresser's", "fryzjer"),
                Entry("laundry", "pralnia"),
                Entry("dry cleaner's", "pralnia chemiczna"),
                Entry("garage", "warsztat"),
                Entry("car wash", "myjnia"),
                Entry("petrol station", "stacja benzynowa"),
                Entry("travel agency", "biuro podróży"),
                Entry("insurance", "ubezpieczenie"),
                Entry("repair", "naprawa"),
                Entry("delivery", "dostawa"),
                Entry("order", "zamawiać"),
                Entry("parcel", "paczka"),
                Entry("letter", "list"),
                Entry("stamp", "znaczek"),
                Entry("envelope", "koperta"),
                Entry("address", "adres"),
                Entry("send", "wysyłać"),
                Entry("book", "rezerwować"),
                Entry("cancel", "odwołać"),
                Entry("appointment", "wizyta"),
            ],
            builtIn: true
        )
    }

    private static func set077() -> WordSet {
        WordSet(
            id: "set077",
            title: "Zakupy · Zakupy i reklamacje",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("trolley", "wózek"),
                Entry("basket", "koszyk"),
                Entry("customer", "klient"),
                Entry("goods", "towary"),
                Entry("product", "produkt"),
                Entry("brand", "marka"),
                Entry("size", "rozmiar"),
                Entry("fitting room", "przymierzalnia"),
                Entry("sale", "wyprzedaż"),
                Entry("discount", "zniżka"),
                Entry("bargain", "okazja"),
                Entry("receipt", "paragon"),
                Entry("refund", "zwrot pieniędzy"),
                Entry("exchange", "wymiana"),
                Entry("guarantee", "gwarancja"),
                Entry("complaint", "reklamacja"),
                Entry("faulty", "wadliwy"),
                Entry("warranty", "gwarancja"),
                Entry("delivery", "dostawa"),
                Entry("packaging", "opakowanie"),
            ],
            builtIn: true
        )
    }

    private static func set078() -> WordSet {
        WordSet(
            id: "set078",
            title: "Zdrowie · Badania, zabiegi i leki",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("examination", "badanie"),
                Entry("test", "badanie"),
                Entry("X-ray", "prześwietlenie"),
                Entry("diagnosis", "diagnoza"),
                Entry("treatment", "leczenie"),
                Entry("operation", "operacja"),
                Entry("prescription", "recepta"),
                Entry("medicine", "lekarstwo"),
                Entry("pill", "tabletka"),
                Entry("tablet", "tabletka"),
                Entry("syrup", "syrop"),
                Entry("injection", "zastrzyk"),
                Entry("vaccination", "szczepienie"),
                Entry("plaster", "plaster"),
                Entry("bandage", "bandaż"),
                Entry("first aid", "pierwsza pomoc"),
                Entry("blood test", "badanie krwi"),
                Entry("ointment", "maść"),
                Entry("drops", "krople"),
                Entry("antibiotic", "antybiotyk"),
            ],
            builtIn: true
        )
    }

    private static func set079() -> WordSet {
        WordSet(
            id: "set079",
            title: "Zdrowie · Choroby i urazy",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("illness", "choroba"),
                Entry("disease", "schorzenie"),
                Entry("allergy", "alergia"),
                Entry("asthma", "astma"),
                Entry("cancer", "rak"),
                Entry("diabetes", "cukrzyca"),
                Entry("heart attack", "zawał serca"),
                Entry("infection", "infekcja"),
                Entry("virus", "wirus"),
                Entry("wound", "rana"),
                Entry("bruise", "siniak"),
                Entry("burn", "oparzenie"),
                Entry("broken leg", "złamana noga"),
                Entry("sprain", "skręcenie"),
                Entry("serious", "poważny"),
                Entry("contagious", "zaraźliwy"),
                Entry("pneumonia", "zapalenie płuc"),
                Entry("chickenpox", "ospa"),
                Entry("migraine", "migrena"),
                Entry("fracture", "złamanie"),
            ],
            builtIn: true
        )
    }

    private static func set080() -> WordSet {
        WordSet(
            id: "set080",
            title: "Zdrowie · Dolegliwości i bóle",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("cold", "przeziębienie"),
                Entry("flu", "grypa"),
                Entry("cough", "kaszel"),
                Entry("sore throat", "ból gardła"),
                Entry("headache", "ból głowy"),
                Entry("stomachache", "ból brzucha"),
                Entry("toothache", "ból zęba"),
                Entry("backache", "ból pleców"),
                Entry("earache", "ból ucha"),
                Entry("fever", "gorączka"),
                Entry("temperature", "temperatura"),
                Entry("rash", "wysypka"),
                Entry("dizzy", "zawroty głowy"),
                Entry("nosebleed", "krwawienie nosa"),
                Entry("sick", "chory"),
                Entry("weak", "osłabiony"),
                Entry("painful", "bolesny"),
                Entry("sneeze", "kichać"),
                Entry("swollen", "spuchnięty"),
                Entry("itchy", "swędzący"),
            ],
            builtIn: true
        )
    }

    private static func set081() -> WordSet {
        WordSet(
            id: "set081",
            title: "Zdrowie · Lekarze i placówki",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("doctor", "lekarz"),
                Entry("GP", "lekarz rodzinny"),
                Entry("specialist", "specjalista"),
                Entry("surgeon", "chirurg"),
                Entry("nurse", "pielęgniarka"),
                Entry("patient", "pacjent"),
                Entry("hospital", "szpital"),
                Entry("clinic", "przychodnia"),
                Entry("ward", "oddział"),
                Entry("surgery", "gabinet"),
                Entry("ambulance", "karetka"),
                Entry("emergency", "nagły wypadek"),
                Entry("appointment", "wizyta"),
                Entry("recover", "wyzdrowieć"),
                Entry("cure", "wyleczyć"),
                Entry("hurt", "boleć"),
                Entry("suffer", "cierpieć"),
                Entry("waiting room", "poczekalnia"),
                Entry("receptionist", "rejestratorka"),
                Entry("paramedic", "ratownik"),
            ],
            builtIn: true
        )
    }

    private static func set082() -> WordSet {
        WordSet(
            id: "set082",
            title: "Zdrowie · Zdrowy tryb życia",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("health", "zdrowie"),
                Entry("healthy", "zdrowy"),
                Entry("unhealthy", "niezdrowy"),
                Entry("fitness", "sprawność"),
                Entry("exercise", "ćwiczenia"),
                Entry("workout", "trening"),
                Entry("diet", "dieta"),
                Entry("balanced diet", "zrównoważona dieta"),
                Entry("vitamin", "witamina"),
                Entry("calorie", "kaloria"),
                Entry("sleep", "sen"),
                Entry("stress", "stres"),
                Entry("addiction", "uzależnienie"),
                Entry("smoking", "palenie"),
                Entry("alcohol", "alkohol"),
                Entry("drug", "narkotyk"),
                Entry("obesity", "otyłość"),
                Entry("hygiene", "higiena"),
                Entry("prevention", "profilaktyka"),
                Entry("checkup", "badanie kontrolne"),
                Entry("give up", "rzucić"),
                Entry("keep fit", "utrzymywać formę"),
                Entry("lose weight", "schudnąć"),
            ],
            builtIn: true
        )
    }

    private static func set083() -> WordSet {
        WordSet(
            id: "set083",
            title: "Życie prywatne · Dalsza rodzina",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("grandmother", "babcia"),
                Entry("grandfather", "dziadek"),
                Entry("grandparents", "dziadkowie"),
                Entry("grandson", "wnuk"),
                Entry("granddaughter", "wnuczka"),
                Entry("uncle", "wujek"),
                Entry("aunt", "ciocia"),
                Entry("cousin", "kuzyn"),
                Entry("nephew", "bratanek"),
                Entry("niece", "siostrzenica"),
                Entry("relative", "krewny"),
                Entry("stepmother", "macocha"),
                Entry("stepfather", "ojczym"),
                Entry("mother-in-law", "teściowa"),
                Entry("father-in-law", "teść"),
                Entry("godmother", "matka chrzestna"),
                Entry("godfather", "ojciec chrzestny"),
                Entry("orphan", "sierota"),
                Entry("in-laws", "teściowie"),
                Entry("great-grandmother", "prababcia"),
            ],
            builtIn: true
        )
    }

    private static func set084() -> WordSet {
        WordSet(
            id: "set084",
            title: "Życie prywatne · Dzień i czas wolny",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("go out", "wychodzić"),
                Entry("come back", "wracać"),
                Entry("have lunch", "jeść obiad"),
                Entry("have dinner", "jeść kolację"),
                Entry("rest", "odpoczywać"),
                Entry("relax", "relaksować się"),
                Entry("read", "czytać"),
                Entry("watch TV", "oglądać telewizję"),
                Entry("listen", "słuchać"),
                Entry("chat", "rozmawiać"),
                Entry("hurry", "spieszyć się"),
                Entry("be late", "spóźniać się"),
                Entry("free time", "czas wolny"),
                Entry("hobby", "hobby"),
                Entry("routine", "rutyna"),
                Entry("meet friends", "spotykać się"),
                Entry("shopping", "zakupy"),
                Entry("do sport", "uprawiać sport"),
                Entry("play", "grać"),
                Entry("walk", "spacer"),
            ],
            builtIn: true
        )
    }

    private static func set085() -> WordSet {
        WordSet(
            id: "set085",
            title: "Życie prywatne · Etapy związku i kontakty",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("date", "randka"),
                Entry("engaged", "zaręczony"),
                Entry("get married", "pobrać się"),
                Entry("break up", "zerwać"),
                Entry("divorce", "rozwód"),
                Entry("quarrel", "kłótnia"),
                Entry("argument", "sprzeczka"),
                Entry("conflict", "konflikt"),
                Entry("make up", "godzić się"),
                Entry("meet", "spotykać"),
                Entry("visit", "odwiedzać"),
                Entry("invite", "zapraszać"),
                Entry("promise", "obiecywać"),
                Entry("engagement", "zaręczyny"),
                Entry("wedding", "wesele"),
                Entry("anniversary", "rocznica"),
                Entry("separation", "separacja"),
                Entry("reconcile", "pogodzić się"),
                Entry("propose", "oświadczyć się"),
                Entry("contact", "kontaktować się"),
            ],
            builtIn: true
        )
    }

    private static func set086() -> WordSet {
        WordSet(
            id: "set086",
            title: "Życie prywatne · Najbliższa rodzina",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("family", "rodzina"),
                Entry("parents", "rodzice"),
                Entry("mother", "matka"),
                Entry("father", "ojciec"),
                Entry("son", "syn"),
                Entry("daughter", "córka"),
                Entry("brother", "brat"),
                Entry("sister", "siostra"),
                Entry("twins", "bliźnięta"),
                Entry("husband", "mąż"),
                Entry("wife", "żona"),
                Entry("only child", "jedynak"),
                Entry("baby", "niemowlę"),
                Entry("child", "dziecko"),
                Entry("sibling", "rodzeństwo"),
                Entry("elder brother", "starszy brat"),
                Entry("younger sister", "młodsza siostra"),
                Entry("household", "gospodarstwo"),
                Entry("upbringing", "wychowanie"),
                Entry("family life", "życie rodzinne"),
            ],
            builtIn: true
        )
    }

    private static func set087() -> WordSet {
        WordSet(
            id: "set087",
            title: "Życie prywatne · Poranek i wieczór",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("wake up", "budzić się"),
                Entry("get up", "wstawać"),
                Entry("wash", "myć się"),
                Entry("have breakfast", "jeść śniadanie"),
                Entry("brush teeth", "myć zęby"),
                Entry("comb", "czesać"),
                Entry("shave", "golić się"),
                Entry("get ready", "szykować się"),
                Entry("bedtime", "pora spania"),
                Entry("fall asleep", "zasypiać"),
                Entry("sleep", "spać"),
                Entry("oversleep", "zaspać"),
                Entry("alarm clock", "budzik"),
                Entry("get dressed", "ubierać się"),
                Entry("wash face", "myć twarz"),
                Entry("dry hair", "suszyć włosy"),
                Entry("make coffee", "robić kawę"),
                Entry("undress", "rozbierać się"),
                Entry("set alarm", "nastawić budzik"),
                Entry("dream", "śnić"),
            ],
            builtIn: true
        )
    }

    private static func set088() -> WordSet {
        WordSet(
            id: "set088",
            title: "Życie prywatne · Znajomi i bliscy",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("friend", "przyjaciel"),
                Entry("best friend", "najlepszy przyjaciel"),
                Entry("acquaintance", "znajomy"),
                Entry("mate", "kumpel"),
                Entry("girlfriend", "dziewczyna"),
                Entry("boyfriend", "chłopak"),
                Entry("partner", "partner"),
                Entry("couple", "para"),
                Entry("relationship", "związek"),
                Entry("friendship", "przyjaźń"),
                Entry("love", "miłość"),
                Entry("trust", "ufać"),
                Entry("support", "wspierać"),
                Entry("miss", "tęsknić"),
                Entry("neighbour", "sąsiad"),
                Entry("colleague", "współpracownik"),
                Entry("company", "towarzystwo"),
                Entry("loyalty", "lojalność"),
                Entry("respect", "szacunek"),
                Entry("understanding", "zrozumienie"),
            ],
            builtIn: true
        )
    }

    private static func set089() -> WordSet {
        WordSet(
            id: "set089",
            title: "Życie prywatne · Święta i uroczystości",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("birthday", "urodziny"),
                Entry("nameday", "imieniny"),
                Entry("anniversary", "rocznica"),
                Entry("wedding", "ślub"),
                Entry("engagement", "zaręczyny"),
                Entry("honeymoon", "miesiąc miodowy"),
                Entry("funeral", "pogrzeb"),
                Entry("christening", "chrzest"),
                Entry("Christmas", "Boże Narodzenie"),
                Entry("Christmas Eve", "Wigilia"),
                Entry("Easter", "Wielkanoc"),
                Entry("New Year", "Nowy Rok"),
                Entry("carnival", "karnawał"),
                Entry("party", "impreza"),
                Entry("guest", "gość"),
                Entry("host", "gospodarz"),
                Entry("invitation", "zaproszenie"),
                Entry("present", "prezent"),
                Entry("card", "kartka"),
                Entry("decoration", "dekoracja"),
                Entry("fireworks", "fajerwerki"),
                Entry("candle", "świeczka"),
                Entry("celebrate", "świętować"),
                Entry("congratulate", "gratulować"),
                Entry("toast", "toast"),
            ],
            builtIn: true
        )
    }

    private static func set090() -> WordSet {
        WordSet(
            id: "set090",
            title: "Życie społeczne · Państwo, prawo i wartości",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("country", "kraj"),
                Entry("state", "państwo"),
                Entry("law", "prawo"),
                Entry("constitution", "konstytucja"),
                Entry("citizen", "obywatel"),
                Entry("tax", "podatek"),
                Entry("border", "granica"),
                Entry("flag", "flaga"),
                Entry("nation", "naród"),
                Entry("union", "unia"),
                Entry("duty", "obowiązek"),
                Entry("freedom", "wolność"),
                Entry("equality", "równość"),
                Entry("rights", "prawa"),
                Entry("peace", "pokój"),
                Entry("justice", "sprawiedliwość"),
                Entry("tolerance", "tolerancja"),
                Entry("solidarity", "solidarność"),
                Entry("passport", "paszport"),
                Entry("anthem", "hymn"),
            ],
            builtIn: true
        )
    }

    private static func set091() -> WordSet {
        WordSet(
            id: "set091",
            title: "Życie społeczne · Problemy społeczne",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("poverty", "bieda"),
                Entry("homeless", "bezdomny"),
                Entry("hunger", "głód"),
                Entry("unemployment", "bezrobocie"),
                Entry("discrimination", "dyskryminacja"),
                Entry("racism", "rasizm"),
                Entry("prejudice", "uprzedzenie"),
                Entry("inequality", "nierówność"),
                Entry("refugee", "uchodźca"),
                Entry("immigrant", "imigrant"),
                Entry("minority", "mniejszość"),
                Entry("charity", "organizacja charytatywna"),
                Entry("donation", "darowizna"),
                Entry("volunteer", "wolontariusz"),
                Entry("help", "pomagać"),
                Entry("support", "wspierać"),
                Entry("protest", "protest"),
                Entry("demonstration", "demonstracja"),
                Entry("strike", "strajk"),
                Entry("campaign", "kampania"),
                Entry("aid", "pomoc"),
                Entry("solidarity", "solidarność"),
                Entry("tolerance", "tolerancja"),
                Entry("respect", "szacunek"),
            ],
            builtIn: true
        )
    }

    private static func set092() -> WordSet {
        WordSet(
            id: "set092",
            title: "Życie społeczne · Przestępstwa i sprawcy",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("crime", "przestępstwo"),
                Entry("criminal", "przestępca"),
                Entry("thief", "złodziej"),
                Entry("theft", "kradzież"),
                Entry("burglar", "włamywacz"),
                Entry("burglary", "włamanie"),
                Entry("robbery", "rozbój"),
                Entry("murder", "morderstwo"),
                Entry("murderer", "morderca"),
                Entry("fraud", "oszustwo"),
                Entry("bribery", "łapówkarstwo"),
                Entry("smuggling", "przemyt"),
                Entry("vandalism", "wandalizm"),
                Entry("violence", "przemoc"),
                Entry("steal", "kraść"),
                Entry("rob", "okradać"),
                Entry("cheat", "oszukiwać"),
                Entry("shoplifting", "kradzież sklepowa"),
                Entry("hacking", "włamanie komputerowe"),
                Entry("gang", "gang"),
            ],
            builtIn: true
        )
    }

    private static func set093() -> WordSet {
        WordSet(
            id: "set093",
            title: "Życie społeczne · Władza i wybory",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("government", "rząd"),
                Entry("president", "prezydent"),
                Entry("prime minister", "premier"),
                Entry("minister", "minister"),
                Entry("parliament", "parlament"),
                Entry("election", "wybory"),
                Entry("vote", "głosować"),
                Entry("voter", "wyborca"),
                Entry("party", "partia"),
                Entry("politician", "polityk"),
                Entry("politics", "polityka"),
                Entry("society", "społeczeństwo"),
                Entry("democracy", "demokracja"),
                Entry("army", "armia"),
                Entry("war", "wojna"),
                Entry("campaign", "kampania"),
                Entry("candidate", "kandydat"),
                Entry("majority", "większość"),
                Entry("opposition", "opozycja"),
                Entry("referendum", "referendum"),
            ],
            builtIn: true
        )
    }

    private static func set094() -> WordSet {
        WordSet(
            id: "set094",
            title: "Życie społeczne · Śledztwo, sąd i kara",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("witness", "świadek"),
                Entry("victim", "ofiara"),
                Entry("suspect", "podejrzany"),
                Entry("evidence", "dowód"),
                Entry("police", "policja"),
                Entry("arrest", "aresztować"),
                Entry("investigate", "badać sprawę"),
                Entry("court", "sąd"),
                Entry("judge", "sędzia"),
                Entry("trial", "proces"),
                Entry("guilty", "winny"),
                Entry("innocent", "niewinny"),
                Entry("sentence", "wyrok"),
                Entry("fine", "grzywna"),
                Entry("prison", "więzienie"),
                Entry("punishment", "kara"),
                Entry("lawyer", "adwokat"),
                Entry("prosecutor", "prokurator"),
                Entry("appeal", "apelacja"),
                Entry("bail", "kaucja"),
            ],
            builtIn: true
        )
    }

    private static func set095() -> WordSet {
        WordSet(
            id: "set095",
            title: "Żywienie · Gotowanie",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("boil", "gotować"),
                Entry("fry", "smażyć"),
                Entry("bake", "piec"),
                Entry("roast", "piec mięso"),
                Entry("grill", "grillować"),
                Entry("stew", "dusić"),
                Entry("reheat", "odgrzewać"),
                Entry("chop", "siekać"),
                Entry("slice", "kroić"),
                Entry("peel", "obierać"),
                Entry("grate", "trzeć"),
                Entry("mix", "mieszać"),
                Entry("stir", "mieszać łyżką"),
                Entry("pour", "nalewać"),
                Entry("serve", "podawać"),
                Entry("taste", "smakować"),
                Entry("season", "doprawiać"),
                Entry("knead", "zagniatać"),
                Entry("whisk", "ubijać"),
                Entry("defrost", "rozmrażać"),
            ],
            builtIn: true
        )
    }

    private static func set096() -> WordSet {
        WordSet(
            id: "set096",
            title: "Żywienie · Mięso, nabiał, pieczywo",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("beef", "wołowina"),
                Entry("pork", "wieprzowina"),
                Entry("chicken", "kurczak"),
                Entry("ham", "szynka"),
                Entry("sausage", "kiełbasa"),
                Entry("fish", "ryba"),
                Entry("egg", "jajko"),
                Entry("cheese", "ser"),
                Entry("butter", "masło"),
                Entry("milk", "mleko"),
                Entry("cream", "śmietana"),
                Entry("yoghurt", "jogurt"),
                Entry("bread", "chleb"),
                Entry("roll", "bułka"),
                Entry("flour", "mąka"),
                Entry("turkey", "indyk"),
                Entry("lamb", "jagnięcina"),
                Entry("bacon", "boczek"),
                Entry("yolk", "żółtko"),
                Entry("toast", "tost"),
            ],
            builtIn: true
        )
    }

    private static func set097() -> WordSet {
        WordSet(
            id: "set097",
            title: "Żywienie · Owoce i warzywa",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("apple", "jabłko"),
                Entry("banana", "banan"),
                Entry("strawberry", "truskawka"),
                Entry("cherry", "wiśnia"),
                Entry("grapes", "winogrona"),
                Entry("lemon", "cytryna"),
                Entry("pear", "gruszka"),
                Entry("peach", "brzoskwinia"),
                Entry("plum", "śliwka"),
                Entry("carrot", "marchewka"),
                Entry("potato", "ziemniak"),
                Entry("tomato", "pomidor"),
                Entry("cucumber", "ogórek"),
                Entry("onion", "cebula"),
                Entry("garlic", "czosnek"),
                Entry("cabbage", "kapusta"),
                Entry("mushroom", "grzyb"),
                Entry("pepper", "papryka"),
                Entry("beans", "fasola"),
                Entry("peas", "groszek"),
            ],
            builtIn: true
        )
    }

    private static func set098() -> WordSet {
        WordSet(
            id: "set098",
            title: "Żywienie · Posiłki i dania",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("breakfast", "śniadanie"),
                Entry("brunch", "drugie śniadanie"),
                Entry("lunch", "obiad"),
                Entry("dinner", "kolacja"),
                Entry("supper", "wieczerza"),
                Entry("snack", "przekąska"),
                Entry("starter", "przystawka"),
                Entry("main course", "danie główne"),
                Entry("dessert", "deser"),
                Entry("dish", "potrawa"),
                Entry("meal", "posiłek"),
                Entry("recipe", "przepis"),
                Entry("portion", "porcja"),
                Entry("diet", "dieta"),
                Entry("vegetarian", "wegetarianin"),
                Entry("vegan", "weganin"),
                Entry("side dish", "dodatek"),
                Entry("soup", "zupa"),
                Entry("salad", "sałatka"),
                Entry("sandwich", "kanapka"),
            ],
            builtIn: true
        )
    }

    private static func set099() -> WordSet {
        WordSet(
            id: "set099",
            title: "Żywienie · Smaki i stan potrawy",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("delicious", "pyszny"),
                Entry("tasty", "smaczny"),
                Entry("disgusting", "obrzydliwy"),
                Entry("sweet", "słodki"),
                Entry("sour", "kwaśny"),
                Entry("bitter", "gorzki"),
                Entry("salty", "słony"),
                Entry("spicy", "ostry"),
                Entry("fresh", "świeży"),
                Entry("stale", "czerstwy"),
                Entry("raw", "surowy"),
                Entry("fried", "smażony"),
                Entry("boiled", "gotowany"),
                Entry("frozen", "mrożony"),
                Entry("healthy", "zdrowy"),
                Entry("unhealthy", "niezdrowy"),
                Entry("hungry", "głodny"),
                Entry("thirsty", "spragniony"),
                Entry("full", "najedzony"),
                Entry("greasy", "tłusty"),
            ],
            builtIn: true
        )
    }

    private static func set100() -> WordSet {
        WordSet(
            id: "set100",
            title: "Żywienie · Słodycze i napoje",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("rice", "ryż"),
                Entry("pasta", "makaron"),
                Entry("sugar", "cukier"),
                Entry("salt", "sól"),
                Entry("honey", "miód"),
                Entry("cake", "ciasto"),
                Entry("biscuit", "ciastko"),
                Entry("ice cream", "lody"),
                Entry("chocolate", "czekolada"),
                Entry("juice", "sok"),
                Entry("tea", "herbata"),
                Entry("coffee", "kawa"),
                Entry("water", "woda"),
                Entry("beer", "piwo"),
                Entry("wine", "wino"),
                Entry("jam", "dżem"),
                Entry("pancake", "naleśnik"),
                Entry("sweets", "cukierki"),
                Entry("lemonade", "lemoniada"),
                Entry("mineral water", "woda mineralna"),
            ],
            builtIn: true
        )
    }

    private static func set101() -> WordSet {
        WordSet(
            id: "set101",
            title: "Żywienie · W restauracji",
            termLanguage: "English",
            definitionLanguage: "Polski",
            entries: [
                Entry("menu", "menu"),
                Entry("bill", "rachunek"),
                Entry("tip", "napiwek"),
                Entry("order", "zamówienie"),
                Entry("restaurant", "restauracja"),
                Entry("cafe", "kawiarnia"),
                Entry("canteen", "stołówka"),
                Entry("pub", "pub"),
                Entry("takeaway", "na wynos"),
                Entry("fast food", "fast food"),
                Entry("waiter", "kelner"),
                Entry("reserve", "rezerwować"),
                Entry("waitress", "kelnerka"),
                Entry("table", "stolik"),
                Entry("booking", "rezerwacja"),
                Entry("service", "obsługa"),
                Entry("napkin", "serwetka"),
                Entry("cutlery", "sztućce"),
                Entry("bar", "bar"),
                Entry("self-service", "samoobsługa"),
            ],
            builtIn: true
        )
    }
}
