part of 'fetch_top_plans_bloc.dart';

@immutable
sealed class FetchTopPlansState {}

final class FetchTopPlansInitial extends FetchTopPlansState {}

final class FetchTopPlansLoading extends FetchTopPlansState {}

final class FetchTopPlansLoaded extends FetchTopPlansState {
  final List<PlanEntity> topPlans;

  FetchTopPlansLoaded({required this.topPlans});
}

final class FetchTopPlansFailure extends FetchTopPlansState {
  final String errorMessage;

  FetchTopPlansFailure({required this.errorMessage});
}
