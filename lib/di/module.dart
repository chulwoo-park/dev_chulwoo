import 'package:dev_chulwoo/platform/data/platform.dart';
import 'package:dev_chulwoo/platform/domain/repository.dart';
import 'package:dev_chulwoo/presentation/route/parser.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initDependencies() {
  getIt.registerSingleton<LocationParser>(LocationParserImpl());

  getIt.registerFactory<PlatformRepository>(() => PlatformRepositoryImpl());
}
