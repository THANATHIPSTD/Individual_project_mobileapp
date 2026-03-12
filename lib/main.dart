import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  if (kIsWeb) {
    FlutterError.onError = (FlutterErrorDetails details) {
      debugPrint(details.toString());
    };
  }
  runApp(const FotmobApp());
}

class FotmobApp extends StatelessWidget {
  const FotmobApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FotMob Follow',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const FollowScreen(),
    );
  }
}

class FollowScreen extends StatefulWidget {
  const FollowScreen({super.key});

  @override
  State<FollowScreen> createState() => _FollowScreenState();
}

class _FollowScreenState extends State<FollowScreen> {

  int selectedIndex = 3;
  int? hoverIndex;

  int getColumns(double width) {
    if (width < 600) return 2;
    if (width < 900) return 3;
    return 4;
  }

  final teams = [
    {
      "name": "Arsenal",
      "color": const Color(0xFFEF0107),
      "logo": "https://upload.wikimedia.org/wikipedia/hif/8/82/Arsenal_FC.png"
    },
    {
      "name": "Chelsea",
      "color": const Color(0xFF034694),
      "logo":
          "https://upload.wikimedia.org/wikipedia/sco/thumb/c/cc/Chelsea_FC.svg/3840px-Chelsea_FC.svg.png"
    },
    {
      "name": "Liverpool",
      "color": const Color(0xFFC8102E),
      "logo":
          "https://upload.wikimedia.org/wikipedia/sco/thumb/0/0c/Liverpool_FC.svg/500px-Liverpool_FC.svg.png"
    },
    {
      "name": "Man City",
      "color": const Color(0xFF6CABDD),
      "logo":
          "https://upload.wikimedia.org/wikipedia/en/thumb/e/eb/Manchester_City_FC_badge.svg/1280px-Manchester_City_FC_badge.svg.png"
    },
    {
      "name": "Man United",
      "color": const Color(0xFFDA291C),
      "logo":
          "https://upload.wikimedia.org/wikipedia/en/thumb/7/7a/Manchester_United_FC_crest.svg/1280px-Manchester_United_FC_crest.svg.png"
    },
    {
      "name": "Barcelona",
      "color": const Color(0xFF004D98),
      "logo":
          "https://upload.wikimedia.org/wikipedia/en/thumb/4/47/FC_Barcelona_%28crest%29.svg/250px-FC_Barcelona_%28crest%29.svg.png"
    },
    {
      "name": "Real Madrid",
      "color": const Color(0xFF00529F),
      "logo":
          "https://upload.wikimedia.org/wikipedia/sco/thumb/5/56/Real_Madrid_CF.svg/1920px-Real_Madrid_CF.svg.png"
    },
    {
      "name": "Bayern Munich",
      "color": const Color(0xFFDC052D),
      "logo":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1f/Logo_FC_Bayern_M%C3%BCnchen_%282002%E2%80%932017%29.svg/3840px-Logo_FC_Bayern_M%C3%BCnchen_%282002%E2%80%932017%29.svg.png"
    },
    {
      "name": "PSG",
      "color": const Color(0xFF004170),
      "logo":
          "https://upload.wikimedia.org/wikipedia/en/thumb/a/a7/Paris_Saint-Germain_F.C..svg/1280px-Paris_Saint-Germain_F.C..svg.png"
    },
    {
      "name": "Tottenham",
      "color": const Color(0xFF132257),
      "logo":
          "https://upload.wikimedia.org/wikipedia/hif/6/6d/Tottenham_Hotspur.png"
    },
  ];

