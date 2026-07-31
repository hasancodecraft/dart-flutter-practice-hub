// Stores all product API endpoints in one place.
class Urls{

  // Common server address used by every endpoint.
  static String baseURL = 'https://crud-api-ostad-live.onrender.com/api/v1';

  // Endpoint for reading all products.
  static String readProductURL = '$baseURL/ReadProduct';

  // Endpoint for creating a new product.
  static String createProductURL = '$baseURL/CreateProduct';

  // Builds the delete endpoint for one product ID.
  static String deleteProductURL(String productID) => '$baseURL/DeleteProduct/$productID';
  
  // Builds the update endpoint for one product ID.
  static String updateProductURL(String productID) => '$baseURL/UpdateProduct/$productID';
}