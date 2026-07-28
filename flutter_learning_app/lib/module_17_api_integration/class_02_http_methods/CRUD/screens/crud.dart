import 'package:flutter/material.dart';
import 'package:module_09_flutter_basics/module_17_api_integration/class_02_http_methods/CRUD/controller/product_controller.dart';
import 'package:module_09_flutter_basics/module_17_api_integration/class_02_http_methods/CRUD/model/product_model.dart';

// StatefulWidget is used because the product list changes after API calls.
class Crud extends StatefulWidget {
  const Crud({super.key});

  @override
  State<Crud> createState() => _CrudState();
}

class _CrudState extends State<Crud> {

  // Handles API requests and stores the products received from the server.
  ProductController productController = ProductController();
 
  // Loads products from the API and rebuilds the UI with the new list.
  Future fetchData() async {
    await productController.getProduct();

    // setState() rebuilds the GridView after the product list changes.
    setState(() {
      
    });
  }
  
  @override
  void initState() {
    // initState() runs once when this page is created.
    super.initState();

    // Loads the existing products when the page opens.
    fetchData();
  }

  // Opens a dialog for collecting the information of a new product.
  productDialog(){
    // Each controller reads the text entered into its TextField.
    TextEditingController productNameController = TextEditingController();
    TextEditingController productIMGController = TextEditingController();
    TextEditingController productQTYController = TextEditingController();
    TextEditingController productUnitPriceController = TextEditingController();
    TextEditingController productTotalPriceController = TextEditingController();

    showDialog(context: context, builder: (context) => AlertDialog(
      title: Text("Create Product"),
      content: Column(
        // Keeps the dialog only as tall as its content needs.
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: productNameController,
            decoration: InputDecoration(
              labelText: 'name',
            ),
          ),

          SizedBox(height: 10,),
          TextField(
            controller: productIMGController,
            decoration: InputDecoration(
              labelText: 'Image',
            ),
          ),

          SizedBox(height: 10,),
          TextField(
            controller: productQTYController,
            decoration: InputDecoration(
              labelText: 'QTY',
            ),
          ),

          SizedBox(height: 10,),
          TextField(
            controller: productUnitPriceController,
            decoration: InputDecoration(
              labelText: 'Unit price',
            ),
          ),

          SizedBox(height: 10,),

          TextField(
            controller: productTotalPriceController,
            decoration: InputDecoration(
              labelText: 'Total price',
            ),
          ),

          SizedBox(height: 10,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: (){}, 
                child: Text("Cancel")),
              
              ElevatedButton(
                onPressed: () async{
                  // Creates a Data object from the entered values and sends it to the API.
                  productController.createProduct(Data(
                    productName : productNameController.text,
                    img: productIMGController.text,

                    // TextField values are Strings, so int.parse() converts numeric inputs.
                    qty: int.parse(productQTYController.text),
                    unitPrice: int.parse(productTotalPriceController.text),
                    totalPrice: int.parse(productTotalPriceController.text)
                    )
                  );

                  // Requests the latest product list and rebuilds the screen.
                  await fetchData();

                  // Closes the dialog and returns to the product page.
                  Navigator.pop(context);
                }, 
                child: Text("Submit"))
            ],
          )

        ],
      ),
    )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product List CRUD"),
        backgroundColor: Colors.blue,
      ),

      // Builds product cards from the list stored in ProductController.
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          childAspectRatio: 0.83
          ), 
        itemCount: productController.products.length,
        itemBuilder: (context, index){
          // Gets the current product object for this grid position.
          final items = productController.products[index];
          return Column(
            children: [
              SizedBox(
                height: 140,
                child: 
                  // Loads the product image from its online URL.
                  Image.network(items.img.toString()),   
              ),
              Text(items.productName.toString(), style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold
              ),),
              Text("Price -${items.totalPrice} ", style: TextStyle(
               color: Colors.deepPurpleAccent
              ),),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: (){}, 
                    icon: Icon(Icons.edit_note, color: Colors.orange,)),

                  IconButton(
                    onPressed: (){}, 
                    icon: Icon(Icons.delete, color: Colors.red,))
                ],
              )
            ],
          );
        }),

        // Opens the create-product dialog when the add button is pressed.
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            productDialog();
          }, 
          child: Icon(Icons.add)),
    );
  }
}
