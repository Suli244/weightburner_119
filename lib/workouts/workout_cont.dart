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
        min: 1,
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
        title: 'Squats:',
        min: 5,
        kcal: 150,
        dis: '''
Stand with your feet hip-width apart and toes slightly turned out. Lower your body by bending your knees and pushing your hips back, as if you're sitting back into a chair. Keep your chest up and core engaged.''',
      ),
      Podr(
        title: 'Push-Ups:',
        min: 5,
        kcal: 150,
        dis:
            '''Start in a plank position with your hands slightly wider than shoulder-width apart. Lower your body towards the ground by bending your elbows, then push back up to the starting position.''',
      ),
      Podr(
        title: 'Step-Ups:',
        min: 5,
        kcal: 150,
        dis:
            '''Stand in front of a sturdy bench or step. Step up onto the bench with one foot, pressing through the heel to lift your body up. Bring the other foot to meet it, then step back down with the same foot leading.''',
      ),
      Podr(
        title: 'Jumping Jacks:',
        min: 5,
        kcal: 150,
        dis:
            '''Stand with your feet together and arms by your sides. Jump your feet out to the sides while simultaneously raising your arms overhead. Jump back to the starting position and repeat for a set duration or number of repetitions.''',
      )
    ],
  ),
  WorkoutsCont(
    image: 'assets/images/gym2.png',
    title: 'Cardiovascular workout',
    min: 27,
    podr: [
      Podr(
        title: 'Treadmill Running:',
        min: 6,
        kcal: 100,
        dis: '''
Start by adjusting the speed and incline settings according to your fitness level. Begin with a warm-up walk, then gradually increase the speed to a comfortable running pace. Maintain good posture with your chest up and core engaged.''',
      ),
      Podr(
        title: 'Stationary Bike:',
        min: 5,
        kcal: 150,
        dis: '''
Adjust the seat and handlebar height to a comfortable position. Start pedaling at a moderate pace, gradually increasing the resistance as needed to increase the intensity. ''',
      ),
      Podr(
        title: 'Elliptical Trainer:',
        min: 5,
        kcal: 180,
        dis: '''
Adjust a bench to a 30-45 degree incline. Lie back on the bench with a dumbbell in each hand, arms extended straight up above your chest. Lower the dumbbells down towards your chest, then press them back up to the starting position.''',
      ),
      Podr(
        title: 'Rowing Machine:',
        min: 5,
        kcal: 120,
        dis: '''Rowing Machine (Row Ergometer):
Sit on the seat with your feet securely strapped in the footrests. Grasp the handle with an overhand grip and extend your arms forward. Push through your legs while simultaneously pulling the handle towards your chest.''',
      ),
      Podr(
        title: 'Arc Trainer:',
        min: 2,
        kcal: 100,
        dis: '''
Step onto the pedals and grasp the handles. Begin moving your legs in a smooth, elliptical motion while simultaneously pushing and pulling the handles back and forth. Adjust the resistance level and incline to vary the intensity.''',
      ),
      Podr(
        title: 'Circuit Training:',
        min: 2,
        kcal: 100,
        dis: '''
Set up a circuit of cardio machines or bodyweight exercises at different stations in the gym. Perform each exercise for a set duration or number of repetitions before moving on to the next station. I''',
      ),
    ],
  ),
  WorkoutsCont(
    image: 'assets/images/gym3.png',
    title: 'Circuit workout',
    min: 24,
    podr: [
      Podr(
        title: 'Bodyweight Squats:',
        min: 5,
        kcal: 150,
        dis: '''
Stand with your feet shoulder-width apart. Lower your body by bending your knees and pushing your hips back, keeping your chest up and core engaged. Lower down until your thighs are parallel to the ground.''',
      ),
      Podr(
        title: 'Dumbbell Lunges:',
        min: 5,
        kcal: 180,
        dis: '''
Hold a dumbbell in each hand, palms facing in. Step forward with one foot and lower your body until both knees are bent at a 90-degree angle. Push through the heel of your front foot to return to the starting position.''',
      ),
      Podr(
        title: 'Push-Ups:',
        min: 5,
        kcal: 160,
        dis: '''
Start in a plank position with your hands slightly wider than shoulder-width apart. Lower your body towards the ground by bending your elbows, then push back up to the starting position.''',
      ),
      Podr(
        title: 'Plank:',
        min: 5,
        kcal: 90,
        dis: '''
Get into a push-up position with your hands directly under your shoulders and your body forming a straight line from head to heels. Hold this position, engaging your core muscles. You can also try side planks to target obliques.''',
      ),
      Podr(
        title: 'Jumping Jacks:',
        min: 4,
        kcal: 100,
        dis: '''
Stand with your feet together and arms by your sides. Jump your feet out to the sides while simultaneously raising your arms overhead. Jump back to the starting position and repeat for a set duration or number of repetitions.''',
      ),
    ],
  ),
  WorkoutsCont(
    image: 'assets/images/gym4.png',
    title: 'Recovery workout',
    min: 22,
    podr: [
      Podr(
        title: 'Foam Rolling:',
        min: 3,
        kcal: 130,
        dis: '''
Use a foam roller to target major muscle groups such as the calves, hamstrings, quadriceps, glutes, back, and shoulders. Roll slowly over each muscle group, pausing on any tight or tender areas and applying gentle pressure.''',
      ),
      Podr(
        title: 'Hip Flexor Stretch:',
        min: 3,
        kcal: 150,
        dis: '''
Kneel on one knee with the other foot flat on the ground in front of you. Engage your core and gently push your hips forward until you feel a stretch in the front of your hip and thigh.''',
      ),
      Podr(
        title: 'Hamstring Stretch:',
        min: 4,
        kcal: 180,
        dis: '''
Sit on the floor with one leg extended straight in front of you and the other leg bent with the sole of the foot against the inner thigh of the extended leg. Hinge forward at the hips, reaching towards your toes while keeping your back straight.''',
      ),
      Podr(
        title: "Child's Pose:",
        min: 2,
        kcal: 120,
        dis: '''
Start on your hands and knees with your toes together and knees apart. Sit back onto your heels, reaching your arms forward and lowering your chest towards the ground.''',
      ),
    ],
  ),
  WorkoutsCont(
    image: 'assets/images/gym5.png',
    title: 'Strength workout',
    min: 30,
    podr: [
      Podr(
        title: 'Barbell Squats:',
        min: 3,
        kcal: 100,
        dis: '''
Start by standing with your feet shoulder-width apart, holding a barbell across your upper back. Engage your core and lower your body by bending your knees and pushing your hips back, keeping your chest up and back straight.''',
      ),
      Podr(
        title: 'Dumbbell Bench Press:',
        min: 4,
        kcal: 150,
        dis: '''
Lie on a flat bench with a dumbbell in each hand, palms facing forward, and arms extended above your chest. Lower the dumbbells towards your chest, keeping your elbows at a 45-degree angle to your body.''',
      ),
      Podr(
        title: 'Deadlifts:',
        min: 3,
        kcal: 180,
        dis: '''
Stand with your feet hip-width apart, holding a barbell or dumbbells in front of your thighs with an overhand grip. Hinge at the hips and lower the weights towards the ground while keeping your back flat and chest lifted.''',
      ),
      Podr(
        title: 'Pull-Ups:',
        min: 5,
        kcal: 120,
        dis: '''
Grab a pull-up bar with an overhand grip, hands slightly wider than shoulder-width apart. Hang with your arms fully extended, then pull your body up until your chin is above the bar. Lower yourself back down with control.''',
      ),
      Podr(
        title: 'Plank:',
        min: 2,
        kcal: 100,
        dis: '''
Get into a push-up position with your hands directly under your shoulders and your body forming a straight line from head to heels. Hold this position, engaging your core muscles. You can also try side planks to target obliques.''',
      ),
      Podr(
        title: 'Dumbbell Shoulder Press:',
        min: 6,
        kcal: 100,
        dis: '''
Sit on a bench with a backrest or stand with your feet shoulder-width apart, holding a dumbbell in each hand at shoulder height with your palms facing forward. Press the weights overhead until your arms are fully extended.''',
      ),
      Podr(
        title: 'Mountain Climbers:',
        min: 3,
        kcal: 100,
        dis: '''
Start in a plank position, then alternate bringing your knees towards your chest in a running motion. Keep your core engaged throughout the exercise.''',
      ),
      Podr(
        title: 'Dumbbell Rows:',
        min: 4,
        kcal: 100,
        dis: '''
Hold a dumbbell in each hand and hinge forward at the hips, keeping your back flat and knees slightly bent. Pull the dumbbells up towards your ribcage, squeezing your shoulder blades together at the top of the movement.''',
      ),
    ],
  ),
];
