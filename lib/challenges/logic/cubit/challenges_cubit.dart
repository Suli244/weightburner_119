import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weightburner_119/challenges/logic/model/challenges_hive_model.dart';
import 'package:weightburner_119/challenges/logic/repositories/challenges_repo.dart';
part 'challenges_state.dart';
part 'challenges_cubit.freezed.dart';

class ChallengesCubit extends Cubit<ChallengesState> {
  ChallengesCubit(this.repo) : super(const ChallengesState.loading()) {
    getChallenges();
  }
  final ChallengesRepo repo;
  Future<void> getChallenges() async {
    await repo.setChallenges();
    emit(const ChallengesState.loading());
    try {
      final challengesList = await repo.getChallenges();

      emit(ChallengesState.success(List.from(challengesList)));
    } catch (e) {
      emit(ChallengesState.error(e.toString()));
    }
  }

  Future<void> saveChallengeButton(int id, int sss) async {
    await repo.saveChallengeButton(id, sss);
    getChallenges();
  }

  Future<void> setAllCheckDaysTrue() async {
    await repo.setAllCheckDaysTrue();
    getChallenges();
  }
}
