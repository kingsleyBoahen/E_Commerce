import 'package:flutter/material.dart';

AppBar productsViewAppBar(BuildContext context, TextStyle titleStyle) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      centerTitle: false,
      iconTheme: IconThemeData(color: Colors.grey[400]),
      automaticallyImplyLeading: false,
      leadingWidth: 80,
      leading: Container(
        margin: EdgeInsets.only(left: 20),
        height: 50,
        width: 50, 
      decoration: BoxDecoration(
      color: Colors.red,
       borderRadius: BorderRadius.circular(10),
       image: DecorationImage(
        fit: BoxFit.cover,
        image: NetworkImage("https://images.unsplash.com/photo-1616356257367-9cd4bf56a45e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDh8fHByb2ZpbGUlMjBwaWN0dXJlc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60")
       ),
      ),
      ),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Hello",
          style: titleStyle,
          ), 

          Text("Kingsley", 
          style: titleStyle,
          ),
        ]
        ),
        actions: [ SizedBox(child: Icon(Icons.notifications)) ],
    );
  }