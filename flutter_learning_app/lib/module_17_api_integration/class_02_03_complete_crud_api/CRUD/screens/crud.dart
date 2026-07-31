import 'package:flutter/material.dart';

// Imports the controller that sends product API requests
// and stores the product list received from the server.
import 'package:module_09_flutter_basics/module_17_api_integration/class_02_03_complete_crud_api/CRUD/controller/product_controller.dart';

// Imports the Data model.
// One Data object represents one product.
import 'package:module_09_flutter_basics/module_17_api_integration/class_02_03_complete_crud_api/CRUD/model/product_model.dart';

// StatefulWidget is needed because the product list changes
// after create, read, update, and delete operations.
class Crud extends StatefulWidget {
  const Crud({super.key});

  @override
  State<Crud> createState() => _CrudState();
}

class _CrudState extends State<Crud> {

  // Provides access to the API methods
  // and the products list stored inside ProductController.
  ProductController productController = ProductController();
 
  // Loads the latest products from the server
  // and rebuilds the screen after the data arrives.
  Future<void> fetchData() async {
    
    // Waits until getProduct() finishes receiving
    // and storing the latest products.
    await productController.getProduct();

    // Stops the method if this page was removed
    // while waiting for the API response.
    if (!mounted) return;

    // Rebuilds the GridView using the updated products list.
    setState(() {
      
    });
  }
  
  @override
  // Runs once when this page is first created.
  void initState() {
    
    // Calls the parent State class initialization.
    super.initState();

    // Loads the initial product list when the page opens.
    fetchData();
  }

