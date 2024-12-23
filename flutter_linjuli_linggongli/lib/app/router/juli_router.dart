import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_linjuli_linggongli/home/home_page.dart';
import 'package:flutter_linjuli_linggongli/musics/album_list_page.dart';
import 'package:flutter_linjuli_linggongli/musics/music_list_page.dart';
import 'package:flutter_linjuli_linggongli/singer/introduce_page.dart';
import 'package:go_router/go_router.dart';

final analytics = FirebaseAnalytics.instance;

GoRouter router = GoRouter(
  observers: [FirebaseAnalyticsObserver(analytics: analytics)],
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (BuildContext context, _) => HomePage(),
      routes: [
        GoRoute(
          path: 'albumList',
          name: 'album_list_view',
          builder: (BuildContext context, _) => AlbumListPage(),
          routes: [
            GoRoute(
              path: 'musicList',
              name: 'music_list_view',
              builder: (BuildContext context, _) => const MusicListPage(),
            ),
          ],
        ),
        GoRoute(
          path: 'introduce',
          name: 'introduce_view',
          builder: (BuildContext context, _) => const IntroducePage(),
        ),
      ],
    ),
  ],
);
