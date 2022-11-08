// ignore_for_file: no_leading_underscores_for_local_identifiers

import "package:flutter/material.dart";
import 'package:flutter_application_2/cubit/app_cubit_states.dart';
import 'package:flutter_application_2/cubit/app_cubits.dart';
import 'package:flutter_application_2/misc/colors.dart';
import 'package:flutter_application_2/widgets/app_large_text.dart';
import 'package:flutter_application_2/widgets/app_text.dart';
import 'package:flutter_application_2/widgets/header.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/data_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "balloning.png": 'Balloning',
    "hiking.png": "Hiking",
    "kayaking.png": "Kayaking",
    "snorkling.png": "Snorkling"
  };

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(body: BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        if (state is LoadedState) {
          final List<DataModel> info = state.places;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Appheader(),
                const SizedBox(height: 30),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: const AppLargeText(text: "Discover"),
                ),
                const SizedBox(height: 30),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      labelPadding: const EdgeInsets.only(left: 20, right: 20),
                      controller: _tabController,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: const CircleTabIndicator(
                        color: Colors.grey,
                        radius: 4,
                      ),
                      tabs: const [
                        Tab(text: "Places"),
                        Tab(text: "Inspiration"),
                        Tab(text: "Emotions"),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 350,
                  width: double.maxFinite,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      ListView.builder(
                        itemCount: info.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              BlocProvider.of<AppCubits>(context)
                                  .detailPage(info[index]);
                            },
                            child: Container(
                              width: 200,
                              height: 300,
                              margin: const EdgeInsets.symmetric(
                                vertical: 20,
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "http://mark.bslmeiyu.com/uploads/${info[index].img}"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      const Text("Here"),
                      const Text("Hello"),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppLargeText(
                        text: "Explore more",
                        size: 22,
                      ),
                      AppText(
                        text: "See all",
                        size: 14,
                        color: AppColors.textColor1,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 120,
                  width: double.maxFinite,
                  margin: const EdgeInsets.only(left: 20),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: ((context, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 30),
                        child: Column(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/images/${images.keys.elementAt(index)}',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            AppText(
                              text: images.values.elementAt(index),
                              color: AppColors.textColor2,
                            )
                          ],
                        ),
                      );
                    }),
                  ),
                )
              ],
            ),
          );
        }

        return Container();
      },
    ));
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  final double radius;

  const CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  final double radius;

  const _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2, configuration.size!.height);

    canvas.drawCircle(circleOffset + offset, radius, _paint);
  }
}
