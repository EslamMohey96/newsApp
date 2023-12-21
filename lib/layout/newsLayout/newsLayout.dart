import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/modules/search/search.dart';
import 'package:news/shared/components/components.dart';
import 'package:news/shared/cubit/myNewsCubit.dart';
import 'package:news/shared/cubit/myNewsStates.dart';

class newsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newsCubit, newsStates>(
      listener: (BuildContext context, newsStates state) {},
      builder: (BuildContext context, newsStates state) {
        newsCubit cubit = newsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text("${cubit.title[cubit.indexOfBottomNzvBar]}"),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => search()));
                },
                icon: Icon(
                  Icons.search,
                ),
              ),
              sizeBoxW(10),
              IconButton(
                onPressed: () {
                  cubit.changeDarkMode();
                },
                icon: Icon(
                  Icons.brightness_6_outlined,
                ),
              ),
              sizeBoxW(10),
            ],
          ),
          body: cubit.screens[cubit.indexOfBottomNzvBar],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomItem,
            onTap: (value) {
              cubit.changeIndex(index: value);
            },
            currentIndex: cubit.indexOfBottomNzvBar,
          ),
        );
      },
    );
  }
}
