import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerITem extends StatelessWidget {
  String title;
  IconData iconData;
  Function onClick;
  DrawerITem({required this.title, required this.iconData,required this.onClick});



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        onClick();
        },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 4),
        child: Row(
          children: [
            Icon(
              iconData,
              size: 40,
              color: Colors.black,
            ),
            Text(
             title,
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
