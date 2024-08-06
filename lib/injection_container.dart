import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:go_rentals/data/datasources/firebase_car_data_source.dart';
import 'package:go_rentals/data/repositories/car_repository_impl.dart';
import 'package:go_rentals/domain/repositories/car_repository.dart';
import 'package:go_rentals/domain/usecases/get_cars.dart';
import 'package:go_rentals/presentation/bloc/car_bloc.dart';

GetIt getIt = GetIt.instance;

void initInjection(){
  try{
    getIt.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
    getIt.registerLazySingleton<FirebaseCarDataSource>(
            () => FirebaseCarDataSource(firestore: getIt<FirebaseFirestore>())
    );
    getIt.registerLazySingleton<CarRepository>(
            () => CarRepositoryImpl(getIt<FirebaseCarDataSource>())
    );
    getIt.registerLazySingleton<GetCars>(
            () => GetCars(getIt<CarRepository>())
    );
    getIt.registerFactory(() => CarBloc(getCars: getIt<GetCars>()));

  } catch (e){
    rethrow;
  }
}