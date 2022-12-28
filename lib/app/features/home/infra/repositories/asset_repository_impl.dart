import 'package:dartz/dartz.dart';

import '../../domain/entities/asset_variation.dart';
import '../../domain/errors/errors.dart';
import '../../domain/interfaces/infra/asset_repository.dart';
import '../interfaces/asset_datasource.dart';

class AssetRepositoryImpl implements AssetRepository {
  final AssetDatasource datasource;

  AssetRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, List<AssetVariation>>> getAsset() async {
    try {
      return right(await datasource.getAsset());
    } catch (e) {
      if (e is Failure) {
        return left(e);
      }
      return left(Failure(message: e));
    }
  }
}
