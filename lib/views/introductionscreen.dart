import 'package:flutter/material.dart';
import 'package:pert8/views/login_page.dart';
import 'package:pert8/views/register_page.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> pageList = [
    {
      'imageAsset': 'images/img intro 1.png',
      'title': 'The World at Your Fingertips',
      'subtitle':
          'Get 24/7 updates on global news – from breaking politics to cultural trends, all in one place',
    },
    {
      'imageAsset': 'images/img intro 2.png',
      'title': 'Tailored to Your Curiosity',
      'subtitle':
          'Select your interests and receive handpicked stories. Technology, sports, or entertainment – we’ve got you covered',
    },
    {
      'imageAsset': 'images/img intro 3.png',
      'title': 'Trusted Updates in Real-Time',
      'subtitle':
          'Instant alerts for breaking news, rigorously fact-checked by our editors before they reach you',
    },
  ];

  void _nextPage() {
    if (_currentPage < pageList.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _skip() {
    _pageController.jumpToPage(pageList.length - 1);
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color(0xFF2D2A7B);
    final Color lightPurple = const Color(0xFFB6BEE2);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: pageList.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                final page = pageList[index];
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(page['imageAsset']!, height: 300),
                      Column(
                        children: [
                          //garis
                           if (_currentPage == 1 || _currentPage == 2)
                          Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            width: 440, 
                            height: 2,
                            color: primaryColor,
                          ),
                          Text(
                            page['title']!,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2D2A7B),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            page['subtitle']!,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          pageList.length,
                          (dotIndex) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: _currentPage == dotIndex ? 16 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: _currentPage == dotIndex
                                  ? primaryColor
                                  : Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                      if (_currentPage != pageList.length - 1)
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: _skip,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: lightPurple,
                                  foregroundColor: primaryColor,
                                  padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Text(
                                  'Skip',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  
                                  ),
                                ),
                              ),
                              const SizedBox(width: 40),
                              ElevatedButton(
                                onPressed: _nextPage,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Text(
                                  'Next',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          )
                      else
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage())); 
                        }, 
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'Get Started',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
