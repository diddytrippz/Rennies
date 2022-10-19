import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'af', 'zu'];

  String get languageCode => locale.toString();
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? afText = '',
    String? zuText = '',
  }) =>
      [enText, afText, zuText][languageIndex] ?? '';
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      FFLocalizations.languages().contains(locale.toString());

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // onboarding
  {
    '7rm5hpzh': {
      'en': 'Rennie House',
      'af': 'Kampus Afrika',
      'zu': 'Ikhampasi Afrika',
    },
    'til09yqe': {
      'en': 'Rennie House',
      'af': 'Kampus Afrika',
      'zu': 'Ikhampasi Afrika',
    },
    '5fjqqbhk': {
      'en': 'Login',
      'af': 'Teken aan',
      'zu': 'Ngena ngemvume',
    },
    'toce9ejh': {
      'en': 'Register',
      'af': 'Registreer',
      'zu': 'Bhalisa',
    },
    '274gqvvp': {
      'en': 'Home',
      'af': 'Tuis',
      'zu': 'Ikhaya',
    },
  },
  // login
  {
    'tgskapzx': {
      'en': 'Sign In',
      'af': '',
      'zu': '',
    },
    '7vcpc0mi': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'x0viklun': {
      'en': 'Enter Student Your Email',
      'af': '',
      'zu': '',
    },
    'ekehj1f9': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'a72qcfjf': {
      'en': 'Enter Your Password',
      'af': '',
      'zu': '',
    },
    'd4an6irz': {
      'en': 'Sign In',
      'af': '',
      'zu': '',
    },
    'rppaluuv': {
      'en': 'Forgot Password?',
      'af': '',
      'zu': '',
    },
    '6iiwvi49': {
      'en': 'Field is required',
      'af': '',
      'zu': '',
    },
    'jhzzqlsx': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'zu': '',
    },
    '8o3gbjtj': {
      'en': 'Field is required',
      'af': '',
      'zu': '',
    },
    'iv7yv8qi': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'zu': '',
    },
    'tgpjg0xr': {
      'en': 'Sign Up',
      'af': '',
      'zu': '',
    },
    'wm8a31zz': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'lf5g9whj': {
      'en': 'Enter Student Your Email',
      'af': '',
      'zu': '',
    },
    'bh05eotq': {
      'en': 'Create account',
      'af': '',
      'zu': '',
    },
    'eaeqw1o6': {
      'en': 'Field is required',
      'af': '',
      'zu': '',
    },
    'j8ro5rx8': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'zu': '',
    },
    'p8zu0wua': {
      'en': 'Home',
      'af': 'Tuis',
      'zu': 'Ikhaya',
    },
  },
  // view
  {
    '7lefrg9p': {
      'en': 'Maintenance',
      'af': '',
      'zu': '',
    },
    'fxusdesr': {
      'en': 'Submitted',
      'af': 'Ingedien',
      'zu': 'Kuthunyelwe',
    },
    'x8cw3w69': {
      'en': 'Search results',
      'af': 'Soek Resultate',
      'zu': 'Imiphumela yosesho',
    },
    '47qcs9t7': {
      'en': 'Delete',
      'af': 'Vee uit',
      'zu': 'Susa',
    },
    'xliyc9jb': {
      'en': 'Pending',
      'af': 'Hangende',
      'zu': 'Kusalindile',
    },
    '4e2bu1eh': {
      'en': 'Search results',
      'af': 'Soek Resultate',
      'zu': 'Imiphumela yosesho',
    },
    'nj9umfeo': {
      'en': 'Completed',
      'af': 'Voltooi',
      'zu': 'Kuqediwe',
    },
    '9zcs84ro': {
      'en': 'Search results',
      'af': 'Soek Resultate',
      'zu': 'Imiphumela yosesho',
    },
    '4mu7n5uz': {
      'en': 'Submitted',
      'af': 'Ingedien',
      'zu': 'Kuthunyelwe',
    },
    'epsh7pdm': {
      'en': 'Search results',
      'af': 'Soek Resultate',
      'zu': 'Imiphumela yosesho',
    },
    'zset6avm': {
      'en': 'Complete',
      'af': 'Voltooi',
      'zu': 'Qedela',
    },
    '6firyr35': {
      'en': 'Pending',
      'af': 'Hangende',
      'zu': 'Kusalindile',
    },
    'xv02t8u2': {
      'en': 'Search results',
      'af': 'Soek Resultate',
      'zu': 'Imiphumela yosesho',
    },
    'r52o7k9c': {
      'en': 'Reject',
      'af': 'Verwerp',
      'zu': 'Yenqaba',
    },
    'ib1fouvv': {
      'en': 'Complete',
      'af': 'Voltooi',
      'zu': 'Qedela',
    },
    'n3dnbo6v': {
      'en': 'Completed',
      'af': 'Voltooi',
      'zu': 'Kuqediwe',
    },
    'afgqhb9l': {
      'en': 'Search results',
      'af': 'Soek Resultate',
      'zu': 'Imiphumela yosesho',
    },
  },
  // rules
  {
    'oft7p3f9': {
      'en': 'Rennie House',
      'af': 'Kampus Afrika',
      'zu': 'Ikhampasi Afrika',
    },
    'abzkc55j': {
      'en': 'Home',
      'af': 'Tuis',
      'zu': 'Ikhaya',
    },
  },
  // chats
  {
    'f6dwmrme': {
      'en': '0',
      'af': '',
      'zu': '',
    },
    '25cdx1l2': {
      'en': 'Home',
      'af': 'Tuis',
      'zu': 'Ikhaya',
    },
  },
  // Appliances
  {
    '379z4gvh': {
      'en': 'Appliances',
      'af': 'Toestelle',
      'zu': 'Izinto zikagesi',
    },
    'kk3edzbs': {
      'en': 'Name',
      'af': 'Naam',
      'zu': 'Igama',
    },
    '4fsu6x0m': {
      'en': ' ',
      'af': '',
      'zu': '',
    },
    'nzk8ziaw': {
      'en': 'Issue',
      'af': 'Uitgawe',
      'zu': 'Inkinga',
    },
    'b282kjk3': {
      'en': 'Stove not working',
      'af': 'Stoof werk nie',
      'zu': 'Isitofu asisebenzi',
    },
    'v7swjfni': {
      'en': 'Oven not working',
      'af': 'Oond werk nie',
      'zu': 'Ihhavini ayisebenzi',
    },
    'jdaewo5r': {
      'en': 'Microwave not working',
      'af': 'Mikrogolf werk nie',
      'zu': 'I-microwave ayisebenzi',
    },
    'b8su8jqc': {
      'en': 'Fridge not working',
      'af': 'Yskas werk nie',
      'zu': 'Isiqandisi asisebenzi',
    },
    'jzxq70zt': {
      'en': 'Please select...',
      'af': 'Kies asseblief...',
      'zu': 'Sicela ukhethe...',
    },
    'ujr70769': {
      'en': 'Description',
      'af': 'Beskrywing',
      'zu': 'Incazelo',
    },
    '5mhqusqz': {
      'en': 'Describe your Issue',
      'af': 'Beskryf jou probleem',
      'zu': 'Chaza udaba lwakho',
    },
    'xmb7t2fh': {
      'en': 'Submit',
      'af': 'Indien',
      'zu': 'Thumela',
    },
    'nyf0hs7p': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'zu': 'Inkambu iyadingeka',
    },
    'aw66xj2z': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'zu': 'Inkambu iyadingeka',
    },
    'jbigh77n': {
      'en': 'Home',
      'af': 'Tuis',
      'zu': 'Ikhaya',
    },
  },
  // Plumbing
  {
    'j6exf7im': {
      'en': 'Plumbing',
      'af': 'Loodgieterswerk',
      'zu': 'Amapayipi amanzi',
    },
    'sjfameuq': {
      'en': 'Name',
      'af': 'Naam',
      'zu': 'Igama',
    },
    'hh3kxhi3': {
      'en': ' ',
      'af': '',
      'zu': '',
    },
    '6ydhq6qy': {
      'en': 'Issue',
      'af': 'Uitgawe',
      'zu': 'Inkinga',
    },
    'g1s4b5qt': {
      'en': 'Damaged toilet sit',
      'af': 'Beskadigde toilet sit',
      'zu': 'Indlu yangasese eyonakele',
    },
    'f3r9wayy': {
      'en': 'Damaged basin/sink',
      'af': 'Beskadigde wasbak/wasbak',
      'zu': 'Isitsha/usinki owonakele',
    },
    'uzsclpgj': {
      'en': 'Blocked urinal',
      'af': 'Geblokkeerde urinaal',
      'zu': 'Umchamo ovinjiwe',
    },
    'bcc5cdzk': {
      'en': 'Blocked toilet',
      'af': 'Geblokkeerde toilet',
      'zu': 'Indlu yangasese evinjiwe',
    },
    'jvpf1jfb': {
      'en': 'Blocked shower drain',
      'af': 'Geblokkeerde stortafvoer',
      'zu': 'I-drain yeshawa evinjiwe',
    },
    '4wyw28qg': {
      'en': 'Low water pressure',
      'af': 'Lae waterdruk',
      'zu': 'Umfutho wamanzi ophansi',
    },
    'xglpnog5': {
      'en': 'No cold water',
      'af': 'Geen koue water nie',
      'zu': 'Awekho amanzi abandayo',
    },
    '4ybabfa3': {
      'en': 'No hot water',
      'af': 'Geen warm water nie',
      'zu': 'Awekho amanzi ashisayo',
    },
    'oe2iooc7': {
      'en': 'Shower head needs to be replaced',
      'af': 'Stortkop moet vervang word',
      'zu': 'Ikhanda leshawa lidinga ukushintshwa',
    },
    '1hx0jrbo': {
      'en': 'Leaking gyser',
      'af': 'Lekkende gyser',
      'zu': 'I-gyser evuzayo',
    },
    '0acr9e1x': {
      'en': 'Burst pipes',
      'af': 'Gebarste pype',
      'zu': 'Amapayipi okuqhuma',
    },
    'jecw64w4': {
      'en': 'Please select...',
      'af': 'Kies asseblief...',
      'zu': 'Sicela ukhethe...',
    },
    '221kv5j6': {
      'en': 'Description',
      'af': 'Beskrywing',
      'zu': 'Incazelo',
    },
    'g4jhlicm': {
      'en': 'Describe your Issue',
      'af': 'Beskryf jou probleem',
      'zu': 'Chaza udaba lwakho',
    },
    '9hwlv2m7': {
      'en': 'Submit',
      'af': 'Indien',
      'zu': 'Thumela',
    },
    'x51gr9yz': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'zu': 'Inkambu iyadingeka',
    },
    'h85e3ygq': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'zu': 'Inkambu iyadingeka',
    },
    '856ubjjv': {
      'en': 'Home',
      'af': 'Tuis',
      'zu': 'Ikhaya',
    },
  },
  // Furniture
  {
    'zsoxcckp': {
      'en': 'Furniture',
      'af': 'Meubels',
      'zu': 'Ifenisha',
    },
    'rjplwfib': {
      'en': 'Name',
      'af': 'Naam',
      'zu': 'Igama',
    },
    'ev3xlq8h': {
      'en': ' ',
      'af': '',
      'zu': '',
    },
    'ri3brf64': {
      'en': 'Issue',
      'af': 'Uitgawe',
      'zu': 'Inkinga',
    },
    '8qnmznb2': {
      'en': 'Damaged bed base',
      'af': 'Beskadigde bedbasis',
      'zu': 'Isisekelo sombhede sonakele',
    },
    'dcliexha': {
      'en': 'Damaged mattress',
      'af': 'Beskadigde matras',
      'zu': 'Umatilasi owonakele',
    },
    'ctzwfb5g': {
      'en': 'Curtain rail needs to be replaced',
      'af': 'Gordynreling moet vervang word',
      'zu': 'I-Curtain rail idinga ukushintshwa',
    },
    'eftivozm': {
      'en': 'Damaged study table',
      'af': 'Beskadigde studietafel',
      'zu': 'Ithebula lokufunda elilimele',
    },
    '6xd65swp': {
      'en': 'Damaged chair',
      'af': 'Beskadigde stoel',
      'zu': 'Isitulo esilimele',
    },
    'fie5oy0p': {
      'en': 'Window cannot open',
      'af': 'Venster kan nie oopmaak nie',
      'zu': 'Iwindi alikwazi ukuvuleka',
    },
    'nzm86etj': {
      'en': 'Window cannot close',
      'af': 'Venster kan nie toemaak nie',
      'zu': 'Iwindi alikwazi ukuvala',
    },
    'enx6owqa': {
      'en': 'Please select...',
      'af': 'Kies asseblief...',
      'zu': 'Sicela ukhethe...',
    },
    'y0ee0fcm': {
      'en': 'Description',
      'af': 'Beskrywing',
      'zu': 'Incazelo',
    },
    'hqui642d': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'smqtfo79': {
      'en': 'Describe your Issue',
      'af': 'Beskryf jou probleem',
      'zu': 'Chaza udaba lwakho',
    },
    'ezxqytym': {
      'en': 'Submit',
      'af': 'Indien',
      'zu': 'Thumela',
    },
    'j5cpjyau': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'zu': 'Inkambu iyadingeka',
    },
    'fut8j40g': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'zu': 'Inkambu iyadingeka',
    },
    'txkmcvkb': {
      'en': 'Home',
      'af': 'Tuis',
      'zu': 'Ikhaya',
    },
  },
  // Electrical
  {
    '5h10vla4': {
      'en': 'Electrical',
      'af': 'Elektries',
      'zu': 'Ezogesi',
    },
    'pptn41hq': {
      'en': 'Name',
      'af': 'Naam',
      'zu': 'Igama',
    },
    'snmjv58b': {
      'en': ' ',
      'af': '',
      'zu': '',
    },
    'o96uncwm': {
      'en': 'Issue',
      'af': 'Uitgawe',
      'zu': 'Inkinga',
    },
    'ynegaw02': {
      'en': 'Emergency lights not working',
      'af': 'Noodligte werk nie',
      'zu': 'Izibani eziphuthumayo azisebenzi',
    },
    'nlauvg3m': {
      'en': 'Loose cables',
      'af': 'Los kabels',
      'zu': 'Izintambo ezixegayo',
    },
    'exk8o1zs': {
      'en': 'No power/electricity',
      'af': 'Geen krag/elektrisiteit',
      'zu': 'Awekho amandla/ugesi',
    },
    '3ellrjbp': {
      'en': 'Faulty prepaid meter',
      'af': 'Foutiewe voorafbetaalde meter',
      'zu': 'Imitha ekhokhelwa ngaphambili enephutha',
    },
    '8u8v7nrs': {
      'en': 'Lights in my room are not working',
      'af': 'Ligte in my kamer werk nie',
      'zu': 'Izibani ekamelweni lami azisebenzi',
    },
    'u216hxi3': {
      'en': 'Lights in my unit are not working',
      'af': 'Ligte in my eenheid werk nie',
      'zu': 'Izibani kuyunithi yami azisebenzi',
    },
    'ewgrtjnb': {
      'en': 'Please select...',
      'af': 'Kies asseblief...',
      'zu': 'Sicela ukhethe...',
    },
    'lvbcdupg': {
      'en': 'Description',
      'af': 'Beskrywing',
      'zu': 'Incazelo',
    },
    '41omkw7r': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'oqw7x9ak': {
      'en': 'Describe your Issue',
      'af': 'Beskryf jou probleem',
      'zu': 'Chaza udaba lwakho',
    },
    'cb9hr1xq': {
      'en': 'Submit',
      'af': 'Indien',
      'zu': 'Thumela',
    },
    'u3d47e3d': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'zu': 'Inkambu iyadingeka',
    },
    'o3r0rwcy': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'zu': 'Inkambu iyadingeka',
    },
    'm8no2npe': {
      'en': 'Home',
      'af': 'Tuis',
      'zu': 'Ikhaya',
    },
  },
  // Locksmith
  {
    'zkpr0gnw': {
      'en': 'Locksmith',
      'af': 'Slotmaker',
      'zu': 'Umkhandi wezikhiye',
    },
    's3eqlhy0': {
      'en': 'Name',
      'af': 'Naam',
      'zu': 'Igama',
    },
    'poroii6k': {
      'en': ' ',
      'af': '',
      'zu': '',
    },
    '5mh6yhav': {
      'en': 'Issue',
      'af': 'Uitgawe',
      'zu': 'Inkinga',
    },
    '2ovvpyjh': {
      'en': 'Broken door handle (unit)',
      'af': 'Gebreekte deurhandvatsel (eenheid)',
      'zu': 'Isibambo somnyango esiphukile (iyunithi)',
    },
    'aiwyw4j6': {
      'en': 'Broken door handle (Room)',
      'af': 'Gebreekte deurhandvatsel (kamer)',
      'zu': 'Isibambo somnyango esiphukile (Igumbi)',
    },
    'lz8ylm9y': {
      'en': 'Room key not opening',
      'af': 'Kamersleutel maak nie oop nie',
      'zu': 'Ukhiye wegumbi awuvuli',
    },
    '4k1n19qm': {
      'en': 'Unit key not opening',
      'af': 'Eenheidsleutel maak nie oop nie',
      'zu': 'Ukhiye weyunithi awuvuli',
    },
    'oqlc0lzx': {
      'en': 'Lost key',
      'af': 'Sleutel verloor',
      'zu': 'Ukhiye olahlekile',
    },
    'mw548crh': {
      'en': 'Lost access card',
      'af': 'Toegangskaart verloor',
      'zu': 'Ikhadi lokufinyelela elilahlekile',
    },
    'rdiv127k': {
      'en': 'access card not working',
      'af': 'toegangskaart werk nie',
      'zu': 'ikhadi lokufinyelela alisebenzi',
    },
    'a0pmib1g': {
      'en': 'Please select...',
      'af': 'Kies asseblief...',
      'zu': 'Sicela ukhethe...',
    },
    'pkd6jbzq': {
      'en': 'Description',
      'af': 'Beskrywing',
      'zu': 'Incazelo',
    },
    '90cp2ji5': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'olb70f7m': {
      'en': 'Describe your Issue',
      'af': 'Beskryf jou probleem',
      'zu': 'Chaza udaba lwakho',
    },
    'ekzi7ay8': {
      'en': 'Submit',
      'af': 'Indien',
      'zu': 'Thumela',
    },
    '02ud1qup': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'zu': 'Inkambu iyadingeka',
    },
    '01ba5isz': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'zu': 'Inkambu iyadingeka',
    },
    '8ufczwdz': {
      'en': 'Home',
      'af': 'Tuis',
      'zu': 'Ikhaya',
    },
  },
  // Pestcontrol
  {
    'b74aucol': {
      'en': 'Pest control',
      'af': 'Plaagbeheer',
      'zu': 'Ukulawula izinambuzane',
    },
    'fbciwrr6': {
      'en': 'Name',
      'af': 'Naam',
      'zu': 'Igama',
    },
    '0bgptks9': {
      'en': ' ',
      'af': '',
      'zu': '',
    },
    '0jz4q5zl': {
      'en': 'Issue',
      'af': 'Uitgawe',
      'zu': 'Inkinga',
    },
    'f6kpyccf': {
      'en': 'Bed bugs',
      'af': 'Bed goggas',
      'zu': 'Izimbungulu zombhede',
    },
    'dzczcupp': {
      'en': 'Cockroaches in my room/unit',
      'af': 'Kakkerlakke in my kamer/eenheid',
      'zu': 'Amaphela egumbini/eyunithi yami',
    },
    '1kiwva5p': {
      'en': 'Fumigation required',
      'af': 'Beroking vereis',
      'zu': 'Ukufuthwa kuyadingeka',
    },
    'k0qus04q': {
      'en': 'Please select...',
      'af': 'Kies asseblief...',
      'zu': 'Sicela ukhethe...',
    },
    '3spt7ujg': {
      'en': 'Description',
      'af': 'Beskrywing',
      'zu': 'Incazelo',
    },
    'men9xdlg': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'khtkq8d8': {
      'en': 'Describe your Issue',
      'af': 'Beskryf jou probleem',
      'zu': 'Chaza udaba lwakho',
    },
    'rb1krgbn': {
      'en': 'Submit',
      'af': 'Indien',
      'zu': 'Thumela',
    },
    'oq45egd2': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'zu': 'Inkambu iyadingeka',
    },
    '1rvpi8sr': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'zu': 'Inkambu iyadingeka',
    },
    'xr7g3ufx': {
      'en': 'Home',
      'af': 'Tuis',
      'zu': 'Ikhaya',
    },
  },
  // painting
  {
    'fpnywby9': {
      'en': 'Painting',
      'af': 'Skildery',
      'zu': 'Ukudweba',
    },
    'y45hko9v': {
      'en': 'Name',
      'af': 'Naam',
      'zu': 'Igama',
    },
    'a4x8dzml': {
      'en': ' ',
      'af': '',
      'zu': '',
    },
    'sxw0xvkr': {
      'en': 'Issue',
      'af': 'Uitgawe',
      'zu': 'Inkinga',
    },
    'b49kwxxn': {
      'en': 'Ceiling needs to be painted',
      'af': 'Die plafon moet geverf word',
      'zu': 'Uphahla ludinga ukupendwa',
    },
    'xcjd2ohv': {
      'en': 'Door frame needs to be painted',
      'af': 'Deurkosyn moet geverf word',
      'zu': 'Uhlaka lomnyango ludinga ukupendwa',
    },
    'hn0l9gtd': {
      'en': 'Skirting needs to be painted',
      'af': 'Plint moet geverf word',
      'zu': 'I-Skirting idinga ukupendwa',
    },
    '73kygpgt': {
      'en': 'Walls needs to be painted',
      'af': 'Mure moet geverf word',
      'zu': 'Izindonga zidinga ukupendwa',
    },
    '99fpkv1q': {
      'en': 'Window frames needs to be painted',
      'af': 'Vensterrame moet geverf word',
      'zu': 'Amawindi ozimele adinga ukupendwa',
    },
    'r8v9zom9': {
      'en': 'Please select...',
      'af': 'Kies asseblief...',
      'zu': 'Sicela ukhethe...',
    },
    '9yycc0gq': {
      'en': 'Description',
      'af': 'Beskrywing',
      'zu': 'Incazelo',
    },
    'al4s42e8': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'i0vecmyv': {
      'en': 'Describe your Issue',
      'af': 'Beskryf jou probleem',
      'zu': 'Chaza udaba lwakho',
    },
    'c9brkjw1': {
      'en': 'Submit',
      'af': 'Indien',
      'zu': 'Thumela',
    },
    '6w71dv82': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'zu': 'Inkambu iyadingeka',
    },
    'qow9mldr': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'zu': 'Inkambu iyadingeka',
    },
    '20b96ira': {
      'en': 'Home',
      'af': 'Tuis',
      'zu': 'Ikhaya',
    },
  },
  // Others
  {
    '2ytiwh02': {
      'en': 'Other',
      'af': 'Ander',
      'zu': 'Okunye',
    },
    'crrao6ih': {
      'en': 'Name',
      'af': 'Naam',
      'zu': 'Igama',
    },
    'xi810ac6': {
      'en': ' ',
      'af': '',
      'zu': '',
    },
    '8jet81fh': {
      'en': 'Issue',
      'af': 'Uitgawe',
      'zu': 'Inkinga',
    },
    '6hpt9krn': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'gn9nsu4y': {
      'en': 'Describe your Issue',
      'af': 'Beskryf jou probleem',
      'zu': 'Chaza udaba lwakho',
    },
    'joeg6jq5': {
      'en': 'Submit',
      'af': 'Indien',
      'zu': 'Thumela',
    },
    'ehaqct9t': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'zu': 'Inkambu iyadingeka',
    },
    '6wg4lijw': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'zu': 'Inkambu iyadingeka',
    },
    'ocnpeou8': {
      'en': 'Home',
      'af': 'Tuis',
      'zu': 'Ikhaya',
    },
  },
  // Communal
  {
    '98jt63cp': {
      'en': 'Communal',
      'af': 'Gemeenskaplik',
      'zu': 'Umphakathi',
    },
    '7nmev92l': {
      'en': 'Name',
      'af': 'Naam',
      'zu': 'Igama',
    },
    'yiv2vl4e': {
      'en': ' ',
      'af': '',
      'zu': '',
    },
    'ugqlruzv': {
      'en': 'Issue',
      'af': 'Uitgawe',
      'zu': 'Inkinga',
    },
    'cc9f1k6t': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'z5y4ns8r': {
      'en': 'Describe your Issue',
      'af': 'Beskryf jou probleem',
      'zu': 'Chaza udaba lwakho',
    },
    'lcbjrhc4': {
      'en': 'Place',
      'af': 'Plek',
      'zu': 'Indawo',
    },
    'j24y4cmn': {
      'en': 'Place',
      'af': 'Plek',
      'zu': 'Indawo',
    },
    'i8tc74up': {
      'en': '',
      'af': '',
      'zu': '',
    },
    '9ve9st0h': {
      'en': 'Submit',
      'af': 'Indien',
      'zu': 'Thumela',
    },
    'u74d156v': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'zu': 'Inkambu iyadingeka',
    },
    'yet5n963': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'zu': 'Inkambu iyadingeka',
    },
    'xzvk0uft': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'zu': 'Inkambu iyadingeka',
    },
    '7pzgv1i8': {
      'en': 'Home',
      'af': 'Tuis',
      'zu': 'Ikhaya',
    },
  },
  // reviews
  {
    'o4ma2plr': {
      'en': 'Review',
      'af': 'Resensie',
      'zu': 'Buyekeza',
    },
    'odl0y290': {
      'en': 'Private Feedback',
      'af': 'Privaat terugvoer',
      'zu': 'Impendulo Eyimfihlo',
    },
    'h6wfwt01': {
      'en': 'What was your most important concern with this  ticket?',
      'af': 'Wat was jou belangrikste bekommernis met hierdie kaartjie?',
      'zu': 'Yini ebikukhathaza kakhulu ngaleli thikithi?',
    },
    'rwc60qez': {
      'en': '    Time     ',
      'af': 'Tyd',
      'zu': 'Isikhathi',
    },
    'm5pnsb3h': {
      'en': 'Convinience',
      'af': 'Gerieflikheid',
      'zu': 'Convinience',
    },
    '0ggkswrv': {
      'en': 'Cleanliness',
      'af': 'Netheid',
      'zu': 'Inhlanzeko',
    },
    'su9q3z9r': {
      'en': 'Communication',
      'af': 'Kommunikasie',
      'zu': 'Ukuxhumana',
    },
    'tqdmj591': {
      'en': 'Quality',
      'af': 'Kwaliteit',
      'zu': 'Ikhwalithi',
    },
    'gmravdzl': {
      'en': 'Option ',
      'af': 'Opsie',
      'zu': 'Inketho',
    },
    'sl49hlqg': {
      'en':
          'Your rating is really important for us as it helps us to improve our services for the future.',
      'af': 'Wat was jou belangrikste bekommernis met hierdie kaartjie?',
      'zu': 'Yini ebikukhathaza kakhulu ngaleli thikithi?',
    },
    '82iy1uqp': {
      'en':
          'Your rating is really important for us as it helps us to improve our services for the future.',
      'af':
          'Jou gradering is baie belangrik vir ons aangesien dit ons help om ons dienste vir die toekoms te verbeter.',
      'zu':
          'Isilinganiso sakho sibaluleke ngempela kithi njengoba sisisiza ukuthuthukisa amasevisi ethu esikhathini esizayo.',
    },
    'm1rx4wqf': {
      'en': 'Confirm',
      'af': 'Bevestig',
      'zu': 'Qinisekisa',
    },
    'v4ofqfkx': {
      'en': 'Home',
      'af': 'Tuis',
      'zu': 'Ikhaya',
    },
  },
  // profile
  {
    'jjbdok4w': {
      'en': 'Edit Profile',
      'af': 'Wysig profiel',
      'zu': 'Hlela iphrofayela',
    },
    '72fpsq8l': {
      'en': 'Save',
      'af': 'Stoor',
      'zu': 'Londoloza',
    },
    'pv1prhyw': {
      'en': 'Full names',
      'af': 'Volle name',
      'zu': 'Amagama aphelele',
    },
    'krf5zipu': {
      'en': 'Email Address',
      'af': 'E-pos adres',
      'zu': 'Ikheli le-imeyili',
    },
    'ljtqvfca': {
      'en': 'Password',
      'af': 'Wagwoord',
      'zu': 'Iphasiwedi',
    },
    'elhlkvnh': {
      'en': 'Password',
      'af': 'Wagwoord',
      'zu': 'Iphasiwedi',
    },
    '5rcl1vbh': {
      'en': 'Bio',
      'af': 'Bio',
      'zu': 'I-Bio',
    },
    '2o453oug': {
      'en': 'Write about yourself...',
      'af': 'Skryf oor jouself...',
      'zu': 'Bhala ngawe...',
    },
    'rwaeignd': {
      'en': 'Home',
      'af': 'Tuis',
      'zu': 'Ikhaya',
    },
  },
  // settings
  {
    'n9zmnk1o': {
      'en': 'Settings',
      'af': '',
      'zu': '',
    },
    'l75068ci': {
      'en': 'Account',
      'af': 'Rekening',
      'zu': 'I-akhawunti',
    },
    'nj9u6e42': {
      'en': 'Messages',
      'af': 'Boodskappe',
      'zu': 'Imilayezo',
    },
    't9754pmw': {
      'en': 'Appearance',
      'af': 'Voorkoms',
      'zu': 'Ukubukeka',
    },
    'mv65usit': {
      'en': 'Student handbook',
      'af': 'Studentehandboek',
      'zu': 'Incwadi yomfundi',
    },
    'w3kgqtsc': {
      'en': 'Notifications',
      'af': 'Kennisgewings',
      'zu': 'Izaziso',
    },
    'lfkifcv6': {
      'en': 'Language',
      'af': 'Taal',
      'zu': 'Ulimi',
    },
    '2u2thzj6': {
      'en': 'About us',
      'af': 'Oor ons',
      'zu': 'Mayelana NATHI',
    },
    'ak9vojgx': {
      'en': 'Logout',
      'af': 'Teken uit',
      'zu': 'Phuma',
    },
    'ugb9k6b5': {
      'en': '',
      'af': '',
      'zu': '',
    },
  },
  // home
  {
    '2koevdog': {
      'en': 'Hello World',
      'af': 'Hello Wêreld',
      'zu': 'Sawubona Mhlaba',
    },
    '0vs51h5t': {
      'en': '1',
      'af': '1',
      'zu': '1',
    },
    'pmvue1v1': {
      'en': 'Hi,',
      'af': 'Hi,',
      'zu': 'Sawubona,',
    },
    '8ih9im8a': {
      'en': ' ',
      'af': '1',
      'zu': '1',
    },
    'kio6wtr0': {
      'en': 'Appliances',
      'af': 'Toestelle',
      'zu': 'Izinto zikagesi',
    },
    '1rfe0xpc': {
      'en': 'Plumbing',
      'af': 'Loodgieterswerk',
      'zu': 'Amapayipi amanzi',
    },
    'wq0kyint': {
      'en': 'Electrical',
      'af': 'Elektries',
      'zu': 'Ezogesi',
    },
    '4oirn1hi': {
      'en': 'Painting',
      'af': 'Skildery',
      'zu': 'Ukudweba',
    },
    'gb7cjba5': {
      'en': 'Locksmith',
      'af': 'Slotmaker',
      'zu': 'Umkhandi wezikhiye',
    },
    '5apgpz66': {
      'en': 'Furniture',
      'af': 'Meubels',
      'zu': 'Ifenisha',
    },
    '88a17nqi': {
      'en': 'Communal',
      'af': 'Gemeenskaplik',
      'zu': 'Umphakathi',
    },
    'lnhucv5s': {
      'en': 'Others',
      'af': 'Ander',
      'zu': 'Abanye',
    },
  },
  // messages
  {
    'g2apk9v9': {
      'en': 'Inbox',
      'af': '',
      'zu': '',
    },
  },
  // sendNotifications
  {
    'fc8z4311': {
      'en': 'Subject',
      'af': '',
      'zu': '',
    },
    'ucbou6nm': {
      'en': 'Body',
      'af': '',
      'zu': '',
    },
    'bsc4cpul': {
      'en': 'General',
      'af': '',
      'zu': '',
    },
    'ouzqm2gc': {
      'en': 'Bookings',
      'af': '',
      'zu': '',
    },
    'lde99z2p': {
      'en': 'Announcement',
      'af': '',
      'zu': '',
    },
    'y4dnvzss': {
      'en': 'Events',
      'af': '',
      'zu': '',
    },
    'maaax0p4': {
      'en': 'Select Topic',
      'af': '',
      'zu': '',
    },
    '1orthxv6': {
      'en': 'Send to everyone',
      'af': '',
      'zu': '',
    },
    '4kbcixms': {
      'en': 'Field is required',
      'af': '',
      'zu': '',
    },
    'ygjxkyww': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'zu': '',
    },
    '9nl0yfpd': {
      'en': 'Field is required',
      'af': '',
      'zu': '',
    },
    'lrktkns3': {
      'en': 'Please choose an option from the dropdown',
      'af': '',
      'zu': '',
    },
    'hzafsymq': {
      'en': 'Home',
      'af': '',
      'zu': '',
    },
  },
  // information
  {
    'ouy56u3e': {
      'en': '1',
      'af': '1',
      'zu': '1',
    },
    '0t9srtqf': {
      'en': 'Details',
      'af': 'Besonderhede',
      'zu': 'Imininingwane',
    },
    '311u38tb': {
      'en': 'Category',
      'af': 'Kategorie',
      'zu': 'Isigaba',
    },
    'nq1dzwbf': {
      'en': 'Status',
      'af': 'Status',
      'zu': 'Isimo',
    },
    '91tagy0g': {
      'en': 'Assigned',
      'af': 'Toegewys',
      'zu': 'Kwabelwe',
    },
    'a2kbfvsf': {
      'en': 'View Ratings',
      'af': 'Bekyk graderings',
      'zu': 'Buka Izilinganiso',
    },
    'tnem7t9x': {
      'en': 'Private Feedback',
      'af': 'Privaat terugvoer',
      'zu': 'Impendulo Eyimfihlo',
    },
    'syeofsym': {
      'en': 'What was your most important concern with this  ticket?',
      'af': 'Wat was jou belangrikste bekommernis met hierdie kaartjie?',
      'zu': 'Yini ebikukhathaza kakhulu ngaleli thikithi?',
    },
    '8oumguvt': {
      'en': 'Time',
      'af': 'Tyd',
      'zu': 'Isikhathi',
    },
    'tv6lydnw': {
      'en': 'Convinience',
      'af': 'Gerieflikheid',
      'zu': 'Convinience',
    },
    'ocqgtcv5': {
      'en': 'Cleanliness',
      'af': 'Netheid',
      'zu': 'Inhlanzeko',
    },
    'yhga0jiz': {
      'en': 'Communication',
      'af': 'Kommunikasie',
      'zu': 'Ukuxhumana',
    },
    '6gje4u7i': {
      'en': 'Quality',
      'af': 'Kwaliteit',
      'zu': 'Ikhwalithi',
    },
    'w7u0acsg': {
      'en': 'Option ',
      'af': 'Opsie',
      'zu': 'Inketho',
    },
    'pzbwczjq': {
      'en':
          'Your rating is really important for us as it helps us to improve our services for the future.',
      'af':
          'Jou gradering is baie belangrik vir ons aangesien dit ons help om ons dienste vir die toekoms te verbeter.',
      'zu':
          'Isilinganiso sakho sibaluleke ngempela kithi njengoba sisisiza ukuthuthukisa amasevisi ethu esikhathini esizayo.',
    },
    'epp10j9k': {
      'en': 'Comments',
      'af': 'Kommentaar',
      'zu': 'Amazwana',
    },
    '8z1kpy7m': {
      'en': 'Home',
      'af': 'Tuis',
      'zu': 'Ikhaya',
    },
  },
  // notifications
  {
    '45q9r5x8': {
      'en': 'Notifications',
      'af': 'Kennisgewings',
      'zu': 'Izaziso',
    },
    '21r1cns5': {
      'en': '1',
      'af': '1',
      'zu': '1',
    },
    '7xadpfse': {
      'en': 'Latest',
      'af': 'Nuutste',
      'zu': 'Okwakamuva',
    },
    't43thx66': {
      'en': 'Following',
      'af': 'Volgende',
      'zu': 'Ukulandela',
    },
  },
  // search
  {
    '1ehqp1x6': {
      'en': 'Contacts',
      'af': 'Soek vriende om te gesels',
      'zu': 'Sesha Abangane ukuze uxoxe',
    },
    'r4fzyodn': {
      'en': 'Search Contacts',
      'af': 'Soek kontakte',
      'zu': 'Sesha Oxhumana Nabo',
    },
    'n8jk3buj': {
      'en': 'Search',
      'af': 'Soek',
      'zu': 'Sesha',
    },
    'qd4t4laz': {
      'en': 'Search Contacts',
      'af': 'Soek kontakte',
      'zu': 'Sesha Oxhumana Nabo',
    },
  },
  // submittedIcon
  {
    'ua7ubrzs': {
      'en': 'Success!',
      'af': 'Sukses!',
      'zu': 'Impumelelo!',
    },
    'eelep3l0': {
      'en':
          'Your request has been received\nby the Campus Africa maintenance\nteam.',
      'af': 'Jou versoek is deur die Campus Africa-instandhoudingspan ontvang.',
      'zu': 'Isicelo sakho sitholwe yithimba elinakekela i-Campus Africa.',
    },
    '6vhy0doc': {
      'en': 'Continue',
      'af': 'Aanhou',
      'zu': 'Qhubeka',
    },
  },
  // emptyList
  {
    'cf85lsih': {
      'en': 'No results were found from your search.\nPlease try again.',
      'af':
          'Geen resultate is van jou soektog gevind nie. Probeer asseblief weer.',
      'zu':
          'Ayikho imiphumela etholakele oseshweni lwakho. Ngicela uzame futhi.',
    },
  },
  // darkMode
  {
    '1ni48z6d': {
      'en': 'Light theme',
      'af': 'Ligte tema',
      'zu': 'Itimu ekhanyayo',
    },
    'lhga9n6k': {
      'en': 'Dark theme',
      'af': 'Donker tema',
      'zu': 'Itimu emnyama',
    },
    'cgkby2zl': {
      'en': 'From device settings',
      'af': 'Van toestelinstellings',
      'zu': 'Kusuka kuzilungiselelo zedivayisi',
    },
  },
  // language
  {
    'oyqbh7ii': {
      'en': 'Afrikaans',
      'af': 'Afrikaans',
      'zu': 'IsiBhunu',
    },
    'i29v1v2d': {
      'en': 'English',
      'af': 'Engels',
      'zu': 'IsiNgisi',
    },
    'anp7mqim': {
      'en': 'Zulu',
      'af': 'Zoeloe',
      'zu': 'Zulu',
    },
  },
  // btmNv
  {
    '5ic4299a': {
      'en': 'Inbox',
      'af': 'Inkassie',
      'zu': 'Ibhokisi lokungenayo',
    },
    'yxwgnmwc': {
      'en': 'Report',
      'af': 'Rapporteer',
      'zu': 'Bika',
    },
    'r0blr3r7': {
      'en': 'Settings',
      'af': 'Instellings',
      'zu': 'Izilungiselelo',
    },
  },
  // sideNav
  {
    'x0l4kq51': {
      'en': 'Campus Africa',
      'af': 'Kampus Afrika',
      'zu': 'Ikhampasi Afrika',
    },
    'mdh6tpe4': {
      'en': 'MENU',
      'af': 'SPYSKAART',
      'zu': 'IMENU',
    },
    'kw4npc6y': {
      'en': 'Home',
      'af': 'Tuis',
      'zu': 'Ikhaya',
    },
    'qa3se4pd': {
      'en': 'View Requests',
      'af': 'Bekyk versoeke',
      'zu': 'Buka Izicelo',
    },
    'j8681eie': {
      'en': 'Messages',
      'af': 'Boodskappe',
      'zu': 'Imilayezo',
    },
    '1ifk0xp2': {
      'en': 'Users',
      'af': 'Gebruikers',
      'zu': 'Abasebenzisi',
    },
    'ep2r2in9': {
      'en': 'ADVANCED SETTINGS',
      'af': 'GEVORDERDE INSTELLINGS',
      'zu': 'IZILUNGISELELO EZITHUTHUKILE',
    },
    'vblitw5u': {
      'en': 'Notifications',
      'af': 'Kennisgewings',
      'zu': 'Izaziso',
    },
    'f638xly7': {
      'en': 'Settings',
      'af': 'Instellings',
      'zu': 'Izilungiselelo',
    },
    'hpde03g2': {
      'en': 'Logout',
      'af': 'Teken uit',
      'zu': 'Phuma',
    },
  },
  // bottomNavBar
  {
    'sol4e3xb': {
      'en': 'Inbox',
      'af': 'Inkassie',
      'zu': 'Ibhokisi lokungenayo',
    },
    '1vi6g268': {
      'en': 'Report',
      'af': 'Rapporteer',
      'zu': 'Bika',
    },
    'y8l90vi9': {
      'en': 'Settings',
      'af': 'Instellings',
      'zu': 'Izilungiselelo',
    },
    'dyx56i25': {
      'en': '',
      'af': '',
      'zu': '',
    },
  },
  // ticket
  {
    '36k5t7bv': {
      'en': 'Dischem \nVoucher',
      'af': '',
      'zu': '',
    },
    'jpd5zrn3': {
      'en': 'Get 20 % off on all purchases',
      'af': '',
      'zu': '',
    },
    'jg01c455': {
      'en': '2X7HV4',
      'af': '',
      'zu': '',
    },
    'hdynqqno': {
      'en': 'Valid until 03/09/2022',
      'af': '',
      'zu': '',
    },
  },
  // skeleton_Home
  {
    '5r7i7loi': {
      'en': 'Hello World',
      'af': 'Hello Wêreld',
      'zu': 'Sawubona Mhlaba',
    },
    '636ymdl3': {
      'en': '1',
      'af': '1',
      'zu': '1',
    },
  },
  // skeletonInfo
  {
    'h7mk5f53': {
      'en': 'Time',
      'af': 'Tyd',
      'zu': 'Isikhathi',
    },
    'myqkd4g0': {
      'en': 'Convinience',
      'af': 'Gerieflikheid',
      'zu': 'Convinience',
    },
    'ccr0js2s': {
      'en': 'Cleanliness',
      'af': 'Netheid',
      'zu': 'Inhlanzeko',
    },
    'zgil29a2': {
      'en': 'Communication',
      'af': 'Kommunikasie',
      'zu': 'Ukuxhumana',
    },
    '91adx62k': {
      'en': 'Quality',
      'af': 'Kwaliteit',
      'zu': 'Ikhwalithi',
    },
    'odeegdal': {
      'en': 'Option ',
      'af': 'Opsie',
      'zu': 'Inketho',
    },
    'oge88a04': {
      'en':
          'Your rating is really important for us as it helps us to improve our services for the future.',
      'af':
          'Jou gradering is baie belangrik vir ons aangesien dit ons help om ons dienste vir die toekoms te verbeter.',
      'zu':
          'Isilinganiso sakho sibaluleke ngempela kithi njengoba sisisiza ukuthuthukisa amasevisi ethu esikhathini esizayo.',
    },
  },
  // resetPassword
  {
    'fpmtun0a': {
      'en': 'Password Reset',
      'af': 'Sukses!',
      'zu': 'Impumelelo!',
    },
    '5xnejcaa': {
      'en':
          'If successful, a link to create a new password has been sent to your email. Please check your spam/junk folder if you can not find the email',
      'af': 'Jou versoek is deur die Campus Africa-instandhoudingspan ontvang.',
      'zu': 'Isicelo sakho sitholwe yithimba elinakekela i-Campus Africa.',
    },
    '7qg09j8y': {
      'en': 'Continue',
      'af': 'Aanhou',
      'zu': 'Qhubeka',
    },
  },
  // notificationsComponent
  {
    '5s8l0mfa': {
      'en': 'Notifications',
      'af': 'Kennisgewings',
      'zu': 'Izaziso',
    },
    '4mc3crbq': {
      'en': '1',
      'af': '1',
      'zu': '1',
    },
    'cx4ukq4k': {
      'en': 'Latest',
      'af': 'Nuutste',
      'zu': 'Okwakamuva',
    },
    'w3bonag1': {
      'en': 'Following',
      'af': 'Volgende',
      'zu': 'Ukulandela',
    },
    'h935li2l': {
      'en': 'All',
      'af': 'Almal',
      'zu': 'Konke',
    },
  },
  // notifBottomSheet
  {
    'dz1ghic9': {
      'en': 'Schedule send',
      'af': '',
      'zu': '',
    },
    'uioanb3n': {
      'en': 'Discard',
      'af': '',
      'zu': '',
    },
    '02x8d75o': {
      'en': 'Cancel',
      'af': '',
      'zu': '',
    },
  },
  // addLink
  {
    'k2ycu2a4': {
      'en': 'Add link for additional information',
      'af': '',
      'zu': '',
    },
    'ceg3wrbq': {
      'en':
          'This could include the link to the social networks containing more information about the relevant post.',
      'af': '',
      'zu': '',
    },
    'igppq1yv': {
      'en': 'Paste link here',
      'af': '',
      'zu': '',
    },
    'ian8r4nd': {
      'en': 'https://campusafrica.co.za/',
      'af': '',
      'zu': '',
    },
    'zpjjymsh': {
      'en': 'https://apply.campusafrica.co.za/login',
      'af': '',
      'zu': '',
    },
    '3p6ry6ef': {
      'en': 'https://www.instagram.com/campus.africa/?hl=en',
      'af': '',
      'zu': '',
    },
    '7o8joatx': {
      'en': 'Done',
      'af': '',
      'zu': '',
    },
  },
  // Miscellaneous
  {
    'lvpj234m': {
      'en':
          'Enable access so you can take photos of your maintenance reports and update your profile picture.',
      'af':
          'Aktiveer toegang sodat jy foto&#39;s van jou instandhoudingsverslae kan neem en jou profielfoto kan opdateer.',
      'zu':
          'Nika amandla ukufinyelela ukuze ukwazi ukuthatha izithombe zemibiko yakho yokulungisa futhi ubuyekeze isithombe sakho sephrofayela.',
    },
    'tpjlcilr': {
      'en':
          'Let Campus Africa access your library so you can upload photos to your maintenance reports and update your profile picture',
      'af':
          'Laat Campus Africa toegang tot jou biblioteek sodat jy foto&#39;s na jou instandhoudingsverslae kan oplaai en jou profielfoto kan opdateer',
      'zu':
          'Vumela i-Campus Africa ifinyelele umtapo wakho wolwazi ukuze ukwazi ukulayisha izithombe emibikweni yakho yokulungisa futhi ubuyekeze isithombe sakho sephrofayela',
    },
    'uo3dfuv5': {
      'en': '',
      'af': '',
      'zu': '',
    },
    '0oulxlkm': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'xjjji9rx': {
      'en': '',
      'af': '',
      'zu': '',
    },
    '961yscwv': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'agtamtgc': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'nkzdpl8c': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'r9k8vtxj': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'zd5kzz0m': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'tt9qlhvb': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'zd4vyvrw': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'z40c2u6r': {
      'en': 'File Uploaded!',
      'af': 'Lêer opgelaai!',
      'zu': 'Ifayela Lilayishiwe!',
    },
    'gpuitegy': {
      'en': '',
      'af': '',
      'zu': '',
    },
    '7rz9brmh': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'op5eft6x': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'pkybakmu': {
      'en': '',
      'af': '',
      'zu': '',
    },
    '4bfkhv86': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'zxholu79': {
      'en': '',
      'af': '',
      'zu': '',
    },
    '82ragmeh': {
      'en': '',
      'af': '',
      'zu': '',
    },
    '6z8c56bm': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'pjyanqy2': {
      'en': '',
      'af': '',
      'zu': '',
    },
    'h2dm6i3z': {
      'en': '',
      'af': '',
      'zu': '',
    },
  },
].reduce((a, b) => a..addAll(b));
