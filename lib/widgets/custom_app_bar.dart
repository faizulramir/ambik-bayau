import 'dart:async';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  List<String> hints = ['places', 'food'];
  String animatedHint = '';
  Timer? _timer;
  int _charIndex = 0;
  int _hintIndex = 0;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    String currentWord = hints[_hintIndex];
    _charIndex = 0;
    animatedHint = '';

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (_charIndex < currentWord.length) {
        setState(() {
          animatedHint += currentWord[_charIndex];
          _charIndex++;
        });
      } else {
        timer.cancel();
        _hintIndex = (_hintIndex == 0) ? 1 : 0;
        Future.delayed(const Duration(seconds: 3), _startAnimation);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF50C878), // soft emerald
              Color(0xFF87CEEB), // soft blue
            ],
          ),
        ),
      ),
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(50),
          ),
          child: IconButton(
            icon: const Icon(
              Icons.qr_code_scanner_rounded,
              color: Colors.white,
            ),
            tooltip: 'QR Scanner',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('QR Scanner pressed')),
              );
            },
          ),
        ),
      ),
      titleSpacing: 0,
      title: SearchAnchor(
        builder: (BuildContext context, SearchController controller) {
          return SearchBar(
            constraints: const BoxConstraints(
              minHeight: 40,
              maxWidth: double.infinity,
            ),
            controller: controller,
            shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
            ),
            elevation: const WidgetStatePropertyAll<double>(0),
            padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(
              EdgeInsets.symmetric(horizontal: 8.0),
            ),
            onTap: () {
              controller.openView();
            },
            onChanged: (_) {
              controller.openView();
            },
            leading: const Icon(Icons.search_rounded, size: 24),
            hintText: 'Search $animatedHint',
            hintStyle: const WidgetStatePropertyAll<TextStyle>(
              TextStyle(fontSize: 14),
            ),
          );
        },
        suggestionsBuilder:
            (BuildContext context, SearchController controller) {
              return List<ListTile>.generate(5, (int index) {
                final String item = 'item $index';
                return ListTile(
                  title: Text(item),
                  onTap: () {
                    controller.closeView(item);
                  },
                );
              });
            },
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: IconButton(
              icon: const Icon(Icons.person_2_rounded),
              tooltip: 'Profile',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Profile pressed')),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
