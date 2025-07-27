import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@module
abstract class HiveModule {
  @lazySingleton
  HiveInterface get hive => Hive;
}
