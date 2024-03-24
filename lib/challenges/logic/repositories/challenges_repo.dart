import 'package:hive_flutter/hive_flutter.dart';
import 'package:weightburner_119/challenges/logic/model/challenges_hive_model.dart';

abstract class ChallengesRepo {
  Future<List<ChallengesContent>> getChallenges();
  Future<void> setChallenges();
  saveChallengeButton(int id, int sss);
  setAllCheckDaysTrue();
}

class ChallengesRepoImpl implements ChallengesRepo {
  @override
  Future<List<ChallengesContent>> getChallenges() async {
    final challengesBox =
        await Hive.openBox<ChallengesContent>('ChallengesBox');
    return challengesBox.values.toList();
  }

  @override
  saveChallengeButton(int id, int sss) async {
    final challengesBox =
        await Hive.openBox<ChallengesContent>('ChallengesBox');
    final dsdsvpsvdfb = challengesBox.values.toList().singleWhere((e) => e.id == id);
    dsdsvpsvdfb.daysLeft = sss;
    dsdsvpsvdfb.chekDay = false;
    dsdsvpsvdfb.save();
  }

  @override
  setAllCheckDaysTrue() async {
    final challengesBox =
        await Hive.openBox<ChallengesContent>('ChallengesBox');
    final challenges = challengesBox.values.toList();
    for (var challenge in challenges) {
      challenge.chekDay = true;
      await challenge.save();
    }
  }

  @override
  Future<void> setChallenges() async {
    final challengesBox =
        await Hive.openBox<ChallengesContent>('ChallengesBox');
    if (challengesBox.isEmpty) {
      List<ChallengesContent> listChallengesContent = [
        ChallengesContent(
          id: 1,
          image: 'assets/images/st1.png',
          title: 'Stand in plank position for 2 minutes',
          status: 'Challenge not started',
          daysPassed: 7,
          daysLeft: 0,
          chekDay: true,
          sp: false,
        ),
        ChallengesContent(
          id: 2,
          image: 'assets/images/st2.png',
          title: 'Walk 10 000 steps',
          status: 'Challenge not started',
          daysPassed: 5,
          daysLeft: 0,
          chekDay: true,
          sp: false,
        ),
        ChallengesContent(
          id: 3,
          image: 'assets/images/st3.png',
          title: 'Stretching before bed',
          status: 'Challenge not started',
          daysPassed: 6,
          daysLeft: 0,
          chekDay: true,
          sp: false,
        ),
        ChallengesContent(
          id: 4,
          image: 'assets/images/st4.png',
          title: 'Morning walk',
          status: 'Challenge not started',
          daysPassed: 7,
          daysLeft: 0,
          chekDay: true,
          sp: false,
        ),
        ChallengesContent(
          id: 5,
          image: 'assets/images/st5.png',
          title: 'Training at the gym',
          status: 'Challenge not started',
          daysPassed: 4,
          daysLeft: 0,
          chekDay: true,
          sp: false,
        ),
        ChallengesContent(
          id: 6,
          image: 'assets/images/st6.png',
          title: 'Ride a bike 2 kilometers',
          status: 'Challenge not started',
          daysPassed: 5,
          daysLeft: 0,
          chekDay: true,
          sp: false,
        ),

        ///===
        ChallengesContent(
          id: 7,
          image: 'assets/images/hl1.png',
          title: 'Day without sugar',
          status: 'Challenge not started',
          daysPassed: 7,
          daysLeft: 0,
          chekDay: true,
          sp: true,
        ),
        ChallengesContent(
          id: 8,
          image: 'assets/images/hl2.png',
          title: 'Take vitamins',
          status: 'Challenge not started',
          daysPassed: 5,
          daysLeft: 0,
          chekDay: true,
          sp: true,
        ),
        ChallengesContent(
          id: 9,
          image: 'assets/images/hl3.png',
          title: 'No smoking day',
          status: 'Challenge not started',
          daysPassed: 6,
          daysLeft: 0,
          chekDay: true,
          sp: true,
        ),
        ChallengesContent(
          id: 10,
          image: 'assets/images/hl4.png',
          title: 'Drink 2 liters of water',
          status: 'Challenge not started',
          daysPassed: 7,
          daysLeft: 0,
          chekDay: true,
          sp: true,
        ),
        ChallengesContent(
          id: 11,
          image: 'assets/images/hl5.png',
          title: 'Don`t use phone 2 hours before bed',
          status: 'Challenge not started',
          daysPassed: 4,
          daysLeft: 0,
          chekDay: true,
          sp: true,
        ),
        ChallengesContent(
          id: 12,
          image: 'assets/images/hl6.png',
          title: 'Go to bed at 22:00 PM',
          status: 'Challenge not started',
          daysPassed: 5,
          daysLeft: 0,
          chekDay: true,
          sp: true,
        ),
      ];
      await challengesBox.addAll(listChallengesContent);
    }
  }

  // @override
  // Future<void> deleteAllChallenges() async {
  //   final challengesBox = await Hive.openBox<ChallengesContent>('ChallengesBox');

  //   // Delete all items in the box
  //   await challengesBox.clear();

  //   // Compact the box
  //   await challengesBox.compact();
  // }
}
