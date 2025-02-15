import 'package:flutter/material.dart';
import 'package:flutter_challange_motel_list/core/constants.dart';
import 'package:flutter_challange_motel_list/core/ui/drawer/drawer.dart';
import 'package:flutter_challange_motel_list/core/ui/widgets/custom_app_bar.dart';
import 'package:flutter_challange_motel_list/core/ui/widgets/filter_widget.dart';
import 'package:flutter_challange_motel_list/views/home/widgets/home_list_moteis.dart';
import 'package:flutter_challange_motel_list/core/ui/widgets/map_floating_buttom.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/motel_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async{
          await Future.delayed(const Duration(seconds: 2));
        },
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          automaticallyImplyLeading: false,
          toolbarHeight: 100,
          backgroundColor: AppColors.colorRed,
          title: CustomAppBar(),
        ),
        drawer: CustomDrawer(),
      
        body: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
            ),
          
          child: Consumer<MotelViewModel>(
            builder: (context, viewModel, child) {
              if (viewModel.isLoading) {
                return const Center(child: CircularProgressIndicator());
          
              } else if (viewModel.error != null) {
                return Center(child: Text("Erro: ${viewModel.error}"));
          
              } else if (viewModel.motelData == null || viewModel.motelData!.moteis.isEmpty) {
                return const Center(child: Text("Nenhum motel encontrado"));
              }
      
              final moteis = viewModel.motelData!.moteis;
              return CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: FilterRow(),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return MotelWidget(index: index);
                      },
                      childCount: moteis.length, 
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        floatingActionButton: const MapFloatingButtom(),
      ),
    );
  }
}