abstract class RegisterStates {}

class RegisterInitialStates extends RegisterStates {}

class RegisterLoadingStates extends RegisterStates {}

class RegisterSuccessStates extends RegisterStates {}

class RegisterErrorStates extends RegisterStates {
  final dynamic error;

  RegisterErrorStates(this.error);
}

class CreateUserSuccessStates extends RegisterStates {}

class CreateUserErrorStates extends RegisterStates {
  final dynamic error;

  CreateUserErrorStates(this.error);
}
