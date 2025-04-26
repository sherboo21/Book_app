import 'package:education/feature/home/data/model/books.dart';

import '../../../../core/networking/network/network_call.dart';
import '../../../../core/networking/network/result.dart';
import '../repo/home_repo.dart';
import 'home_api_constants.dart';

class HomeServices implements HomeRepository {
  @override
  Future<Result<BooksDataModel>> getBooks() async {
    return await networkCall<BooksDataModel>(
      method: ServerMethods.Get,
      path: HomeApiConstants.allBooksApi,
      fromJson: (data) => BooksDataModel.fromJson(data),
    );
  }
}
