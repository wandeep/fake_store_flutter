// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return _ProductModel.fromJson(json);
}

/// @nodoc
mixin _$ProductModel {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  RatingModel get rating => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductModelCopyWith<ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
          ProductModel value, $Res Function(ProductModel) then) =
      _$ProductModelCopyWithImpl<$Res, ProductModel>;
  @useResult
  $Res call(
      {int id,
      String title,
      double price,
      String description,
      String category,
      String image,
      RatingModel rating});

  $RatingModelCopyWith<$Res> get rating;
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res, $Val extends ProductModel>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? price = null,
    Object? description = null,
    Object? category = null,
    Object? image = null,
    Object? rating = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as RatingModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RatingModelCopyWith<$Res> get rating {
    return $RatingModelCopyWith<$Res>(_value.rating, (value) {
      return _then(_value.copyWith(rating: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProductModelCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$$_ProductModelCopyWith(
          _$_ProductModel value, $Res Function(_$_ProductModel) then) =
      __$$_ProductModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      double price,
      String description,
      String category,
      String image,
      RatingModel rating});

  @override
  $RatingModelCopyWith<$Res> get rating;
}

/// @nodoc
class __$$_ProductModelCopyWithImpl<$Res>
    extends _$ProductModelCopyWithImpl<$Res, _$_ProductModel>
    implements _$$_ProductModelCopyWith<$Res> {
  __$$_ProductModelCopyWithImpl(
      _$_ProductModel _value, $Res Function(_$_ProductModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? price = null,
    Object? description = null,
    Object? category = null,
    Object? image = null,
    Object? rating = null,
  }) {
    return _then(_$_ProductModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as RatingModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductModel implements _ProductModel {
  _$_ProductModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.rating});

  factory _$_ProductModel.fromJson(Map<String, dynamic> json) =>
      _$$_ProductModelFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final double price;
  @override
  final String description;
  @override
  final String category;
  @override
  final String image;
  @override
  final RatingModel rating;

  @override
  String toString() {
    return 'ProductModel(id: $id, title: $title, price: $price, description: $description, category: $category, image: $image, rating: $rating)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, price, description, category, image, rating);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductModelCopyWith<_$_ProductModel> get copyWith =>
      __$$_ProductModelCopyWithImpl<_$_ProductModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductModelToJson(
      this,
    );
  }
}

abstract class _ProductModel implements ProductModel {
  factory _ProductModel(
      {required final int id,
      required final String title,
      required final double price,
      required final String description,
      required final String category,
      required final String image,
      required final RatingModel rating}) = _$_ProductModel;

  factory _ProductModel.fromJson(Map<String, dynamic> json) =
      _$_ProductModel.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  double get price;
  @override
  String get description;
  @override
  String get category;
  @override
  String get image;
  @override
  RatingModel get rating;
  @override
  @JsonKey(ignore: true)
  _$$_ProductModelCopyWith<_$_ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

RatingModel _$RatingModelFromJson(Map<String, dynamic> json) {
  return _RatingModel.fromJson(json);
}

/// @nodoc
mixin _$RatingModel {
  double get rate => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RatingModelCopyWith<RatingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatingModelCopyWith<$Res> {
  factory $RatingModelCopyWith(
          RatingModel value, $Res Function(RatingModel) then) =
      _$RatingModelCopyWithImpl<$Res, RatingModel>;
  @useResult
  $Res call({double rate, int count});
}

/// @nodoc
class _$RatingModelCopyWithImpl<$Res, $Val extends RatingModel>
    implements $RatingModelCopyWith<$Res> {
  _$RatingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rate = null,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RatingModelCopyWith<$Res>
    implements $RatingModelCopyWith<$Res> {
  factory _$$_RatingModelCopyWith(
          _$_RatingModel value, $Res Function(_$_RatingModel) then) =
      __$$_RatingModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double rate, int count});
}

/// @nodoc
class __$$_RatingModelCopyWithImpl<$Res>
    extends _$RatingModelCopyWithImpl<$Res, _$_RatingModel>
    implements _$$_RatingModelCopyWith<$Res> {
  __$$_RatingModelCopyWithImpl(
      _$_RatingModel _value, $Res Function(_$_RatingModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rate = null,
    Object? count = null,
  }) {
    return _then(_$_RatingModel(
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RatingModel implements _RatingModel {
  _$_RatingModel({required this.rate, required this.count});

  factory _$_RatingModel.fromJson(Map<String, dynamic> json) =>
      _$$_RatingModelFromJson(json);

  @override
  final double rate;
  @override
  final int count;

  @override
  String toString() {
    return 'RatingModel(rate: $rate, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RatingModel &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, rate, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RatingModelCopyWith<_$_RatingModel> get copyWith =>
      __$$_RatingModelCopyWithImpl<_$_RatingModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RatingModelToJson(
      this,
    );
  }
}

abstract class _RatingModel implements RatingModel {
  factory _RatingModel({required final double rate, required final int count}) =
      _$_RatingModel;

  factory _RatingModel.fromJson(Map<String, dynamic> json) =
      _$_RatingModel.fromJson;

  @override
  double get rate;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$_RatingModelCopyWith<_$_RatingModel> get copyWith =>
      throw _privateConstructorUsedError;
}
