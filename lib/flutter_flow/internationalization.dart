import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'af', 'zu', 'st'];

  String get languageCode => locale.languageCode;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.languageCode] ?? '';

  String getVariableText({
    String? enText = '',
    String? afText = '',
    String? zuText = '',
    String? stText = '',
  }) =>
      [enText, afText, zuText, stText][languageIndex] ?? '';
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      FFLocalizations.languages().contains(locale.languageCode);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // testOnboarding
  {
    '7rm5hpzh': {
      'en': 'Campus Africa',
      'af': 'Kampus Afrika',
      'st': 'Khampase ea Afrika',
      'zu': 'Ikhampasi Afrika',
    },
    'til09yqe': {
      'en': 'Rennie House',
      'af': 'Kampus Afrika',
      'st': 'Khampase ea Afrika',
      'zu': 'Ikhampasi Afrika',
    },
    '5fjqqbhk': {
      'en': 'Login',
      'af': 'Teken aan',
      'st': 'Kena',
      'zu': 'Ngena ngemvume',
    },
    'toce9ejh': {
      'en': 'Register',
      'af': 'Registreer',
      'st': 'Ngodisa',
      'zu': 'Bhalisa',
    },
    '274gqvvp': {
      'en': 'Home',
      'af': 'Tuis',
      'st': 'Lehae',
      'zu': 'Ikhaya',
    },
  },
  // loginPage
  {
    '41bxdiwe': {
      'en': 'Sign In',
      'af': 'Meld aan',
      'st': 'Kena',
      'zu': 'Ngena ngemvume',
    },
    'ed82ihgs': {
      'en': 'Enter Student Your Email',
      'af': 'Voer Student Jou E-pos in',
      'st': 'Kenya Seithuti Email ea Hau',
      'zu': 'Faka I-imeyili Yakho Yomfundi',
    },
    'r0zrl5vr': {
      'en': 'Enter Student Your Email',
      'af': 'Voer Student Jou E-pos in',
      'st': 'Kenya Seithuti Email ea Hau',
      'zu': 'Faka I-imeyili Yakho Yomfundi',
    },
    '8jzdsi0i': {
      'en': 'Enter Your Password',
      'af': 'Sleutel jou wagwoord in',
      'st': 'Kenya Password ea hau',
      'zu': 'Faka Iphasiwedi Yakho',
    },
    '4cv0xtvu': {
      'en': 'Enter Your Password',
      'af': 'Sleutel jou wagwoord in',
      'st': 'Kenya Password ea hau',
      'zu': 'Faka Iphasiwedi Yakho',
    },
    'g9fuyf01': {
      'en': 'Sign In',
      'af': 'Meld aan',
      'st': 'Kena',
      'zu': 'Ngena ngemvume',
    },
    'lp9o8sui': {
      'en': 'Forgot Password?',
      'af': 'Wagwoord vergeet?',
      'st': 'U lebetse phasewete?',
      'zu': 'Ukhohlwe iphasiwedi?',
    },
    '39d2vk8s': {
      'en': 'Sign Up',
      'af': 'Teken aan',
      'st': 'Ngolisa',
      'zu': 'Bhalisela',
    },
    'h92rfs71': {
      'en': 'Enter Student Your Email',
      'af': 'Voer Student Jou E-pos in',
      'st': 'Kenya Seithuti Email ea Hau',
      'zu': 'Faka I-imeyili Yakho Yomfundi',
    },
    't4khzpcp': {
      'en': 'Enter Student Your Email',
      'af': 'Voer Student Jou E-pos in',
      'st': 'Kenya Seithuti Email ea Hau',
      'zu': 'Faka I-imeyili Yakho Yomfundi',
    },
    'usj6cw5r': {
      'en': 'Create account',
      'af': 'Skep rekening',
      'st': 'Theha ak&#39;haonte',
      'zu': 'Yenza i-akhawunti',
    },
    'p8zu0wua': {
      'en': 'Home',
      'af': 'Tuis',
      'st': 'Lehae',
      'zu': 'Ikhaya',
    },
  },
  // homePage
  {
    'ri3unxcp': {
      'en': '1',
      'af': '1',
      'st': '1',
      'zu': '1',
    },
    'ihzp7w59': {
      'en': 'Appliances',
      'af': 'Toestelle',
      'st': 'Lisebelisoa',
      'zu': 'Izinto zikagesi',
    },
    's71iwvs7': {
      'en': 'Plumbing',
      'af': 'Loodgieterswerk',
      'st': 'Liphaephe tsa metsi',
      'zu': 'Amapayipi amanzi',
    },
    '5o364w1w': {
      'en': 'Furniture',
      'af': 'Meubels',
      'st': 'Thepa ea ka tlung',
      'zu': 'Ifenisha',
    },
    'mfcvyrpf': {
      'en': 'Electrical',
      'af': 'Elektries',
      'st': 'Motlakase',
      'zu': 'Ezogesi',
    },
    'hnyo7o5l': {
      'en': 'Locksmith',
      'af': 'Slotmaker',
      'st': 'Moetsi oa liloko',
      'zu': 'Umkhandi wezikhiye',
    },
    'wizr7y4h': {
      'en': 'Painting',
      'af': 'Skildery',
      'st': 'Ho penta',
      'zu': 'Ukudweba',
    },
    'lupj6l78': {
      'en': 'Pest control',
      'af': 'Plaagbeheer',
      'st': 'Taolo ea likokoanyana',
      'zu': 'Ukulawula izinambuzane',
    },
    'rhqj312f': {
      'en': 'Communal',
      'af': 'Gemeenskaplik',
      'st': 'Sechaba',
      'zu': 'Umphakathi',
    },
    'ht2a7sj7': {
      'en': 'Others',
      'af': 'Ander',
      'st': 'Ba bang',
      'zu': 'Abanye',
    },
  },
  // viewPage
  {
    'g6o86hf9': {
      'en': 'Search here...',
      'af': 'Soek hier...',
      'st': 'Batla mona...',
      'zu': 'Sesha lapha...',
    },
    '16xkmm6b': {
      'en': 'Search',
      'af': 'Soek',
      'st': 'Batla',
      'zu': 'Sesha',
    },
    'fxusdesr': {
      'en': 'Submitted',
      'af': 'Ingedien',
      'st': 'E rometsoe',
      'zu': 'Kuthunyelwe',
    },
    'x8cw3w69': {
      'en': 'Search results',
      'af': 'Soek Resultate',
      'st': 'Liphetho tsa lipatlisiso',
      'zu': 'Imiphumela yosesho',
    },
    '47qcs9t7': {
      'en': 'Delete',
      'af': 'Vee uit',
      'st': 'Hlakola',
      'zu': 'Susa',
    },
    'xliyc9jb': {
      'en': 'Pending',
      'af': 'Hangende',
      'st': 'E emetse',
      'zu': 'Kusalindile',
    },
    '4e2bu1eh': {
      'en': 'Search results',
      'af': 'Soek Resultate',
      'st': 'Liphetho tsa lipatlisiso',
      'zu': 'Imiphumela yosesho',
    },
    'nj9umfeo': {
      'en': 'Completed',
      'af': 'Voltooi',
      'st': 'E phethiloe',
      'zu': 'Kuqediwe',
    },
    '9zcs84ro': {
      'en': 'Search results',
      'af': 'Soek Resultate',
      'st': 'Liphetho tsa lipatlisiso',
      'zu': 'Imiphumela yosesho',
    },
    '4mu7n5uz': {
      'en': 'Submitted',
      'af': 'Ingedien',
      'st': 'E rometsoe',
      'zu': 'Kuthunyelwe',
    },
    'epsh7pdm': {
      'en': 'Search results',
      'af': 'Soek Resultate',
      'st': 'Liphetho tsa lipatlisiso',
      'zu': 'Imiphumela yosesho',
    },
    'zset6avm': {
      'en': 'Complete',
      'af': 'Voltooi',
      'st': 'Feletseng',
      'zu': 'Qedela',
    },
    '6firyr35': {
      'en': 'Pending',
      'af': 'Hangende',
      'st': 'E emetse',
      'zu': 'Kusalindile',
    },
    'xv02t8u2': {
      'en': 'Search results',
      'af': 'Soek Resultate',
      'st': 'Liphetho tsa lipatlisiso',
      'zu': 'Imiphumela yosesho',
    },
    'r52o7k9c': {
      'en': 'Reject',
      'af': 'Verwerp',
      'st': 'Hana',
      'zu': 'Yenqaba',
    },
    'ib1fouvv': {
      'en': 'Complete',
      'af': 'Voltooi',
      'st': 'Feletseng',
      'zu': 'Qedela',
    },
    'n3dnbo6v': {
      'en': 'Completed',
      'af': 'Voltooi',
      'st': 'E phethiloe',
      'zu': 'Kuqediwe',
    },
    'afgqhb9l': {
      'en': 'Search results',
      'af': 'Soek Resultate',
      'st': 'Liphetho tsa lipatlisiso',
      'zu': 'Imiphumela yosesho',
    },
  },
  // rulesBook
  {
    'oft7p3f9': {
      'en': 'Rennie House',
      'af': 'Kampus Afrika',
      'st': 'Khampase ea Afrika',
      'zu': 'Ikhampasi Afrika',
    },
    'abzkc55j': {
      'en': 'Home',
      'af': 'Tuis',
      'st': 'Lehae',
      'zu': 'Ikhaya',
    },
  },
  // ChatPage
  {
    '25cdx1l2': {
      'en': 'Home',
      'af': 'Tuis',
      'st': 'Lehae',
      'zu': 'Ikhaya',
    },
  },
  // notifications
  {
    'haji3w3r': {
      'en': 'Notifications',
      'af': 'Kennisgewings',
      'st': 'Litsebiso',
      'zu': 'Izaziso',
    },
    'tpem8gpk': {
      'en': '1',
      'af': '1',
      'st': '1',
      'zu': '1',
    },
    'sqtwcc8d': {
      'en': 'Latest',
      'af': 'Nuutste',
      'st': 'Tsa moraorao',
      'zu': 'Okwakamuva',
    },
    'mw2e1nsx': {
      'en': 'Following',
      'af': 'Volgende',
      'st': 'Ho latela',
      'zu': 'Ukulandela',
    },
    'uaxcgmql': {
      'en': 'All',
      'af': 'Almal',
      'st': 'Tsohle',
      'zu': 'Konke',
    },
  },
  // usersSearch
  {
    'vwnld80s': {
      'en': 'Search Contacts',
      'af': 'Soek kontakte',
      'st': 'Batla Mabitso',
      'zu': 'Sesha Oxhumana Nabo',
    },
    'hulawll3': {
      'en': 'Search',
      'af': 'Soek',
      'st': 'Batla',
      'zu': 'Sesha',
    },
    'cym7ky30': {
      'en': 'Search Contacts',
      'af': 'Soek kontakte',
      'st': 'Batla Mabitso',
      'zu': 'Sesha Oxhumana Nabo',
    },
    '9r5p3whq': {
      'en': 'Search Friends to chat',
      'af': 'Soek vriende om te gesels',
      'st': 'Batla Metsoalle ho qoqa',
      'zu': 'Sesha Abangane ukuze uxoxe',
    },
  },
  // MessagesPage
  {
    'ziacko5o': {
      'en': 'Inbox',
      'af': 'Inkassie',
      'st': 'Inbox',
      'zu': 'Ibhokisi lokungenayo',
    },
  },
  // Appliances
  {
    '379z4gvh': {
      'en': 'Appliances',
      'af': 'Toestelle',
      'st': 'Lisebelisoa',
      'zu': 'Izinto zikagesi',
    },
    'kk3edzbs': {
      'en': 'Name',
      'af': 'Naam',
      'st': 'Lebitso',
      'zu': 'Igama',
    },
    '4fsu6x0m': {
      'en': ' ',
      'af': '',
      'st': '',
      'zu': '',
    },
    'nzk8ziaw': {
      'en': 'Issue',
      'af': 'Uitgawe',
      'st': 'Hlahisa',
      'zu': 'Inkinga',
    },
    'b282kjk3': {
      'en': 'Stove not working',
      'af': 'Stoof werk nie',
      'st': 'Setofo ha se sebetse',
      'zu': 'Isitofu asisebenzi',
    },
    'v7swjfni': {
      'en': 'Oven not working',
      'af': 'Oond werk nie',
      'st': 'Ovine ha e sebetse',
      'zu': 'Ihhavini ayisebenzi',
    },
    'jdaewo5r': {
      'en': 'Microwave not working',
      'af': 'Mikrogolf werk nie',
      'st': 'Microwave ha e sebetse',
      'zu': 'I-microwave ayisebenzi',
    },
    'b8su8jqc': {
      'en': 'Fridge not working',
      'af': 'Yskas werk nie',
      'st': 'Sehatsetsi ha se sebetse',
      'zu': 'Isiqandisi asisebenzi',
    },
    'jzxq70zt': {
      'en': 'Please select...',
      'af': 'Kies asseblief...',
      'st': 'Ka kopo khetha...',
      'zu': 'Sicela ukhethe...',
    },
    'ujr70769': {
      'en': 'Description',
      'af': 'Beskrywing',
      'st': 'Tlhaloso',
      'zu': 'Incazelo',
    },
    '5mhqusqz': {
      'en': 'Describe your Issue',
      'af': 'Beskryf jou probleem',
      'st': 'Hlalosa Taba ea hau',
      'zu': 'Chaza udaba lwakho',
    },
    'xmb7t2fh': {
      'en': 'Submit',
      'af': 'Indien',
      'st': 'Kenya',
      'zu': 'Thumela',
    },
    'nyf0hs7p': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'st': 'Ho hlokahala sebaka',
      'zu': 'Inkambu iyadingeka',
    },
    'aw66xj2z': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'st': 'Ho hlokahala sebaka',
      'zu': 'Inkambu iyadingeka',
    },
    'jbigh77n': {
      'en': 'Home',
      'af': 'Tuis',
      'st': 'Lehae',
      'zu': 'Ikhaya',
    },
  },
  // Plumbing
  {
    'j6exf7im': {
      'en': 'Plumbing',
      'af': 'Loodgieterswerk',
      'st': 'Liphaephe tsa metsi',
      'zu': 'Amapayipi amanzi',
    },
    'sjfameuq': {
      'en': 'Name',
      'af': 'Naam',
      'st': 'Lebitso',
      'zu': 'Igama',
    },
    'hh3kxhi3': {
      'en': ' ',
      'af': '',
      'st': '',
      'zu': '',
    },
    '6ydhq6qy': {
      'en': 'Issue',
      'af': 'Uitgawe',
      'st': 'Hlahisa',
      'zu': 'Inkinga',
    },
    'g1s4b5qt': {
      'en': 'Damaged toilet sit',
      'af': 'Beskadigde toilet sit',
      'st': 'Setsi sa ntloana se senyehileng',
      'zu': 'Indlu yangasese eyonakele',
    },
    'f3r9wayy': {
      'en': 'Damaged basin/sink',
      'af': 'Beskadigde wasbak/wasbak',
      'st': 'Sekepe se senyehileng',
      'zu': 'Isitsha/usinki owonakele',
    },
    'uzsclpgj': {
      'en': 'Blocked urinal',
      'af': 'Geblokkeerde urinaal',
      'st': 'Moroto o koetsoeng',
      'zu': 'Umchamo ovinjiwe',
    },
    'bcc5cdzk': {
      'en': 'Blocked toilet',
      'af': 'Geblokkeerde toilet',
      'st': 'Ntloana e koetsoeng',
      'zu': 'Indlu yangasese evinjiwe',
    },
    'jvpf1jfb': {
      'en': 'Blocked shower drain',
      'af': 'Geblokkeerde stortafvoer',
      'st': 'Sekhahla sa shaoara se koetsoeng',
      'zu': 'I-drain yeshawa evinjiwe',
    },
    '4wyw28qg': {
      'en': 'Low water pressure',
      'af': 'Lae waterdruk',
      'st': 'Khatello e tlase ea metsi',
      'zu': 'Umfutho wamanzi ophansi',
    },
    'xglpnog5': {
      'en': 'No cold water',
      'af': 'Geen koue water nie',
      'st': 'Ha ho metsi a batang',
      'zu': 'Awekho amanzi abandayo',
    },
    '4ybabfa3': {
      'en': 'No hot water',
      'af': 'Geen warm water nie',
      'st': 'Ha ho metsi a chesang',
      'zu': 'Awekho amanzi ashisayo',
    },
    'oe2iooc7': {
      'en': 'Shower head needs to be replaced',
      'af': 'Stortkop moet vervang word',
      'st': 'Hlooho ea shaoara e hloka ho nkeloa sebaka',
      'zu': 'Ikhanda leshawa lidinga ukushintshwa',
    },
    '1hx0jrbo': {
      'en': 'Leaking gyser',
      'af': 'Lekkende gyser',
      'st': 'gyser e lutlang',
      'zu': 'I-gyser evuzayo',
    },
    '0acr9e1x': {
      'en': 'Burst pipes',
      'af': 'Gebarste pype',
      'st': 'Liphaephe tse phatlohileng',
      'zu': 'Amapayipi okuqhuma',
    },
    'jecw64w4': {
      'en': 'Please select...',
      'af': 'Kies asseblief...',
      'st': 'Ka kopo khetha...',
      'zu': 'Sicela ukhethe...',
    },
    '221kv5j6': {
      'en': 'Description',
      'af': 'Beskrywing',
      'st': 'Tlhaloso',
      'zu': 'Incazelo',
    },
    'g4jhlicm': {
      'en': 'Describe your Issue',
      'af': 'Beskryf jou probleem',
      'st': 'Hlalosa Taba ea hau',
      'zu': 'Chaza udaba lwakho',
    },
    '9hwlv2m7': {
      'en': 'Submit',
      'af': 'Indien',
      'st': 'Kenya',
      'zu': 'Thumela',
    },
    'x51gr9yz': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'st': 'Ho hlokahala sebaka',
      'zu': 'Inkambu iyadingeka',
    },
    'h85e3ygq': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'st': 'Ho hlokahala sebaka',
      'zu': 'Inkambu iyadingeka',
    },
    '856ubjjv': {
      'en': 'Home',
      'af': 'Tuis',
      'st': 'Lehae',
      'zu': 'Ikhaya',
    },
  },
  // Furniture
  {
    'zsoxcckp': {
      'en': 'Furniture',
      'af': 'Meubels',
      'st': 'Thepa ea ka tlung',
      'zu': 'Ifenisha',
    },
    'rjplwfib': {
      'en': 'Name',
      'af': 'Naam',
      'st': 'Lebitso',
      'zu': 'Igama',
    },
    'ev3xlq8h': {
      'en': ' ',
      'af': '',
      'st': '',
      'zu': '',
    },
    'ri3brf64': {
      'en': 'Issue',
      'af': 'Uitgawe',
      'st': 'Hlahisa',
      'zu': 'Inkinga',
    },
    '8qnmznb2': {
      'en': 'Damaged bed base',
      'af': 'Beskadigde bedbasis',
      'st': 'Setsi sa bethe se senyehileng',
      'zu': 'Isisekelo sombhede sonakele',
    },
    'dcliexha': {
      'en': 'Damaged mattress',
      'af': 'Beskadigde matras',
      'st': 'Materase a senyehileng',
      'zu': 'Umatilasi owonakele',
    },
    'ctzwfb5g': {
      'en': 'Curtain rail needs to be replaced',
      'af': 'Gordynreling moet vervang word',
      'st': 'Curtain rail e hloka ho nkeloa sebaka',
      'zu': 'I-Curtain rail idinga ukushintshwa',
    },
    'eftivozm': {
      'en': 'Damaged study table',
      'af': 'Beskadigde studietafel',
      'st': 'Tafole ea thuto e senyehileng',
      'zu': 'Ithebula lokufunda elilimele',
    },
    '6xd65swp': {
      'en': 'Damaged chair',
      'af': 'Beskadigde stoel',
      'st': 'Setulo se senyehileng',
      'zu': 'Isitulo esilimele',
    },
    'fie5oy0p': {
      'en': 'Window cannot open',
      'af': 'Venster kan nie oopmaak nie',
      'st': 'Fesetere ha e khone ho buleha',
      'zu': 'Iwindi alikwazi ukuvuleka',
    },
    'nzm86etj': {
      'en': 'Window cannot close',
      'af': 'Venster kan nie toemaak nie',
      'st': 'Fesetere ha e khone ho koala',
      'zu': 'Iwindi alikwazi ukuvala',
    },
    'enx6owqa': {
      'en': 'Please select...',
      'af': 'Kies asseblief...',
      'st': 'Ka kopo khetha...',
      'zu': 'Sicela ukhethe...',
    },
    'y0ee0fcm': {
      'en': 'Description',
      'af': 'Beskrywing',
      'st': 'Tlhaloso',
      'zu': 'Incazelo',
    },
    'hqui642d': {
      'en': '',
      'af': '',
      'st': '',
      'zu': '',
    },
    'smqtfo79': {
      'en': 'Describe your Issue',
      'af': 'Beskryf jou probleem',
      'st': 'Hlalosa Taba ea hau',
      'zu': 'Chaza udaba lwakho',
    },
    'ezxqytym': {
      'en': 'Submit',
      'af': 'Indien',
      'st': 'Kenya',
      'zu': 'Thumela',
    },
    'j5cpjyau': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'st': 'Ho hlokahala sebaka',
      'zu': 'Inkambu iyadingeka',
    },
    'fut8j40g': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'st': 'Ho hlokahala sebaka',
      'zu': 'Inkambu iyadingeka',
    },
    'txkmcvkb': {
      'en': 'Home',
      'af': 'Tuis',
      'st': 'Lehae',
      'zu': 'Ikhaya',
    },
  },
  // Electrical
  {
    '5h10vla4': {
      'en': 'Electrical',
      'af': 'Elektries',
      'st': 'Motlakase',
      'zu': 'Ezogesi',
    },
    'pptn41hq': {
      'en': 'Name',
      'af': 'Naam',
      'st': 'Lebitso',
      'zu': 'Igama',
    },
    'snmjv58b': {
      'en': ' ',
      'af': '',
      'st': '',
      'zu': '',
    },
    'o96uncwm': {
      'en': 'Issue',
      'af': 'Uitgawe',
      'st': 'Hlahisa',
      'zu': 'Inkinga',
    },
    'ynegaw02': {
      'en': 'Emergency lights not working',
      'af': 'Noodligte werk nie',
      'st': 'Mabone a ts&#39;ohanyetso ha a sebetse',
      'zu': 'Izibani eziphuthumayo azisebenzi',
    },
    'nlauvg3m': {
      'en': 'Loose cables',
      'af': 'Los kabels',
      'st': 'Lithapo tse hlephileng',
      'zu': 'Izintambo ezixegayo',
    },
    'exk8o1zs': {
      'en': 'No power/electricity',
      'af': 'Geen krag/elektrisiteit',
      'st': 'Ha ho matla/motlakase',
      'zu': 'Awekho amandla/ugesi',
    },
    '3ellrjbp': {
      'en': 'Faulty prepaid meter',
      'af': 'Foutiewe voorafbetaalde meter',
      'st': 'Metara e lefuoang e nang le phoso',
      'zu': 'Imitha ekhokhelwa ngaphambili enephutha',
    },
    '8u8v7nrs': {
      'en': 'Lights in my room are not working',
      'af': 'Ligte in my kamer werk nie',
      'st': 'Mabone a kamoreng ea ka ha a sebetse',
      'zu': 'Izibani ekamelweni lami azisebenzi',
    },
    'u216hxi3': {
      'en': 'Lights in my unit are not working',
      'af': 'Ligte in my eenheid werk nie',
      'st': 'Mabone a yuniti ea ka ha a sebetse',
      'zu': 'Izibani kuyunithi yami azisebenzi',
    },
    'ewgrtjnb': {
      'en': 'Please select...',
      'af': 'Kies asseblief...',
      'st': 'Ka kopo khetha...',
      'zu': 'Sicela ukhethe...',
    },
    'lvbcdupg': {
      'en': 'Description',
      'af': 'Beskrywing',
      'st': 'Tlhaloso',
      'zu': 'Incazelo',
    },
    '41omkw7r': {
      'en': '',
      'af': '',
      'st': '',
      'zu': '',
    },
    'oqw7x9ak': {
      'en': 'Describe your Issue',
      'af': 'Beskryf jou probleem',
      'st': 'Hlalosa Taba ea hau',
      'zu': 'Chaza udaba lwakho',
    },
    'cb9hr1xq': {
      'en': 'Submit',
      'af': 'Indien',
      'st': 'Kenya',
      'zu': 'Thumela',
    },
    'u3d47e3d': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'st': 'Ho hlokahala sebaka',
      'zu': 'Inkambu iyadingeka',
    },
    'o3r0rwcy': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'st': 'Ho hlokahala sebaka',
      'zu': 'Inkambu iyadingeka',
    },
    'm8no2npe': {
      'en': 'Home',
      'af': 'Tuis',
      'st': 'Lehae',
      'zu': 'Ikhaya',
    },
  },
  // Locksmith
  {
    'zkpr0gnw': {
      'en': 'Locksmith',
      'af': 'Slotmaker',
      'st': 'Moetsi oa liloko',
      'zu': 'Umkhandi wezikhiye',
    },
    's3eqlhy0': {
      'en': 'Name',
      'af': 'Naam',
      'st': 'Lebitso',
      'zu': 'Igama',
    },
    'poroii6k': {
      'en': ' ',
      'af': '',
      'st': '',
      'zu': '',
    },
    '5mh6yhav': {
      'en': 'Issue',
      'af': 'Uitgawe',
      'st': 'Hlahisa',
      'zu': 'Inkinga',
    },
    '2ovvpyjh': {
      'en': 'Broken door handle (unit)',
      'af': 'Gebreekte deurhandvatsel (eenheid)',
      'st': 'Mohele oa lemati o robehileng (yuniti)',
      'zu': 'Isibambo somnyango esiphukile (iyunithi)',
    },
    'aiwyw4j6': {
      'en': 'Broken door handle (Room)',
      'af': 'Gebreekte deurhandvatsel (kamer)',
      'st': 'Mohele oa monyako o robehileng (Kamore)',
      'zu': 'Isibambo somnyango esiphukile (Igumbi)',
    },
    'lz8ylm9y': {
      'en': 'Room key not opening',
      'af': 'Kamersleutel maak nie oop nie',
      'st': 'Senotlolo sa kamore ha se butsoe',
      'zu': 'Ukhiye wegumbi awuvuli',
    },
    '4k1n19qm': {
      'en': 'Unit key not opening',
      'af': 'Eenheidsleutel maak nie oop nie',
      'st': 'Senotlolo sa yuniti ha se butsoe',
      'zu': 'Ukhiye weyunithi awuvuli',
    },
    'oqlc0lzx': {
      'en': 'Lost key',
      'af': 'Sleutel verloor',
      'st': 'Senotlolo se lahlehileng',
      'zu': 'Ukhiye olahlekile',
    },
    'mw548crh': {
      'en': 'Lost access card',
      'af': 'Toegangskaart verloor',
      'st': 'Karete ea phihlello e lahlehileng',
      'zu': 'Ikhadi lokufinyelela elilahlekile',
    },
    'rdiv127k': {
      'en': 'access card not working',
      'af': 'toegangskaart werk nie',
      'st': 'karete ea ho kena ha e sebetse',
      'zu': 'ikhadi lokufinyelela alisebenzi',
    },
    'a0pmib1g': {
      'en': 'Please select...',
      'af': 'Kies asseblief...',
      'st': 'Ka kopo khetha...',
      'zu': 'Sicela ukhethe...',
    },
    'pkd6jbzq': {
      'en': 'Description',
      'af': 'Beskrywing',
      'st': 'Tlhaloso',
      'zu': 'Incazelo',
    },
    '90cp2ji5': {
      'en': '',
      'af': '',
      'st': '',
      'zu': '',
    },
    'olb70f7m': {
      'en': 'Describe your Issue',
      'af': 'Beskryf jou probleem',
      'st': 'Hlalosa Taba ea hau',
      'zu': 'Chaza udaba lwakho',
    },
    'ekzi7ay8': {
      'en': 'Submit',
      'af': 'Indien',
      'st': 'Kenya',
      'zu': 'Thumela',
    },
    '02ud1qup': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'st': 'Ho hlokahala sebaka',
      'zu': 'Inkambu iyadingeka',
    },
    '01ba5isz': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'st': 'Ho hlokahala sebaka',
      'zu': 'Inkambu iyadingeka',
    },
    '8ufczwdz': {
      'en': 'Home',
      'af': 'Tuis',
      'st': 'Lehae',
      'zu': 'Ikhaya',
    },
  },
  // Pestcontrol
  {
    'b74aucol': {
      'en': 'Pest control',
      'af': 'Plaagbeheer',
      'st': 'Taolo ea likokoanyana',
      'zu': 'Ukulawula izinambuzane',
    },
    'fbciwrr6': {
      'en': 'Name',
      'af': 'Naam',
      'st': 'Lebitso',
      'zu': 'Igama',
    },
    '0bgptks9': {
      'en': ' ',
      'af': '',
      'st': '',
      'zu': '',
    },
    '0jz4q5zl': {
      'en': 'Issue',
      'af': 'Uitgawe',
      'st': 'Hlahisa',
      'zu': 'Inkinga',
    },
    'f6kpyccf': {
      'en': 'Bed bugs',
      'af': 'Bed goggas',
      'st': 'Linta tsa likobo',
      'zu': 'Izimbungulu zombhede',
    },
    'dzczcupp': {
      'en': 'Cockroaches in my room/unit',
      'af': 'Kakkerlakke in my kamer/eenheid',
      'st': 'Maphele ka kamoreng eaka/yuniti',
      'zu': 'Amaphela ekamelweni/eyunithi yami',
    },
    '1kiwva5p': {
      'en': 'Fumigation required',
      'af': 'Beroking vereis',
      'st': 'Fumigation e hlokahalang',
      'zu': 'Ukufuthwa kuyadingeka',
    },
    'k0qus04q': {
      'en': 'Please select...',
      'af': 'Kies asseblief...',
      'st': 'Ka kopo khetha...',
      'zu': 'Sicela ukhethe...',
    },
    '3spt7ujg': {
      'en': 'Description',
      'af': 'Beskrywing',
      'st': 'Tlhaloso',
      'zu': 'Incazelo',
    },
    'men9xdlg': {
      'en': '',
      'af': '',
      'st': '',
      'zu': '',
    },
    'khtkq8d8': {
      'en': 'Describe your Issue',
      'af': 'Beskryf jou probleem',
      'st': 'Hlalosa Taba ea hau',
      'zu': 'Chaza udaba lwakho',
    },
    'rb1krgbn': {
      'en': 'Submit',
      'af': 'Indien',
      'st': 'Kenya',
      'zu': 'Thumela',
    },
    'oq45egd2': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'st': 'Ho hlokahala sebaka',
      'zu': 'Inkambu iyadingeka',
    },
    '1rvpi8sr': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'st': 'Ho hlokahala sebaka',
      'zu': 'Inkambu iyadingeka',
    },
    'xr7g3ufx': {
      'en': 'Home',
      'af': 'Tuis',
      'st': 'Lehae',
      'zu': 'Ikhaya',
    },
  },
  // painting
  {
    'fpnywby9': {
      'en': 'Painting',
      'af': 'Skildery',
      'st': 'Ho penta',
      'zu': 'Ukudweba',
    },
    'y45hko9v': {
      'en': 'Name',
      'af': 'Naam',
      'st': 'Lebitso',
      'zu': 'Igama',
    },
    'a4x8dzml': {
      'en': ' ',
      'af': '',
      'st': '',
      'zu': '',
    },
    'sxw0xvkr': {
      'en': 'Issue',
      'af': 'Uitgawe',
      'st': 'Hlahisa',
      'zu': 'Inkinga',
    },
    'b49kwxxn': {
      'en': 'Ceiling needs to be painted',
      'af': 'Die plafon moet geverf word',
      'st': 'Siling e hloka ho penta',
      'zu': 'Uphahla ludinga ukupendwa',
    },
    'xcjd2ohv': {
      'en': 'Door frame needs to be painted',
      'af': 'Deurkosyn moet geverf word',
      'st': 'Foreimi ea lemati e hloka ho penta',
      'zu': 'Uhlaka lomnyango ludinga ukupendwa',
    },
    'hn0l9gtd': {
      'en': 'Skirting needs to be painted',
      'af': 'Plint moet geverf word',
      'st': 'Skirting e hloka ho penta',
      'zu': 'I-Skirting idinga ukupendwa',
    },
    '73kygpgt': {
      'en': 'Walls needs to be painted',
      'af': 'Mure moet geverf word',
      'st': 'Mabota a hloka ho penta',
      'zu': 'Izindonga zidinga ukupendwa',
    },
    '99fpkv1q': {
      'en': 'Window frames needs to be painted',
      'af': 'Vensterrame moet geverf word',
      'st': 'Liforeimi tsa lifensetere li hloka ho penta',
      'zu': 'Amawindi ozimele adinga ukupendwa',
    },
    'r8v9zom9': {
      'en': 'Please select...',
      'af': 'Kies asseblief...',
      'st': 'Ka kopo khetha...',
      'zu': 'Sicela ukhethe...',
    },
    '9yycc0gq': {
      'en': 'Description',
      'af': 'Beskrywing',
      'st': 'Tlhaloso',
      'zu': 'Incazelo',
    },
    'al4s42e8': {
      'en': '',
      'af': '',
      'st': '',
      'zu': '',
    },
    'i0vecmyv': {
      'en': 'Describe your Issue',
      'af': 'Beskryf jou probleem',
      'st': 'Hlalosa Taba ea hau',
      'zu': 'Chaza udaba lwakho',
    },
    'c9brkjw1': {
      'en': 'Submit',
      'af': 'Indien',
      'st': 'Kenya',
      'zu': 'Thumela',
    },
    '6w71dv82': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'st': 'Ho hlokahala sebaka',
      'zu': 'Inkambu iyadingeka',
    },
    'qow9mldr': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'st': 'Ho hlokahala sebaka',
      'zu': 'Inkambu iyadingeka',
    },
    '20b96ira': {
      'en': 'Home',
      'af': 'Tuis',
      'st': 'Lehae',
      'zu': 'Ikhaya',
    },
  },
  // Others
  {
    '2ytiwh02': {
      'en': 'Other',
      'af': 'Ander',
      'st': 'Tse ding',
      'zu': 'Okunye',
    },
    'crrao6ih': {
      'en': 'Name',
      'af': 'Naam',
      'st': 'Lebitso',
      'zu': 'Igama',
    },
    'xi810ac6': {
      'en': ' ',
      'af': '',
      'st': '',
      'zu': '',
    },
    '8jet81fh': {
      'en': 'Issue',
      'af': 'Uitgawe',
      'st': 'Hlahisa',
      'zu': 'Inkinga',
    },
    '6hpt9krn': {
      'en': '',
      'af': '',
      'st': '',
      'zu': '',
    },
    'gn9nsu4y': {
      'en': 'Describe your Issue',
      'af': 'Beskryf jou probleem',
      'st': 'Hlalosa Taba ea hau',
      'zu': 'Chaza udaba lwakho',
    },
    'joeg6jq5': {
      'en': 'Submit',
      'af': 'Indien',
      'st': 'Kenya',
      'zu': 'Thumela',
    },
    'ehaqct9t': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'st': 'Ho hlokahala sebaka',
      'zu': 'Inkambu iyadingeka',
    },
    '6wg4lijw': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'st': 'Ho hlokahala sebaka',
      'zu': 'Inkambu iyadingeka',
    },
    'ocnpeou8': {
      'en': 'Home',
      'af': 'Tuis',
      'st': 'Lehae',
      'zu': 'Ikhaya',
    },
  },
  // Communal
  {
    '98jt63cp': {
      'en': 'Communal',
      'af': 'Gemeenskaplik',
      'st': 'Sechaba',
      'zu': 'Umphakathi',
    },
    '7nmev92l': {
      'en': 'Name',
      'af': 'Naam',
      'st': 'Lebitso',
      'zu': 'Igama',
    },
    'yiv2vl4e': {
      'en': ' ',
      'af': '',
      'st': '',
      'zu': '',
    },
    'ugqlruzv': {
      'en': 'Issue',
      'af': 'Uitgawe',
      'st': 'Hlahisa',
      'zu': 'Inkinga',
    },
    'cc9f1k6t': {
      'en': '',
      'af': '',
      'st': '',
      'zu': '',
    },
    'z5y4ns8r': {
      'en': 'Describe your Issue',
      'af': 'Beskryf jou probleem',
      'st': 'Hlalosa Taba ea hau',
      'zu': 'Chaza udaba lwakho',
    },
    'lcbjrhc4': {
      'en': 'Place',
      'af': 'Plek',
      'st': 'Sebaka',
      'zu': 'Indawo',
    },
    'j24y4cmn': {
      'en': 'Place',
      'af': 'Plek',
      'st': 'Sebaka',
      'zu': 'Indawo',
    },
    'i8tc74up': {
      'en': '',
      'af': '',
      'st': '',
      'zu': '',
    },
    '9ve9st0h': {
      'en': 'Submit',
      'af': 'Indien',
      'st': 'Kenya',
      'zu': 'Thumela',
    },
    'u74d156v': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'st': 'Ho hlokahala sebaka',
      'zu': 'Inkambu iyadingeka',
    },
    'yet5n963': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'st': 'Ho hlokahala sebaka',
      'zu': 'Inkambu iyadingeka',
    },
    'xzvk0uft': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'st': 'Ho hlokahala sebaka',
      'zu': 'Inkambu iyadingeka',
    },
    '7pzgv1i8': {
      'en': 'Home',
      'af': 'Tuis',
      'st': 'Lehae',
      'zu': 'Ikhaya',
    },
  },
  // reviews
  {
    'o4ma2plr': {
      'en': 'Review',
      'af': 'Resensie',
      'st': 'Hlahloba',
      'zu': 'Buyekeza',
    },
    'd385clrz': {
      'en': 'Private Feedback',
      'af': 'Privaat terugvoer',
      'st': 'Maikutlo a Poraefete',
      'zu': 'Impendulo Eyimfihlo',
    },
    '73kmddwp': {
      'en': 'What was your most important concern with this  ticket?',
      'af': 'Wat was jou belangrikste bekommernis met hierdie kaartjie?',
      'st': 'Matšoenyeho a hau a bohlokoa ke afe ka tekete ee?',
      'zu': 'Yini ebikukhathaza kakhulu ngaleli thikithi?',
    },
    'ugvvl6sj': {
      'en': 'Time',
      'af': 'Tyd',
      'st': 'Nako',
      'zu': 'Isikhathi',
    },
    'hf7xrl78': {
      'en': 'Convinience',
      'af': 'Gerieflikheid',
      'st': 'Kholiseho',
      'zu': 'Convinience',
    },
    '8qm66qau': {
      'en': 'Cleanliness',
      'af': 'Netheid',
      'st': 'Bohloeki',
      'zu': 'Inhlanzeko',
    },
    '655gd3ni': {
      'en': 'Communication',
      'af': 'Kommunikasie',
      'st': 'Puisano',
      'zu': 'Ukuxhumana',
    },
    'oakcj4gl': {
      'en': 'Quality',
      'af': 'Kwaliteit',
      'st': 'Boleng',
      'zu': 'Ikhwalithi',
    },
    'lw2fg6hp': {
      'en': 'Option ',
      'af': 'Opsie',
      'st': 'Khetho',
      'zu': 'Inketho',
    },
    'ylyfvpnm': {
      'en': 'Anything you\'d like us to know?\n(optional)',
      'af': 'Enigiets wat jy wil hê ons moet weet? (opsioneel)',
      'st': 'Na u batla hore re tsebe? (ka boikhethelo)',
      'zu': 'Kukhona ongathanda ukuthi sikwazi? (uyazikhethela)',
    },
    '11421gx0': {
      'en':
          'Your rating is really important for us as it helps us to improve our services for the future.',
      'af':
          'Jou gradering is baie belangrik vir ons aangesien dit ons help om ons dienste vir die toekoms te verbeter.',
      'st':
          'Lintlha tsa hau li bohlokoa ho rona kaha li re thusa ho ntlafatsa litšebeletso tsa rona bakeng sa bokamoso.',
      'zu':
          'Isilinganiso sakho sibaluleke ngempela kithi njengoba sisisiza ukuthuthukisa amasevisi ethu esikhathini esizayo.',
    },
    'q7zf3n84': {
      'en': 'Confirm',
      'af': 'Bevestig',
      'st': 'Netefatsa',
      'zu': 'Qinisekisa',
    },
    'gao0k4d6': {
      'en': 'Field is required',
      'af': 'Veld word vereis',
      'st': 'Ho hlokahala sebaka',
      'zu': 'Inkambu iyadingeka',
    },
    'v4ofqfkx': {
      'en': 'Home',
      'af': 'Tuis',
      'st': 'Lehae',
      'zu': 'Ikhaya',
    },
  },
  // testMoreInfo
  {
    'yxfxboa1': {
      'en': 'Details',
      'af': 'Besonderhede',
      'st': 'Lintlha',
      'zu': 'Imininingwane',
    },
    'gtrpavgl': {
      'en': 'Category',
      'af': 'Kategorie',
      'st': 'Sehlopha',
      'zu': 'Isigaba',
    },
    'cgpixroe': {
      'en': 'Status',
      'af': 'Status',
      'st': 'Boemo',
      'zu': 'Isimo',
    },
    'c406ieec': {
      'en': 'Assigned',
      'af': 'Toegewys',
      'st': 'E abetsoe',
      'zu': 'Kwabelwe',
    },
    '8dzwam8y': {
      'en': 'View Ratings',
      'af': 'Bekyk graderings',
      'st': 'Sheba Lintlha',
      'zu': 'Buka Izilinganiso',
    },
    'h2qnzia6': {
      'en': 'Private Feedback',
      'af': 'Privaat terugvoer',
      'st': 'Maikutlo a Poraefete',
      'zu': 'Impendulo Eyimfihlo',
    },
    't9u0hkvb': {
      'en': 'What was your most important concern with this  ticket?',
      'af': 'Wat was jou belangrikste bekommernis met hierdie kaartjie?',
      'st': 'Matšoenyeho a hau a bohlokoa ke afe ka tekete ee?',
      'zu': 'Yini ebikukhathaza kakhulu ngaleli thikithi?',
    },
    '4cce03y8': {
      'en': 'Time',
      'af': 'Tyd',
      'st': 'Nako',
      'zu': 'Isikhathi',
    },
    'jluzpfq0': {
      'en': 'Convinience',
      'af': 'Gerieflikheid',
      'st': 'Kholiseho',
      'zu': 'Convinience',
    },
    '5gyizihq': {
      'en': 'Cleanliness',
      'af': 'Netheid',
      'st': 'Bohloeki',
      'zu': 'Inhlanzeko',
    },
    'kmzqh6iw': {
      'en': 'Communication',
      'af': 'Kommunikasie',
      'st': 'Puisano',
      'zu': 'Ukuxhumana',
    },
    '4t0sq6e2': {
      'en': 'Quality',
      'af': 'Kwaliteit',
      'st': 'Boleng',
      'zu': 'Ikhwalithi',
    },
    '5ns1rv2o': {
      'en': 'Option ',
      'af': 'Opsie',
      'st': 'Khetho',
      'zu': 'Inketho',
    },
    'mwhoav8a': {
      'en':
          'Your rating is really important for us as it helps us to improve our services for the future.',
      'af':
          'Jou gradering is baie belangrik vir ons aangesien dit ons help om ons dienste vir die toekoms te verbeter.',
      'st':
          'Lintlha tsa hau li bohlokoa ho rona kaha li re thusa ho ntlafatsa litšebeletso tsa rona bakeng sa bokamoso.',
      'zu':
          'Isilinganiso sakho sibaluleke ngempela kithi njengoba sisisiza ukuthuthukisa amasevisi ethu esikhathini esizayo.',
    },
    'ev6nki30': {
      'en': 'Comments',
      'af': 'Kommentaar',
      'st': 'Maikutlo',
      'zu': 'Amazwana',
    },
    '0h542f8d': {
      'en': '1',
      'af': '1',
      'st': '1',
      'zu': '1',
    },
    'nq5s5bc3': {
      'en': 'Home',
      'af': 'Tuis',
      'st': 'Lehae',
      'zu': 'Ikhaya',
    },
  },
  // newProfile
  {
    '4mbweto7': {
      'en': 'Change My Picture',
      'af': 'Verander my prentjie',
      'st': 'Fetola Setšoantšo sa Ka',
      'zu': 'Shintsha Isithombe Sami',
    },
    'nktudvhd': {
      'en': 'Name',
      'af': 'Naam',
      'st': 'Lebitso',
      'zu': 'Igama',
    },
    'v9bhu3my': {
      'en': 'Email',
      'af': 'E-pos',
      'st': 'Email',
      'zu': 'I-imeyili',
    },
    '31viba32': {
      'en': 'Bio    ',
      'af': 'Bio',
      'st': 'Bophelo',
      'zu': 'I-Bio',
    },
    'pcl4k8pk': {
      'en': 'Write about yourself...',
      'af': 'Skryf oor jouself...',
      'st': 'Ngola ka uena...',
      'zu': 'Bhala ngawe...',
    },
    'm8wmwvns': {
      'en': 'Building',
      'af': 'Gebou',
      'st': 'Moaho',
      'zu': 'Isakhiwo',
    },
    'hrbosgqh': {
      'en': 'Room',
      'af': 'Kamer',
      'st': 'Kamore',
      'zu': 'Igumbi',
    },
    '17zon0zi': {
      'en': 'UID',
      'af': 'UID',
      'st': 'UID',
      'zu': 'I-UID',
    },
    'ie0kbdvu': {
      'en': 'Selected\nLanguage',
      'af': 'Kies taal',
      'st': 'Kgetha Puo',
      'zu': 'Khetha Ulimi',
    },
    'n22ngvbt': {
      'en': 'ZA',
      'af': '',
      'st': '',
      'zu': '',
    },
    'gaduf3gk': {
      'en': 'ZA',
      'af': '',
      'st': '',
      'zu': '',
    },
    '0wva1xyq': {
      'en': 'Profile',
      'af': 'Profiel',
      'st': 'Profile',
      'zu': 'Iphrofayili',
    },
    'uu3knjl3': {
      'en': 'Save',
      'af': 'Stoor',
      'st': 'Boloka',
      'zu': 'Londoloza',
    },
    'rwaeignd': {
      'en': 'Home',
      'af': 'Tuis',
      'st': 'Lehae',
      'zu': 'Ikhaya',
    },
  },
  // newSettings
  {
    'l75068ci': {
      'en': 'Account',
      'af': 'Rekening',
      'st': 'Akhaonto',
      'zu': 'I-akhawunti',
    },
    'nj9u6e42': {
      'en': 'Messages',
      'af': 'Boodskappe',
      'st': 'Melaetsa',
      'zu': 'Imilayezo',
    },
    't9754pmw': {
      'en': 'Appearance',
      'af': 'Voorkoms',
      'st': 'Ponahalo',
      'zu': 'Ukubukeka',
    },
    'k25fzrux': {
      'en': 'Checklist',
      'af': 'Kontrolelys',
      'st': 'Lethathamo la tlhahlobo',
      'zu': 'Uhlu lokuhlola',
    },
    'mv65usit': {
      'en': 'Residence fees',
      'af': 'Studentehandboek',
      'st': 'Buka ea moithuti',
      'zu': 'Incwadi yomfundi',
    },
    'w3kgqtsc': {
      'en': 'Notifications',
      'af': 'Kennisgewings',
      'st': 'Litsebiso',
      'zu': 'Izaziso',
    },
    'lfkifcv6': {
      'en': 'Language',
      'af': 'Taal',
      'st': 'Puo',
      'zu': 'Ulimi',
    },
    '2u2thzj6': {
      'en': 'About us',
      'af': 'Oor ons',
      'st': 'Mabapi le rona',
      'zu': 'Mayelana NATHI',
    },
    'ak9vojgx': {
      'en': 'Logout',
      'af': 'Teken uit',
      'st': 'Tsoa',
      'zu': 'Phuma',
    },
    'u72jdw6e': {
      'en': 'Settings',
      'af': 'Instellings',
      'st': 'Litlhophiso',
      'zu': 'Izilungiselelo',
    },
    'ugb9k6b5': {
      'en': '',
      'af': '',
      'st': '',
      'zu': '',
    },
  },
  // submittedIcon
  {
    'ua7ubrzs': {
      'en': 'Success!',
      'af': 'Sukses!',
      'st': 'Katleho!',
      'zu': 'Impumelelo!',
    },
    'eelep3l0': {
      'en':
          'Your request has been received\nby the Campus Africa maintenance\nteam.',
      'af': 'Jou versoek is deur die Campus Africa-instandhoudingspan ontvang.',
      'st':
          'Kopo ya hao e amohetswe ke sehlopha sa tlhokomelo sa Campus Africa.',
      'zu': 'Isicelo sakho sitholwe yithimba elilungisa le-Campus Africa.',
    },
    '6vhy0doc': {
      'en': 'Continue',
      'af': 'Aanhou',
      'st': 'Tswella',
      'zu': 'Qhubeka',
    },
  },
  // emptyList
  {
    'cf85lsih': {
      'en': 'No results were found from your search.\nPlease try again.',
      'af':
          'Geen resultate is van jou soektog gevind nie. Probeer asseblief weer.',
      'st':
          'Ha ho liphetho tse fumanoeng ho tsoa patlisisong ea hau. Ka kopo, leka hape.',
      'zu':
          'Ayikho imiphumela etholakele oseshweni lwakho. Ngicela uzame futhi.',
    },
  },
  // darkMode
  {
    '1ni48z6d': {
      'en': 'Light theme',
      'af': 'Ligte tema',
      'st': 'Theme e khanyang',
      'zu': 'Itimu ekhanyayo',
    },
    'lhga9n6k': {
      'en': 'Dark theme',
      'af': 'Donker tema',
      'st': 'Tema e lefifi',
      'zu': 'Itimu emnyama',
    },
    'cgkby2zl': {
      'en': 'From device settings',
      'af': 'Van toestelinstellings',
      'st': 'Ho tsoa ho litlhophiso tsa sesebelisoa',
      'zu': 'Kusuka kuzilungiselelo zedivayisi',
    },
  },
  // signature
  {
    'm5h8e46u': {
      'en': 'Signature',
      'af': 'Handtekening',
      'st': 'Tshaeno',
      'zu': 'Isiginesha',
    },
    '2gbpplsv': {
      'en': 'Clear',
      'af': 'Duidelik',
      'st': 'Hlakileng',
      'zu': 'Kucace',
    },
    'lflh79c1': {
      'en': 'Cancel',
      'af': 'Kanselleer',
      'st': 'Hlakola',
      'zu': 'Khansela',
    },
    '1sijgjm7': {
      'en': 'Confirm',
      'af': 'Bevestig',
      'st': 'Netefatsa',
      'zu': 'Qinisekisa',
    },
  },
  // signUp
  {
    'frsyhmri': {
      'en': 'Create New Account',
      'af': 'Skep nuwe rekening',
      'st': 'Theha Account e Ncha',
      'zu': 'Dala I-akhawunti Entsha',
    },
    'nj3rduhf': {
      'en': 'Email Address',
      'af': 'E-pos adres',
      'st': 'Aterese ea imeile',
      'zu': 'Ikheli le-imeyili',
    },
    '3udea805': {
      'en': 'Enter your email here...',
      'af': 'Voer jou e-pos hier in...',
      'st': 'Kenya lengolo-tsoibila la hau mona...',
      'zu': 'Faka i-imeyili yakho lapha...',
    },
    'dcg5h4rw': {
      'en': 'Create Account',
      'af': 'Skep rekening',
      'st': 'Theha ak&#39;haonte',
      'zu': 'Yenza i-akhawunti',
    },
  },
  // language
  {
    'oyqbh7ii': {
      'en': 'Afrikaans',
      'af': 'Afrikaans',
      'st': 'Seafrikanse',
      'zu': 'IsiBhunu',
    },
    'i29v1v2d': {
      'en': 'English',
      'af': 'Engels',
      'st': 'Senyesemane',
      'zu': 'IsiNgisi',
    },
    'anp7mqim': {
      'en': 'Zulu',
      'af': 'Zoeloe',
      'st': 'Sezulu',
      'zu': 'Zulu',
    },
  },
  // Miscellaneous
  {
    'lvpj234m': {
      'en':
          'Enable access so you can take photos of your maintenance reports and update your profile picture.',
      'af':
          'Aktiveer toegang sodat jy foto&#39;s van jou instandhoudingsverslae kan neem en jou profielfoto kan opdateer.',
      'st':
          'Lumella monyetla oa ho kena e le hore u ka nka linepe tsa litlaleho tsa tlhokomelo ea hau le ho nchafatsa setšoantšo sa boemo ba hau.',
      'zu':
          'Nika amandla ukufinyelela ukuze ukwazi ukuthatha izithombe zemibiko yakho yokulungisa futhi ubuyekeze isithombe sakho sephrofayela.',
    },
    'tpjlcilr': {
      'en':
          'Let Campus Africa access your library so you can upload photos to your maintenance reports and update your profile picture',
      'af':
          'Laat Campus Africa toegang tot jou biblioteek sodat jy foto&#39;s na jou instandhoudingsverslae kan oplaai en jou profielfoto kan opdateer',
      'st':
          'Lumella Campus Africa ho fihlella laeborari ea hau hore o tsebe ho kenya linepe litlalehong tsa tlhokomelo ea hau le ho nchafatsa setšoantšo sa profil ea hau',
      'zu':
          'Vumela i-Campus Africa ifinyelele umtapo wakho wolwazi ukuze ukwazi ukulayisha izithombe emibikweni yakho yokulungisa futhi ubuyekeze isithombe sakho sephrofayela',
    },
    'uo3dfuv5': {
      'en': '',
      'af': '',
      'st': '',
      'zu': '',
    },
    '0oulxlkm': {
      'en': '',
      'af': '',
      'st': '',
      'zu': '',
    },
    'xjjji9rx': {
      'en': '',
      'af': '',
      'st': '',
      'zu': '',
    },
    '961yscwv': {
      'en': '',
      'af': '',
      'st': '',
      'zu': '',
    },
    'agtamtgc': {
      'en': '',
      'af': '',
      'st': '',
      'zu': '',
    },
    'nkzdpl8c': {
      'en': '',
      'af': '',
      'st': '',
      'zu': '',
    },
    'r9k8vtxj': {
      'en': '',
      'af': '',
      'st': '',
      'zu': '',
    },
    'zd5kzz0m': {
      'en': '',
      'af': '',
      'st': '',
      'zu': '',
    },
    'tt9qlhvb': {
      'en': '',
      'af': '',
      'st': '',
      'zu': '',
    },
    'zd4vyvrw': {
      'en': '',
      'af': '',
      'st': '',
      'zu': '',
    },
    'z40c2u6r': {
      'en': 'File Uploaded!',
      'af': 'Lêer opgelaai!',
      'st': 'Faele e kentsoe!',
      'zu': 'Ifayela Lilayishiwe!',
    },
    'gpuitegy': {
      'en': '',
      'af': '',
      'st': '',
      'zu': '',
    },
    '7rz9brmh': {
      'en': '',
      'af': '',
      'st': '',
      'zu': '',
    },
    'op5eft6x': {
      'en': '',
      'af': '',
      'st': '',
      'zu': '',
    },
    'pkybakmu': {
      'en': '',
      'af': '',
      'st': '',
      'zu': '',
    },
    '4bfkhv86': {
      'en': '',
      'af': '',
      'st': '',
      'zu': '',
    },
    'zxholu79': {
      'en': '',
      'af': '',
      'st': '',
      'zu': '',
    },
    '82ragmeh': {
      'en': '',
      'af': '',
      'st': '',
      'zu': '',
    },
    '6z8c56bm': {
      'en': '',
      'af': '',
      'st': '',
      'zu': '',
    },
    'pjyanqy2': {
      'en': '',
      'af': '',
      'st': '',
      'zu': '',
    },
    'h2dm6i3z': {
      'en': '',
      'af': '',
      'st': '',
      'zu': '',
    },
  },
].reduce((a, b) => a..addAll(b));
