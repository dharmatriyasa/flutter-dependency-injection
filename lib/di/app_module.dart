import 'package:get_injectable/network/comment_service.dart';
import 'package:get_injectable/network/comment_service_impl.dart';
import 'package:get_injectable/network/user_service.dart';
import 'package:get_injectable/network/user_service_impl.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @lazySingleton
  CommentService getCommentService() {
    return CommentServiceImpl();
  }

  @lazySingleton
  UserService getUserService() {
    return UserServiceImpl();
  }
}
