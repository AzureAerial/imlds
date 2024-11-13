import 'package:flutter/material.dart';
import 'dart:math';
import 'package:in_my_lane/widgets/background_scaffold.dart';



class FlashcardsScreen extends StatefulWidget {
  @override
  _FlashcardsScreenState createState() => _FlashcardsScreenState();
}

class _FlashcardsScreenState extends State<FlashcardsScreen> {
  final List<Map<String, dynamic>> _flashcards = [
    {'question': 'To help relieve fatigue on a trip, it is a good idea to:', 'answer': 'Stop for a rest every two hours.'},
    {'question': 'A “No Parking” sign at a specific location means:', 'answer': 'You may stop temporarily to load or unload passengers.'},
    {
      'question': 'You are making a left turn from a two-way street into a multilane one-way street. When you have completed the turn, your car should be:',
      'image': 'assets/s38.png',
      'answer': 'In the left lane of the street.'
    },
    {
      'question': 'A red and white triangular sign at an intersection means:',
      'image': 'assets/s15.png',
      'answer': 'Slow down and be prepared to stop if necessary.'
    },
    {'question': 'What should you do if your accelerator sticks while driving?', 'answer': 'Shift to neutral and apply steady pressure on the brake.'},
    {'question': 'If a police officer stops you, you should:', 'answer': 'Stay in your vehicle with your hands on the steering wheel, and wait for the officer to approach you.'},
    {'question': 'Suppose you stopped behind a school bus with flashing red signals and extended the "STOP" arm. When can you pass the bus?', 'answer': 'If the flashing red signals are turned off, and the "STOP" arm is retracted.'},
    {'question': 'The main reason why drinking alcohol and then driving is so dangerous is that it affects your:', 'answer': 'Judgment and skill.'},
    {'question': 'Drivers must have their vehicle registration:', 'answer': 'In their vehicles.'},
    {'question': 'When driving in traffic, it is safest to:', 'answer': 'Drive with the flow of traffic.'},
    {'question': 'You may not cross a single broken white or yellow line:', 'answer': 'When to do so would interfere with traffic.'},
    {'question': 'In Michigan state if you are hauling a load which goes past the back of a vehicle by 4 feet, you must attach a red flag on the end of the load.', 'answer': '4 feet.'},
    {'question': 'If you want to get off of a freeway, but you missed your exit. You should:', 'answer': 'Go to the next exit, and get off of the freeway there.'},
    {'question': 'To avoid last-minute braking, or the need to turn, you should look down the road at least:', 'answer': '10-15 seconds ahead of your vehicle.'},
    {'question': 'A bicyclist differs from a motorist in that he isn’t required to:', 'answer': 'Insure the bicycle.'},
    {'question': 'Most traffic crashes are caused by:', 'answer': 'Poor driver judgment.'},
    {'question': 'A copy of the vehicle inspection certificate:', 'answer': 'It should be kept in the vehicle.'},
    {'question': 'Many drivers get into serious trouble while driving a vehicle because:', 'answer': 'They do not understand or inform themselves of the legal responsibilities of having their license.'},
    {'question': 'You are waiting in the intersection to complete a left turn. You should:', 'answer': 'Signal and keep your wheels straight.'},
    {'question': 'If you run off the pavement, you should:', 'answer': 'All of these choices: 1) Grip the steering wheel firmly; 2) Slow before steering back on the pavement; 3) Take your foot off the gas.'},
    {'question': 'What does this sign mean?', 'image': 'assets/s40.png', 'answer': '270-degree turn.'},
    {'question': 'When you want to overtake and pass another vehicle, you should:', 'answer': 'Signal and pass when safe to do so.'},
    {'question': 'What are the colors of the warning signs that indicate hazards ahead, such as curves in the road or narrow bridges:', 'answer': 'Black letters or symbols on a yellow background.'},
    {'question': 'One of the rules of defensive driving is:', 'answer': 'Stay alert and keep your eyes moving.'},
    {'question': 'This sign means that:', 'image': 'assets/2_42.png', 'answer': 'Workers are on or very close to the road in the work zone ahead.'},
    {'question': 'If your brake pedal suddenly sinks to the floor, you should first:', 'answer': 'Try to pump it to build up the pressure.'},
    {'question': 'This sign is used to warn drivers about:', 'image': 'assets/s1.png', 'answer': 'Lane ends, merge left.'},
    {'question': 'Before backing up, you should:', 'answer': 'Turn your head and look through the rear window.'},
    {'question': 'The posted speed limits show:', 'answer': 'The maximum safe speed under ideal road and weather conditions.'},
    {'question': 'Suppose you are turning left into a driveway. What must you do before you continue?', 'image': 'assets/s44.png', 'answer': 'Wait for pedestrians and traffic.'},
    {'question': 'A “no standing” sign at a certain location means:', 'answer': 'You may stop temporarily to pick up or discharge passengers.'},
    {'question': 'A traffic light that has a green arrow and a red light means that:', 'answer': 'You may drive only in the direction of the green arrow.'},
    {'question': 'When driving with babies and children under 6 years of age and who weigh less than 60 pounds:', 'answer': 'They must be buckled into a child safety seat.'},
    {'question': 'Which of the signals/marks are used on some highways to direct drivers into the proper lanes for turning?', 'answer': 'White arrows in the middle of the lanes.'},
    {'question': 'A steady yellow light means that a _______ light will soon appear:', 'answer': 'Steady red.'},
    {'question': 'Alcohol is removed from your body:', 'answer': 'By the time only.'},
    {'question': 'You may never park:', 'answer': 'In a crosswalk.'},
    {'question': 'You should honk your horn when you:', 'answer': 'See a child who is about to run into the street.'},
    {'question': 'What does this sign mean?', 'image': 'assets/s24.png', 'answer': 'Sharp turn ahead.'},
    {'question': 'When any vehicle is bought or sold, the owner must:', 'answer': 'Get a new registration card.'},
    {'question': 'At night, it is hardest to see:', 'answer': 'Pedestrians.'},
    {'question': 'Which car is NOT using the circle correctly?', 'image': 'assets/s30.png', 'answer': 'C'},
    {'question': 'Drinking coffee after drinking alcohol:', 'answer': 'It does not affect blood alcohol concentration.'},
    {'question': 'If someone is driving aggressively behind you, you should:', 'answer': 'Try to get out of the aggressive driver’s way.'},
    {'question': 'If your turn signal fails, you should use _____ to indicate you are turning:', 'answer': 'Hand signals.'},
    {'question': 'It is against the law for anyone under the age of 21 to _____ alcohol:', 'answer': 'Consume.'},
    {'question': 'When signing for their child under 18 years of age, parents are indicating that:', 'answer': 'They are accepting financial responsibility for any damage resulting from the minor operating a motor vehicle.'},
    {'question': 'A solid white line on the right edge of the highway slants towards your left. That shows that:', 'answer': 'The road will get narrower.'},
    {'question': 'Headlights are required at any time you cannot see persons or vehicles for 500 feet (because of snow, dust, etc.) and:', 'answer': 'From 1/2 hour after sunset to 1/2 hour before sunrise.'},
    {'question': 'Night driving is dangerous because:', 'answer': 'The distance we can see ahead is reduced.'},
    {'question': 'You may honk your horn when you:', 'answer': 'Have lost control of your car.'},
    {'question': 'A chemical test is used to measure...', 'answer': 'Blood Alcohol Concentration (BAC).'},
    {'question': 'The car "B" is in the intersection, turning right on the red light. However, car "A" comes with a green light. Which of the car should yield?', 'image': 'assets/s32.png', 'answer': 'Car "A" should yield to Car "B".'},
    {'question': 'Minimum speed signs are designed to:', 'answer': 'Keep traffic flowing smoothly.'},
    {'question': 'You come to an intersection that is blocked by other traffic. You should:', 'answer': 'Stay out of the intersection until you can pass through.'},
    {'question': 'What is a probationary license?', 'answer': 'A license restricted to essential driving only.'},
    {'question': 'To help avoid crashes, you should:', 'answer': 'Communicate with other drivers on the road.'},
    {'question': 'The first skill lost by a driver under the influence of alcohol is:', 'answer': 'Judgment.'},
    {'question': 'Why is driving on an expressway different from driving on an ordinary street?', 'answer': 'You must think faster and handle your vehicle more effectively.'},
    {'question': 'When you are planning to make a turn, you should activate your turn signals:', 'answer': '3 to 4 seconds before you reach the intersection.'},
    {'question': 'When the road is marked with a solid yellow line and a broken yellow line on your side, you may pass:', 'answer': 'If traffic is clear.'},
    {'question': 'You may cross a double solid yellow line:', 'answer': 'To turn left into a driveway.'},
    {'question': 'Which of these signs is used to show the end of a divided highway?', 'image': 'assets/2_19.png', 'answer': 'End of divided highway.'}
  ];

