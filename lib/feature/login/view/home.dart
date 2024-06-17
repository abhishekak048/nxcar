import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nxcar/utils/typo.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/laptop.svg"),
              Text(
                "You’re successfully logged in!",
                style: headlineMedium24(Colors.black),
              ),
            ]),
      ),
    );
  }
}
