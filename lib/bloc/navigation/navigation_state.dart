import 'package:pokemon_test/models/navigation_pages.dart';

class NavigationState {
  final List<int> pages;
  const NavigationState({required this.pages});

  NavigationState.initial() : this(pages: [POKEDEX]);

  get currentPage => pages.last;

  NavigationState copyWith({List<int>? pages}) {
    return NavigationState(
      pages: pages ?? this.pages,
    );
  }
}
