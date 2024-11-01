// questions.dart

// General Knowledge Quiz Questions
List<Map<String, Object>> generalQuestions = [
  {
    'question': 'To help relieve fatigue on a trip, it is a good idea to:',
    'answers': [
      {'text': 'Drive faster to finish sooner', 'score': 0},
      {'text': 'Stop for a rest every two hours', 'score': 1},
      {'text': 'Turn up the music', 'score': 0},
    ],
  },
  {
    'question': 'What should you do if your accelerator sticks while driving?',
    'answers': [
      {'text': 'Shift to neutral and apply steady pressure on the brake', 'score': 1},
      {'text': 'Turn off the engine immediately', 'score': 0},
      {'text': 'Pump the accelerator', 'score': 0},
    ],
  },
  {
    'question': 'If a police officer stops you, you should:',
    'answers': [
      {'text': 'Stay in your vehicle with your hands on the steering wheel', 'score': 1},
      {'text': 'Exit the vehicle to talk to the officer', 'score': 0},
      {'text': 'Reach for your license immediately', 'score': 0},
    ],
  },
  {
    'question': 'The main reason why drinking alcohol and then driving is dangerous is that it affects your:',
    'answers': [
      {'text': 'Vision only', 'score': 0},
      {'text': 'Coordination only', 'score': 0},
      {'text': 'Judgment and skill', 'score': 1},
    ],
  },
  {
    'question': 'Drivers must have their vehicle registration:',
    'answers': [
      {'text': 'In their vehicles', 'score': 1},
      {'text': 'At home', 'score': 0},
      {'text': 'With their insurance agent', 'score': 0},
    ],
  },
  {
    'question': 'In Michigan, if you are hauling a load that extends past the back of a vehicle by 4 feet, you must:',
    'answers': [
      {'text': 'Attach flashing lights to the load', 'score': 0},
      {'text': 'Get a special permit', 'score': 0},
      {'text': 'Attach a red flag on the end of the load', 'score': 1},
    ],
  },
  {
    'question': 'To avoid last-minute braking or the need to turn, you should:',
    'answers': [
      {'text': 'Brake as soon as you see a car in front of you', 'score': 0},
      {'text': 'Look down the road at least 10-15 seconds ahead of your vehicle', 'score': 1},
      {'text': 'Use your mirrors constantly', 'score': 0},
    ],
  },
  {
    'question': 'Most traffic crashes are caused by:',
    'answers': [
      {'text': 'Bad weather', 'score': 0},
      {'text': 'Poor driver judgment', 'score': 1},
      {'text': 'Mechanical failures', 'score': 0},
    ],
  },
  {
    'question': 'What should you do when waiting in the intersection to complete a left turn?',
    'answers': [
      {'text': 'Turn your wheels left', 'score': 0},
      {'text': 'Signal and keep your wheels straight', 'score': 1},
      {'text': 'Move slightly forward', 'score': 0},
    ],
  },
  {
    'question': 'If you run off the pavement, you should:',
    'answers': [
      {'text': 'Brake immediately', 'score': 0},
      {'text': 'Turn sharply back onto the road', 'score': 0},
      {'text': 'Grip the steering wheel firmly and take your foot off the gas', 'score': 1},
    ],
  },
  {
    'question': 'If your brake pedal suddenly sinks to the floor, you should first:',
    'answers': [
      {'text': 'Try to pump it to build up the pressure', 'score': 1},
      {'text': 'Pull the emergency brake immediately', 'score': 0},
      {'text': 'Shift into neutral', 'score': 0},
    ],
  },
  {
    'question': 'At night, it is hardest to see:',
    'answers': [
      {'text': 'Pedestrians', 'score': 1},
      {'text': 'Other cars', 'score': 0},
      {'text': 'Road signs', 'score': 0},
    ],
  },
  {
    'question': 'Drinking coffee after drinking alcohol:',
    'answers': [
      {'text': 'Does not affect blood alcohol concentration', 'score': 1},
      {'text': 'Reduces blood alcohol concentration', 'score': 0},
      {'text': 'Sobers you up quickly', 'score': 0},
    ],
  },
  {
    'question': 'If someone is driving aggressively behind you, you should:',
    'answers': [
      {'text': 'Speed up to get away from them', 'score': 0},
      {'text': 'Try to get out of the aggressive driver’s way', 'score': 1},
      {'text': 'Brake to slow them down', 'score': 0},
    ],
  },
  {
    'question': 'A probationary license is:',
    'answers': [
      {'text': 'A temporary learner’s permit', 'score': 0},
      {'text': 'A license for new drivers with no restrictions', 'score': 0},
      {'text': 'A license restricted to essential driving only', 'score': 1},
    ],
  },
  {
    'question': 'The first skill lost by a driver under the influence of alcohol is:',
    'answers': [
      {'text': 'Vision', 'score': 0},
      {'text': 'Coordination', 'score': 0},
      {'text': 'Judgment', 'score': 1},
    ],
  },
];

