import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import '../../../../../constants.dart';

part 'item_handler_state.dart';

class ItemHandlerCubit extends Cubit<ItemHandlerState> {
  ItemHandlerCubit() : super(ItemHandlerInitial());

  Future<void> checkExistence(
      {required String email, required String id}) async {
    emit(ItemHandlerLoading());
    try {
      CollectionReference cart = FirebaseFirestore.instance
          .collection(email + kCartCollectionReference);
      await cart.doc(id).get().then((doc) {
        if (doc.exists) {
          emit(const ItemHandlerSuccess(true));
        } else {
          emit(const ItemHandlerSuccess(false));
        }
      });
    } catch (e) {
      emit(ItemHandlerFailure(e.toString()));
    }
  }
}
