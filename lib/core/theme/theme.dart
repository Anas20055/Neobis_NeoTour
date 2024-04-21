part of '../../main.dart';

ThemeData _theme() {
  return ThemeData(
      fontFamily: 'SfProDisplay',
      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(AppColors.purple),
          padding: MaterialStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 30, vertical: 17),
          ),
        ),
      ),
      appBarTheme: _appBarThem(),
      colorScheme: const ColorScheme.light(),
      textTheme: const TextTheme(
        labelLarge: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w900,
        ),
        labelMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            overflow: TextOverflow.ellipsis),
        labelSmall: TextStyle(
          fontSize: 16,
        ),
        headlineLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w900,
        ),
        headlineSmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        headlineMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      tabBarTheme: TabBarTheme(
        tabAlignment: TabAlignment.start,
        labelPadding: const EdgeInsets.all(10),
        labelColor: AppColors.purple,
        labelStyle: const TextStyle(fontSize: 16),
        unselectedLabelStyle: const TextStyle(fontSize: 16),
        unselectedLabelColor: Colors.black,
        overlayColor: const MaterialStatePropertyAll(Colors.white),
        indicator: CircleTabIndicator(color: AppColors.purple, radius: 3.5),
      ));
}

AppBarTheme _appBarThem() {
  return const AppBarTheme(
    centerTitle: false,
    scrolledUnderElevation: 0,
    titleTextStyle: TextStyle(
      fontSize: 32,
      color: Colors.black,
      fontWeight: FontWeight.w900,
    ),
    elevation: 0,
  );
}
