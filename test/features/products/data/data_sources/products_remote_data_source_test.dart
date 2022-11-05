import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:shopping/core/error/failures.dart';
import 'package:shopping/core/network/environment.dart';
import 'package:shopping/features/products/data/data_sources/products_remote_data_source.dart';
import 'package:shopping/features/products/data/model/product_model.dart';

import '../../../../fixture_reader.dart';
import 'products_remote_data_source_test.mocks.dart';

@GenerateMocks([http.Client])
main() {
  late ProductsRemoteDataSourceImpl dataSource;
  late MockClient mockHttpClient;
  late Environment environment;

  setUp(
    () {
      mockHttpClient = MockClient();
      environment = Environment();
      dataSource = ProductsRemoteDataSourceImpl(client: mockHttpClient, environment: environment);
    },
  );

  void setUpMockHttpClientSuccess200() {
    when(mockHttpClient.get(any)).thenAnswer((_) async => http.Response(fixture('products_response.json'), 200));
  }

  void setUpMockHttpClientFailure404() {
    when(mockHttpClient.get(any)).thenAnswer((_) async => http.Response('Something went wrong', 404));
  }

  group(
    'getProducts',
    () {
      const tCategory = 'category';

      test(
        '''should perform a GET request on a URL with category in the URL path''',
        () async {
          // Given
          setUpMockHttpClientSuccess200();
          // When
          await dataSource.products(tCategory);
          // Then
          verify(
            mockHttpClient.get(
              Uri.parse('https://fakestoreapi.com/products/category/category'),
            ),
          );
        },
      );

      test(
        'should return ProductModels when the response code is 200 (success)',
        () async {
          // Given
          setUpMockHttpClientSuccess200();
          // When
          final result = await dataSource.products(tCategory);
          // Then
          expect(result, isInstanceOf<Either<Failure, List<ProductModel>>>());
        },
      );

      test(
        'should return [Failure.products] if the category is empty when requesting products',
        () async {
          // Given
          // When
          final result = await dataSource.products('');
          // Then
          expect(result, equals(Left(Failure.products('Error - invalid category specified'))));
        },
      );

      test(
        'should return [Failure.products] if the products request failed',
        () async {
          // Given
          setUpMockHttpClientFailure404();
          // When
          final result = await dataSource.products(tCategory);
          // Then
          expect(
              result,
              equals(
                  Left(Failure.products('Products Failure - Server responded 404 when attempting to fetch products'))));
        },
      );
    },
  );
}
