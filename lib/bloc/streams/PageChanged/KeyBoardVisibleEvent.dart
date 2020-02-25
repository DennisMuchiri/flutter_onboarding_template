abstract class KeyBoardVisibleEvent {
  const KeyBoardVisibleEvent();
}

class ToggleKeyBoardVisEvent extends KeyBoardVisibleEvent {
  final int keyboardShownVal;
  const ToggleKeyBoardVisEvent(this.keyboardShownVal);
}


