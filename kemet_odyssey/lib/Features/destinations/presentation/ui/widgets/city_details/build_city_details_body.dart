import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:kemet_odyssey/features/destinations/presentation/ui/widgets/city_details/build_hero_section.dart';
import 'package:kemet_odyssey/features/destinations/presentation/ui/widgets/city_details/build_landmark_card.dart';
import 'package:kemet_odyssey/features/destinations/presentation/ui/widgets/city_details/build_quick_fact.dart';

class BuildCityDetailsBody extends StatelessWidget {
  const BuildCityDetailsBody({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hero Section
          BuildHeroSection(theme: theme),
    
          // Content
          CityDetailsBodyContent(theme: theme),
        ],
      ),
    );
  }
}

class CityDetailsBodyContent extends StatelessWidget {
  const CityDetailsBodyContent({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Essence Tags
          BuildTourismTypesTages(theme: theme).animate().fadeIn(delay: 400.ms).slideY(begin: 0.1, end: 0),
        
          const SizedBox(height: 24),
        
          // Quick Facts
          BuildQuickFacts(theme: theme).animate().fadeIn(delay: 500.ms).slideY(begin: 0.1, end: 0),
        
          const SizedBox(height: 32),
        
          // Description
          Text(
            '"Ancient Thebes, the capital of the Pharaohs at the height of their power, where the Nile flows between the living and the dead."',
            style: theme.textTheme.headlineSmall?.copyWith(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w300),
          ).animate().fadeIn(delay: 600.ms),
        
          const SizedBox(height: 24),
        
          Text(
            'Luxor is often referred to as the world\'s greatest open-air museum. Built on the site of ancient Thebes, this extraordinary city is home to some of Egypt’s most spectacular monuments, from the soaring columns of the Temple of Karnak to the enigmatic Valley of the Kings.\n\nThe city is divided by the Nile into the East Bank, where the living built their temples to the sun god, and the West Bank, where the sun sets and the pharaohs were buried in magnificent tombs designed to endure for eternity.',
            style: theme.textTheme.bodyLarge?.copyWith(
                height: 1.6, color: theme.colorScheme.onSurfaceVariant),
          ).animate().fadeIn(delay: 700.ms),
        
          const SizedBox(height: 48),
        
          // Top Landmarks
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('City Destinations',
                  style: theme.textTheme.headlineMedium
                      ?.copyWith(fontWeight: FontWeight.bold)),
              Text(
                'VIEW ALL',
                style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.primary,
                    letterSpacing: 1.5,
                    decoration: TextDecoration.underline),
              ),
            ],
          ).animate().fadeIn(delay: 800.ms),
        
          const SizedBox(height: 16),
        
          BuildLandmarkCard(
              tag: 'East Bank',
              title: 'Karnak Temple Complex',
              imageUrl:
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuAQ3TPUuheoJNZVGi9Src9bYEtD19kimqlz65odkKEWZ-KDElOMl_24mXCTQzh_etR8Vft_dq3VVoQhXRIWvJRGFapIc8eN_lMVlSAsN1xZB2Hrk-tQqojESX9O-C-8zm5MOnWBs03AjiQG56TOnCeRKXv2YJMPPH5pVyjdVGcvf5gA-gk59H72lNkFaCSVCMKkop_iY-UjCexwXsHZv49ZnEvAKtVi6UWS-1H3c5Bdcq3gXjF2qDn_X5nKyTwlQJ_gKuepKi6oOXQ',
              delay: 900.ms),
          const SizedBox(height: 16),
          BuildLandmarkCard(
              tag: 'West Bank',
              title: 'Valley of the Kings',
              imageUrl:
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuBMw_1gP1WC5aCpImvVkuL_qAKtrEtVUSkKgtdTZWTQVKVYH0LAJVTAt6BMAY2nGKNVchRPneuKhP69ThChpjyGKZOY0DYLvMOtWnTEVhNG5RSLIYrqTdqLQRVb6Vjj4CQWdq2e04eNEFS4fmJl8lX5sIBdO92-7YRpFoue0gcOvMNJYGUgHsgukSnX1vDE2uVRUrlU2RqH6uiJiuaJwK2mq4xObTiilpjZ-Yzo5LpL8CIJFhpqCdyeIdzzBzScX5lqricU-w_ZF5A',
              delay: 1000.ms),
          const SizedBox(height: 48),
        ],
      ),
    );
  }
}



class BuildTourismTypesTages extends StatelessWidget {
  const BuildTourismTypesTages({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tourism Types',
            style: theme.textTheme.titleLarge?.copyWith(
                fontStyle: FontStyle.italic,
                color: theme.colorScheme.onSurfaceVariant),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              BuildTag(
                  text: 'Historical',
                  color: theme.colorScheme.primary),
              BuildTag(
                  text: 'Cultural',
                  color: theme.colorScheme.primary),
              BuildTag(
                  text: 'Adventure',
                  color: theme.colorScheme.primary),
            ],
          ),
        ],
      ),
    );
  }
}

class BuildTag extends StatelessWidget {
  const BuildTag({super.key, required this.text, required this.color});
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        border: Border.all(color: color.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text.toUpperCase(),
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: color, fontWeight: FontWeight.bold, letterSpacing: 1),
      ),
    );
  }
}