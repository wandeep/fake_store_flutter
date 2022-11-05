import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecases/no_params.dart';
import '../../domain/usecases/categories_use_case.dart';
import 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesUseCase _categoriesUseCase;

  CategoriesCubit({
    required CategoriesUseCase categoriesUseCase,
  })  : _categoriesUseCase = categoriesUseCase,
        super(const CategoriesState.initial());

  void categories() async {
    emit(const CategoriesState.inProgress());
    (await _categoriesUseCase(NoParams())).fold(
      (failure) => emit(const CategoriesState.failure()),
      (categories) => emit(CategoriesState.success(categories)),
    );
  }
}