  // Opens the same dialog for both create and update.
  //
  // isUpdate = true  → Update mode
  // isUpdate = false → Create mode
  //
  // data contains the selected product only in update mode.
  productDialog(bool isUpdate, {Data? data}){
    
    // Each controller stores the text entered
    // into one TextField.
    TextEditingController productNameController = TextEditingController();
    TextEditingController productIMGController = TextEditingController();
    TextEditingController productQTYController = TextEditingController();
    TextEditingController productUnitPriceController = TextEditingController();
    TextEditingController productTotalPriceController = TextEditingController();

  // In update mode, fills the TextFields
  // with the selected product's existing values.
  if(isUpdate){
    productNameController.text = data!.productName.toString();
    productIMGController.text = data!.img.toString();
    productQTYController.text = data!.qty.toString();
    productUnitPriceController.text = data!.unitPrice.toString();
    productTotalPriceController.text = data!.totalPrice.toString();
  }

    // Displays the product form inside an AlertDialog.
    showDialog(context: context, builder: (context) => AlertDialog(
      
      // Shows a different title for create and update modes.
      title: Text( isUpdate ? "Edit Product" : "Create Product"),
      content: Column(
        
        // Makes the Column use only the height
        // required by its children.
        mainAxisSize: MainAxisSize.min,
        children: [
          
          // Input field for the product name.
          TextField(
            controller: productNameController,
            decoration: InputDecoration(
              labelText: 'name',
            ),
          ),

          SizedBox(height: 10,),

          // Input field for the product image URL or image value.
          TextField(
            controller: productIMGController,
            decoration: InputDecoration(
              labelText: 'Image',
            ),
          ),

          SizedBox(height: 10,),

          // Input field for the product quantity.
          TextField(
            controller: productQTYController,
            decoration: InputDecoration(
              labelText: 'QTY',
            ),
          ),

          SizedBox(height: 10,),

          // Input field for the price of one product unit.
          TextField(
            controller: productUnitPriceController,
            decoration: InputDecoration(
              labelText: 'Unit price',
            ),
          ),

          SizedBox(height: 10,),

          // Input field for the total product price.
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
              
              // Closes the dialog without saving any changes.
              TextButton(
                onPressed: (){
                  Navigator.pop(context);
                }, 
                child: Text("Cancel")),
              
              // Creates a new product or updates an existing product
              // depending on the value of isUpdate.
              ElevatedButton(
  onPressed: () async {
  
  // Stores the Boolean result returned by
  // createProduct() or updateProduct().
  //
  // true  → The API request succeeded.
  // false → The API request failed.
  bool isSuccess;

  if (isUpdate) {
    
    // Sends the selected product's ID and
    // the new TextField values to updateProduct().
    isSuccess = await productController.updateProduct(
      
      // Identifies which product should be updated.
      data!.sId.toString(),
      
      // Creates a new Data object containing
      // the updated product values.
      Data(
        
        // Reads the updated product name.
        productName: productNameController.text,
        
        // Reads the updated image value.
        img: productIMGController.text,
        
        // Converts the quantity text into an integer.
        qty: int.parse(productQTYController.text),
        
        // Converts the unit-price text into an integer.
        unitPrice: int.parse(productUnitPriceController.text),
        
        // Converts the total-price text into an integer.
        totalPrice: int.parse(productTotalPriceController.text),
      ),
    );
  } else {
    
    // Creates a new product using the values
    // entered into the TextFields.
    isSuccess = await productController.createProduct(
      Data(
        
        // Reads the new product name.
        productName: productNameController.text,
        
        // Reads the new product image value.
        img: productIMGController.text,
        
        // Converts the quantity text into an integer.
        qty: int.parse(productQTYController.text),
        
        // Converts the unit-price text into an integer.
        unitPrice: int.parse(productUnitPriceController.text),
        
        // Converts the total-price text into an integer.
        totalPrice: int.parse(productTotalPriceController.text),
      ),
    );
  }

  // Refreshes the product list only when
  // the create or update request succeeds.
  if (isSuccess) {
    
    // Loads the latest products and rebuilds the GridView.
    await fetchData();

    // Stops here if this page was removed
    // during the asynchronous operation.
    if (!mounted) return;

    // Closes the dialog after a successful operation.
    Navigator.pop(context);
  } else {
    
    // Shows the correct error message according
    // to the current create or update mode.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isUpdate
              ? "Product update failed"
              : "Product creation failed",
        ),
      ),
    );
  }
},
                
                // Changes the button text according to the current mode.
                child: Text(isUpdate? "Update" : "Submit"))
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

      // Builds one product item for every product
      // stored inside productController.products.
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          
          // Displays two product items in each row.
          crossAxisCount: 2,

          // Adds horizontal space between the grid columns.
          crossAxisSpacing: 10,

          // Controls the width-to-height ratio of each grid item.
          childAspectRatio: 0.83
          ), 

        // Keeps the number of grid items equal
        // to the number of products in the list.
        itemCount: productController.products.length,

        itemBuilder: (context, index){
          
          // Gets the product that belongs
          // to the current GridView index.
          final item = productController.products[index];

          return Column(
            children: [
              SizedBox(
                height: 140,
                child: 
                  
                  // Displays the current product's image.
                  Image.network(item.img.toString()),   
              ),

              // Displays the current product's name.
              Text(item.productName.toString(), style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold
              ),),

              // Displays the current product's total price.
              Text("Price -${item.totalPrice} ", style: TextStyle(
               color: Colors.deepPurpleAccent
              ),),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  
                  // Opens the product dialog in update mode
                  // and sends the clicked product object.
                  IconButton(
                    onPressed: (){
                      productDialog(true, data: item);                      

                    }, 
                    icon: Icon(Icons.edit_note, color: Colors.orange,)),

                  // Deletes the product whose delete button was clicked.
                  IconButton(
                    onPressed: (){
                      
                      /*
                        Sends the clicked product's ID to deleteProduct().

                        deleteProduct() returns Future<bool>.
                        After the request finishes, .then() receives
                        the returned true or false value.
                      */
                      productController.deleteProduct(item.sId.toString()).then((value) async{
                        
                        // Runs when the server reports
                        // that the product was deleted successfully.
                        if(value){
                          
                          // Loads the latest products so that
                          // the deleted item disappears from the UI.
                          await fetchData();

                          // Stops here if this page was removed
                          // while waiting for the latest product list.
                          if (!mounted) return;

                          // Shows a success message.
                          ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(content:Text("Product deleted")) 
                          );
                        
                        // Runs when the delete request fails.
                        } else{
                          
                          // Shows an error message.
                          ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(content:Text("Something went wrong, try again")));
                        }
                      });
                    }, 
                    icon: Icon(Icons.delete, color: Colors.red,))
                ],
              )
            ],
          );
        }),

        // Opens the product dialog in create mode.
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            
            // false tells productDialog() to use create mode.
            productDialog(false);
          }, 
          child: Icon(Icons.add)),
    );
  }
}