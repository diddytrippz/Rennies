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
    _profilePic = prefs.getString('ff_profilePic') ?? _profilePic;
    _darkMode = prefs.getBool('ff_darkMode') ?? _darkMode;
  }

  SharedPreferences prefs;

  String _profilePic;
  String get profilePic => _profilePic;
  set profilePic(String _value) {
    _profilePic = _value;
    prefs.setString('ff_profilePic', _value);
  }

  bool isPressed = true;

  List<bool> listPressed = [];

  bool _darkMode = false;
  bool get darkMode => _darkMode;
  set darkMode(bool _value) {
    _darkMode = _value;
    prefs.setBool('ff_darkMode', _value);
  }
}

LatLng _latLngFromString(String val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
