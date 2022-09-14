import 'dart:io';

import 'package:educational_websites_app/screens/home_page.dart';
import 'package:educational_websites_app/screens/website_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const HomePage(),
        "website_page": (context) => const WebsitePage(),
      },
    ),
  );
}
