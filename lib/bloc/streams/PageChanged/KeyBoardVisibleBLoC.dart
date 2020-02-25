import 'dart:async';

import 'KeyBoardVisibleEvent.dart';

class KeyBoardVisibleBLoC {
  final _keyBoardVisibleStreamController = StreamController<int>.broadcast();
  StreamSink<int> get keyBoardVisible_sink =>
      _keyBoardVisibleStreamController.sink;

  // expose data from stream
  Stream<int> get stream_counter => _keyBoardVisibleStreamController.stream;

  final _keyBoardVisibleEventController = StreamController<KeyBoardVisibleEvent>();
  // expose sink for input events
  Sink<KeyBoardVisibleEvent> get keyboard_visible_event_sink =>
      _keyBoardVisibleEventController.sink;

  KeyBoardVisibleBLoC() {
    _keyBoardVisibleEventController.stream.listen(_keyBoardVisible);
  }
  
  _keyBoardVisible(KeyBoardVisibleEvent event) {
    print('_keyBoardVisible');
    if (event is ToggleKeyBoardVisEvent) {
      print('event is ToggleKeyBoardVisEvent');
      print('toggleVal${event.keyboardShownVal}');

      keyBoardVisible_sink.add(event.keyboardShownVal);
    }
  }

  dispose() {
    _keyBoardVisibleStreamController.close();
    _keyBoardVisibleEventController.close();
  }
}
