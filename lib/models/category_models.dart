
import 'package:flutter/material.dart';

class CategoryModels{
  String name;
  String iconPath;
  Color boxColor;
  CategoryModels({
    required this.name,
    required this.iconPath,
    required this.boxColor,
});
 static List<CategoryModels> getCategories(){
    List<CategoryModels> categories=[];

    categories.add(
      CategoryModels(name:'Water Purifiers',
          iconPath:'assets/icons/water purifiers.svg' ,
          boxColor:Colors.blue)
      
    );
    categories.add(
        CategoryModels(name:'Iron Removers',
            iconPath:'assets/icons/iron.svg' ,
            boxColor:Colors.lightBlueAccent)

    );
    categories.add(
        CategoryModels(name:'Kitchen Chimneys',
            iconPath:'assets/icons/kitchen.svg' ,
            boxColor:Colors.blue)

    );
    categories.add(
        CategoryModels(name:'Spare Parts',
            iconPath:'assets/icons/kitchen.svg' ,
            boxColor:Colors.lightBlueAccent)

    );



    return categories;
  }
}

