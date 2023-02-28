import 'package:flutter/material.dart';

const colorSchemeLight = ColorScheme.light(
    primary: Color(0xffFF5D12),
    primaryContainer: Color(0xffFAFAFA),
    secondaryContainer: Color(0xff2B2B2B)
);

final themeLight = ThemeData(
    colorScheme: colorSchemeLight,
    navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: Colors.white
    )
);

final themeDark = themeLight;

