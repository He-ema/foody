import 'package:dartz/dartz.dart';
import 'package:foody/features/home/data/models/product_model/product_model.dart';

import '../failures/failures.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ProductModel>>> getAllProducts();
}
