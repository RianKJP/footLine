import 'dart:io'; // Permite trabalhar com arquivos do sistema;
import 'package:http/http.dart' as http; // Pacote para trabalhar com requisições HTTP;
import 'package:path/path.dart'; // Fornece funções para manipulação de metadados de arquivos (faltou informação)
import 'package:http_parser/http_parser.dart'; // Faltou informação
import 'package:footline/ui/models/product_model.dart';

class ProductService {

  // Função assíncrona para cadastrar produto, retorna uma response.StatusCode como resultado
  static Future<http.Response> createProduct(ProductModel product) async {

    var url = Uri.parse('http://10.0.2.2:8000/api/produtos/'); // Converte a url como string para uma uri;
    var request = http.MultipartRequest('POST', url); // Cria a requisição POST do tipo MULTIPART/FORM-DATA, para envio de arquivos + dados;

    // Adiciona as informações do produto, ao corpo da requisição;
    request.fields['name'] = product.name; // Nome
    // Verifica de o produto possui descrição;
    if (product.description != null){
      request.fields['description'] = product.description!; // Descrição
    }
    request.fields['price'] = product.price.toString(); // Preço
    request.fields['category_id'] = product.category; // Categoria
    request.fields['stock'] = product.stock.toString(); // Quantidade

    // REVER A PARTE DA IMAGEM
    var imageFile = File(product.image);
    var imageStream = http.MultipartFile(
      'image',
      imageFile.readAsBytes().asStream(),
      imageFile.lengthSync(),
      filename: basename(imageFile.path),
      contentType: MediaType('image', 'jpeg'),
    );

    request.files.add(imageStream);

    var response = await request.send(); // Envia a requisição para a API e retorna um StreamedResponse
    return await http.Response.fromStream(response); // Converte o StreamedResponse em um Response comum e retorna
  }
}