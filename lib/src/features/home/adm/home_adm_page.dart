import 'package:flutter/material.dart';

import '../../../core/ui/barbershop_icons.dart';
import '../../../core/ui/constants.dart';
import '../widgets/home_header.dart';
import 'widgets/home_employee_tile.dart';

class HomeAdmPage extends StatefulWidget {
  const HomeAdmPage({super.key});

  @override
  State<HomeAdmPage> createState() => _HomeAdmPageState();
}

class _HomeAdmPageState extends State<HomeAdmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        backgroundColor: AppColors.brown,
        child: const CircleAvatar(
          backgroundColor: Colors.white,
          maxRadius: 12,
          child: Icon(
            BarbershopIcons.addEmployee,
            color: AppColors.brown,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: HomeHeader(),
          ),
          const SliverPadding(padding: EdgeInsets.only(top: 16)),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 20,
              (context, index) {
                return const HomeEmployeeTile();
              },
            ),
          ),
        ],
      ),
    );
  }
}
