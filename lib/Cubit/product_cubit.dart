import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/Core/Model/Data/list.dart';
import 'package:product_app/Cubit/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  void loadProducts() {
    emit(ProductLoading());
    Future.delayed(Duration(seconds: 2), () {
      emit(ProductLoaded(products));
    });
  }
}
