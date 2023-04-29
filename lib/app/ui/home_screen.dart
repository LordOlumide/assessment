import 'package:assessment/app/ui/widgets/circle_icon.dart';
import 'package:flutter/material.dart';
import 'package:assessment/app/ui/widgets/coloured_tile.dart';
import 'package:assessment/app/core/themes.dart';
import 'package:assessment/app/data/data_repo.dart';
import '../models/profile_model.dart';

// widgets
import 'package:assessment/app/ui//widgets/portfolio_item_widget.dart';
import 'package:assessment/app/ui/widgets/major_section_container.dart';
import 'package:assessment/app/ui//widgets/purple_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ProfileModel profile;
  late Future<bool> isDoneLoading;

  Future<bool> loadData() async {
    Map<String, dynamic> data = await DataRepo.loadData();
    profile = ProfileModel.fromJson(data);
    // simulating delay
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }

  @override
  void initState() {
    super.initState();
    isDoneLoading = loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: nearBlack,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
// "Hire me" section
                        Expanded(
                          flex: 7,
                          child: MajorContainer(
// "Hire me" section
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      22.0, 20.0, 12.0, 14.0),
                                  child: FittedBox(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Bringing Your Ideas\nTo Life Through\nUI Design',
                                      style: TextStyle(
                                        fontSize: 50.0,
                                        fontWeight: FontWeight.w600,
                                        color: pureWhite,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 8.0,
                                  right: 30.0,
                                  child: PurpleButton(
                                    // TODO: change emoji to SVG
                                    text: 'Hire me 👋',
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
// Stats section
                        Expanded(
                          flex: 5,
                          child: FutureBuilder(
                            future: isDoneLoading,
                            builder: (_, snapshot) {
                              bool profileDataLoaded =
                                  snapshot.connectionState ==
                                      ConnectionState.done;

                              return Row(
                                children: [
                                  ColouredTile(
                                    number: profileDataLoaded
                                        ? profile.min_years_experience
                                        : null,
                                    text: 'Years Experience',
                                    color: lightGreen,
                                    textColor: pureWhite,
                                  ),
                                  const SizedBox(width: 10.0),
                                  ColouredTile(
                                    number: profileDataLoaded
                                        ? profile.min_handled_projects
                                        : null,
                                    text: 'Handled Projects',
                                    color: lightOrange,
                                    textColor: pureBlack,
                                  ),
                                  const SizedBox(width: 10.0),
                                  ColouredTile(
                                    number: profileDataLoaded
                                        ? profile.min_clients
                                        : null,
                                    text: 'Clients',
                                    color: pink,
                                    textColor: pureWhite,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10.0),
// Profile section
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Expanded(
                          child: MajorContainer(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      style: const TextStyle(fontSize: 16),
                                      children: [
                                        TextSpan(
                                          text: 'Bim',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            color: lightGrey,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Graph',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: pureWhite,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.menu, color: pureWhite),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Expanded(
                          flex: 6,
                          child: FutureBuilder(
                              future: isDoneLoading,
                              builder: (_, snapshot) {
                                bool profileDataLoaded =
                                    snapshot.connectionState ==
                                        ConnectionState.done;

                                return Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                              color: darkGrey,
                                              image: profileDataLoaded
                                                  ? DecorationImage(
                                                      image: AssetImage(
                                                          profile.profile_pic),
                                                      fit: BoxFit.cover,
                                                    )
                                                  : null,
                                            ),
                                          ),
                                          profileDataLoaded
                                              ? const SizedBox.shrink()
                                              : const Center(
                                                  child:
                                                      CircularProgressIndicator()),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 10.0),
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        children: [
                                          // Name
                                          Expanded(
                                            flex: 1,
                                            child: MajorContainer(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 18.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Name: ',
                                                      style: TextStyle(
                                                        fontSize: 12.0,
                                                        fontWeight:
                                                            FontWeight.w200,
                                                        color: lightGrey,
                                                      ),
                                                    ),
                                                    Text(
                                                      profileDataLoaded
                                                          ? profile.name
                                                          : '----- -----',
                                                      style: TextStyle(
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        color: pureWhite,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 10.0),
                                          // Location
                                          Expanded(
                                            flex: 3,
                                            child: MajorContainer(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(18.0),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Based in: ',
                                                          style: TextStyle(
                                                            fontSize: 12.0,
                                                            fontWeight:
                                                                FontWeight.w200,
                                                            color: lightGrey,
                                                          ),
                                                        ),
                                                        Text(
                                                          profileDataLoaded
                                                              ? profile.location
                                                              : '----- -----',
                                                          style: TextStyle(
                                                            fontSize: 15.0,
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            color: pureWhite,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 5.0),
                                                    Flexible(
                                                      child: Image.asset(
                                                        'assets/images/map_tracker.jpg',
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 10.0),
                                          // App Icons
                                          Expanded(
                                            flex: 1,
                                            child: MajorContainer(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: profileDataLoaded
                                                    ? profile.social_icons
                                                        .map((imageLocation) =>
                                                            CircularIcon(
                                                                imageLocation:
                                                                    imageLocation,
                                                                onPressed:
                                                                    () {}))
                                                        .toList()
                                                    : <Widget>[],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Expanded(
              flex: 3,
              child: Row(
                children: [
// Portfolio section
                  Expanded(
                    flex: 7,
                    child: MajorContainer(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    8.0, 10.0, 8.0, 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'UI Portofolio',
                                      style: TextStyle(
                                        fontSize: 23.0,
                                        fontWeight: FontWeight.w600,
                                        color: pureWhite,
                                      ),
                                    ),
                                    Text(
                                      'See All',
                                      style: TextStyle(
                                        fontSize: 23.0,
                                        fontWeight: FontWeight.w100,
                                        color: lightGrey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 2.0),
                            FutureBuilder(
                                future: isDoneLoading,
                                builder: (_, snapshot) {
                                  bool profileDataLoaded =
                                      snapshot.connectionState ==
                                          ConnectionState.done;
                                  return Row(
                                    children: [
                                      Expanded(
                                        child: PortfolioItemWidget(
                                          isSeeMoreTile: true,
                                          image: profileDataLoaded
                                              ? AssetImage(profile
                                                  .dummy_portfolio_pics[0])
                                              : null,
                                        ),
                                      ),
                                      Expanded(
                                        child: PortfolioItemWidget(
                                          image: profileDataLoaded
                                              ? AssetImage(profile
                                                  .dummy_portfolio_pics[1])
                                              : null,
                                        ),
                                      ),
                                      Expanded(
                                        child: PortfolioItemWidget(
                                          image: profileDataLoaded
                                              ? AssetImage(profile
                                                  .dummy_portfolio_pics[2])
                                              : null,
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
// About section
                  Expanded(
                    flex: 5,
                    child: MajorContainer(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                18.0, 18.0, 18.0, 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'About',
                                  style: TextStyle(
                                    fontSize: 23.0,
                                    fontWeight: FontWeight.w600,
                                    color: pureWhite,
                                  ),
                                ),
                                Text(
                                  'Resume',
                                  style: TextStyle(
                                    fontSize: 23.0,
                                    fontWeight: FontWeight.w100,
                                    color: lightGrey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          FutureBuilder(
                            future: isDoneLoading,
                            builder: (_, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                return Expanded(
                                  child: ListView(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            18.0, 6.0, 18.0, 18.0),
                                        child: Text(
                                          profile.about,
                                          style: TextStyle(
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.w200,
                                            height: 1.7,
                                            color: lightGrey,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                return const Expanded(
                                  child: SizedBox(
                                    child: Center(
                                        child: CircularProgressIndicator()),
                                  ),
                                );
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
