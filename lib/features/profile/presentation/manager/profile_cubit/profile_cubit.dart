import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:foody/constants.dart';
import 'package:foody/features/profile/data/models/user_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  Future<void> getUserData(String email) async {
    emit(ProfileLoading());
    try {
      CollectionReference user =
          FirebaseFirestore.instance.collection(kUsersCollectionReference);
      var userData = await user.doc(email).get();

      emit(ProfileSuccess(UserModel.fromJson(userData)));
    } catch (e) {
      emit(ProfileFailure(e.toString()));
    }
  }
}
