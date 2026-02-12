import 'package:get_it/get_it.dart';
import 'package:peng_cafe/core/DB/app_database.dart';
import 'package:peng_cafe/features/login/data/model/login_model.dart';
import 'package:peng_cafe/features/login/data/repositories/login_repository_implement.dart';
import 'package:peng_cafe/features/products/domain/usecases/get_all_product_usecase.dart';
import 'package:peng_cafe/features/products/domain/usecases/get_produtc_usecase.dart';
import 'package:peng_cafe/features/products/presentation/bloc/get_products_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/app/app_preferences.dart';
import '../features/login/data/data_sources/remote/service.dart';

import '../features/login/domain/repositories/login_repository.dart';
import '../features/login/domain/usecase/login.dart';
import '../features/login/presentations/bloc/login_bloc.dart';
import '../features/products/data/repositories/product_repository_implement.dart';
import '../features/products/domain/repositories/product_repository.dart';
import '../features/products/domain/usecases/add_product_usecase.dart';
import '../features/products/domain/usecases/delete_all_product_except_excluding_usecase.dart';
import '../features/products/domain/usecases/delete_all_product_usecase.dart';

import '../features/products/domain/usecases/delete_selected_products_usecase.dart';
import '../features/products/domain/usecases/update_product_usecase.dart';
import '../features/products/presentation/bloc/add_product_bloc.dart';
import '../features/products/presentation/bloc/delete_product_bloc.dart';

import 'resource/connectivity/check_connectivity.dart';
import 'resource/selection_bloc/bloc/selection_bloc.dart';

final getItInstance = GetIt.instance;
Future<void> initializeDependencies() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  getItInstance.registerFactory<AppPreferences>(
    () => AppPreferences(sharedPreferences),
  );
  getItInstance.registerLazySingleton<AppDatabase>(() => AppDatabase());

  getItInstance.registerSingleton<CheckConnectivity>(CheckConnectivity());
  // selection bloc
  getItInstance.registerFactory<SelectionBloc>(() => SelectionBloc());
  // Login Feature
  //service
  getItInstance.registerSingleton<LoginServices>(LoginServices());
  //model
  getItInstance.registerSingleton<LoginModel>(const LoginModel());
  //repository
  getItInstance.registerSingleton<LogInRepository>(
    LogInRepositoryImplements(getItInstance(), getItInstance()),
  );
  //usecase
  getItInstance.registerSingleton<LogInUseCase>(
    LogInUseCase(logInRepository: getItInstance<LogInRepository>()),
  );
  //bloc
  getItInstance.registerFactory<LoginBloc>(() => LoginBloc(getItInstance()));
  // products feature
  //repository
  getItInstance.registerSingleton<ProductRepository>(
    ProductRepositoryImplement(getItInstance()),
  );
  //usecase
  getItInstance.registerSingleton<AddProductUsecase>(
    AddProductUsecase(getItInstance<ProductRepository>()),
  );
  getItInstance.registerSingleton<GetAllProductUsecase>(
    GetAllProductUsecase(getItInstance<ProductRepository>()),
  );
  getItInstance.registerSingleton<GetProdutcUsecase>(
    GetProdutcUsecase(getItInstance<ProductRepository>()),
  );
  getItInstance.registerSingleton<UpdateProductUsecase>(
    UpdateProductUsecase(getItInstance<ProductRepository>()),
  );
  getItInstance.registerSingleton<DeleteSelectedProductsUsecase>(
    DeleteSelectedProductsUsecase(getItInstance<ProductRepository>()),
  );
  getItInstance.registerSingleton<DeleteAllProductUsecase>(
    DeleteAllProductUsecase(getItInstance<ProductRepository>()),
  );
  getItInstance.registerSingleton<DeleteAllProductExceptExcludingUsecase>(
    DeleteAllProductExceptExcludingUsecase(getItInstance<ProductRepository>()),
  );
  //bloc
  getItInstance.registerFactory(
    () => GetProductsBloc(
      getItInstance<GetAllProductUsecase>(),
      getItInstance<GetProdutcUsecase>(),
    ),
  );
  getItInstance.registerFactory(
    () => AddProductBloc(getItInstance<AddProductUsecase>()),
  );
  getItInstance.registerFactory(
    () => DeleteProductBloc(
      getItInstance<DeleteSelectedProductsUsecase>(),
      getItInstance<DeleteAllProductUsecase>(),
      getItInstance<DeleteAllProductExceptExcludingUsecase>(),
    ),
  );
}
