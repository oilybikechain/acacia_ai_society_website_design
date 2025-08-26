// lib/pages/home_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:website/themes/theme_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math' as math;
import 'package:website/widgets/gradient_border_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Dummy data for the carousel
  final List<Map<String, String>> carouselItems = [
    {
      'title': 'AI Ethics Debate',
      'date': 'OCT 28, 2024',
      'description':
          'A lively debate on the ethical implications of advanced AI.',
    },
    {
      'title': 'Neural Network Project Showcase',
      'date': 'NOV 15, 2024',
      'description':
          'Members present their term projects, from image classifiers to text generators.',
    },
    {
      'title': 'Flutter Web Workshop',
      'date': 'DEC 02, 2024',
      'description':
          'Learn how to build beautiful, responsive websites for your AI projects.',
    },
  ];

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      // --- MODIFIED BODY STRUCTURE ---
      // We now use a Column to stack the Nav Bar on top of the content.
      body: Column(
        children: [
          // The new navigation bar
          _buildNavBar(context),
          // A subtle line to separate nav from content
          const Divider(height: 1),
          // The rest of the page content must be wrapped in Expanded
          // to prevent a render overflow error.
          Expanded(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: ListView(
                  padding: const EdgeInsets.all(24.0),
                  children: [
                    _buildSectionTitle(context, "About Us"),
                    const SizedBox(height: 16),
                    _buildAboutUsCard(context),
                    const SizedBox(height: 48),
                    _buildSectionTitle(context, "Events & Projects"),
                    const SizedBox(height: 16),
                    _buildCarousel(),
                    const SizedBox(height: 48),
                    _buildContactUsSection(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.themeData.brightness == Brightness.dark;

    return AppBar(
      title: Text(
        "ACACIA AI SOCIETY",
        style: Theme.of(
          context,
        ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      actions: [
        Tooltip(
          message: isDarkMode ? 'Switch to Light Mode' : 'Switch to Dark Mode',
          child: IconButton(
            icon: Icon(
              isDarkMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
              color: Theme.of(context).colorScheme.primary,
            ),
            onPressed: () {
              themeProvider.toggleTheme();
            },
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }

  // --- NEW WIDGET: NAVIGATION BAR ---
  Widget _buildNavBar(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      // Constrain the width for a consistent web layout
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          // Wrap allows buttons to reflow on smaller screens
          child: Wrap(
            alignment: WrapAlignment.end, // Aligns buttons to the right
            spacing: 24.0, // Horizontal space between buttons
            runSpacing: 8.0, // Vertical space if they wrap
            children: [
              _buildNavButton(context, "Projects"),
              _buildNavButton(context, "Newsletter"),
              _buildNavButton(context, "Events"),
            ],
          ),
        ),
      ),
    );
  }

  // --- NEW WIDGET: Helper for creating styled nav buttons ---
  Widget _buildNavButton(BuildContext context, String text) {
    return TextButton(
      onPressed: () {
        // Placeholder: In a real app, you'd navigate here.
        // For example: Navigator.pushNamed(context, '/$text');
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Navigating to $text page...')));
      },
      child: Text(
        text,
        style: Theme.of(
          context,
        ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
        fontWeight: FontWeight.w600,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  Widget _buildAboutUsCard(BuildContext context) {
    return GradientBorderCard(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Text(
          "We are a passionate community of students at the National University of Singapore (NUS) from Acacia Residential College, united by our fascination with Artificial Intelligence. Our mission is to explore the frontiers of AI, foster collaborative projects, and build a strong network of future innovators and leaders in the field.",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.6),
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }

  Widget _buildCarousel() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 420.0,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 6),
        enlargeCenterPage: true,
        viewportFraction: 0.8,
        aspectRatio: 16 / 9,
      ),
      items:
          carouselItems.map((item) {
            return Builder(
              builder: (BuildContext context) {
                final randomImageId = math.Random().nextInt(1000);
                final imageUrl =
                    "https://picsum.photos/600/400?random=$randomImageId";
                final textTheme = Theme.of(context).textTheme;
                final colorScheme = Theme.of(context).colorScheme;

                return GradientBorderCard(
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return const Center(
                              child: Icon(Icons.broken_image_outlined),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['date']!,
                              style: textTheme.bodySmall?.copyWith(
                                color: colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              item['title']!,
                              style: textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              item['description']!,
                              style: textTheme.bodyMedium?.copyWith(
                                color: textTheme.bodyMedium?.color?.withOpacity(
                                  0.8,
                                ),
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }).toList(),
    );
  }

  Widget _buildContactUsSection(BuildContext context) {
    return Column(
      children: [
        _buildSectionTitle(context, "Connect With Us"),
        const SizedBox(height: 16),
        Text(
          "Follow our journey, join our events, and get in touch!",
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSocialIcon(
              icon: FontAwesomeIcons.telegram,
              url: 'https://t.me/your_telegram_group',
              tooltip: 'Telegram',
            ),
            const SizedBox(width: 24),
            _buildSocialIcon(
              icon: FontAwesomeIcons.instagram,
              url: 'https://instagram.com/your_instagram_page',
              tooltip: 'Instagram',
            ),
            const SizedBox(width: 24),
            _buildSocialIcon(
              icon: FontAwesomeIcons.github,
              url: 'https://github.com/your_github_org',
              tooltip: 'GitHub',
            ),
          ],
        ),
        const SizedBox(height: 48),
        Text(
          "© ${DateTime.now().year} ACACIA AI Society. All Rights Reserved.",
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }

  Widget _buildSocialIcon({
    required IconData icon,
    required String url,
    required String tooltip,
  }) {
    return Tooltip(
      message: tooltip,
      child: IconButton(
        icon: FaIcon(icon),
        iconSize: 32,
        color: Theme.of(context).colorScheme.primary,
        onPressed: () => _launchUrl(url),
      ),
    );
  }
}
