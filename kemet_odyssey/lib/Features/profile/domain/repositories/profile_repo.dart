import 'package:dartz/dartz.dart';
import 'package:kemet_odyssey/core/domain/entities/place_entity.dart';
import 'package:kemet_odyssey/core/errors/failures.dart';
import 'package:kemet_odyssey/features/auth/data/models/user_model.dart';
import 'package:kemet_odyssey/features/planning/domain/entities/plan_entity.dart';

abstract class ProfileRepo {
  Future<Either<Failure, bool>> checkAuthState();
  Future<Either<Failure, bool>> emailVerfied();
  Either<Failure, UserModel?> getCurrentUser();
  Future<Either<Failure, void>> logout();

  Future<Either<Failure, List<PlaceEntity>>> fetchFavoritePlaces();
  Future<Either<Failure, List<PlanEntity>>> fetchFavoritePlans();
  Future<Either<Failure, List<PlanEntity>>> fetchMyPlans();
}
