class DemoModel {
  final String title;
  final String image;
  final String location;
  final String price;
  final String description;
  final List<String> tags;

  DemoModel({
    required this.title,
    required this.image,
    required this.location,
    required this.price,
    required this.description,
    required this.tags,
  });
}

List<DemoModel> demoModels = [
  // Mountain destinations
  DemoModel(
    title: 'Mountain Peak',
    image: 'assets/images/mountain.jpg',
    location: 'Himalayas, Nepal',
    price: '\$299',
    description: 'Stand in awe of the world\'s highest peaks as you embark on an unforgettable journey through the majestic Himalayas. This breathtaking destination offers pristine mountain air, ancient Buddhist monasteries, and panoramic views that will leave you speechless. Experience the rich culture of Nepal while trekking through valleys dotted with prayer flags and traditional Sherpa villages.',
    tags: ['mountains', 'hiking', 'adventure'],
  ),
  DemoModel(
    title: 'Alpine Adventure',
    image: 'assets/images/mountain1.jpg',
    location: 'Swiss Alps',
    price: '\$450',
    description: 'Discover the timeless beauty of the Swiss Alps, where snow-capped peaks meet charming alpine villages. This pristine destination offers world-class skiing, hiking trails, and cozy mountain huts. Experience the perfect blend of adventure and luxury as you explore crystal-clear lakes, flower-filled meadows, and traditional Swiss culture in this picture-perfect alpine paradise.',
    tags: ['mountains', 'hiking', 'adventure'],
  ),
  DemoModel(
    title: 'Mountain Vista',
    image: 'assets/images/mountain2.jpg',
    location: 'Rocky Mountains, USA',
    price: '\$199',
    description: 'Immerse yourself in the rugged beauty of the Rocky Mountains, where dramatic peaks rise majestically against endless blue skies. This iconic American wilderness offers incredible wildlife viewing, pristine hiking trails, and breathtaking sunsets. From spotting elk and bears to exploring ancient forests and crystal-clear mountain streams, every moment here is a nature lover\'s dream.',
    tags: ['mountains', 'hiking', 'nature'],
  ),
  
  // Beach destinations
  DemoModel(
    title: 'Tropical Paradise',
    image: 'assets/images/beach.jpg',
    location: 'Maldives',
    price: '\$599',
    description: 'Escape to a world of unparalleled luxury and natural beauty in the Maldives, where crystal-clear turquoise waters meet pristine white sand beaches. This tropical paradise offers overwater bungalows, world-class diving among vibrant coral reefs, and the most spectacular sunsets you\'ll ever witness. Indulge in spa treatments, fresh seafood, and the ultimate relaxation experience in this slice of heaven on earth.',
    tags: ['ocean', 'beach', 'relaxation'],
  ),
  DemoModel(
    title: 'Sunset Beach',
    image: 'assets/images/beach1.jpg',
    location: 'Bali, Indonesia',
    price: '\$299',
    description: 'Discover the magic of Bali\'s legendary beaches, where golden sands stretch endlessly and world-class surf breaks await. This enchanting island destination combines ancient Hindu temples, lush rice terraces, and vibrant beach culture. From romantic sunset dinners to thrilling surf lessons, Bali offers the perfect blend of adventure and relaxation. Immerse yourself in the island\'s spiritual energy while enjoying pristine beaches and warm hospitality.',
    tags: ['ocean', 'beach', 'surfing'],
  ),
  DemoModel(
    title: 'Coastal Retreat',
    image: 'assets/images/beach2.jpg',
    location: 'Santorini, Greece',
    price: '\$399',
    description: 'Experience the romance and beauty of Santorini, where dramatic cliffs meet the sparkling Aegean Sea. This iconic Greek island captivates with its whitewashed buildings, blue-domed churches, and breathtaking sunsets that paint the sky in shades of gold and pink. Stroll through charming villages, savor authentic Greek cuisine, and relax on unique volcanic beaches while soaking in the island\'s timeless Mediterranean charm.',
    tags: ['ocean', 'beach', 'romantic'],
  ),
  
  // Forest destinations
  DemoModel(
    title: 'Ancient Forest',
    image: 'assets/images/forest.jpg',
    location: 'Amazon Rainforest',
    price: '\$199',
    description: 'Venture into the heart of the world\'s largest rainforest, where ancient trees tower above and exotic wildlife thrives in their natural habitat. The Amazon offers an unparalleled biodiversity experience, from colorful parrots and playful monkeys to elusive jaguars and pink river dolphins. Navigate winding waterways, discover indigenous communities, and witness the incredible ecosystem that produces 20% of the world\'s oxygen in this living, breathing natural wonder.',
    tags: ['forest', 'nature', 'wildlife'],
  ),
  DemoModel(
    title: 'Mystical Woods',
    image: 'assets/images/forest1.jpg',
    location: 'Black Forest, Germany',
    price: '\$249',
    description: 'Step into the enchanting realm of the Black Forest, where centuries-old legends come to life among towering pine trees and misty valleys. This magical destination inspired countless fairy tales and offers charming villages, traditional cuckoo clocks, and delicious Black Forest cake. Hike through dense woodlands, discover hidden waterfalls, and experience the timeless beauty of German folklore in this captivating forest sanctuary.',
    tags: ['forest', 'hiking', 'mystical'],
  ),
  DemoModel(
    title: 'Forest Sanctuary',
    image: 'assets/images/forest2.jpg',
    location: 'Redwood National Park',
    price: '\$179',
    description: 'Stand in awe beneath the world\'s tallest trees in California\'s magnificent Redwood National Park, where ancient giants have stood for over 2,000 years. This sacred forest sanctuary offers peaceful hiking trails, fern-covered forest floors, and the humbling experience of walking among living monuments. Feel the spiritual energy of these ancient redwoods while exploring pristine wilderness that has remained virtually unchanged for millennia.',
    tags: ['forest', 'hiking', 'nature'],
  ),
  
  // Hiking destinations
  DemoModel(
    title: 'Trail Adventure',
    image: 'assets/images/hiking.jpg',
    location: 'Appalachian Trail',
    price: '\$149',
    description: 'Embark on the legendary Appalachian Trail, a 2,200-mile journey through some of America\'s most diverse and beautiful landscapes. This iconic hiking destination takes you through 14 states, from the rolling hills of Georgia to the rugged peaks of Maine. Experience changing seasons, encounter diverse wildlife, and connect with fellow hikers while challenging yourself on one of the world\'s most famous long-distance trails.',
    tags: ['hiking', 'adventure', 'nature'],
  ),
  DemoModel(
    title: 'Mountain Trail',
    image: 'assets/images/hiking1.jpg',
    location: 'Pacific Crest Trail',
    price: '\$199',
    description: 'Conquer the Pacific Crest Trail, a breathtaking 2,650-mile journey from Mexico to Canada through California, Oregon, and Washington. This challenging trail offers incredible diversity, from desert landscapes to alpine meadows and volcanic peaks. Experience the solitude of the wilderness, witness stunning sunrises over mountain ranges, and push your limits while hiking through some of the most spectacular scenery North America has to offer.',
    tags: ['hiking', 'mountains', 'adventure'],
  ),
  DemoModel(
    title: 'Wilderness Trek',
    image: 'assets/images/hiking2.jpg',
    location: 'Patagonia, Chile',
    price: '\$349',
    description: 'Discover the raw, untamed beauty of Patagonia, where jagged peaks pierce the sky and glaciers carve through pristine wilderness. This remote corner of South America offers some of the world\'s most challenging and rewarding hiking experiences. Trek through Torres del Paine National Park, witness massive glaciers, and encounter unique wildlife while exploring one of the last truly wild places on Earth.',
    tags: ['hiking', 'adventure', 'wilderness'],
  ),
];

