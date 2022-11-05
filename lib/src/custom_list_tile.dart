import 'package:flutter/material.dart';

// class CustomListTile extends StatelessWidget {
//   CustomListTile(String title, String singer, String cover,
//       {Key? key, required singer, required title})
//       : super(key: key);
//
//   String? title;
//   String? cover;
//   String? singer;
//
//   @override
//   Widget build(BuildContext context) {

Widget customListTile({
  required String title,
  required String singer,
  required String cover,
  onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: NetworkImage(cover),
                )),
          ),
          const SizedBox(width: 10),
          Column(children: [
            Text(title),
            const SizedBox(height: 5),
            Text(singer),
          ])
        ],
      ),
    ),
  );
}
