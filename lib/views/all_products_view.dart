import 'dart:ui';
import 'package:ecommerce_app/models/products_model.dart';
import 'package:ecommerce_app/network/products_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../commons/widgets.dart';

class AllProductView extends StatefulWidget {
  const AllProductView({Key? key}) : super(key: key);

  @override
  State<AllProductView> createState() => _AllProductViewState();
}

class _AllProductViewState extends State<AllProductView> {
GoodsNetwork _goodsNetwork = GoodsNetwork();

Future<List<ProductModel>>? getProducts;



  @override
  void initState() {
     getProducts = _goodsNetwork.getAllProducts();
    super.initState();
  }

  Widget build(BuildContext context) {
    TextStyle titleStyle = Theme.of(context)
    .textTheme
    .bodyText1!
    .copyWith(fontSize: 18, fontWeight: FontWeight.bold);
    
    var outlineInputBorder = OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      );
    return Scaffold(
      appBar: productsViewAppBar(context, titleStyle),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom:15),
                child: Text("Choose A brand", 
                style: titleStyle,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        border: outlineInputBorder,
                        focusedBorder: outlineInputBorder,
                        hintText: "Search for brand",
                        prefixIcon: Icon(Icons.search, 
                        color: Colors.grey,),
                      ),
                    )
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Material(
                    color: Color(0xff4FAFFA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Icon(Icons.sort),
                    ),
                  ),
                ],
              ),
              
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: ShoeBrands.length,
                  itemBuilder: (context, index) =>
                   Padding(
                     padding: const EdgeInsets.all(5.0),
                     child: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(ShoeBrands[index]),
                     backgroundColor: Colors.grey,),
                   ),
                  ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text("Products", style: titleStyle,),
                  Text("13 items"),
                ],),
              ),
        
              ListView.separated(
                separatorBuilder: (context, index)=>const SizedBox(height: 10),
                physics: NeverScrollableScrollPhysics(),
                itemCount: ShoeBrands.length,
                shrinkWrap: true,
                itemBuilder: (context, index) =>
              ProductsCard(titleStyle: titleStyle)),
              
        
            ],
              ),
        ),
      ),
    );
  }
}

class ProductsCard extends StatelessWidget {
  const ProductsCard({
    Key? key,
    required this.titleStyle,
  }) : super(key: key);


  final TextStyle titleStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 236, 234, 234),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 110,
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
            child: Container(
              height: 120,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(""),
                  fit: BoxFit.fill),
              ),
              // color: Colors.green,
            ),
          ),

           

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Nike",
                style: titleStyle),
                Text("Size:12",
                ),
                Text("Color:red",
                ),
                Text("\$20", 
                style: titleStyle)
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(Icons.favorite_border_outlined),
                Material(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Color(0xff4FAFFA),
                  child: const Padding(
                    padding: EdgeInsets.all(7.0),
                    child: Text(
                      "Add to Cart", 
                    style: TextStyle(color: Colors.white),),
                  ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}


List ShoeBrands = [
  "https://images.unsplash.com/photo-1555274175-75f4056dfd05?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YWRpZGFzJTIwbG9nb3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",

  "https://images.unsplash.com/photo-1617611413968-537a2ba4986d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bmlrZSUyMGxvZ298ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",

  "https://images.unsplash.com/photo-1575537302964-96cd47c06b1b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDZ8fHB1bWElMjBzaG9lcyUyMGxvZ298ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",

  "https://images.unsplash.com/photo-1515955656352-a1fa3ffcd111?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTV8fHB1bWElMjBzaG9lcyUyMGxvZ298ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",

  "https://unsplash.com/photos/lqTDTCiedDA"
  
];