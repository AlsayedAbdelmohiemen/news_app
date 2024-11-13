import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/theme/my_theme.dart';

import '../../../models/category_model.dart';
import 'drawer_item.dart';

class DrawerWidget extends StatelessWidget {
  CategoryModel? selectedcategor;
  Function? onPressed;

  DrawerWidget({required this.selectedcategor, required this.onPressed, });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Use constraints to size and position your widgets
        return Scaffold(
          body: Container(
            width: constraints.maxWidth * 0.8,
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: constraints.maxHeight * 0.2, // Adjust as needed
                  color: MyTheme.lightTheme.primaryColor,
                  child: Text(
                    "News App!",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                SizedBox(
                  height: 25,
                ),
                DrawerITem(title: 'Categories', iconData: Icons.list, onClick: () {
                  if(onPressed != null) {
                    onPressed!();
                  }

                },),
                SizedBox(
                  height: 15,
                ),
                DrawerITem(title: 'Settings', iconData:  Icons.settings, onClick: () {},),


                // Add more widgets as needed
              ],
            ),
          ),
        );
      },
    );
  }
}
