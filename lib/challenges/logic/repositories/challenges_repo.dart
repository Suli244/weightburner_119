import 'package:hive_flutter/hive_flutter.dart';
import 'package:weightburner_119/challenges/logic/model/challenges_hive_model.dart';

abstract class ChallengesRepo {
  Future<List<ChallengesHiveModel>> getChallenges();
  Future<void> setChallenges();
  saveStarChallenges(int id, double star);
}

class ChallengesRepoImpl implements ChallengesRepo {
  @override
  Future<List<ChallengesHiveModel>> getChallenges() async {
    final challengesBox = await Hive.openBox<ChallengesHiveModel>('ChallengesBox');
    return challengesBox.values.toList();
  }

  @override
  saveStarChallenges(int id, double star) async {
    final challengesBox = await Hive.openBox<ChallengesHiveModel>('ChallengesBox');
    final model = challengesBox.values.toList().singleWhere((e) => e.id == id);
    model.stars = star;
    model.save();
  }

  @override
  Future<void> setChallenges() async {
    final challengesBox = await Hive.openBox<ChallengesHiveModel>('ChallengesBox');
    if (challengesBox.isEmpty) {
      List<ChallengesHiveModel> listChallenges = [
        ChallengesHiveModel(
          id: 0,
          image:
              'https://assets.bwbx.io/images/users/iqjWHBFdfxIU/iKjOpxBj7i7U/v1/-1x-1.jpg',
          data: '23.01.2024',
          lang: 'EN',
          stars: 4.5,
          title:
              'Wonderful Challenges about economics sphere in deep inside of beach beach',
          description:
              '''Lorem ipsum dolor sit amet consectetur. In lorem sed metus consectetur quis. Integer proin quisque enim commodo mi vel enim mauris quisque. Vel rutrum placerat vestibulum nulla lorem nisl eget dictum. A vitae sed amet risus orci. Laoreet etiam at quis quis egestas pellentesque nibh amet. Aenean pretium ultricies massa nibh amet consequat.''',
        ),
        ChallengesHiveModel(
          id: 1,
          image:
              'https://earth.org/wp-content/uploads/2023/07/Untitled-683-%C3%97-1024px-1024-%C3%97-683px-2023-07-12T154605.688-1200x900.jpg',
          data: '24.01.2024',
          lang: 'EN',
          stars: 4.3,
          title: 'Innovations in renewable energy sources mark a new era',
          description:
              '''Viverra maecenas accumsan lacus vel facilisis volutpat est velit. Ut placerat orci nulla pellentesque dignissim enim sit amet. Amet nisl suscipit adipiscing bibendum est ultricies integer. Lacus suspendisse faucibus interdum posuere lorem ipsum dolor sit amet. Consectetur adipiscing elit duis tristique sollicitudin nibh sit.''',
        ),
        ChallengesHiveModel(
          id: 2,
          image:
              'https://static01.nyt.com/images/2023/09/10/business/10Face-glasses-promo-sub/10Face-glasses-promo-sub-popup.png',
          data: '25.01.2024',
          lang: 'EN',
          stars: 3.7,
          title: 'Global tech giants announce groundbreaking collaboration',
          description:
              '''Amet massa vitae tortor condimentum lacinia quis vel eros donec. Lacus viverra vitae congue eu consequat ac felis donec. Sit amet consectetur adipiscing elit pellentesque habitant morbi tristique senectus. Sed blandit libero volutpat sed cras ornare arcu dui.''',
        ),
        ChallengesHiveModel(
          id: 3,
          image: 'https://thred.com/wp-content/uploads/2023/09/robot.png',
          data: '26.01.2024',
          lang: 'EN',
          stars: 4.4,
          title:
              'Exploring the depths of ocean biodiversity with new submarine technology',
          description:
              '''Pellentesque elit eget gravida cum sociis natoque penatibus et magnis. Nulla facilisi nullam vehicula ipsum a arcu cursus vitae. Nulla malesuada pellentesque elit eget gravida cum sociis. Nunc congue nisi vitae suscipit tellus mauris a diam maecenas.''',
        ),
        ChallengesHiveModel(
          id: 4,
          image:
              'https://wp.technologyreview.com/wp-content/uploads/2021/01/image001.jpg',
          data: '27.01.2024',
          lang: 'EN',
          stars: 4.2,
          title:
              'Breakthrough in AI technology promises to revolutionize industries',
          description:
              '''Sit amet cursus sit amet dictum sit amet justo donec. Enim blandit volutpat maecenas volutpat blandit aliquam etiam erat velit. At imperdiet dui accumsan sit amet. Nulla malesuada pellentesque elit eget gravida.''',
        ),
        ChallengesHiveModel(
          id: 5,
          image:
              'https://nieuws.kuleuven.be/en/content/2014/ancient-dinner-tables-found-at-archaeological-dig-site-shed-new-light-on-roman-food-culture/image',
          data: '28.01.2024',
          lang: 'RU',
          stars: 4.5,
          title:
              'New archaeological discovery sheds light on ancient civilizations',
          description:
              '''Sed adipiscing diam donec adipiscing tristique risus nec feugiat in. Fermentum posuere urna nec tincidunt praesent semper feugiat nibh. Sed vulputate odio ut enim blandit volutpat.''',
        ),
        ChallengesHiveModel(
          id: 6,
          image:
              'https://www.aamc.org/sites/default/files/d/1/66-aamc-Challenges-rare-diseases-hero.jpg__992x558_q85_crop-smart_subsampling-2_upscale.jpg',
          data: '29.01.2024',
          lang: 'EN',
          stars: 4.8,
          title:
              'Advancements in medical research offer hope for curing rare diseases',
          description:
              '''Mauris in aliquam sem fringilla ut morbi tincidunt augue interdum. Velit scelerisque in dictum non consectetur a erat nam. At in tellus integer feugiat scelerisque varius morbi enim nunc.''',
        ),
        ChallengesHiveModel(
          id: 7,
          image:
              'https://bondvigilantes.com/wp-content/uploads/2023/05/1-emerging-market-growth.png',
          data: '30.01.2024',
          lang: 'EN',
          stars: 4.1,
          title:
              'Economic forecasts predict significant growth in emerging markets',
          description:
              '''Pharetra magna ac placerat vestibulum lectus mauris ultrices eros in. Aliquam purus sit amet luctus venenatis lectus magna fringilla urna. Porttitor leo a diam sollicitudin tempor id eu nisl nunc.''',
        ),
        ChallengesHiveModel(
          id: 8,
          image:
              'https://www.natureconservancy.ca/assets/images/graphics/nat/infographics/accelerator-infographic-01.png',
          data: '31.01.2024',
          lang: 'EN',
          stars: 3.0,
          title: 'Climate change initiatives to receive unprecedented funding',
          description:
              '''Eget nulla facilisi etiam dignissim diam quis enim lobortis. Aenean et tortor at risus viverra adipiscing at in tellus. Integer feugiat scelerisque varius morbi enim nunc faucibus a pellentesque.''',
        ),
        ChallengesHiveModel(
          id: 9,
          image:
              'https://www.highstuff.com/wp-content/uploads/2023/09/Top-startups.jpg',
          data: '01.02.2024',
          lang: 'EN',
          stars: 4.5,
          title:
              'Tech startups to watch in 2024: Innovations that could change the world',
          description:
              '''Mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Arcu dui vivamus arcu felis bibendum ut tristique et egestas. Sed turpis tincidunt id aliquet risus feugiat in ante metus.''',
        ),
        ChallengesHiveModel(
          id: 10,
          image:
              'https://meadhunt.com/wp-content/uploads/future-of-transpo-1200x675-1.jpg',
          data: '02.02.2024',
          lang: 'EN',
          stars: 4.9,
          title:
              'Major breakthrough in sustainable transportation technologies',
          description:
              '''Lacus luctus accumsan tortor posuere ac ut consequat semper viverra. Maecenas accumsan lacus vel facilisis volutpat est velit egestas dui. Id venenatis a condimentum vitae sapien pellentesque habitant morbi tristique.''',
        ),
        ChallengesHiveModel(
          id: 11,
          image:
              'https://www.itsecurityguru.org/wp-content/uploads/2023/07/ICEInfluencer.png',
          data: '03.02.2024',
          lang: 'EN',
          stars: 4.3,
          title: 'International summit focuses on global cybersecurity threats',
          description:
              '''Morbi tristique senectus et netus et malesuada fames ac turpis. Nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut. Orci a scelerisque purus semper eget duis at tellus at.''',
        ),
        ChallengesHiveModel(
          id: 12,
          image:
              'https://miro.medium.com/v2/resize:fit:1400/1*uFNvR1lZDjT8kFTy3vCLwg.jpeg',
          data: '04.02.2024',
          lang: 'EN',
          stars: 4.7,
          title: 'Exploring space: The next frontier in human discovery',
          description:
              '''Quis vel eros donec ac odio tempor orci dapibus ultrices. In hac habitasse platea dictumst quisque sagittis purus. Lacus suspendisse faucibus interdum posuere lorem ipsum dolor sit amet.''',
        ),
        ChallengesHiveModel(
          id: 13,
          image:
              'https://miro.medium.com/v2/resize:fit:1200/0*-oLGV_VXNRxivsx9.jpg',
          data: '05.02.2024',
          lang: 'EN',
          stars: 4.6,
          title:
              'Revolutionizing education: The rise of digital learning platforms',
          description:
              '''Amet volutpat consequat mauris nunc congue nisi vitae suscipit. Nibh sed sit amet volutpat consequat mauris. Nunc aliquet bibendum enim facilisis gravida neque convallis a cras.''',
        ),
        ChallengesHiveModel(
          id: 14,
          image:
              'https://mmc.co.im/wp-content/uploads/2020/07/The-rise-of-social-media-and-its-impact-on-global-communications.jpg',
          data: '06.02.2024',
          lang: 'EN',
          stars: 4.2,
          title: 'The impact of social media on global communication trends',
          description:
              '''Dui sapien eget mi proin sed libero enim sed faucibus. Turpis egestas integer eget aliquet nibh praesent tristique magna sit. Non sodales neque sodales ut etiam sit amet nisl purus.''',
        ),
      ];
      await challengesBox.addAll(listChallenges);
    }
  }

  // @override
  // Future<void> deleteAllChallenges() async {
  //   final challengesBox = await Hive.openBox<ChallengesHiveModel>('ChallengesBox');

  //   // Delete all items in the box
  //   await challengesBox.clear();

  //   // Compact the box
  //   await challengesBox.compact();
  // }
}
