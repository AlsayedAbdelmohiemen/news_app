import 'package:flutter/material.dart';
import '../../../models/sources_model.dart';

class TabItem extends StatelessWidget {
source sourses;
bool isSelected;


TabItem(this.sourses, this.isSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color:isSelected? Colors.green : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.green,
        )
        
      ),
      child: Text(
        sourses.name ?? "",
        style: TextStyle( color:isSelected? Colors.white: Colors.green, ),
          ),
    );
  }
}
