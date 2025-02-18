import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:foody/constants.dart';
import 'package:foody/features/cart/data/models/cart_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  Future<void> getAllCartItems({required String email}) async {
    double total = 0;
    emit(CartLoading());
    try {
      CollectionReference cart = FirebaseFirestore.instance
          .collection(email + kCartCollectionReference);
      var data = await cart.get();
      List<CartModel> tempList = [];
      int index = 0;
      for (var element in data.docs) {
        tempList.add(CartModel.fromJson(element));
        total += tempList[index].price;
        index++;
      }
      emit(CartSuccess(tempList, total));
    } catch (e) {
      emit(CartFailure(e.toString()));
    }
  }
}