  final players = [
  {
    "name": "Cristiano Ronaldo",
    "image": "https://fbref.com/req/202302030/images/headshots/dea698d9_2022.jpg",
    "color": Colors.amber
  },
  {
    "name": "Kylian Mbappe",
    "image": "https://fbref.com/req/202302030/images/headshots/42fd9c7f_2022.jpg",
    "color": const Color(0xFF004170)
  },
  {
    "name": "Erling Haaland",
    "image": "https://fbref.com/req/202302030/images/headshots/1f44ac21_2022.jpg",
    "color": const Color(0xFF6CABDD)
  },
  {
    "name": "Jude Bellingham",
    "image": "https://fbref.com/req/202302030/images/headshots/57d88cf9_2022.jpg",
    "color": const Color(0xFF00529F)
  },
  {
    "name": "Mohamed Salah",
    "image": "https://fbref.com/req/202302030/images/headshots/e342ad68_2022.jpg",
    "color": const Color(0xFFC8102E)
  },
  {
    "name": "Son Heung-Min",
    "image": "https://fbref.com/req/202302030/images/headshots/92e7e919_2022.jpg",
    "color": const Color(0xFF132257)
  },
  {
    "name": "Harry Kane",
    "image": "https://fbref.com/req/202302030/images/headshots/21a66f6a_2022.jpg",
    "color": const Color(0xFFDC052D)
  },
  {
    "name": "Vinicius Junior",
    "image": "https://fbref.com/req/202302030/images/headshots/7111d552_2022.jpg",
    "color": const Color(0xFF00529F)
  },
  {
    "name": "Cole Palmer",
    "image": "https://fbref.com/req/202302030/images/headshots/dc7f8a28_2022.jpg",
    "color": const Color(0xFF034694)
  },
  {
    "name": "Lamine Yamal",
    "image": "https://fbref.com/req/202302030/images/headshots/82ec26c1_2022.jpg",
    "color": const Color(0xFF004D98)
  },
];

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (context, constraints) {

        final width = constraints.maxWidth;
        final columns = getColumns(width);
        final isLarge = width >= 700;

        if (isLarge) {
          return Scaffold(
            body: Row(
              children: [

                NavigationRail(
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  labelType: NavigationRailLabelType.all,
                  destinations: const [
                    NavigationRailDestination(icon: Icon(Icons.sports_soccer), label: Text("Matches")),
                    NavigationRailDestination(icon: Icon(Icons.article), label: Text("News")),
                    NavigationRailDestination(icon: Icon(Icons.emoji_events), label: Text("Leagues")),
                    NavigationRailDestination(icon: Icon(Icons.star), label: Text("Follow")),
                    NavigationRailDestination(icon: Icon(Icons.search), label: Text("Search")),
                  ],
                ),

                const VerticalDivider(width: 1),

                Expanded(
                  child: SafeArea(
                    child: DefaultTabController(
                      length: 2,
                      child: Scaffold(
                        appBar: AppBar(
                          title: const Text("Follow"),
                          bottom: const TabBar(
                            tabs: [
                              Tab(text: "Teams"),
                              Tab(text: "Players"),
                            ],
                          ),
                        ),
                        body: TabBarView(
                          children: [
                            buildTeamGrid(columns),
                            buildPlayerGrid(columns),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }

        return SafeArea(
          child: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                title: const Text("Follow"),
                bottom: const TabBar(
                  tabs: [
                    Tab(text: "Teams"),
                    Tab(text: "Players"),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  buildTeamGrid(columns),
                  buildPlayerGrid(columns),
                ],
              ),
              bottomNavigationBar: NavigationBar(
                selectedIndex: selectedIndex,
                onDestinationSelected: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                destinations: const [
                  NavigationDestination(icon: Icon(Icons.sports_soccer), label: "Matches"),
                  NavigationDestination(icon: Icon(Icons.article), label: "News"),
                  NavigationDestination(icon: Icon(Icons.emoji_events), label: "Leagues"),
                  NavigationDestination(icon: Icon(Icons.star), label: "Follow"),
                  NavigationDestination(icon: Icon(Icons.search), label: "Search"),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildTeamGrid(int columns) {

    final screenWidth = MediaQuery.sizeOf(context).width;

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: teams.length,
      itemBuilder: (context, index) {

        final team = teams[index];
        final isHover = hoverIndex == index;

        return MouseRegion(
          onEnter: (_) => setState(() => hoverIndex = index),
          onExit: (_) => setState(() => hoverIndex = null),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            transform: isHover
                ? (Matrix4.identity()..scale(1.05))
                : Matrix4.identity(),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: team["color"] as Color,
              borderRadius: BorderRadius.circular(20),
              boxShadow: isHover
                  ? [
                      const BoxShadow(
                        color: Colors.black54,
                        blurRadius: 12,
                        offset: Offset(0, 6),
                      )
                    ]
                  : [],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Image.network(
                  team["logo"] as String,
                  width: 56,
                  height: 56,
                  fit: BoxFit.contain,
                ),

                const SizedBox(height: 16),

                Text(
                  team["name"] as String,
                  style: TextStyle(
                    fontSize: screenWidth < 600 ? 18 : 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const Spacer(),

                const Text("Next Match"),
                const Text("12 Mar 03:00"),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildPlayerGrid(int columns) {

    final screenWidth = MediaQuery.sizeOf(context).width;

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: players.length,
      itemBuilder: (context, index) {

        final player = players[index];
        final parts = (player["name"] as String).split(" ");

        final hoverId = index + 100;
        final isHover = hoverIndex == hoverId;

        return MouseRegion(
          onEnter: (_) => setState(() => hoverIndex = hoverId),
          onExit: (_) => setState(() => hoverIndex = null),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            transform: isHover
                ? (Matrix4.identity()..scale(1.05))
                : Matrix4.identity(),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: player["color"] as Color,
              borderRadius: BorderRadius.circular(20),
              boxShadow: isHover
                  ? [
                      const BoxShadow(
                        color: Colors.black54,
                        blurRadius: 12,
                        offset: Offset(0, 6),
                      )
                    ]
                  : [],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                ClipOval(
                  child: Image.network(
                    player["image"] as String,
                    width: 56,
                    height: 56,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(height: 16),

                Text(
                  parts.first,
                  style: TextStyle(fontSize: screenWidth < 600 ? 14 : 16),
                ),

                Text(
                  parts.length > 1 ? parts.last : "",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth < 600 ? 18 : 20,
                  ),
                ),

                const Spacer(),

                const Row(
                  children: [
                    Icon(Icons.sports_soccer, size: 16),
                    SizedBox(width: 8),
                    Text("22"),
                    SizedBox(width: 16),
                    Icon(Icons.sports_football, size: 16),
                    SizedBox(width: 8),
                    Text("8"),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}