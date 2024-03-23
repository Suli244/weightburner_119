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
  getChallenges() async {
    await repo.setChallenges();
    emit(const ChallengesState.loading());
    try {
      final challengesList = await repo.getChallenges();

      emit(ChallengesState.success(List.from(challengesList)));
    } catch (e) {
      emit(ChallengesState.error(e.toString()));
    }
  }

  // saveStarChallenges(int id, double star) async {
  //   await repo.saveStarChallenges(id, star);
  //   getChallenges();
  // }
}