// Road Signs Quiz Questions
List<Map<String, Object>> roadSignsQuestions = [
  {
    'question': 'You are making a left turn from a two-way street into a multilane one-way street. When you have completed the turn, your car should be:',
    'image': 'assets/s38.png', // Local image
    'answers': [
      {'text': 'In the right lane', 'score': 0},
      {'text': 'In the left lane of the street', 'score': 1},
      {'text': 'In the center lane', 'score': 0},
    ],
  },
  {
    'question': 'A red and white triangular sign at an intersection means:',
    'image': 'assets/s15.png', // Local image
    'answers': [
      {'text': 'Yield to traffic on the right', 'score': 0},
      {'text': 'Come to a full stop', 'score': 0},
      {'text': 'Slow down and be prepared to stop if necessary', 'score': 1},
    ],
  },
  {
    'question': 'What does this sign mean?',
    'image': 'assets/s40.png', // Local image
    'answers': [
      {'text': 'Sharp left turn', 'score': 0},
      {'text': 'U-turn', 'score': 0},
      {'text': '270-degree turn', 'score': 1},
    ],
  },
  {
    'question': 'This sign means that:',
    'image': 'assets/2_42.png', // Local image
    'answers': [
      {'text': 'Workers are on or very close to the road in the work zone ahead', 'score': 1},
      {'text': 'Detour ahead', 'score': 0},
      {'text': 'Road closure ahead', 'score': 0},
    ],
  },
  {
    'question': 'This sign is used to warn drivers about:',
    'image': 'assets/s1.png', // Local image
    'answers': [
      {'text': 'Narrow bridge ahead', 'score': 0},
      {'text': 'Right lane ends', 'score': 0},
      {'text': 'Lane ends, merge left', 'score': 1},
    ],
  },
  {
    'question': 'Suppose you are turning left into a driveway. What must you do before you continue?',
    'image': 'assets/s44.png', // Local image
    'answers': [
      {'text': 'Wait for pedestrians and traffic', 'score': 1},
      {'text': 'Proceed cautiously', 'score': 0},
      {'text': 'Honk your horn to alert others', 'score': 0},
    ],
  },
  {
    'question': 'What does this sign mean?',
    'image': 'assets/s24.png', // Local image
    'answers': [
      {'text': 'Sharp turn ahead', 'score': 1},
      {'text': 'Curve ahead', 'score': 0},
      {'text': 'Slippery when wet', 'score': 0},
    ],
  },
  {
    'question': 'Which car is NOT using the circle correctly?',
    'image': 'assets/s30.png', // Local image
    'answers': [
      {'text': 'Car A', 'score': 0},
      {'text': 'Car B', 'score': 0},
      {'text': 'Car C', 'score': 1},
    ],
  },
  {
    'question': 'The car "B" is in the intersection, turning right on the red light. However, car "A" comes with a green light. Which of the cars should yield?',
    'image': 'assets/s32.png', // Local image
    'answers': [
      {'text': 'Car "A" should yield to car "B"', 'score': 1},
      {'text': 'Car "B" should yield to car "A"', 'score': 0},
      {'text': 'Both should stop and wait', 'score': 0},
    ],
  },
  {
    'question': 'Which of these signs is used to show the end of a divided highway?',
    'image': 'assets/2_19.png', // Local image
    'answers': [
      {'text': 'Sign 1', 'score': 0},
      {'text': 'Sign 2', 'score': 1},
      {'text': 'Sign 3', 'score': 0},
    ],
  },
];

// questions.dart

