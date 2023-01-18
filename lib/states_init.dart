import 'package:csi_hackathon/states.dart';
import 'package:get_it/get_it.dart';

class GetItRegister {
  Future initializeGlobalStates() async {
    GetIt.I.registerLazySingleton<States>(() => States());
    //lazy singleton won't be initialized until its resource is used for the first time
  }
}
