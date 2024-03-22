class WorkoutsCont {
  final String image;
  final String title;
  final int min;
  final List<Podr> podr;

  WorkoutsCont({
    required this.image,
    required this.title,
    required this.min,
    required this.podr,
  });
}

class Podr {
  final String title;
  final int min;
  final int kcal;
  final String dis;
  Podr({
    required this.title,
    required this.min,
    required this.kcal,
    required this.dis,
  });
}

List<WorkoutsCont> listHome = [
  WorkoutsCont(
    image: 'assets/images/home1.png',
    title: 'Burning belly fat workout',
    min: 15,
    podr: [
      Podr(
        title: 'Reverse Crunches:',
        min: 3,
        kcal: 120,
        dis:
            '''Lie on your back with your knees bent and feet lifted off the floor, creating a 90-degree angle with your hips and knees. Engage your core and lift your hips off the ground towards your chest, then slowly lower them back down. Repeat.''',
      ),
      Podr(
        title: 'Mountain Climbers:',
        min: 3,
        kcal: 120,
        dis:
            '''Start in a plank position, then alternate bringing your knees towards your chest in a running motion. Keep your core engaged throughout the exercise.''',
      ),
      Podr(
        title: 'Leg Raises:',
        min: 3,
        kcal: 120,
        dis:
            '''Lie on your back with your legs straight and hands under your glutes for support. Lift your legs towards the ceiling while keeping them straight, then slowly lower them back down without touching the ground.''',
      ),
      Podr(
        title: 'Burpees:',
        min: 3,
        kcal: 120,
        dis:
            '''Stand with your feet shoulder-width apart, then squat down and place your hands on the ground. Jump your feet back into a plank position, perform a push-up if desired, then jump your feet back towards.''',
      ),
      Podr(
        title: 'Planks:',
        min: 3,
        kcal: 120,
        dis:
            '''Get into a push-up position with your hands directly under your shoulders and your body forming a straight line from head to heels. Hold this position, engaging your core muscles. You can also try side planks to target obliques.''',
      ),
    ],
  ),
  WorkoutsCont(
    image: 'assets/images/home2.png',
    title: 'Burning chest fat workout',
    min: 17,
    podr: [
      Podr(
        title: 'Push-Ups:',
        min: 2,
        kcal: 100,
        dis:
            '''Start in a plank position with your hands slightly wider than shoulder-width apart. Lower your body towards the ground by bending your elbows, then push back up to the starting position.''',
      ),
      Podr(
        title: 'Dumbbell Bench Press:',
        min: 4,
        kcal: 150,
        dis:
            '''Lie on a flat bench with a dumbbell in each hand, palms facing forward. Press the dumbbells straight up towards the ceiling until your arms are fully extended, then lower them back down to chest level.''',
      ),
      Podr(
        title: 'Incline Dumbbell Press:',
        min: 4,
        kcal: 180,
        dis:
            '''Adjust a bench to a 30-45 degree incline. Lie back on the bench with a dumbbell in each hand, arms extended straight up above your chest. Lower the dumbbells down towards your chest, then press them back up to the starting position.''',
      ),
      Podr(
        title: 'Chest Flyes:',
        min: 3,
        kcal: 120,
        dis:
            '''Start in a plank position with your hands slightly wider than shoulder-width apart. Lower your body towards the ground by bending your elbows, then push back up to the starting position.''',
      ),
      Podr(
        title: 'Cable Chest Press:',
        min: 2,
        kcal: 100,
        dis:
            '''Step forward with one foot for stability. Press the handles forward until your arms are fully extended, then bring them back towards your chest.''',
      ),
      Podr(
        title: 'Dumbbell Pullover:',
        min: 2,
        kcal: 100,
        dis:
            '''Lie perpendicular on a bench with only your upper back and shoulders supported. Hold a dumbbell with both hands above your chest, arms slightly bent. Lower the dumbbell back behind your head in a controlled motion until you feel a stretch in your chest and lats.''',
      ),
    ],
  ),
  WorkoutsCont(
    image: 'assets/images/home3.png',
    title: 'Burning arms fat workout',
    min: 14,
    podr: [
      Podr(
        title: 'Triceps Dips:',
        min: 3,
        kcal: 100,
        dis:
            '''Sit on the edge of a chair or bench with your hands placed next to your hips, fingers pointing forward. Lift your hips off the bench and walk your feet forward, keeping your knees bent at a 90-degree angle.''',
      ),
      Podr(
        title: 'Bicep Curls:',
        min: 3,
        kcal: 150,
        dis:
            '''Stand with a dumbbell in each hand, palms facing forward, and arms fully extended by your sides. Keeping your elbows close to your body, curl the weights towards your shoulders, then lower them back down with control.''',
      ),
      Podr(
        title: 'Triceps Kickbacks:',
        min: 4,
        kcal: 180,
        dis:
            '''Hold a dumbbell in each hand and hinge forward at the hips, keeping your back straight and core engaged. Bend your elbows to bring the weights towards your chest, then extend your arms straight back behind you''',
      ),
      Podr(
        title: 'Arm Circles:',
        min: 3,
        kcal: 120,
        dis:
            '''Stand with your feet shoulder-width apart and extend your arms straight out to the sides at shoulder height. Make small circles with your arms, gradually increasing the size of the circles. ''',
      ),
      Podr(
        title: 'Jumping Jacks:',
        min: 1,
        kcal: 80,
        dis:
            '''Stand with your feet together and arms by your sides. Jump your feet out to the sides while simultaneously raising your arms overhead. Jump back to the starting position and repeat for a set duration or number of repetitions.''',
      ),
    ],
  ),
  WorkoutsCont(
    image: 'assets/images/home4.png',
    title: 'Burning legs fat workout',
    min: 12,
    podr: [
      Podr(
        title: 'Squats:',
        min: 3,
        kcal: 130,
        dis:
            '''Stand with your feet hip-width apart and toes slightly turned out. Lower your body by bending your knees and pushing your hips back, as if you're sitting back into a chair. Keep your chest up and core engaged.''',
      ),
      Podr(
        title: 'Lunges:',
        min: 3,
        kcal: 150,
        dis:
            '''Stand with your feet hip-width apart. Take a step forward with one foot and lower your body until both knees are bent at a 90-degree angle, with your back knee hovering just above the ground.''',
      ),
      Podr(
        title: 'Step-Ups:',
        min: 4,
        kcal: 180,
        dis:
            '''Stand in front of a sturdy bench or step. Step up onto the bench with one foot, pressing through the heel to lift your body up. Bring the other foot to meet it, then step back down with the same foot leading.''',
      ),
      Podr(
        title: 'Jump Squats:',
        min: 2,
        kcal: 120,
        dis:
            '''Start in a squat position, then explosively jump up into the air, reaching your arms overhead. Land softly back into the squat position and immediately jump again.''',
      ),
    ],
  ),
  WorkoutsCont(
    image: 'assets/images/home5.png',
    title: 'Full body workout',
    min: 24,
    podr: [
      Podr(
        title: 'Push-Ups:',
        min: 2,
        kcal: 100,
        dis:
            '''Start in a plank position with your hands slightly wider than shoulder-width apart. Lower your body towards the ground by bending your elbows, then push back up to the starting position.''',
      ),
      Podr(
        title: 'Squats:',
        min: 4,
        kcal: 150,
        dis:
            '''Stand with your feet hip-width apart and toes slightly turned out. Lower your body by bending your knees and pushing your hips back, as if you're sitting back into a chair. Keep your chest up and core engaged.''',
      ),
      Podr(
        title: 'Lunges:',
        min: 4,
        kcal: 180,
        dis:
            '''Stand with your feet hip-width apart. Take a step forward with one foot and lower your body until both knees are bent at a 90-degree angle, with your back knee hovering just above the ground.''',
      ),
      Podr(
        title: 'Bench Press:',
        min: 3,
        kcal: 120,
        dis:
            '''Lie on a flat bench with a dumbbell in each hand, palms facing forward. Press the dumbbells straight up towards the ceiling until your arms are fully extended, then lower them back down to chest level.''',
      ),
      Podr(
        title: 'Plank:',
        min: 2,
        kcal: 100,
        dis:
            '''Get into a push-up position with your hands directly under your shoulders and your body forming a straight line from head to heels. Hold this position, engaging your core muscles. You can also try side planks to target obliques.''',
      ),
      Podr(
        title: 'Burpees:',
        min: 3,
        kcal: 100,
        dis:
            '''Stand with your feet shoulder-width apart, then squat down and place your hands on the ground. Jump your feet back into a plank position, perform a push-up if desired, then jump your feet back towards.''',
      ),
      Podr(
        title: 'Mountain Climbers:',
        min: 2,
        kcal: 100,
        dis:
            '''Start in a plank position, then alternate bringing your knees towards your chest in a running motion. Keep your core engaged throughout the exercise.''',
      ),
      Podr(
        title: 'Dumbbell Pullover:',
        min: 4,
        kcal: 100,
        dis:
            '''Stand with your feet hip-width apart, holding a barbell or dumbbells in front of your thighs with an overhand grip. Hinge at the hips and lower the weights towards the ground while keeping your back flat and chest lifted.''',
      ),
    ],
  ),
];
////////////////////////////////////////////
/////////////////////////////////////
List<WorkoutsCont> listGym = [
  WorkoutsCont(
    image: 'assets/images/gym1.png',
    title: 'CrossFit workout',
    min: 25,
    podr: [
      Podr(
        title: 'Burpees:',
        min: 5,
        kcal: 150,
        dis:
            '''Stand with your feet shoulder-width apart, then squat down and place your hands on the ground. Jump your feet back into a plank position, perform a push-up if desired, then jump your feet back towards.''',
      ),
      Podr(
        title: '',
        min: 0,
        kcal: 0,
        dis: '''''',
      ),
      Podr(
        title: '',
        min: 0,
        kcal: 0,
        dis: '''''',
      ),
      Podr(
        title: '',
        min: 0,
        kcal: 0,
        dis: '''''',
      ),
    ],
  ),
  WorkoutsCont(
    image: 'assets/images/gym2.png',
    title: 'Cardiovascular workout',
    min: 27,
    podr: [
      Podr(
        title: '',
        min: 0,
        kcal: 0,
        dis: '''''',
      ),
      Podr(
        title: '',
        min: 0,
        kcal: 0,
        dis: '''''',
      ),
      Podr(
        title: '',
        min: 0,
        kcal: 0,
        dis: '''''',
      ),
      Podr(
        title: '',
        min: 0,
        kcal: 0,
        dis: '''''',
      ),
      Podr(
        title: '',
        min: 0,
        kcal: 0,
        dis: '''''',
      ),
      Podr(
        title: '',
        min: 0,
        kcal: 0,
        dis: '''''',
      ),
    ],
  ),
  WorkoutsCont(
    image: 'assets/images/gym3.png',
    title: 'Circuit workout',
    min: 24,
    podr: [
      Podr(
        title: '',
        min: 0,
        kcal: 0,
        dis: '''''',
      ),
    ],
  ),
  WorkoutsCont(
    image: 'assets/images/gym4.png',
    title: 'Recovery workout',
    min: 22,
    podr: [
      Podr(
        title: '',
        min: 0,
        kcal: 0,
        dis: '''''',
      ),
    ],
  ),
  WorkoutsCont(
    image: 'assets/images/gym5.png',
    title: 'Strength workout',
    min: 30,
    podr: [
      Podr(
        title: '',
        min: 0,
        kcal: 0,
        dis: '''''',
      ),
    ],
  ),
];
