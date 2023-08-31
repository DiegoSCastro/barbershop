import '../../../models/user_model.dart';

enum HomeAdmVmStatus {
  loaded,
  error,
}

class HomeAdmState {
  final HomeAdmVmStatus status;
  final List<UserModel> employees;

  HomeAdmState({
    required this.status,
    required this.employees,
  });

  HomeAdmState copyWith({
    HomeAdmVmStatus? status,
    List<UserModel>? employees,
  }) {
    return HomeAdmState(
      status: status ?? this.status,
      employees: employees ?? this.employees,
    );
  }
}
