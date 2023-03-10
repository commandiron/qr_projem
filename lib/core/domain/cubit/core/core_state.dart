class CoreState {
  bool isUserAuthenticated;
  bool isUserAdmin;
  String? userUid;

  CoreState({required this.isUserAuthenticated, required this.isUserAdmin, this.userUid});
}