List<Map<String, Object>> quiz1 = [
  {
    'question': 'When you brake, the weight of your vehicle shifts to the:',
    'answers': [
      {'text': 'Front of the vehicle', 'score': 1},
      {'text': 'Rear of the vehicle', 'score': 0},
      {'text': 'Left side of the vehicle', 'score': 0},
    ],
  },
  {
    'question': 'Right of way laws are written:',
    'answers': [
      {'text': 'To demand the right of way', 'score': 0},
      {'text': 'In terms of who must give the right of way', 'score': 1},
      {'text': 'To allow one driver automatically to go ahead', 'score': 0},
    ],
  },
  {
    'question': 'What is the Zero Tolerance Law in Michigan?',
    'answers': [
      {'text': 'Zero alcohol while operating a motor vehicle', 'score': 1},
      {'text': 'This law does not apply in Michigan', 'score': 0},
      {'text': 'You are not allowed to get any points on your driving record', 'score': 0},
    ],
  },
  {
    'question': 'Each time you drive, make a pre-driving check of:',
    'answers': [
      {'text': 'Tires and lights', 'score': 1},
      {'text': 'All fluid levels', 'score': 0},
      {'text': 'Oil and transmission fluids', 'score': 0},
    ],
  },
  {
    'question': 'Following more closely than 3 to 4 seconds behind a vehicle may restrict your:',
    'answers': [
      {'text': 'Line of sight', 'score': 1},
      {'text': 'Fringe vision', 'score': 0},
      {'text': 'Peripheral vision', 'score': 0},
    ],
  },
  {
    'question': 'The more ____________ a moving object has, the harder it is to stop.',
    'answers': [
      {'text': 'Momentum', 'score': 1},
      {'text': 'Traction', 'score': 0},
      {'text': 'Adhesion', 'score': 0},
    ],
  },
  {
    'question': 'If a rear tire blows out, you might experience:',
    'answers': [
      {'text': 'Traction loss', 'score': 1},
      {'text': 'Increased traction', 'score': 0},
      {'text': 'Minimal impact', 'score': 0},
    ],
  },
  {
    'question': 'Before turning at a T intersection from a stop, you should look:',
    'answers': [
      {'text': 'Left, right, and left again', 'score': 1},
      {'text': 'Straight, left, and right', 'score': 0},
      {'text': 'Right, left, and right again', 'score': 0},
    ],
  },
  {
    'question': 'What action should you take first if the accelerator sticks and you need to stop quickly?',
    'answers': [
      {'text': 'Quickly kick the side of the accelerator to jar it free', 'score': 0},
      {'text': 'Turn off the ignition', 'score': 0},
      {'text': 'Shift to neutral and apply the brakes', 'score': 1},
    ],
  },
  {
    'question': 'Who yields the right-of-way when drivers enter a travel lane from a parking space?',
    'answers': [
      {'text': 'Whoever gets there first', 'score': 0},
      {'text': 'The driver entering the travel lane from the parking lane', 'score': 1},
      {'text': 'Oncoming traffic in the travel lane', 'score': 0},
    ],
  },
  {
    'question': 'A reasonable and prudent speed for any set of conditions is a speed that gives a driver:',
    'answers': [
      {'text': 'A safe path of travel', 'score': 1},
      {'text': 'An alternative path of travel', 'score': 0},
      {'text': 'An aggressive path of travel', 'score': 0},
    ],
  },
  {
    'question': 'When making a right turn at an intersection onto a two-way street, you should:',
    'answers': [
      {'text': 'Position your car closest to the center lane marking so as not to hit the curb', 'score': 0},
      {'text': 'Turn into the lane closest to the center line', 'score': 0},
      {'text': 'Turn from the lane closest to the right curb unless the turn is allowed from other lanes', 'score': 1},
    ],
  },
  {
    'question': 'Before turning left, it is important to:',
    'answers': [
      {'text': 'Yield to oncoming vehicles', 'score': 1},
      {'text': 'Wait until oncoming traffic has a red traffic light', 'score': 0},
      {'text': 'Swing to the right side of your lane', 'score': 0},
    ],
  },
  {
    'question': 'A Michigan Left, unless otherwise marked, is designed for _______.',
    'answers': [
      {'text': 'Two lanes of traffic', 'score': 0},
      {'text': 'One lane of traffic', 'score': 1},
      {'text': 'Three lanes of traffic', 'score': 0},
    ],
  },
  {
    'question': 'Serving as proof that a driver is financially responsible and can pay for damages resulting from a crash, Michigan requires that all drivers carry:',
    'answers': [
      {'text': 'Proof of insurance', 'score': 1},
      {'text': 'Title to the vehicle', 'score': 0},
      {'text': 'Car registration', 'score': 0},
    ],
  },
];

