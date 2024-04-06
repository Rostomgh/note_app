import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_data_state.dart';

class GetDataCubit extends Cubit<GetDataState> {
  GetDataCubit() : super(GetDataInitial());
}
