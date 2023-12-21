import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/shared/components/components.dart';
import 'package:news/shared/components/constants.dart';
import 'package:news/shared/cubit/myNewsCubit.dart';
import 'package:news/shared/cubit/myNewsStates.dart';

class search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();
    return BlocConsumer<newsCubit, newsStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                textFormField(
                    controller: search,
                    textInputType: TextInputType.text,
                    labelText: "Search",
                    prefixIcon: Icon(Icons.search),
                    valid: (String? value) {
                      if (value!.isEmpty) {
                        return 'Search must not be empty';
                      }
                      return null;
                    },
                    onChange: (value) {
                      newsCubit.get(context).getSearchData(data: value);
                    }),
                Expanded(child: article(data: allDataConst)
                    // newsCubit.get(context).allData.length == 0
                    //     ? Center(child: CircularProgressIndicator())
                    //     : article(
                    //         data: newsCubit.get(context).allData,
                    //       ),
                    ),
              ],
            ),
          ),
        );
      },
    );
  }
}
