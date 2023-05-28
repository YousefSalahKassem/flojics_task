import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flojics_task/core/blocs/notifiers/connectivity_notifier.dart';
import 'package:flojics_task/core/components/custom_loader.dart';
import 'package:flojics_task/core/components/network_failed_container.dart';
import 'package:flojics_task/core/components/un_focus_widget.dart';
import 'package:flojics_task/core/helper/extensions.dart';
import 'package:flojics_task/core/helper/ui/app_scroll_behavior.dart';
import 'package:flojics_task/core/routes/router.gr.dart';
import 'package:flojics_task/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:overlay_support/overlay_support.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return OverlaySupport(
      child: ScreenUtilInit(
        designSize: const Size(360, 762),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return AppTheme(
            builder: (theme) {
              return MaterialApp.router(
                onGenerateTitle: (context) {
                  return "Shopify";
                },
                theme: theme,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                routerDelegate: AutoRouterDelegate(
                  _appRouter,
                  initialRoutes: const [SplashRoute()],
                ),
                routeInformationParser: _appRouter.defaultRouteParser(),
                debugShowCheckedModeBanner: false,
                scrollBehavior: const AppScrollBehavior(),
                builder: (context, child) {
                  final isConnectedToNetwork =
                      ref.watch(ConnectivityStatusNotifier.provider) ==
                          ConnectivityStatus.isConnected;

                  if (isConnectedToNetwork) {
                    return UnFocusWidget(
                      child: LoaderOverlay(
                        overlayColor: Colors.black,
                        useDefaultLoading: false,
                        overlayWidget: Center(
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: context.heightR(0.3),
                            ),
                            child: const CustomLoader(),
                          ),
                        ),
                        child: SizedBox(
                          child: child,
                        ),
                      ),
                    );
                  } else {
                    return const NetworkFailedContainer();
                  }
                },
              );
            },
          );
        },
      ),
    );
  }
}
