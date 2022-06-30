import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _darkMode = prefs.getBool('ff_darkMode') ?? _darkMode;
    _numberOfDocs = prefs.getInt('ff_numberOfDocs') ?? _numberOfDocs;
    _caLogo = prefs.getString('ff_caLogo') ?? _caLogo;
    _myBio = prefs.getString('ff_myBio') ?? _myBio;
    _defaultLanguage =
        prefs.getString('ff_defaultLanguage') ?? _defaultLanguage;
  }

  late SharedPreferences prefs;

  bool isPressed = true;

  List<bool> listPressed = [];

  bool _darkMode = false;
  bool get darkMode => _darkMode;
  set darkMode(bool _value) {
    _darkMode = _value;
    prefs.setBool('ff_darkMode', _value);
  }

  int _numberOfDocs = 0;
  int get numberOfDocs => _numberOfDocs;
  set numberOfDocs(int _value) {
    _numberOfDocs = _value;
    prefs.setInt('ff_numberOfDocs', _value);
  }

  String _caLogo = '';
  String get caLogo => _caLogo;
  set caLogo(String _value) {
    _caLogo = _value;
    prefs.setString('ff_caLogo', _value);
  }

  String _myBio = 'Write about yourself...';
  String get myBio => _myBio;
  set myBio(String _value) {
    _myBio = _value;
    prefs.setString('ff_myBio', _value);
  }

  String _defaultLanguage = '';
  String get defaultLanguage => _defaultLanguage;
  set defaultLanguage(String _value) {
    _defaultLanguage = _value;
    prefs.setString('ff_defaultLanguage', _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
