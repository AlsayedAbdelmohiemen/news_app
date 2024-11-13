import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/pages/home_page/category_view.dart';
import 'package:news_app/pages/home_page/widget/drawer.dart';
import 'package:news_app/pages/home_page/widget/grid_view_item_widget.dart';

import '../../models/category_model.dart';

class HomeView extends StatefulWidget {
  static const String routeName = "home";

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<CategoryModel> categoriesList = [
    CategoryModel(
        id: "sports",
        title: "Sports",
        image: "assets/images/sports.png",
        backgroundColor: Color(0xFFC91C22)),
    CategoryModel(
        id: "politics",
        title: "Politics",
        image: "assets/images/politics.png",
        backgroundColor: Color(0xFF003E90)),
    CategoryModel(
        id: "health",
        title: "Health",
        image: "assets/images/health.png",
        backgroundColor: Color(0xFFED1E79)),
    CategoryModel(
        id: "business",
        title: "Business",
        image: "assets/images/bussines.png",
        backgroundColor: Color(0xFFCF7E48)),
    CategoryModel(
        id: "environment",
        title: "Environment",
        image: "assets/images/environment.png",
        backgroundColor: Color(0xFF4882CF)),
    CategoryModel(
        id: "science",
        title: "Science",
        image: "assets/images/science.png",
        backgroundColor: Color(0xFFF2D352))
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage("assets/images/pattern.png"),
              fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(selectedcategory==null?"News App":selectedcategory!.title),
        ),
        drawer:  DrawerWidget(selectedcategor: selectedcategory, onPressed: onPressed),
        backgroundColor: Colors.transparent,
        body:selectedcategory==null? Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pick your category \n of interest",
                textAlign: TextAlign.start,
                style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 7 / 8),
                  itemBuilder: (context, index) => GridViewItemWidget(
                    categoryModel: categoriesList[index],
                    index: index,
                    onClicked: onClicked,
                  ),
                  itemCount: categoriesList.length,
                ),
              )
            ],
          ),
        ):CategoryView(selected :selectedcategory!),
      ),
    );
  }

CategoryModel? selectedcategory;

  onClicked(CategoryModel categoryModel) {
    print("hallo ya shbab...");
    selectedcategory = categoryModel;
    setState(() {

    });
  }
  onPressed(){
  setState(() {
    selectedcategory = null;
    Navigator.pop(context);
  });
  }
}
