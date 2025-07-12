import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Custom color extensions for theme
extension AppColorsExtension on ColorScheme {
  // App brand colors - Red theme
  Color get brandRedPrimary => const Color(0xFFEF4444);
  Color get brandRedSecondary => const Color(0xFFDC2626);
  Color get brandRedAccent => const Color(0xFFB91C1C);
  
  // Task status colors
  Color get taskPendingColor => const Color(0xFFF59E0B);
  Color get taskCompletedColor => const Color(0xFF34D399);
  Color get taskTotalColor =>  Colors.blue;
  
  // Background and surface colors
  Color get backgroundSecondary => const Color(0xFF1F2937);
  Color get cardBackground => const Color(0xFF374151);
  
  // Typography colors
  Color get textMain => const Color(0xFFF9FAFB);
  Color get textSubtitle => const Color(0xFFD1D5DB);
  Color get textCaption => const Color(0xFF9CA3AF);
  
  // Feedback colors
  Color get feedbackSuccess => const Color(0xFF34D399);
  Color get feedbackError => const Color(0xFFF87171);
  Color get feedbackInfo => const Color(0xFFEF4444);
  
  // Utility methods for gradients
  LinearGradient get brandGradient => LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [brandRedPrimary, brandRedSecondary, brandRedAccent],
  );
  
  LinearGradient get taskCompletedGradient => LinearGradient(
    colors: [
      taskCompletedColor.withValues(alpha: 0.2),
      taskCompletedColor.withValues(alpha: 0.1),
    ],
  );
  
  LinearGradient get backgroundGradient => LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      brandRedPrimary.withValues(alpha: 0.15),
      brandRedAccent.withValues(alpha: 0.05),
    ],
  );
}

class AppTheme {
  AppTheme._();
  
  static ThemeData get lightTheme {
    const primaryColor = Color(0xFFEF4444);
    
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Inter',
      fontFamilyFallback: const ['SF Pro Display', 'Roboto', 'Arial', 'sans-serif'],
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.light,
      ),
      
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.lato(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          letterSpacing: -0.25,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        actionsIconTheme: const IconThemeData(color: Colors.white),
      ),
      
