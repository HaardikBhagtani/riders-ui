part of 'rider_cubit.dart';

enum RiderStatus { initial, submit, success, error }

class RiderState extends Equatable {
  final RiderStatus status;
  final List<UserDetail>? riders;

  const RiderState({required this.status, required this.riders});

  factory RiderState.initial() {
    return const RiderState(status: RiderStatus.initial, riders: null);
  }

  RiderState copyWith({RiderStatus? status, List<UserDetail>? riders}) {
    return RiderState(
      status: status ?? this.status,
      riders: riders ?? this.riders,
    );
  }

  @override
  List<Object?> get props => [status, riders];
}
