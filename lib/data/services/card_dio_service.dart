import 'package:banking/data/models/card_model.dart';
import 'package:dio/dio.dart';

class CardDioService {
  final dio = Dio()
    ..options = BaseOptions(
        baseUrl: "https://lesson66-e0c3e-default-rtdb.firebaseio.com");

  Future<List<CardModel>> getCards() async {
    try {
      final response = await dio.get('/cards.json');

      final Map<String, dynamic> data = response.data as Map<String, dynamic>;
      List<CardModel> cards = data.entries.map((entry) {
        var data = entry.value as Map<String, dynamic>;

        data['id'] = entry.key;
        return CardModel.fromJson(data);
      }).toList();

      return cards;
    } on DioException catch (e) {
      print('DioException: ${e.message}');
      rethrow;
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }

  Future<void> addCard(CardModel card) async {
    try {
      final response = await dio.post('/cards.json', data: card.toJson());
      print(response.data);
    } on DioException catch (e) {
      print('DioException: ${e.message}');
      rethrow;
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }

  Future<void> deleteCard(String id) async {
    try {
      final response = await dio.delete('/cards/$id.json');
      print(response.data);
    } on DioException catch (e) {
      print('DioException: ${e.message}');
      rethrow;
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }
}