      cardTheme: CardThemeData(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      ),
      
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: 8,
        shape: const CircleBorder(),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
      
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFFF8F9FA),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFFE5E5E5)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFFE5E5E5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: primaryColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFFFF6B6B), width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFFFF6B6B), width: 2),
        ),
        prefixIconColor: primaryColor,
        labelStyle: GoogleFonts.lato(
          color: const Color(0xFF7F8C8D),
          fontWeight: FontWeight.w400,
        ),
      ),
      
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          textStyle: GoogleFonts.lato(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primaryColor,
          textStyle: GoogleFonts.lato(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          padding: const EdgeInsets.all(8),
          iconSize: 24,
        ),
      ),
      
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        checkColor: WidgetStateProperty.all(Colors.white),
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const Color(0xFF4ECDC4);
          }
          return Colors.transparent;
        }),
      ),
      
      listTileTheme: const ListTileThemeData(
        contentPadding: EdgeInsets.all(12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
      
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.lato(
          fontSize: 32,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF2C3E50),
          letterSpacing: -0.5,
        ),
        headlineMedium: GoogleFonts.lato(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF2C3E50),
          letterSpacing: -0.25,
        ),
        headlineSmall: GoogleFonts.lato(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF2C3E50),
          letterSpacing: -0.15,
        ),
        titleLarge: GoogleFonts.lato(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF2C3E50),
          letterSpacing: -0.1,
        ),
        titleMedium: GoogleFonts.lato(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF2C3E50),
          letterSpacing: -0.05,
        ),
        titleSmall: GoogleFonts.lato(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF2C3E50),
        ),
        bodyLarge: GoogleFonts.lato(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF2C3E50),
        ),
        bodyMedium: GoogleFonts.lato(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF7F8C8D),
        ),
        bodySmall: GoogleFonts.lato(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF7F8C8D),
        ),
        labelLarge: GoogleFonts.lato(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF7F8C8D),
        ),
        labelMedium: GoogleFonts.lato(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF7F8C8D),
        ),
        labelSmall: GoogleFonts.lato(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          color: const Color(0xFFBDC3C7),
        ),
      ),
    );
  }
  
  static ThemeData get darkTheme {
    
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Inter',
      fontFamilyFallback: const ['SF Pro Display', 'Roboto', 'Arial', 'sans-serif'],
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF111827),
      
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFFEF4444),
        onPrimary: Colors.white,
        secondary: Color(0xFF34D399),
        onSecondary: Colors.white,
        surface: Color(0xFF1F2937),
        onSurface: Color(0xFFF9FAFB),
        background: Color(0xFF111827),
        onBackground: Color(0xFFF9FAFB),
        error: Color(0xFFF87171),
        onError: Colors.white,
        outline: Color(0xFF374151),
        outlineVariant: Color(0xFF4B5563),
        surfaceVariant: Color(0xFF374151),
        onSurfaceVariant: Color(0xFFD1D5DB),
        inverseSurface: Color(0xFFF9FAFB),
        onInverseSurface: Color(0xFF111827),
        inversePrimary: Color(0xFFEF4444),
        shadow: Color(0xFF000000),
        scrim: Color(0xFF000000),
        tertiary: Color(0xFFF59E0B),
        onTertiary: Colors.white,
      ),
      
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Color(0xFF1F2937),
        surfaceTintColor: Colors.transparent,
        titleTextStyle: TextStyle(
          fontFamily: 'Inter',
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          letterSpacing: -0.25,
        ),
        iconTheme: IconThemeData(color: Colors.white),
        actionsIconTheme: IconThemeData(color: Colors.white),
      ),
      
      cardTheme: CardThemeData(
        elevation: 8,
        color: const Color(0xFF374151),
        surfaceTintColor: Colors.transparent,
        shadowColor: const Color(0xFF000000).withValues(alpha: 0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      ),
      
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        elevation: 12,
        shape: CircleBorder(),
        backgroundColor: Color(0xFFEF4444),
        foregroundColor: Colors.white,
        iconSize: 28,
      ),
      
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF374151),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFF4B5563)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFF4B5563)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFFEF4444), width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFFF87171), width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFFF87171), width: 2),
        ),
        prefixIconColor: const Color(0xFFEF4444),
        labelStyle: const TextStyle(
          fontFamily: 'Inter',
          color: Color(0xFF9CA3AF),
          fontWeight: FontWeight.w400,
        ),
        hintStyle: const TextStyle(
          fontFamily: 'Inter',
          color: Color(0xFF6B7280),
          fontWeight: FontWeight.w400,
        ),
      ),
      
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 8,
          backgroundColor: const Color(0xFFEF4444),
          foregroundColor: Colors.white,
          shadowColor: const Color(0xFFEF4444).withValues(alpha: 0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          textStyle: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: const Color(0xFF8B5CF6),
          textStyle: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          padding: const EdgeInsets.all(8),
          iconSize: 24,
          backgroundColor: const Color(0xFF374151),
          foregroundColor: const Color(0xFFD1D5DB),
        ),
      ),
      
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        checkColor: WidgetStateProperty.all(Colors.white),
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const Color(0xFF34D399);
          }
          return Colors.transparent;
        }),
        side: const BorderSide(color: Color(0xFF4B5563), width: 2),
      ),
      
      listTileTheme: const ListTileThemeData(
        contentPadding: EdgeInsets.all(12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        tileColor: Color(0xFF374151),
        textColor: Color(0xFFF9FAFB),
        iconColor: Color(0xFFD1D5DB),
      ),
      
      snackBarTheme: SnackBarThemeData(
        backgroundColor: const Color(0xFF374151),
        contentTextStyle: const TextStyle(
          fontFamily: 'Inter',
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        behavior: SnackBarBehavior.floating,
        elevation: 8,
      ),
      
      popupMenuTheme: PopupMenuThemeData(
        color: const Color(0xFF374151),
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: const TextStyle(
          fontFamily: 'Inter',
          color: Color(0xFFF9FAFB),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      
      dialogTheme: DialogThemeData(
        backgroundColor: const Color(0xFF374151),
        surfaceTintColor: Colors.transparent,
        elevation: 16,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        titleTextStyle: const TextStyle(
          fontFamily: 'Inter',
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Color(0xFFF9FAFB),
        ),
        contentTextStyle: const TextStyle(
          fontFamily: 'Inter',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Color(0xFFD1D5DB),
        ),
      ),
      
      dividerTheme: const DividerThemeData(
        color: Color(0xFF4B5563),
        thickness: 1,
        space: 1,
      ),
      
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontFamily: 'Inter',
          fontSize: 32,
          fontWeight: FontWeight.w600,
          color: Color(0xFFF9FAFB),
          letterSpacing: -0.5,
        ),
        headlineMedium: TextStyle(
          fontFamily: 'Inter',
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: Color(0xFFF9FAFB),
          letterSpacing: -0.25,
        ),
        headlineSmall: TextStyle(
          fontFamily: 'Inter',
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Color(0xFFF9FAFB),
          letterSpacing: -0.15,
        ),
        titleLarge: TextStyle(
          fontFamily: 'Inter',
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Color(0xFFF9FAFB),
          letterSpacing: -0.1,
        ),
        titleMedium: TextStyle(
          fontFamily: 'Inter',
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color(0xFFF9FAFB),
          letterSpacing: -0.05,
        ),
        titleSmall: TextStyle(
          fontFamily: 'Inter',
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Color(0xFFF9FAFB),
        ),
        bodyLarge: TextStyle(
          fontFamily: 'Inter',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Color(0xFFF9FAFB),
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Inter',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Color(0xFFD1D5DB),
        ),
        bodySmall: TextStyle(
          fontFamily: 'Inter',
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Color(0xFF9CA3AF),
        ),
        labelLarge: TextStyle(
          fontFamily: 'Inter',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Color(0xFFD1D5DB),
        ),
        labelMedium: TextStyle(
          fontFamily: 'Inter',
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Color(0xFF9CA3AF),
        ),
        labelSmall: TextStyle(
          fontFamily: 'Inter',
          fontSize: 10,
          fontWeight: FontWeight.w400,
          color: Color(0xFF6B7280),
        ),
      ),
    );
  }
}