// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_injectable/di/app_module.dart' as _i7;
import 'package:get_injectable/network/comment_service.dart' as _i3;
import 'package:get_injectable/network/post_service.dart' as _i4;
import 'package:get_injectable/network/post_service_impl.dart' as _i5;
import 'package:get_injectable/network/user_service.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.lazySingleton<_i3.CommentService>(() => appModule.getCommentService());
    gh.factory<_i4.PostService>(() => _i5.PostServiceImpl());
    gh.lazySingleton<_i6.UserService>(() => appModule.getUserService());
    return this;
  }
}

class _$AppModule extends _i7.AppModule {}
