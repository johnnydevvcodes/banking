import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'transaction_client.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com')
abstract class TransactionClient {
  factory TransactionClient(Dio dio, {String baseUrl}) = _TransactionClient;

  @GET('/users/{userId}/posts')
  Future getTransactions({@Path() int? userId});

  @POST('/posts')
  Future<String?> postTransaction({@Body() required FormData data});
}
