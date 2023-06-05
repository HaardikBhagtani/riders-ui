import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riders_ui/models/user_details.dart';
part 'rider_state.dart';

class RiderCubit extends Cubit<RiderState> {
  RiderCubit() : super(RiderState.initial());

  void addNewRider(UserDetail user) {
    emit(state.copyWith(riders: [...state.riders ?? [], user]));
  }

  void deleteRider(UserDetail user) {
    List<UserDetail> data = [...?state.riders];
    data.remove(user);
    emit(state.copyWith(riders: data));
  }
}
