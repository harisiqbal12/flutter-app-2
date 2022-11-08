import "package:flutter/material.dart";
import 'package:flutter_application_2/cubit/app_cubit_states.dart';
import 'package:flutter_application_2/cubit/app_cubits.dart';
import 'package:flutter_application_2/misc/colors.dart';
import 'package:flutter_application_2/model/data_model.dart';
import 'package:flutter_application_2/widgets/app_button.dart';
import 'package:flutter_application_2/widgets/app_large_text.dart';
import 'package:flutter_application_2/widgets/app_text.dart';
import 'package:flutter_application_2/widgets/responsive_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

Icon generateIcons(int index, num stars) {
  return Icon(
    index <= 3 ? Icons.star : Icons.star_border_outlined,
    color: index <= 3 ? AppColors.starColor : Colors.grey,
  );
}

class _DetailsPageState extends State<DetailsPage> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        if (state is DetailState) {
          final DataModel data = state.place;
          return Scaffold(
            bottomNavigationBar: Container(
                color: Colors.white,
                padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    AppButtons(
                      color: Colors.grey,
                      backgroundColor: Colors.transparent,
                      size: 60,
                      borderColor: Colors.grey,
                      isIcon: true,
                      icon: Icons.favorite_border_outlined,
                    ),
                    SizedBox(
                      width: 275,
                      child: ResponsiveButton(
                        isResponsive: true,
                        width: 280,
                      ),
                    ),
                  ],
                )),
            body: SizedBox(
              width: double.maxFinite,
              height: double.maxFinite,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    child: Container(
                      width: double.maxFinite,
                      height: 350,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              "http://mark.bslmeiyu.com/uploads/${data.img}"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            BlocProvider.of<AppCubits>(context).goHome();
                          },
                          icon: const Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.6,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 330,
                    child: Container(
                      padding:
                          const EdgeInsets.only(top: 30, left: 20, right: 20),
                      width: MediaQuery.of(context).size.width,
                      height: 600,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppLargeText(
                                text: data.name,
                                color: Colors.black.withOpacity(0.6),
                              ),
                              AppLargeText(
                                text: "\$ ${data.price.toString()}",
                                color: AppColors.mainColor,
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                size: 16,
                                color: AppColors.mainColor,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                data.location,
                                style: TextStyle(
                                  color: AppColors.mainColor.withOpacity(0.8),
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Wrap(
                                children: List.generate(
                                    5,
                                    ((index) =>
                                        generateIcons(index, data.stars))),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                data.stars.toString(),
                                style: TextStyle(
                                  color: AppColors.textColor2.withOpacity(0.7),
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 25),
                          AppLargeText(
                            text: "People",
                            color: Colors.black.withOpacity(0.8),
                            size: 20,
                          ),
                          const SizedBox(height: 5),
                          AppText(
                            text: "Number of people in your group",
                            color: AppColors.mainTextColor,
                            size: 14,
                          ),
                          const SizedBox(height: 20),
                          Wrap(
                              children: List.generate(
                            data.people,
                            (index) => InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: AppButtons(
                                  backgroundColor: selectedIndex == index
                                      ? Colors.black.withOpacity(0.8)
                                      : AppColors.buttonBackground,
                                  color: selectedIndex == index
                                      ? AppColors.buttonBackground
                                      : Colors.black,
                                  size: 50,
                                  borderColor: AppColors.buttonBackground,
                                  text: (index + 1).toString(),
                                ),
                              ),
                            ),
                          )),
                          const SizedBox(height: 20),
                          AppLargeText(
                            text: "Description",
                            size: 20,
                            color: Colors.black.withOpacity(0.8),
                          ),
                          const SizedBox(height: 10),
                          AppText(
                            text: data.description,
                            color: AppColors.mainTextColor,
                            size: 15,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }

        return Container();
      },
    );
  }
}
