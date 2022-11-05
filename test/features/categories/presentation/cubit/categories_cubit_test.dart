// ignore_for_file: prefer_const_constructors, void_checks
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:shopping/core/error/failures.dart';
import 'package:shopping/core/usecases/no_params.dart';
import 'package:shopping/features/categories/domain/entities/category.dart';
import 'package:shopping/features/categories/domain/usecases/categories_use_case.dart';
import 'package:shopping/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:shopping/features/categories/presentation/cubit/categories_state.dart';

import '../categories_cubit_test.mocks.dart';

@GenerateMocks([
  CategoriesUseCase,
])
void main() {
  late CategoriesCubit categoriesCubit;
  late MockCategoriesUseCase mockCategoriesUseCase;

  final tCategories = [
    Category(value: 'category 1'),
    Category(value: 'category 2'),
  ];

  setUp(() {
    mockCategoriesUseCase = MockCategoriesUseCase();

    categoriesCubit = CategoriesCubit(categoriesUseCase: mockCategoriesUseCase);
  });

  blocTest<CategoriesCubit, CategoriesState>(
    'Emits [initial] state when categoriesCubit is first loaded',
    build: () => categoriesCubit,
    verify: (cubit) => expect(cubit.state, CategoriesState.initial()),
  );

  blocTest<CategoriesCubit, CategoriesState>(
    'emits [CategoriesState.success] when categories are loaded successfully',
    setUp: () {
      when(mockCategoriesUseCase(NoParams())).thenAnswer((_) async => Right(tCategories));
    },
    build: () => categoriesCubit,
    act: (cubit) {
      categoriesCubit.categories();
    },
    verify: (cubit) => expect(cubit.state, CategoriesState.success(tCategories)),
  );

  blocTest<CategoriesCubit, CategoriesState>(
    'emits [CategoriesState.failure] when categories fail to load',
    setUp: () {
      final tFailure = Failure.categories('failed to get categories');
      when(mockCategoriesUseCase(NoParams())).thenAnswer((_) async => Left(tFailure));
    },
    build: () => categoriesCubit,
    act: (cubit) {
      categoriesCubit.categories();
    },
    verify: (cubit) => expect(cubit.state, CategoriesState.failure()),
  );
}