List<Map<String, Object>> quiz2 = [
  {
    'question': 'What is the benefit of Automatic Emergency Braking (AEB)?',
    'answers': [
      {'text': 'It will stop the vehicle and always prevent the crash', 'score': 0},
      {'text': 'It may stop the vehicle on its own or reduce the severity of the crash', 'score': 1},
      {'text': 'It will stop the vehicle and shift gears', 'score': 0},
    ],
  },
  {
    'question': 'Before turning left, it is important to:',
    'answers': [
      {'text': 'Yield to oncoming vehicles', 'score': 1},
      {'text': 'Wait until oncoming traffic has a red traffic light', 'score': 0},
      {'text': 'Swing to the right side of your lane', 'score': 0},
    ],
  },
  {
    'question': 'If a rear tire blows out, you might experience:',
    'answers': [
      {'text': 'Minimal impact', 'score': 0},
      {'text': 'Increased traction', 'score': 0},
      {'text': 'Traction loss', 'score': 1},
    ],
  },
  {
    'question': 'The more ____________ a moving object has, the harder it is to stop.',
    'answers': [
      {'text': 'Momentum', 'score': 1},
      {'text': 'Traction', 'score': 0},
      {'text': 'Adhesion', 'score': 0},
    ],
  },
  {
    'question': 'When traveling on a 2-lane roadway and an emergency vehicle is approaching, you should:',
    'answers': [
      {'text': 'Move to the right edge of the road and stop', 'score': 1},
      {'text': 'Stop immediately', 'score': 0},
      {'text': 'Flash your headlights to alert the driver ahead', 'score': 0},
    ],
  },
  {
    'question': 'When parked at a curb, which direction should you approach to enter the vehicle?',
    'answers': [
      {'text': 'From the rear', 'score': 0},
      {'text': 'From the front', 'score': 1},
      {'text': 'From the right side', 'score': 0},
    ],
  },
  {
    'question': 'Kelsey’s Law requires that a driver on a Level _______ License may not use their cell phone while driving.',
    'answers': [
      {'text': '1 learner’s and 3 full', 'score': 0},
      {'text': '1 learner’s and 2 intermediate', 'score': 1},
      {'text': '2 intermediate and 3 full', 'score': 0},
    ],
  },
  {
    'question': 'When driving a vehicle with airbags, you are safest when seated:',
    'answers': [
      {'text': 'Within 6 inches of the steering wheel', 'score': 0},
      {'text': 'At least 10 inches away from the steering wheel', 'score': 1},
      {'text': 'With your head positioned directly above the steering wheel', 'score': 0},
    ],
  },
  {
    'question': 'The best way to keep from getting involved in emergency driving situations is to:',
    'answers': [
      {'text': 'Keep your vehicle in good mechanical condition', 'score': 0},
      {'text': 'Use rearview and side mirrors', 'score': 0},
      {'text': 'Continually search for hazards', 'score': 1},
    ],
  },
  {
    'question': 'Right of way laws are written:',
    'answers': [
      {'text': 'To demand the right of way', 'score': 0},
      {'text': 'To allow one driver automatically to go ahead', 'score': 0},
      {'text': 'In terms of who must give the right of way', 'score': 1},
    ],
  },
  {
    'question': 'When you identify a potential hazard, you must:',
    'answers': [
      {'text': 'Decide what to do', 'score': 1},
      {'text': 'Immediately apply the brake', 'score': 0},
      {'text': 'Move to the right', 'score': 0},
    ],
  },
  {
    'question': 'Emergency flashers will warn other drivers:',
    'answers': [
      {'text': 'Of a problem', 'score': 1},
      {'text': 'That the flow of traffic is stopping', 'score': 0},
      {'text': 'That they should not try to pass you', 'score': 0},
    ],
  },
  {
    'question': 'Implied consent laws are designed to:',
    'answers': [
      {'text': 'Penalize drivers for refusal to take a breath or blood alcohol concentration test', 'score': 1},
      {'text': 'Penalize drivers for failing a blood alcohol concentration test', 'score': 0},
      {'text': 'Penalize drivers for failing a preliminary breath test', 'score': 0},
    ],
  },
  {
    'question': 'Unless otherwise posted, the speed limit in a residential area is:',
    'answers': [
      {'text': '35 MPH', 'score': 0},
      {'text': '30 MPH', 'score': 0},
      {'text': '25 MPH', 'score': 1},
    ],
  },
  {
    'question': 'When pulled over by the police, where should your hands be as the officer approaches your vehicle?',
    'answers': [
      {'text': 'Visible to the officer', 'score': 1},
      {'text': 'In your lap', 'score': 0},
      {'text': 'Reaching for your documents', 'score': 0},
    ],
  },
];

