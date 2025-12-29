import 'package:appointment_app/core/env/environment.dart';
import 'package:appointment_app/core/env/environment_config.dart';
import 'main.dart';

void main() {
  EnvironmentConfig.current = Environment.production;
  startApp();
}
