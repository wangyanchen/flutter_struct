import 'models.dart';
class AppState {
  final bool isLoading;
  final int activeTab;
  final User user;
  AppState({
    this.isLoading = false,
    this.user,
    this.activeTab = 0
  });
  factory AppState.loading() => AppState(isLoading: true);

}