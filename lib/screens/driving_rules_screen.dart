import 'package:flutter/material.dart';
import '../widgets/background_scaffold.dart';

class DrivingRulesScreen extends StatelessWidget {
  final List<Map<String, String>> _rules = [
    {
      'title': 'To help relieve fatigue on a trip, it is a good idea to:',
      'description': 'Stop for a rest every two hours.',
    },
    {
      'title': 'A “No Parking” sign at a specific location means:',
      'description': 'You may stop temporarily to load or unload passengers.',
    },
    {
      'title': 'You are making a left turn from a two-way street into a multilane one-way street.',
      'image': 'assets/s38.png', // Local image
      'description': 'In the left lane of the street.',
    },
    {
      'title': 'A red and white triangular sign at an intersection means:',
      'image': 'assets/s15.png', // Local image
      'description': 'Slow down and be prepared to stop if necessary.',
    },
    {
      'title': 'What should you do if your accelerator sticks while driving?',
      'description': 'Shift to neutral and apply steady pressure on the brake.',
    },
    {
      'title': 'If a police officer stops you, you should:',
      'description': 'Stay in your vehicle with your hands on the steering wheel, and wait for the officer to approach you.',
    },
    {
      'title': 'Suppose you stopped behind a school bus with flashing red signals and extended the "STOP" arm. When can you pass the bus?',
      'description': 'If the flashing red signals are turned off, and the "STOP" arm is retracted.',
    },
    {
      'title': 'The main reason why drinking alcohol and then driving is so dangerous is that it affects your:',
      'description': 'Judgment and skill.',
    },
    {
      'title': 'Drivers must have their vehicle registration:',
      'description': 'In their vehicles.',
    },
    {
      'title': 'When driving in traffic, it is safest to:',
      'description': 'Drive with the flow of traffic.',
    },
    {
      'title': 'You may not cross a single broken white or yellow line:',
      'description': 'When to do so would interfere with traffic.',
    },
    {
      'title': 'In Michigan state if you are hauling a load which goes past the back of a vehicle by ______ feet, you must attach a red flag on the end of the load.',
      'description': '4 feet.',
    },
    {
      'title': 'If you want to get off of a freeway, but you missed your exit. You should:',
      'description': 'Go to the next exit, and get off of the freeway there.',
    },
    {
      'title': 'To avoid last-minute braking, or the need to turn, you should look down the road at least:',
      'description': '10-15 seconds ahead of your vehicle.',
    },
    {
      'title': 'A bicyclist differs from a motorist in that he isn’t required to:',
      'description': 'Insure the bicycle.',
    },
    {
      'title': 'Most traffic crashes are caused by:',
      'description': 'Poor driver judgment.',
    },
    {
      'title': 'A copy of the vehicle inspection certificate:',
      'description': 'Should be kept in the vehicle.',
    },
    {
      'title': 'Many drivers get into serious trouble while driving a vehicle because:',
      'description': 'They do not understand or inform themselves of the legal responsibilities of having their license.',
    },
    {
      'title': 'You are waiting in the intersection to complete a left turn. You should:',
      'description': 'Signal and keep your wheels straight.',
    },
    {
      'title': 'If you run off the pavement, you should:',
      'description': 'All of these choices: 1) Grip the steering wheel firmly; 2) Slow before steering back on the pavement; 3) Take your foot off the gas.',
    },
    {
      'title': 'What does this sign mean?',
      'image': 'assets/s40.png', // Local image
      'description': '270-degree turn.',
    },
    {
      'title': 'When you want to overtake and pass another vehicle, you should:',
      'description': 'Signal and pass when safe to do so.',
    },
    {
      'title': 'What are the colors of the warning signs that indicate hazards ahead, such as curves in the road or narrow bridges:',
      'description': 'Black letters or symbols on a yellow background.',
    },
    {
      'title': 'One of the rules of defensive driving is:',
      'description': 'Stay alert and keep your eyes moving.',
    },
    {
      'title': 'This sign means that:',
      'image': 'assets/2_42.png', // Local image
      'description': 'Workers are on or very close to the road in the work zone ahead.',
    },
    {
      'title': 'If your brake pedal suddenly sinks to the floor, you should first:',
      'description': 'Try to pump it to build up the pressure.',
    },
    {
      'title': 'This sign is used to warn drivers about:',
      'image': 'assets/s1.png', // Local image
      'description': 'Lane ends, merge left.',
    },
    {
      'title': 'Before backing up, you should:',
      'description': 'Turn your head and look through the rear window.',
    },
    {
      'title': 'The posted speed limits show:',
      'description': 'The maximum safe speed under ideal road and weather conditions.',
    },
    {
      'title': 'Suppose you are turning left into a driveway. What must you do before you continue?',
      'image': 'assets/s44.png', // Local image
      'description': 'Wait for pedestrians and traffic.',
    },
    {
      'title': 'A “no standing” sign at a certain location means:',
      'description': 'You may stop temporarily to pick up or discharge passengers.',
    },
    {
      'title': 'A traffic light that has a green arrow and a red light means that:',
      'description': 'You may drive only in the direction of the green arrow.',
    },
    {
      'title': 'When driving with babies and children under 6 years of age and who weigh less than 60 pounds:',
      'description': 'They must be buckled into a child safety seat.',
    },
    {
      'title': 'Which of the signals/marks are used on some highways to direct drivers into the proper lanes for turning?',
      'description': 'White arrows in the middle of the lanes.',
    },
    {
      'title': 'A steady yellow light means that a _______ light will soon appear.',
      'description': 'Steady red.',
    },
    {
      'title': 'Alcohol is removed from your body:',
      'description': 'By the time only.',
    },
    {
      'title': 'You may never park:',
      'description': 'In a crosswalk.',
    },
    {
      'title': 'You should honk your horn when you:',
      'description': 'See a child who is about to run into the street.',
    },
    {
      'title': 'What does this sign mean?',
      'image': 'assets/s24.png', // Local image
      'description': 'Sharp turn ahead.',
    },
    {
      'title': 'When any vehicle is bought or sold, the owner must:',
      'description': 'Get a new registration card.',
    },
    {
      'title': 'At night, it is hardest to see:',
      'description': 'Pedestrians.',
    },
    {
      'title': 'Which car is NOT using the circle correctly?',
      'image': 'assets/s30.png', // Local image
      'description': 'C.',
    },
    {
      'title': 'Drinking coffee after drinking alcohol:',
      'description': 'It does not affect blood alcohol concentration.',
    },
    {
      'title': 'If someone is driving aggressively behind you, you should:',
      'description': 'Try to get out of the aggressive driver’s way.',
    },
    {
      'title': 'If your turn signal fails, you should use _____ to indicate you are turning.',
      'description': 'Hand signals.',
    },
    {
      'title': 'It is against the law for anyone under the age of 21 to _____ alcohol.',
      'description': 'Consume.',
    },
    {
      'title': 'When signing for their child under 18 years of age, parents are indicating that:',
      'description': 'They are accepting financial responsibility for any damage resulting from the minor operating a motor vehicle.',
    },
    {
      'title': 'A solid white line on the right edge of the highway slants towards your left. That shows that:',
      'description': 'The road will get narrower.',
    },
    {
      'title': 'Headlights are required at any time you cannot see persons or vehicles for 500 feet (because of snow, dust, etc.) and:',
      'description': 'From 1/2 hour after sunset to 1/2 hour before sunrise.',
    },
    {
      'title': 'Night driving is dangerous because:',
      'description': 'The distance we can see ahead is reduced.',
    },
    {
      'title': 'You may honk your horn when you:',
      'description': 'Have lost control of your car.',
    },
    {
      'title': 'A chemical test is used to measure:',
      'description': 'Blood Alcohol Concentration (BAC).',
    },
    {
      'title': 'The car "B" is in the intersection, turning right on the red light. However, car "A" comes with a green light. Which of the car should yield?',
      'image': 'assets/s32.png', // Local image
      'description': 'Car "A" should yield to car "B," as Car "B" is already at the intersection.',
    },
    {
      'title': 'Minimum speed signs are designed to:',
      'description': 'Keep traffic flowing smoothly.',
    },
    {
      'title': 'You come to an intersection that is blocked by other traffic. You should:',
      'description': 'Stay out of the intersection until you can pass through.',
    },
    {
      'title': 'What is a probationary license?',
      'description': 'A license restricted to essential driving only.',
    },
    {
      'title': 'To help avoid crashes, you should:',
      'description': 'Communicate with other drivers on the road.',
    },
    {
      'title': 'The first skill lost by a driver under the influence of alcohol is:',
      'description': 'Judgment.',
    },
    {
      'title': 'Why is driving on an expressway different from driving on an ordinary street?',
      'description': 'You must think faster and handle your vehicle more effectively.',
    },
    {
      'title': 'When you are planning to make a turn, you should activate your turn signals:',
      'description': '3 to 4 seconds before you reach the intersection.',
    },
    {
      'title': 'When the road is marked with a solid yellow line and a broken yellow line on your side, you may pass:',
      'description': 'If traffic is clear.',
    },
    {
      'title': 'You may cross a double solid yellow line:',
      'description': 'To turn left into a driveway.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      title: 'Driving Rules & Guidelines',
      appBar: AppBar(
        title: const Text('Driving Rules & Guidelines'),
      ),
      body: ListView.builder(
        itemCount: _rules.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              title: Text(_rules[index]['title']!),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (_rules[index].containsKey('image')) ...[
                    SizedBox(height: 10),
                    Image.asset(
                      _rules[index]['image']!, // Load local image
                      height: 100,
                      errorBuilder: (context, error, stackTrace) =>
                          const Text('Image not found'),
                    ),
                  ],
                  SizedBox(height: 10),
                  Text(_rules[index]['description']!),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
