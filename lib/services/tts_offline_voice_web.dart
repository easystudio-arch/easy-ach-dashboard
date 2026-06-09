import 'dart:js_interop';

@JS('getOfflineVoiceName')
external JSString _getOfflineVoiceName(JSString lang);

String getOfflineVoiceNameForLang(String lang) {
  return _getOfflineVoiceName(lang.toJS).toDart;
}
