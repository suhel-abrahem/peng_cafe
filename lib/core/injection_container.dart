import 'package:get_it/get_it.dart';
import 'package:peng_cafe/core/DB/app_database.dart';
import 'package:peng_cafe/features/login/data/model/login_model.dart';
import 'package:peng_cafe/features/login/data/repositories/login_repository_implement.dart';
import 'package:peng_cafe/features/orders/domain/usecases/delete_order_by_id_usecase.dart';
import 'package:peng_cafe/features/orders/domain/usecases/get_order_details_usecase.dart';
import 'package:peng_cafe/features/orders/presentation/bloc/delete_order_by_id_bloc.dart';
import 'package:peng_cafe/features/products/domain/usecases/get_all_product_usecase.dart';
import 'package:peng_cafe/features/products/domain/usecases/get_produtc_usecase.dart';
import 'package:peng_cafe/features/products/presentation/bloc/get_products_bloc.dart';
import 'package:peng_cafe/features/products/presentation/bloc/update_product_bloc.dart';
import 'package:peng_cafe/features/table_page/domain/usecases/get_or_create_order_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/app/app_preferences.dart';
import '../features/login/data/data_sources/remote/service.dart';

import '../features/login/domain/repositories/login_repository.dart';
import '../features/login/domain/usecase/login.dart';
import '../features/login/presentations/bloc/login_bloc.dart';
import '../features/orders/data/repositories/orders_repository_implement.dart';
import '../features/orders/domain/repositories/orders_repository.dart';
import '../features/orders/domain/usecases/get_orders_summary_usecas.dart';
import '../features/orders/presentation/bloc/order_details_bloc.dart';
import '../features/orders/presentation/bloc/orders_bloc.dart';
import '../features/products/data/repositories/product_repository_implement.dart';
import '../features/products/domain/repositories/product_repository.dart';
import '../features/products/domain/usecases/add_product_usecase.dart';
import '../features/products/domain/usecases/delete_all_product_except_excluding_usecase.dart';
import '../features/products/domain/usecases/delete_all_product_usecase.dart';

import '../features/products/domain/usecases/delete_selected_products_usecase.dart';
import '../features/products/domain/usecases/search_products_usecase.dart';
import '../features/products/domain/usecases/update_product_usecase.dart';
import '../features/products/presentation/bloc/add_product_bloc.dart';
import '../features/products/presentation/bloc/delete_product_bloc.dart';

import '../features/table_page/data/repositories/table_repository_implements.dart';
import '../features/table_page/domain/repositories/table_repository.dart';
import '../features/table_page/domain/usecases/add_item_usecase.dart';
import '../features/table_page/domain/usecases/close_order_usecase.dart';
import '../features/table_page/domain/usecases/delete_item_usecase.dart';
import '../features/table_page/domain/usecases/get_order_items_usecase.dart';
import '../features/table_page/domain/usecases/update_item_usecase.dart';
import '../features/table_page/presentation/bloc/table_page_bloc.dart';
import 'resource/connectivity/check_connectivity.dart';
import 'resource/selection_bloc/bloc/selection_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:peng_cafe/features/licensing/domain/repositories/license_cache_storage.dart';
import 'package:peng_cafe/features/licensing/data/services/secure_license_cache_storage.dart';
import 'package:peng_cafe/features/licensing/data/repositories/signed_license_cache.dart';
import 'package:dio/dio.dart';

