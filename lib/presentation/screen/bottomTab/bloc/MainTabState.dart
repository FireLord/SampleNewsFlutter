import 'package:equatable/equatable.dart';

abstract class MainTabState extends Equatable {
  final int tabIndex;

  const MainTabState({required this.tabIndex});

  @override
  List<Object> get props => [tabIndex];
}

class MainTabInit extends MainTabState {
  const MainTabInit({required super.tabIndex});
}