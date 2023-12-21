abstract class newsStates {}

class newsInitState extends newsStates {}

class newsBottomNavState extends newsStates {}

class newsBottomNavIndexState extends newsStates {}

class getBusinessDataSuccessState extends newsStates {}

class getBusinessDataErrorState extends newsStates {
  late final String error;
  getBusinessDataErrorState(this.error) {
    print(error);
  }
}

class getBusinessLoadingState extends newsStates {}

class getSportsDataSuccessState extends newsStates {}

class getSportsDataErrorState extends newsStates {
  late final String error;
  getSportsDataErrorState(this.error) {
    print(error);
  }
}

class getSportsLoadingState extends newsStates {}

class getScienceDataSuccessState extends newsStates {}

class getScienceDataErrorState extends newsStates {
  late final String error;
  getScienceDataErrorState(this.error) {
    print(error);
  }
}

class getScienceLoadingState extends newsStates {}

class getAllDataSuccessState extends newsStates {}

class getAllDataErrorState extends newsStates {
  late final String error;
  getAllDataErrorState(this.error) {
    print(error);
  }
}

class getAllLoadingState extends newsStates {}

class darkModeState extends newsStates {}
