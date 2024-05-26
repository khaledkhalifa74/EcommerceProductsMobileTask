import 'package:ecommerce_products/features/Home/data/models/products_data_model.dart';
import 'package:ecommerce_products/features/Home/presentation/manager/get_products_cubit/get_products_cubit.dart';
import 'package:ecommerce_products/features/Home/presentation/manager/get_products_cubit/get_products_state.dart';
import 'package:ecommerce_products/features/Home/presentation/views/widgets/product_item.dart';
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
  late GetProductsCubit _getProductsCubit;

  @override
  void initState() {
    _getProductsCubit = context.read<GetProductsCubit>();
    _getProductsCubit.getProducts();
    super.initState();
  }
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
        return isLoading == true ? const Center(child: CircularProgressIndicator())
            : products != null ?
          products!.isNotEmpty
              ? ListView.builder(
            itemCount: products!.length,
            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.only(
                  bottom: 16,
                ),
                child: ProductItem(
                  image: products![index].images![0],
                  category: products![index].category!.name,
                  subCategory: products![index].subcategory![0].name,
                  brandName: products![index].brand!.name,
                  price: products![index].price.toString(),
                  soldNumber: products![index].sold.toString(),
                  ratingAverage: products![index].ratingsAverage.toString(),
                  ratingCounters: products![index].ratingsQuantity.toString(),
                ),
              );
            },
          ) : const SizedBox()
            : const SizedBox();
      },
    );
  }
}
