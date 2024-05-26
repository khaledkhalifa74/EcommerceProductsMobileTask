import 'package:ecommerce_products/features/Home/data/models/data_model.dart';

abstract class GetProductsState{}

class GetProductsInitial extends GetProductsState{}

class GetProductsLoading extends GetProductsState{}

class GetProductsSuccess extends GetProductsState{
  final DataModel dataModel;

  GetProductsSuccess(this.dataModel);
}

class GetProductsFailure extends GetProductsState{
  String errorMessage;
  GetProductsFailure({required this.errorMessage});
}