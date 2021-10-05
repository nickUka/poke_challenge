abstract class NavigationEvent {
  const NavigationEvent();
}

class GoTo extends NavigationEvent {
  late int page;
  GoTo({required this.page});
}

class Back extends NavigationEvent {
  final int pagesToRemove;
  const Back({this.pagesToRemove = 1});
}
