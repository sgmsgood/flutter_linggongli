import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linjuli_linggongli/app/router/juli_router.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Text('sdf23s'),
              ElevatedButton(
                onPressed: () {
                  FirebaseAnalytics.instance.logEvent(
                      name: "CLICK_MOVE_ALBUM_PAGE",
                      );
                  context.go('/albumList');
                },
                child: Text('yin le xiang'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
