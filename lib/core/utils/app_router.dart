// import 'package:egy_exlpor/features/auth/presentation/views/register_view.dart';
// import 'package:egy_exlpor/features/home/presentation/views/home_view.dart';
// import 'package:egy_exlpor/features/splash/presentation/views/splash_screen.dart';
// import 'package:egy_exlpor/features/onboarding/presentation/views/on_boarding_view.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// abstract class AppRouter {
//   static const kHomeView = '/homeView';
//   static const kOnBoardingView = '/onBoardingView';
//   static const kRegisterView = '/registerView';
//   static const kLoginView = '/loginView';

//   static final GoRouter router = GoRouter(
//     routes: <RouteBase>[
//       GoRoute(
//         path: '/',
//         builder: (BuildContext context, GoRouterState state) =>
//             const SplashView(),
//       ),
//       // ),

//       GoRoute(
//         path: kHomeView,
//         builder: (BuildContext context, GoRouterState state) =>
//             const HomeView(),
//       ),
//       GoRoute(
//         path: kOnBoardingView,
//         builder: (BuildContext context, GoRouterState state) =>
//             const OnBoardingView(),
//       ),
//       GoRoute(
//         path: kRegisterView,
//         builder: (BuildContext context, GoRouterState state) =>
//             const RegisterView(),
//       ),
//       // GoRoute(
//       //   path: kBookDetailsView,
//       //   builder: (BuildContext context, GoRouterState state) =>
//       //       BlocProvider(
//       //         create: (context) => RelatedBooksCubit(getit.get<HomeRepoImpl>()),
//       //         child:  BookDetailsView(
//       //           book: state.extra as BookModel,
//       //         )),
//       // ),
//       // GoRoute(
//       //   path: kSearchView,
//       //   builder: (BuildContext context, GoRouterState state) =>
//       //       const SearchView(),
//       // ),
//     ],
//   );
// }
