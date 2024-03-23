part of 'challenges_cubit.dart';

@freezed
class ChallengesState with _$ChallengesState {
  const factory ChallengesState.loading() = _Loading;
  const factory ChallengesState.error(String error) = _Error;
  const factory ChallengesState.success(List<ChallengesHiveModel> model) = _Success;
}
