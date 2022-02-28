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
    _inspection = prefs.getStringList('ff_inspection') ?? _inspection;
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

  List<String> _inspection = ['Good', 'Fair', 'Dirty', 'Repair', 'Repalce'];
  List<String> get inspection => _inspection;
  set inspection(List<String> _value) {
    _inspection = _value;
    prefs.setStringList('ff_inspection', _value);
  }

  void addToInspection(String _value) {
    _inspection.add(_value);
    prefs.setStringList('ff_inspection', _inspection);
  }

  void removeFromInspection(String _value) {
    _inspection.remove(_value);
    prefs.setStringList('ff_inspection', _inspection);
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
