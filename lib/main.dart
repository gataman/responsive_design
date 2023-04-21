import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'components/body1.dart';
import 'components/body2.dart';
import 'components/constants.dart';
import 'components/menu.dart';
import 'components/right_side1.dart';
import 'components/right_side2.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeView());
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(''),
        ),
        drawer: !desktop.isActive(context) ? const Menu() : null,
        body: const MyBody());
  }
}

class MyBody extends StatelessWidget {
  const MyBody({super.key});

  @override
  Widget build(BuildContext context) {
    String title = 'MyTitle';
    return AdaptiveLayout(
      body: SlotLayout(
        config: <Breakpoint, SlotLayoutConfig>{
          desktop: SlotLayout.from(
            key: const Key('home_view_desktop'),
            builder: (context) {
              return _desktopView(title, true);
            },
          ),
          tablet: SlotLayout.from(
            key: const Key('home_view_tablet'),
            builder: (context) {
              return _desktopView(title, false);
            },
          ),
          mobile: SlotLayout.from(
            key: const Key('home_view_mobile'),
            builder: (context) {
              return _mobileView(title);
            },
          ),
        },
      ),
    );
  }

  Widget _desktopView(String title, bool isDesktop) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isDesktop) const Menu(),
        Expanded(
          child: SingleChildScrollView(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Body1(title: title),
                      const Body2(),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: const [
                      RightSide1(),
                      RightSide2(),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _mobileView(String title) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const RightSide1(),
          Body1(
            title: title,
          ),
          const Body2(),
          const RightSide2(),
        ],
      ),
    );
  }
}
