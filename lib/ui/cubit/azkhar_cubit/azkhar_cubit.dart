import 'package:bloc/bloc.dart';
import 'package:islamicapp/data/models/azkhar_model/azkhar_model.dart';
import 'package:islamicapp/data/repositories/local_repository/azkhar_repository/azkhar_repository_imp.dart';
import 'package:islamicapp/ui/cubit/azkhar_cubit/azkhar_state.dart';

class AzkharCubit extends Cubit<AzkharState<List<Azkhar>>> {
  final AzkharRepositoryImp azkharRepository;

  AzkharCubit({required this.azkharRepository}) : super(const AzkharInitial());

  Future<void> addAzkar(Azkhar zkhar) async {
    try {
      await azkharRepository.addNewZhkar(zkhar);
    } catch (e) {
      emit(Error());
    }
  }

  Future<void> deleteAzkar(Azkhar zkhar) async {
    try {
      await azkharRepository.deleteZhkar(key: zkhar.zkhar!.trim());
      getAllAzkhar();
    } catch (e) {
      emit(Error());
    }
  }

  void getAllAzkhar() async {
    List<Azkhar> azkhar = await azkharRepository.getAllAzhkar();
    emit(const AzkharLoading());
    if (azkhar.isNotEmpty) {
      emit(AzkharGetSuccess(azkhar: azkhar));
    } else {
      emit(Error());
    }
  }

  Future<void> updateAzkar(
      {required Azkhar newZkhar, required Azkhar oldZkhar}) async {
    try {
      await azkharRepository.updateZhkerCounter(
          oldeAzkar: oldZkhar, newAzkar: newZkhar);
    } catch (e) {
      emit(Error());
    }
  }
}
