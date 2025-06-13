import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class AppColors {
  static const pureWhite = Color.fromARGB(255, 255, 255, 255);
  static const softBlueGray = Color.fromARGB(255, 241, 246, 248);
  static const mutedGrayPeach = Color.fromARGB(253, 205, 213, 214);
  static const navyBlueDark = Color.fromARGB(255, 20, 40, 80);
  static const navyBlue = Color.fromARGB(255, 30, 60, 100);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rewards App',
      theme: ThemeData(
        primaryColor: AppColors.navyBlue,
        scaffoldBackgroundColor: AppColors.pureWhite,
        fontFamily: 'Poppins',
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.navyBlue,
          titleTextStyle: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.pureWhite,
          ),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontFamily: 'Poppins',
            color: AppColors.navyBlueDark,
          ),
        ),
      ),
      home: RewardsPage(),
    );
  }
}

class RewardsPage extends StatefulWidget {
  @override
  _RewardsPageState createState() => _RewardsPageState();
}

class _RewardsPageState extends State<RewardsPage> {
  final PageController _controller = PageController(viewportFraction: 1.0);
  int _currentIndex = 0;
  Timer? _timer;

  final List<String> imagePaths = [
    'assets/carousel/image1.jpg',
    'assets/carousel/image2.jpg',
    'assets/carousel/image3.jpg',
    'assets/carousel/image4.jpg',
  ];

  List rewardsData = [
    {'name': 'Flipkart', 'coins': 6, 'logo': 'assets/images/flipkart.jpg'},
    {'name': 'Amazon', 'coins': 10, 'logo': 'assets/images/amazon.jpg'},
    {'name': 'Myntra', 'coins': 4, 'logo': 'assets/images/myntra.jpg'},
    {'name': 'Nykaa', 'coins': 4, 'logo': 'assets/images/nykaa.jpg'},
    {'name': 'AJIO', 'coins': 10, 'logo': 'assets/images/ajio.jpg'},
    {'name': 'Libas', 'coins': 3, 'logo': 'assets/images/libas.jpeg'},
    {'name': 'Purple', 'coins': 5, 'logo': 'assets/images/purple.jpeg'},
    {'name': 'Meesho', 'coins': 7, 'logo': 'assets/images/meesho.jpeg'},
    {'name': 'Max', 'coins': 5, 'logo': 'assets/images/Max.jpeg'},
    {'name': 'KFC', 'coins': 8, 'logo': 'assets/images/kfc.jpeg'},
    {'name': 'Zomato', 'coins': 9, 'logo': 'assets/images/zomato.jpeg'},
    {'name': 'Swiggy', 'coins': 9, 'logo': 'assets/images/Swiggy.png'},
    {'name': 'Paytm', 'coins': 6, 'logo': 'assets/images/paytm.jpeg'},
  ];

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentIndex < imagePaths.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }
      _controller.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int totalCoins = rewardsData.fold(0, (sum, item) => sum + (item['coins'] as int));

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Rewards',style: TextStyle(color: AppColors.pureWhite),),
        centerTitle: true,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            int crossAxisCount = constraints.maxWidth >= 900
                ? 4
                : constraints.maxWidth >= 600
                    ? 3
                    : 2;
            double aspectRatio = constraints.maxWidth > 600 ? 0.95 : 0.8;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Carousel
                  SizedBox(
                    height: screenWidth < 600 ? 180 : 250,
                    child: PageView.builder(
                      controller: _controller,
                      itemCount: imagePaths.length,
                      onPageChanged: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 6,
                                offset: Offset(0, 4),
                              ),
                            ],
                            color: AppColors.pureWhite,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              imagePaths[index],
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Total Coins Display
                  Center(
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 600),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [AppColors.navyBlue, AppColors.mutedGrayPeach],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'Total Coins',
                            style: TextStyle(
                              color: AppColors.navyBlueDark,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '$totalCoins',
                            style: const TextStyle(
                              color: Colors.orange,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Grid View
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: rewardsData.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      childAspectRatio: aspectRatio,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemBuilder: (context, index) {
                      final item = rewardsData[index];
                      return buildRewardCard(item);
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildRewardCard(Map<String, dynamic> item) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColors.softBlueGray, AppColors.mutedGrayPeach],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: constraints.maxHeight * 0.2,
                    backgroundImage: AssetImage(item['logo']),
                  ),
                  const SizedBox(height: 12),
                  FittedBox(
                    child: Text(
                      item['name'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: AppColors.navyBlueDark,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.currency_rupee, size: 16, color: Colors.orange),
                        const SizedBox(width: 4),
                        Text(
                          '${item['coins']}',
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.navyBlueDark,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
