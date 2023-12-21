import 'package:flutter/material.dart';
import 'package:news/modules/webview/webview.dart';
import 'package:news/shared/cubit/myNewsCubit.dart';

// sizeBoxHWidget
Widget sizeBoxH(double x) => SizedBox(
      height: x,
    );
// sizeBoxWWidget
Widget sizeBoxW(double x) => SizedBox(
      width: x,
    );
// items for business screen
Widget item(Map<String, dynamic> data, int index, context) {
  return InkWell(
    onTap: () {
      print(data['articles'][index]['url']);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => webview(data['articles'][index]['url'])));
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
              "${data['articles'][index]['urlToImage']}",
            ),
          ),
          sizeBoxW(20),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("${data['articles'][index]['title']}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText2),
                Text(
                  "${data['articles'][index]['publishedAt']}",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget article({required data}) {
  return ListView.separated(
    physics: BouncingScrollPhysics(),
    itemBuilder: (context, index) => item(data, index, context),
    separatorBuilder: (context, index) => Container(
      height: 1,
      color: Colors.grey,
    ),
    itemCount: 10,
  );
}

//defaultButton
Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.teal,
  required Function() function,
  required String text,
}) =>
    Container(
      width: width,
      color: background,
      child: MaterialButton(
        onPressed: function,
        child: Text(text),
      ),
    );
// textFormField
Widget textFormField({
  required TextEditingController controller,
  required TextInputType textInputType,
  required String labelText,
  required Icon prefixIcon,
  required String? Function(String?)? valid,
  bool visible = false,
  bool isClickable = true,
  IconData? suffixIcon,
  Function()? suffixPressed,
  Function? onSubmit,
  onChange,
  Function()? ontap,
}) =>
    TextFormField(
      // initialValue: passwordController.text,
      controller: controller,
      keyboardType: textInputType,
      obscureText: visible,
      // onFieldSubmitted: onSubmit,
      // onChanged: onChange,
      validator: valid,
      onTap: ontap,
      enabled: isClickable,
      onChanged: onChange,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: prefixIcon,
        suffixIcon: IconButton(
          icon: Icon(suffixIcon),
          onPressed: suffixPressed,
        ),
        border: const OutlineInputBorder(),
      ),
    );
