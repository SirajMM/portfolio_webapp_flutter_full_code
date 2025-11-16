import 'package:flutter/material.dart';
import 'package:mysite/changes/links.dart';
import 'package:mysite/core/util/constants.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Container(
      margin: EdgeInsets.fromLTRB(0, height * 0.05, 0, 10),
      width: width,
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Developed by "),
              InkWell(
                onTap: () => openURL(gitHub),
                child: const Text(
                  "Muhammad Siraj 💙",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const Text(" © 2022"),
            ],
          ),
          SizedBox(height: height / 80),
          Opacity(
            opacity: 0.5,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Made with "),
                InkWell(
                  onTap: () => openURL(flutter),
                  child: const Text(
                    "Flutter",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Opacity(opacity: 0.5, child: FlutterLogo()),
        ],
      ),
    );
  }
}
