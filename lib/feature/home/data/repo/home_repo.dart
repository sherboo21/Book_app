import 'package:education/feature/home/data/model/books.dart';

import '../../../../core/networking/network/result.dart';

abstract class HomeRepository {
  Future<Result<BooksDataModel>> getBooks();
}
