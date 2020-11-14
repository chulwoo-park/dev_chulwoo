import 'package:dev_chulwoo/platform/domain/repository.dart';

import 'di/inject.dart';
import 'platform/domain/model.dart';

export 'platform/domain/model.dart';

Platform get platform => inject<PlatformRepository>().getPlatform();
