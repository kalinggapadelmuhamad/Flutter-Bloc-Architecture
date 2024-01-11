import "package:flutter_bloc/flutter_bloc.dart";

import "package:flutter_ecatalog/data/datasource/auth_datasource.dart";
import "package:flutter_ecatalog/data/models/request/register_request_model.dart";
import "package:flutter_ecatalog/data/models/response/register_response_model.dart";

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthDataSource dataSource;
  RegisterBloc(
    this.dataSource,
  ) : super(RegisterInitial()) {
    on<DoRegister>((event, emit) async {
      emit(RegisterLoading());
      final result = await dataSource.register(event.model);
      result.fold(
        (l) {
          emit(RegisterError(message: "Registerasi Gagal"));
        },
        (r) {
          emit(RegisterLoaded(model: r));
        },
      );
    });
  }
}
