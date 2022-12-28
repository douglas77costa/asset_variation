import 'package:dartz/dartz.dart';

import '../../entities/asset_variation.dart';
import '../../errors/errors.dart';

abstract class GetAssetUseCase {
  Future<Either<Failure, List<AssetVariation>>> call();
}
