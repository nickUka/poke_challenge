import 'package:flutter/material.dart';
import 'package:pokemon_test/models/navigation_pages.dart';

class NavigationState {
  final List<Widget> pages;
  const NavigationState({required this.pages});

  NavigationState.initial() : this(pages: [Pages[0]]);

  get currentPage => pages.last;

  NavigationState copyWith({List<Widget>? pages}) {
    return NavigationState(
      pages: pages ?? this.pages,
    );
  }
}
