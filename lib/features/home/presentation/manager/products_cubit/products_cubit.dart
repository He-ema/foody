import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foody/features/home/data/models/product_model/product_model.dart';
import 'package:foody/features/home/data/repo/home_repo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.homeRepo) : super(ProductsInitial());
  final HomeRepo homeRepo;
  Future<void> getAllHomeProducts() async {
    emit(ProductsLoading());
    var result = await homeRepo.getAllProducts();
    result.fold((failure) {
      emit(ProductsFailure(failure.errorMessage));
    }, (products) {
      emit(ProductsSuccess(products));
    });
  }
}
