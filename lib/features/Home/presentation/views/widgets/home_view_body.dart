import 'package:ecommerce_products/features/Home/data/models/products_data_model.dart';
import 'package:ecommerce_products/features/Home/presentation/manager/get_products_cubit/get_products_cubit.dart';
import 'package:ecommerce_products/features/Home/presentation/manager/get_products_cubit/get_products_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  List<Data>? products;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetProductsCubit,GetProductsState>(
      listener: (context, state) {
        if (state is GetProductsLoading) {
          isLoading = true;
        } else if (state is GetProductsSuccess) {
          products = state.dataModel.data;
          isLoading = false;
        } else if (state is GetProductsFailure) {
          isLoading = false;
        }
      },
      builder: (BuildContext context, GetProductsState state){
        return const Column(
          children: [

          ],
        );
      },
    );
  }
}
