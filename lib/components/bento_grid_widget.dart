import 'package:flutter/material.dart';
import 'package:gen_ai/pages/breathe.dart';
import 'package:gen_ai/pages/chat_screen.dart';
import 'package:gen_ai/pages/community.dart';
import 'package:gen_ai/pages/dashboard.dart';
import 'package:gen_ai/pages/hero_page.dart';
import 'package:gen_ai/pages/journal.dart';
import 'package:gen_ai/pages/meditation.dart';
import 'package:gen_ai/pages/mood.dart';
import 'package:gen_ai/pages/type.dart';
import 'package:design_grid/design_grid.dart';

class BentoGridWidget extends StatelessWidget {
  const BentoGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveDesignGridConfig(
      breakpoints: const ResponsiveDesignGridBreakpoints(
        small: 375,
        medium: 768,
        large: 1280,
        extraLarge: 1920,
      ),
      theme: ResponsiveDesignGridThemeData(
        columns: 12,
        columnSpacing: 16.0,
        rowSpacing: 16.0,
        gridPadding: 16.0,
      ),
      child: ResponsiveDesignGrid(
        children: [
          ResponsiveDesignGridRow(
            children: [
              // Row 1
              ResponsiveDesignGridItem(
                columns: ResponsiveDesignGridColumns(
                  small: 12,
                  medium: 6,
                  large: 4,
                  extraLarge: 4,
                ),
                child: _buildCard(
                    context, 'Mood', Colors.lightGreen, () => onMood(context),
                    isWide: true),
              ),
              ResponsiveDesignGridItem(
                columns: ResponsiveDesignGridColumns(
                  small: 12,
                  medium: 6,
                  large: 4,
                  extraLarge: 4,
                ),
                child: _buildCard(context, 'Dashboard', Colors.blueAccent,
                    () => onDash(context),
                    isWide: false),
              ),
              ResponsiveDesignGridItem(
                columns: ResponsiveDesignGridColumns(
                  small: 12,
                  medium: 12,
                  large: 4,
                  extraLarge: 4,
                ),
                child: _buildCard(context, 'Breathe', Colors.orangeAccent,
                    () => onBreathe(context),
                    isWide: true),
              ),
            ],
          ),
          ResponsiveDesignGridRow(
            children: [
              // Row 2
              ResponsiveDesignGridItem(
                columns: ResponsiveDesignGridColumns(
                  small: 12,
                  medium: 6,
                  large: 4,
                  extraLarge: 4,
                ),
                child: _buildCard(
                    context, 'Type', Colors.purpleAccent, () => onType(context),
                    isWide: false),
              ),
              ResponsiveDesignGridItem(
                columns: ResponsiveDesignGridColumns(
                  small: 12,
                  medium: 6,
                  large: 4,
                  extraLarge: 4,
                ),
                child: _buildCard(context, 'Journal', Colors.tealAccent,
                    () => onJournal(context),
                    isWide: false),
              ),
              ResponsiveDesignGridItem(
                columns: ResponsiveDesignGridColumns(
                  small: 12,
                  medium: 6,
                  large: 4,
                  extraLarge: 4,
                ),
                child: _buildCard(context, 'Community', Colors.amberAccent,
                    () => onCommunity(context),
                    isWide: true),
              ),
            ],
          ),
          ResponsiveDesignGridRow(
            children: [
              // Row 3
              ResponsiveDesignGridItem(
                columns: ResponsiveDesignGridColumns(
                  small: 12,
                  medium: 12,
                  large: 6,
                  extraLarge: 6,
                ),
                child: _buildCard(context, 'Meditation', Colors.cyanAccent,
                    () => onMeditation(context),
                    isWide: false),
              ),
              ResponsiveDesignGridItem(
                columns: ResponsiveDesignGridColumns(
                  small: 12,
                  medium: 12,
                  large: 6,
                  extraLarge: 6,
                ),
                child: _buildCard(context, 'Chat', Colors.deepPurpleAccent,
                    () => onChat(context),
                    isWide: true),
              ),
              ResponsiveDesignGridItem(
                columns: ResponsiveDesignGridColumns(
                  small: 12,
                  medium: 6,
                  large: 6,
                  extraLarge: 6,
                ),
                child: _buildCard(context, 'Hero', Colors.lightBlueAccent,
                    () => onHero(context),
                    isWide: false),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCard(
      BuildContext context, String title, Color color, VoidCallback onTap,
      {bool isWide = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: color,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          padding: isWide ? EdgeInsets.all(24.0) : EdgeInsets.all(16.0),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: isWide ? 22 : 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onMood(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MoodScreen()));
  }

  void onBreathe(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => BreathingScreen()));
  }

  void onDash(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DashboardPage()));
  }

  void onType(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Type()));
  }

  void onJournal(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Journal()));
  }

  void onCommunity(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CommunityPage()));
  }

  void onMeditation(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MeditationScreen()));
  }

  void onChat(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ChatScreen()));
  }

  void onHero(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HeroPage()));
  }
}
