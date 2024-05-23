abstract class MainTabEvent {
  const MainTabEvent();
}

class TabChange extends MainTabEvent {
  final int tabIndex;

  const TabChange({required this.tabIndex});
}