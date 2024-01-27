import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:foody/constants.dart';
import 'package:foody/features/profile/data/models/user_model.dart';
import 'package:hive/hive.dart';

part 'get_delivery_data_state.dart';

class GetDeliveryDataCubit extends Cubit<GetDeliveryDataState> {
  GetDeliveryDataCubit() : super(GetDeliveryDataInitial());

  Future<void> getDeliveryData() async {
    emit(GetDeliveryDataLoading());
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection(kUsersCollectionReference);
      var data = await users.get();
      List<UserModel> tempList = [];
      var box = Hive.box(kEmail);
      for (var doc in data.docs) {
        UserModel comingData = UserModel.fromJson(doc);
        if (comingData.email != box.get(kEmail)) {
          tempList.add(UserModel.fromJson(doc));
        }
      }
      emit(GetDeliveryDataSuccess(tempList));
    } catch (e) {
      emit(GetDeliveryDataFailure(e.toString()));
    }
  }
}
