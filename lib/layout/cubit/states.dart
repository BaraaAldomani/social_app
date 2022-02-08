import '../../models/user_model.dart';

abstract class SocialStates {}

class SocialInitialStates extends SocialStates {}

class GetUserDataLoadingStates extends SocialStates {}

class GetUserDataSuccessStates extends SocialStates {
  final UserModel model;

  GetUserDataSuccessStates(this.model);
}

class GetUserDataErrorStates extends SocialStates {}

class SignOutSuccessStates extends SocialStates {}

class SignOutErrorStates extends SocialStates {}

class ChangeNavIndex extends SocialStates {}
