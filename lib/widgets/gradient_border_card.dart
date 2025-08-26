// lib/widgets/gradient_border_card.dart
import 'package:flutter/material.dart';

class GradientBorderCard extends StatelessWidget {
  const GradientBorderCard({
    super.key,
    required this.child,
    this.borderWidth = 1.5,
    this.borderRadius = 12.0,
    this.margin,
    this.elevation,
  });

  final Widget child;
  final double borderWidth;
  final double borderRadius;
  final EdgeInsetsGeometry? margin;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cardTheme = theme.cardTheme;
    final isDarkMode = theme.brightness == Brightness.dark;

    // --- Light Mode Fix ---
    // The Card itself will handle the border and clipping.
    if (!isDarkMode) {
      return Card(
        margin: margin ?? cardTheme.margin,
        elevation: elevation ?? cardTheme.elevation,
        // **FIX:** Ensure clipBehavior is set to clip the child (like the image).
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          // **FIX:** Made the border solid and slightly thicker for better visibility.
          side: BorderSide(
            color: theme.colorScheme.primary, // Using the solid primary color
            width: 1.2,
          ),
        ),
        child: child,
      );
    }

    // --- Dark Mode Fix ---
    // The structure is correct, but relies on the child NOT having its own clipping.
    return Card(
      elevation: elevation ?? cardTheme.elevation,
      margin: margin ?? cardTheme.margin,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          gradient: LinearGradient(
            colors: [theme.colorScheme.secondary, theme.colorScheme.primary],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(borderWidth),
          child: Container(
            decoration: BoxDecoration(
              color: cardTheme.color ?? theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(borderRadius - borderWidth),
            ),
            // **FIX:** This clips the child (like the image) inside the border,
            // which is why the ClipRRect in home_page was causing issues.
            clipBehavior: Clip.antiAlias,
            child: child,
          ),
        ),
      ),
    );
  }
}
