import 'package:dartz/dartz.dart';

import '../../../../core/shared/utils/connectivity.dart';
import '../entities/asset_variation.dart';
import '../errors/errors.dart';
import '../interfaces/domain/get_asset_usecase.dart';
import '../interfaces/infra/asset_repository.dart';

class GetAssetUseCaseImpl implements GetAssetUseCase {
  final AssetRepository repository;

  GetAssetUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, List<AssetVariation>>> call() async {
    try {
      if (await VerifyConnectivity.isConnected()) {
        return await repository.getAsset();
      } else {
        return left(NoConnection());
      }
    } catch (e) {
      return left(Failure(message: e));
    }
  }
}