List<Map<String, Object>> quiz3 = [
  {
    'question': 'A parked car is on your right. What lane position should you move to?',
    'answers': [
      {'text': 'Left of center', 'score': 1},
      {'text': 'Center', 'score': 0},
      {'text': 'Right of center', 'score': 0},
    ],
  },
  {
    'question': 'What does searching for hazards in traffic depend on most?',
    'answers': [
      {'text': 'Moving eyes slowly from place to place', 'score': 0},
      {'text': 'Actively searching places where trouble could be', 'score': 1},
      {'text': 'Seeing out of the corners of your eyes', 'score': 0},
    ],
  },
  {
    'question': 'Unless otherwise posted, the speed limit in a residential area is:',
    'answers': [
      {'text': '30 MPH', 'score': 0},
      {'text': '25 MPH', 'score': 1},
      {'text': '35 MPH', 'score': 0},
    ],
  },
  {
    'question': 'The "Dutch Reach" provides a way for a driver to ensure safety of ___________ before exiting the vehicle.',
    'answers': [
      {'text': 'Approaching bicyclists', 'score': 1},
      {'text': 'Pedestrians on the sidewalk', 'score': 0},
      {'text': 'Pedestrians in the crosswalk', 'score': 0},
    ],
  },
  {
    'question': 'When traveling on a 3-lane freeway, which lane should you drive in?',
    'answers': [
      {'text': 'Left lane', 'score': 0},
      {'text': 'Center lane', 'score': 1},
      {'text': 'Any lane', 'score': 0},
    ],
  },
  {
    'question': 'A solid white line between lanes of traffic moving in the same direction:',
    'answers': [
      {'text': 'Discourages lane-changing at high-risk locations', 'score': 1},
      {'text': 'Indicates where a driver should stop', 'score': 0},
      {'text': 'Does not indicate if passing is legal', 'score': 0},
    ],
  },
  {
    'question': 'A vehicle driven into a curve tends to:',
    'answers': [
      {'text': 'Steer towards the left', 'score': 0},
      {'text': 'Steer towards the right', 'score': 0},
      {'text': 'Go in a straight line', 'score': 1},
    ],
  },
  {
    'question': 'The legal maximum speed limit when attempting to pass another vehicle is:',
    'answers': [
      {'text': 'The posted speed limit', 'score': 1},
      {'text': 'As fast as your vehicle can go', 'score': 0},
      {'text': '20 mph over the posted speed limit', 'score': 0},
    ],
  },
  {
    'question': 'When attempting to change lanes, it is safest to:',
    'answers': [
      {'text': 'Signal, check your mirrors, and then change lanes', 'score': 1},
      {'text': 'Signal, check blind spot, and move quickly to change lanes', 'score': 0},
      {'text': 'Check mirrors and blind spots, signal, check again, then change lanes', 'score': 0},
    ],
  },
  {
    'question': 'Before exiting your vehicle, ensure that:',
    'answers': [
      {'text': 'You check mirrors and over your shoulder for traffic', 'score': 1},
      {'text': 'Release the parking brake and turn off the vehicle', 'score': 0},
      {'text': 'Turn the ignition to the accessory position', 'score': 0},
    ],
  },
  {
    'question': 'The type of vision that provides the most detail in targeting one object is called:',
    'answers': [
      {'text': 'Fringe vision', 'score': 0},
      {'text': 'Peripheral vision', 'score': 0},
      {'text': 'Central vision', 'score': 1},
    ],
  },
  {
    'question': 'How should you approach farm machinery in the roadway?',
    'answers': [
      {'text': 'Flash your high beam headlights so they can see you', 'score': 0},
      {'text': 'Honk your vehicle’s horn and continue at your current speed', 'score': 0},
      {'text': 'Adjust your speed and position', 'score': 1},
    ],
  },
  {
    'question': 'If a rear tire blows out, you might experience:',
    'answers': [
      {'text': 'Minimal impact', 'score': 0},
      {'text': 'Increased traction', 'score': 0},
      {'text': 'Traction loss', 'score': 1},
    ],
  },
  {
    'question': 'Implied consent laws are designed to:',
    'answers': [
      {'text': 'Penalize drivers for refusal to take a breath or blood alcohol concentration test', 'score': 1},
      {'text': 'Penalize drivers for failing a blood alcohol concentration test', 'score': 0},
      {'text': 'Penalize drivers for failing a preliminary breath test', 'score': 0},
    ],
  },
  {
    'question': 'What is the best way to approach a yellow signal light at an intersection?',
    'answers': [
      {'text': 'Stop before entering if you can do so safely', 'score': 1},
      {'text': 'Speed up to cross before it turns red', 'score': 0},
      {'text': 'Slow down and proceed through cautiously', 'score': 0},
    ],
  },
];

// Function to get a random set of questions
List<Map<String, Object>> getRandomQuestions(List<Map<String, Object>> questions, int numberOfQuestions) {
  questions.shuffle();
  return questions.take(numberOfQuestions).toList();
}
