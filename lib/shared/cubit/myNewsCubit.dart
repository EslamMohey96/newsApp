import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/modules/business/business.dart';
import 'package:news/modules/science/science.dart';
import 'package:news/modules/sports/sports.dart';
import 'package:news/shared/components/constants.dart';
import 'package:news/shared/cubit/myNewsStates.dart';
import 'package:news/shared/network/local/cacheHelper.dart';
import 'package:news/shared/network/remote/dioHelper.dart';

class newsCubit extends Cubit<newsStates> {
  newsCubit() : super(newsInitState());
  static newsCubit get(context) => BlocProvider.of(context);
  int indexOfBottomNzvBar = 0;
  bool darkMode = false;
  List states = ["0"];
  Map<String, dynamic> allDataCons = allDataConst;
  List title = [
    "Business",
    "Sports",
    "Science",
    "Settings",
  ];
  List<Widget> screens = [
    business(),
    sports(),
    science(),
    // settings(),
  ];
  List<BottomNavigationBarItem> bottomItem = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports_soccer),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science_outlined),
      label: 'Science',
    ),
    // BottomNavigationBarItem(
    //   icon: Icon(Icons.settings),
    //   label: 'Settings',
    // ),
  ];
  void changeDarkMode({isDarkMode}) {
    if (isDarkMode != null) {
      darkMode = isDarkMode;
      emit(darkModeState());
    } else {
      darkMode = !darkMode;
      print(darkMode);
      cacheHelper
          .setData(key: "isDark", value: darkMode)
          .then((value) => emit(darkModeState()));
      emit(darkModeState());
      print(cacheHelper.getData(key: 'isDark'));
    }
  }

  void changeIndex({required index}) {
    indexOfBottomNzvBar = index;
    emit(newsBottomNavIndexState());
  }

  late Map<String, dynamic> businessData;
  void getBusiness(Map<String, dynamic> apiBody) {
    print(states.length);
    print(apiBody);
    emit(getBusinessLoadingState());
    dioHelper
        .getData(
      url: urlMethod,
      queryParameter: apiBody,
    )
        .then((value) {
      print("get is done");
      businessData = value.data;
      print(businessData['totalResults']);
      emit(getBusinessDataSuccessState());
      states.add('1');
      print(states.length);
    }).catchError((onError) {
      emit(getBusinessDataErrorState(onError.toString()));
    });
    ;
  }

  late Map<String, dynamic> sportsData;
  void getSports(Map<String, dynamic> apiBody) {
    print(states.length);
    print(apiBody);
    dioHelper
        .getData(
      url: urlMethod,
      queryParameter: apiBody,
    )
        .then((value) {
      print("get is done");
      sportsData = value.data;
      print(sportsData['totalResults']);
      emit(getSportsDataSuccessState());
      states.add('2');
      print(states.length);
    }).catchError((onError) {
      emit(getSportsDataErrorState(onError.toString()));
    });
    ;
  }

  late Map<String, dynamic> scienceData;
  void getScience(Map<String, dynamic> apiBody) {
    print(states.length);
    print(apiBody);
    dioHelper
        .getData(
      url: urlMethod,
      queryParameter: apiBody,
    )
        .then((value) {
      print("get is done");
      scienceData = value.data;
      print(scienceData['totalResults']);
      emit(getScienceDataSuccessState());
      states.add('3');
      print(states.length);
    }).catchError((onError) {
      emit(getScienceDataErrorState(onError.toString()));
    });
    ;
  }

  late Map<String, dynamic> allData = {};
  void getAllData(String value) {
    allData.clear();
    dioHelper.getData(
      url: urlSearchMethod,
      queryParameter: {
        'q': value,
        'apiKey': '3d7b81f1a1e94dfaadb9eb5cde0a3d65',
      },
    ).then((value) {
      print("get is done");
      allData = value.data;
      print(allData['totalResults']);
      states.add('4');
      print(states.length);
    }).catchError((onError) {
      emit(getAllDataErrorState(onError.toString()));
    });
  }

  Map<String, dynamic> searchData = {
    "status": "ok",
    "totalResults": 302,
    "articles": []
  };
  Map<String, dynamic> getSearchData({required String data}) {
    searchData["articles"] = [];
    for (var i = 0; i < allDataConst["articles"].length; i++) {
      if (allDataCons["articles"][i]["title"].contains(data)) {
        (searchData["articles"]).add(allDataCons["articles"][i]);
      }
    }
    emit(getAllDataSuccessState());
    return searchData;
  }
}
