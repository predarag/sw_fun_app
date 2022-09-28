import 'package:sw_fun_app/core/config/build_config.dart';
import 'package:sw_fun_app/core/enums/enviorment.dart';
import 'package:sw_fun_app/main.dart';

Future<void> main() async {
  BuildConfig().setEnvironment(Environment.dev);
  mainDelegate();
}
