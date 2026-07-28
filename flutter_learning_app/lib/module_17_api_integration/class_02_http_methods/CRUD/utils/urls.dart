// Keeps all API addresses in one place so they can be reused easily.
class Urls{
  // The common server address used by every product endpoint.
  static String baseURL = 'https://crud-api-ostad-live.onrender.com/api/v1';

  // Endpoint used by the GET request to receive all products.
  static String readProductURL = '$baseURL/ReadProduct';

  // Endpoint used by the POST request to create a new product.
  static String createProductURL = '$baseURL/CreateProduct';
}
