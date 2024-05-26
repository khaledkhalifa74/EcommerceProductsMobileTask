import 'package:dio/dio.dart';
import 'package:ecommerce_products/core/utils/api_service.dart';
import 'package:ecommerce_products/features/Home/data/models/data_model.dart';
import 'package:ecommerce_products/features/Home/presentation/manager/get_products_cubit/get_products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetProductsCubit extends Cubit<GetProductsState>{
  GetProductsCubit() : super (GetProductsInitial());

  static GetProductsCubit get(context) => BlocProvider.of(context);

  Future<void> getProducts() async {
    emit(GetProductsLoading());
    try {
      Response response = await ApiService.getData(
        url: 'v1/products',
      );
      if (response.statusCode == 200) {
        DataModel dataModel = DataModel.fromJson(response.data);
        // getMyGalleryModel.data.images;
        emit(GetProductsSuccess(dataModel));
      }
    }
    on Exception catch (e) {
      emit(GetProductsFailure(errorMessage: e.toString()));
    }
  }
}