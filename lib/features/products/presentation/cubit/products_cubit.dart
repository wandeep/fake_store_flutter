import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../categories/domain/entities/category.dart';
import '../../domain/usecases/products_use_case.dart';
import 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsUseCase _productsUseCase;

  ProductsCubit({
    required ProductsUseCase productsUseCase,
  })  : _productsUseCase = productsUseCase,
        super(const ProductsState.initial());

  void products(Category category) async {
    emit(const ProductsState.inProgress());
    (await _productsUseCase(category)).fold(
      (failure) => emit(const ProductsState.failure()),
      (products) => emit(ProductsState.success(products)),
    );
  }
}