final getItInstance = GetIt.instance;
Future<void> initializeDependencies() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  // Shared protected storage for login and licensing.
  getItInstance.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );
  const apiBaseUrl = String.fromEnvironment(
    'PENG_API_URL',
    defaultValue: 'http://127.0.0.1:5069',
  );

  getItInstance.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: apiBaseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 15),
        headers: {'Content-Type': 'application/json'},
      ),
    ),
  );
  getItInstance.registerFactory<AppPreferences>(
    () => AppPreferences(sharedPreferences),
  );
  getItInstance.registerLazySingleton<AppDatabase>(() => AppDatabase());

  getItInstance.registerSingleton<CheckConnectivity>(CheckConnectivity());
  // selection bloc
  getItInstance.registerFactory<SelectionBloc>(() => SelectionBloc());
  // Login Feature
  //service
  getItInstance.registerLazySingleton<LoginServices>(
    () => LoginServices(
      getItInstance<Dio>(),
      getItInstance<FlutterSecureStorage>(),
    ),
  );

  getItInstance.registerLazySingleton<LogInRepository>(
    () => LogInRepositoryImplements(getItInstance<LoginServices>()),
  );
  //model
  getItInstance.registerSingleton<LoginModel>(const LoginModel());
  //repository

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
  getItInstance.registerSingleton<SearchProductsUsecase>(
    SearchProductsUsecase(getItInstance<ProductRepository>()),
  );
  //bloc
  getItInstance.registerFactory(
    () => GetProductsBloc(
      getItInstance<GetAllProductUsecase>(),
      getItInstance<GetProdutcUsecase>(),
      getItInstance<SearchProductsUsecase>(),
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
  //end
  //table feature
  //repository
  getItInstance.registerSingleton<TableRepository>(
    TableRepositoryImplements(getItInstance()),
  );
  //usecase
  getItInstance.registerSingleton<GetOrCreateOrderUsecase>(
    GetOrCreateOrderUsecase(getItInstance<TableRepository>()),
  );
  getItInstance.registerSingleton<AddItemUsecase>(
    AddItemUsecase(getItInstance<TableRepository>()),
  );
  getItInstance.registerSingleton<GetOrderItemsUsecase>(
    GetOrderItemsUsecase(getItInstance<TableRepository>()),
  );
  getItInstance.registerSingleton<DeleteItemUsecase>(
    DeleteItemUsecase(getItInstance<TableRepository>()),
  );
  getItInstance.registerSingleton<UpdateItemUsecase>(
    UpdateItemUsecase(getItInstance<TableRepository>()),
  );
  getItInstance.registerSingleton<CloseOrderUsecase>(
    CloseOrderUsecase(getItInstance<TableRepository>()),
  );
  //bloc
  getItInstance.registerFactory(
    () => TablePageBloc(
      getItInstance<GetOrCreateOrderUsecase>(),
      getItInstance<AddItemUsecase>(),
      getItInstance<UpdateItemUsecase>(),
      getItInstance<GetOrderItemsUsecase>(),
      getItInstance<DeleteItemUsecase>(),
      getItInstance<CloseOrderUsecase>(),
    ),
  );
  // orders feature
  //repository
  getItInstance.registerSingleton<OrdersRepository>(
    OrdersRepositoryImpl(getItInstance()),
  );
  //usecase
  getItInstance.registerSingleton<GetOrdersSummaryUsecase>(
    GetOrdersSummaryUsecase(getItInstance<OrdersRepository>()),
  );
  getItInstance.registerSingleton<GetOrderDetailsUsecase>(
    GetOrderDetailsUsecase(getItInstance<OrdersRepository>()),
  );
  getItInstance.registerLazySingleton<DeleteOrderByIdUsecase>(
    () => DeleteOrderByIdUsecase(
      ordersRepository: getItInstance<OrdersRepository>(),
    ),
  );

  //bloc
  getItInstance.registerFactory(
    () => OrdersBloc(getItInstance<GetOrdersSummaryUsecase>()),
  );
  getItInstance.registerFactory(
    () => OrderDetailsBloc(getItInstance<GetOrderDetailsUsecase>()),
  );
  getItInstance.registerFactory<DeleteOrderByIdBloc>(
    () => DeleteOrderByIdBloc(getItInstance<DeleteOrderByIdUsecase>()),
  );
  getItInstance.registerFactory<UpdateProductBloc>(
    () => UpdateProductBloc(getItInstance<UpdateProductUsecase>()),
  );

  getItInstance.registerLazySingleton<LicenseCacheStorage>(
    () => SecureLicenseCacheStorage(getItInstance<FlutterSecureStorage>()),
  );

  getItInstance.registerLazySingleton<SignedLicenseCache>(
    () => SignedLicenseCache(getItInstance<LicenseCacheStorage>()),
  );
}
