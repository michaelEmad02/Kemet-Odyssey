import 'package:kemet_odyssey/core/services/i_services.dart';
import 'package:kemet_odyssey/features/home/data/models/plan_model.dart';
import 'package:kemet_odyssey/features/home/domain/entities/plan_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<PlanEntity>> fetchTopPlans({String endPoint = "Plans"});
}

class HomeRemoteDataSourceImplementation implements HomeRemoteDataSource {
  final IServices iServices;

  HomeRemoteDataSourceImplementation({required this.iServices});

  @override
  Future<List<PlanModel>> fetchTopPlans({String endPoint = "Plans"}) async {
     // DocumentSnapshot
    var data = await iServices.get(endPoint: endPoint);  
    return data.map((doc) => PlanModel.fromMap(doc)).toList();
  }
}
