import 'dart:js_interop';

@JS('window.speechSynthesis.pause')
external void _pause();

@JS('window.speechSynthesis.resume')
external void _resume();

void webPauseResume() {
  _pause();
  _resume();
}
