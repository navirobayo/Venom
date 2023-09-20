// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    Auth.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserAuthPage(),
      );
    },
    Gas_history.name: (routeData) {
      final args = routeData.argsAs<Gas_historyArgs>(
          orElse: () => const Gas_historyArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: GasHistory(key: args.key),
      );
    },
    Home.name: (routeData) {
      final args = routeData.argsAs<HomeArgs>(orElse: () => const HomeArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HomePage(key: args.key),
      );
    },
    Intro.name: (routeData) {
      final args = routeData.argsAs<IntroArgs>(orElse: () => const IntroArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: IntroPage(key: args.key),
      );
    },
    Before_ride.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BeforeRidePage(),
      );
    },
    Final_data.name: (routeData) {
      final args = routeData.argsAs<Final_dataArgs>(
          orElse: () => const Final_dataArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: FinalData(key: args.key),
      );
    },
    Km_in_bike.name: (routeData) {
      final args = routeData.argsAs<Km_in_bikeArgs>(
          orElse: () => const Km_in_bikeArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: KmInBikePage(key: args.key),
      );
    },
    New_ride.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NewRidePage(),
      );
    },
    Rides.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MyRides(),
      );
    },
    Ride_results_page.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RideResultsPage(),
      );
    },
    About.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AboutPage(),
      );
    },
    DefaultPriceSelector.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DefaultPriceSelectorPage(),
      );
    },
    DefaultVehicleSelector.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DefaultVehicleSelectorPage(),
      );
    },
    Settings.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsPage(),
      );
    },
    Splash.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
    Toolkit.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ToolKit(),
      );
    },
    My_vehicle.name: (routeData) {
      final args = routeData.argsAs<My_vehicleArgs>(
          orElse: () => const My_vehicleArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MyVehiclePage(key: args.key),
      );
    },
    SetTheme.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SetThemePage(),
      );
    },
  };
}

/// generated route for
/// [UserAuthPage]
class Auth extends PageRouteInfo<void> {
  const Auth({List<PageRouteInfo>? children})
      : super(
          Auth.name,
          initialChildren: children,
        );

  static const String name = 'Auth';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [GasHistory]
class Gas_history extends PageRouteInfo<Gas_historyArgs> {
  Gas_history({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          Gas_history.name,
          args: Gas_historyArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'Gas_history';

  static const PageInfo<Gas_historyArgs> page = PageInfo<Gas_historyArgs>(name);
}

class Gas_historyArgs {
  const Gas_historyArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'Gas_historyArgs{key: $key}';
  }
}

/// generated route for
/// [HomePage]
class Home extends PageRouteInfo<HomeArgs> {
  Home({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          Home.name,
          args: HomeArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'Home';

  static const PageInfo<HomeArgs> page = PageInfo<HomeArgs>(name);
}

class HomeArgs {
  const HomeArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'HomeArgs{key: $key}';
  }
}

/// generated route for
/// [IntroPage]
class Intro extends PageRouteInfo<IntroArgs> {
  Intro({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          Intro.name,
          args: IntroArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'Intro';

  static const PageInfo<IntroArgs> page = PageInfo<IntroArgs>(name);
}

class IntroArgs {
  const IntroArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'IntroArgs{key: $key}';
  }
}

/// generated route for
/// [BeforeRidePage]
class Before_ride extends PageRouteInfo<void> {
  const Before_ride({List<PageRouteInfo>? children})
      : super(
          Before_ride.name,
          initialChildren: children,
        );

  static const String name = 'Before_ride';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FinalData]
class Final_data extends PageRouteInfo<Final_dataArgs> {
  Final_data({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          Final_data.name,
          args: Final_dataArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'Final_data';

  static const PageInfo<Final_dataArgs> page = PageInfo<Final_dataArgs>(name);
}

class Final_dataArgs {
  const Final_dataArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'Final_dataArgs{key: $key}';
  }
}

/// generated route for
/// [KmInBikePage]
class Km_in_bike extends PageRouteInfo<Km_in_bikeArgs> {
  Km_in_bike({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          Km_in_bike.name,
          args: Km_in_bikeArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'Km_in_bike';

  static const PageInfo<Km_in_bikeArgs> page = PageInfo<Km_in_bikeArgs>(name);
}

class Km_in_bikeArgs {
  const Km_in_bikeArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'Km_in_bikeArgs{key: $key}';
  }
}

/// generated route for
/// [NewRidePage]
class New_ride extends PageRouteInfo<void> {
  const New_ride({List<PageRouteInfo>? children})
      : super(
          New_ride.name,
          initialChildren: children,
        );

  static const String name = 'New_ride';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MyRides]
class Rides extends PageRouteInfo<void> {
  const Rides({List<PageRouteInfo>? children})
      : super(
          Rides.name,
          initialChildren: children,
        );

  static const String name = 'Rides';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RideResultsPage]
class Ride_results_page extends PageRouteInfo<void> {
  const Ride_results_page({List<PageRouteInfo>? children})
      : super(
          Ride_results_page.name,
          initialChildren: children,
        );

  static const String name = 'Ride_results_page';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AboutPage]
class About extends PageRouteInfo<void> {
  const About({List<PageRouteInfo>? children})
      : super(
          About.name,
          initialChildren: children,
        );

  static const String name = 'About';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DefaultPriceSelectorPage]
class DefaultPriceSelector extends PageRouteInfo<void> {
  const DefaultPriceSelector({List<PageRouteInfo>? children})
      : super(
          DefaultPriceSelector.name,
          initialChildren: children,
        );

  static const String name = 'DefaultPriceSelector';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DefaultVehicleSelectorPage]
class DefaultVehicleSelector extends PageRouteInfo<void> {
  const DefaultVehicleSelector({List<PageRouteInfo>? children})
      : super(
          DefaultVehicleSelector.name,
          initialChildren: children,
        );

  static const String name = 'DefaultVehicleSelector';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsPage]
class Settings extends PageRouteInfo<void> {
  const Settings({List<PageRouteInfo>? children})
      : super(
          Settings.name,
          initialChildren: children,
        );

  static const String name = 'Settings';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashPage]
class Splash extends PageRouteInfo<void> {
  const Splash({List<PageRouteInfo>? children})
      : super(
          Splash.name,
          initialChildren: children,
        );

  static const String name = 'Splash';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ToolKit]
class Toolkit extends PageRouteInfo<void> {
  const Toolkit({List<PageRouteInfo>? children})
      : super(
          Toolkit.name,
          initialChildren: children,
        );

  static const String name = 'Toolkit';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MyVehiclePage]
class My_vehicle extends PageRouteInfo<My_vehicleArgs> {
  My_vehicle({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          My_vehicle.name,
          args: My_vehicleArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'My_vehicle';

  static const PageInfo<My_vehicleArgs> page = PageInfo<My_vehicleArgs>(name);
}

class My_vehicleArgs {
  const My_vehicleArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'My_vehicleArgs{key: $key}';
  }
}

/// generated route for
/// [SetThemePage]
class SetTheme extends PageRouteInfo<void> {
  const SetTheme({List<PageRouteInfo>? children})
      : super(
          SetTheme.name,
          initialChildren: children,
        );

  static const String name = 'SetTheme';

  static const PageInfo<void> page = PageInfo<void>(name);
}
