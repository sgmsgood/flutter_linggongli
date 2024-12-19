import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_linjuli_linggongli/home/home_page.dart';
import 'package:flutter_linjuli_linggongli/musics/album_list_page.dart';
import 'package:flutter_linjuli_linggongli/musics/music_page.dart';
import 'package:go_router/go_router.dart';

final analytics = FirebaseAnalytics.instance;

GoRouter router = GoRouter(
  observers: [FirebaseAnalyticsObserver(analytics: analytics)],
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (BuildContext context, _) => const HomePage(),
      routes:[
        GoRoute(
          path: 'musicList',
          name: 'musicList',
          builder: (BuildContext context, _) => const MusicPage(),
        ),
        GoRoute(
          path: 'albumList',
          name: 'albumList',
          builder: (BuildContext context, _) => const AlbumListPage(),
        ),
      ]
    ),

  ]
);