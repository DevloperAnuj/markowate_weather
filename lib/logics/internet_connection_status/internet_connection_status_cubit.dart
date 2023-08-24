import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'internet_connection_status_state.dart';

class InternetConnectionStatusCubit extends Cubit<InternetConnectionStatusState> {
  InternetConnectionStatusCubit() : super(InternetConnectionStatusInitial());
}
