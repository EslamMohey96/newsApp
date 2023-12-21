import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/shared/components/components.dart';
import 'package:news/shared/cubit/myNewsCubit.dart';
import 'package:news/shared/cubit/myNewsStates.dart';
import 'package:news/shared/components/constants.dart';

class sports extends StatelessWidget {
  const sports({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newsCubit, newsStates>(
      listener: (BuildContext context, newsStates state) {},
      builder: (BuildContext context, newsStates state) {
        return //newsCubit.get(context).states.length < 4
            //? Center(  child: CircularProgressIndicator(), ) :
            article(
                data:
                    sportsDataConst); //article(data: newsCubit.get(context).sportsData);
      },
    );
  }
}
