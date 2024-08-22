import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;
import '../../moduls/layout/provider/settings_provider.dart';
import '../provider/settings_provider.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  _SebhaScreenState createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  int _tasbeehCount = 0;
  final List<String> _azkar = ['سبحان الله', 'الحمد لله', 'الله أكبر', 'لا إله إلا الله'];
  int _currentZikrIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _increaseTasbeehCount() {
    setState(() {
      _tasbeehCount++;
      if (_tasbeehCount % 33 == 0) {
        _currentZikrIndex = (_currentZikrIndex + 1) % _azkar.length;
      }
    });
    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    final isDarkMode = provider.themeMode == ThemeMode.dark;

    final headImage = isDarkMode
        ? 'assets/images/head_sebha_dark.png'
        : 'assets/images/head_sebha_logo.png';

    final bodyImage = isDarkMode
        ? 'assets/images/body_sebha_dark.png'
        : 'assets/images/body_sebha_logo.png';

    final lightModeTextColor = Colors.black;
    final lightModeBackgroundColor = const Color(0xFFD7BBA9);
    final lightModeButtonColor = const Color(0xFFD7BBA9);

    final darkModeTextColor = Colors.white;
    final darkModeBackgroundColor = const Color(0xFF141A2F);
    final darkModeButtonColor = const Color(0xFFF7C850);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const SizedBox(height: 40),
              Column(
                children: [
                  Image.asset(
                    headImage,
                    width: 120,
                    height: 120,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 5),
                  AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: _tasbeehCount % 33 * 2 * math.pi / 33,
                        child: child,
                      );
                    },
                    child: Image.asset(
                      bodyImage,
                      width: 250,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Text(
                'عدد التسبيحات',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? darkModeTextColor : lightModeTextColor,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isDarkMode
                      ? darkModeBackgroundColor
                      : lightModeBackgroundColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '$_tasbeehCount',
                  style: TextStyle(
                    fontSize: 32,
                    color: isDarkMode ? darkModeButtonColor : Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: 200,
                height: 60,
                child: ElevatedButton(
                  onPressed: _increaseTasbeehCount,
                  style: ElevatedButton.styleFrom(
                    primary: isDarkMode
                        ? darkModeButtonColor
                        : lightModeButtonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    _azkar[_currentZikrIndex],
                    style: TextStyle(
                      fontSize: 24,
                      color: isDarkMode ? Colors.black : Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