  int _currentIndex = 0;
  bool _showAnswer = false;
  List<String> _options = [];
  bool _isMultipleChoice = true;

  @override
  void initState() {
    super.initState();
    _shuffleFlashcards();
    _generateOptions();
  }

  void _shuffleFlashcards() {
    setState(() {
      _flashcards.shuffle(Random());
    });
  }

  void _nextFlashcard() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _flashcards.length;
      _showAnswer = false;
      _generateOptions();
    });
  }

  void _previousFlashcard() {
    setState(() {
      _currentIndex = (_currentIndex - 1 + _flashcards.length) % _flashcards.length;
      _showAnswer = false;
      _generateOptions();
    });
  }

  void _toggleAnswer() {
    setState(() {
      _showAnswer = !_showAnswer;
    });
  }

  void _generateOptions() {
    if (_isMultipleChoice) {
      final currentAnswer = _flashcards[_currentIndex]['answer'];
      final random = Random();
      _options = [currentAnswer];

      while (_options.length < 4) {
        final randomFlashcard = _flashcards[random.nextInt(_flashcards.length)]['answer'];
        if (!_options.contains(randomFlashcard)) {
          _options.add(randomFlashcard);
        }
      }

      _options.shuffle(random);
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentFlashcard = _flashcards[_currentIndex];
    
    return BackgroundScaffold(
      title: 'Flashcards',
      appBar: AppBar(
        title: const Text('Flashcards'),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                currentFlashcard['question']!,
                style: const TextStyle(fontSize: 24, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              if (currentFlashcard.containsKey('image'))
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    currentFlashcard['image']!,
                    height: 150,
                    errorBuilder: (context, error, stackTrace) => const Text('Image not found'),
                  ),
                ),
              const SizedBox(height: 20),
              if (_isMultipleChoice)
                ..._options.map((option) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _showAnswer = true;
                          });
                          if (option == currentFlashcard['answer']) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Correct!')),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Try again!')),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _showAnswer && option == currentFlashcard['answer'] ? Colors.green : Colors.blue,
                        ),
                        child: Text(option, style: const TextStyle(color: Colors.white)),
                      ),
                    )),
              if (!_isMultipleChoice)
                if (_showAnswer)
                  Text(
                    currentFlashcard['answer']!,
                    style: const TextStyle(fontSize: 20, color: Colors.green),
                    textAlign: TextAlign.center,
                  ),
              const SizedBox(height: 20),
              if (!_isMultipleChoice)
                ElevatedButton(
                  onPressed: _toggleAnswer,
                  child: Text(_showAnswer ? 'Hide Answer' : 'Show Answer'),
                ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: _previousFlashcard,
                    child: const Text('Previous Flashcard'),
                  ),
                  ElevatedButton(
                    onPressed: _nextFlashcard,
                    child: const Text('Next Flashcard'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
