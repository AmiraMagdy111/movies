// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:movies/clean_architecture/data_source/local/auth_local_data_source.dart'
    as _i741;
import 'package:movies/clean_architecture/data_source/local/auth_sharedPrefs_local_data_source.dart'
    as _i412;
import 'package:movies/clean_architecture/data_source/remote/auth_firebase_remote_data_source.dart'
    as _i869;
import 'package:movies/clean_architecture/data_source/remote/auth_remote_data_source.dart'
    as _i173;
import 'package:movies/clean_architecture/data_source/remote/firebase_firestore_data_source.dart'
    as _i324;
import 'package:movies/clean_architecture/data_source/remote/firebase_firestore_remote_data_source.dart'
    as _i479;
import 'package:movies/clean_architecture/domain/cubit/auth_cubit.dart'
    as _i252;
import 'package:movies/clean_architecture/domain/repository/auth_repository.dart'
    as _i515;
import 'package:movies/clean_architecture/domain/repository/auth_repository_implementation.dart'
    as _i358;
import 'package:movies/tabs/profile_tab/update_profile_cubit.dart' as _i544;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i173.AuthRemoteDataSource>(
      () => _i869.AuthFirebaseRemoteDataSource(),
    );
    gh.lazySingleton<_i324.FirebaseFirestoreDataSource>(
      () => _i479.FirebaseFirestoreRemoteDataSource(),
    );
    gh.singleton<_i741.AuthLocalDataSource>(
      () => _i412.AuthSharedPrefsLocalDataSource(),
    );
    gh.lazySingleton<_i515.AuthRepository>(
      () => _i358.AuthRepositoryImplementation(
        remoteDataSource: gh<_i173.AuthRemoteDataSource>(),
        firestoreRemoteDataSource: gh<_i324.FirebaseFirestoreDataSource>(),
        localDataSource: gh<_i741.AuthLocalDataSource>(),
      ),
    );
    gh.factory<_i544.UpdateProfileCubit>(
      () => _i544.UpdateProfileCubit(gh<_i515.AuthRepository>()),
    );
    gh.singleton<_i252.AuthCubit>(
      () => _i252.AuthCubit(authRepository: gh<_i515.AuthRepository>()),
    );
    return this;
  }
}
