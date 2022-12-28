import 'package:dartz/dartz.dart';

import '../../entities/asset_variation.dart';
import '../../errors/errors.dart';

abstract class AssetRepository {
  Future<Either<Failure, List<AssetVariation>>> getAsset();
}
