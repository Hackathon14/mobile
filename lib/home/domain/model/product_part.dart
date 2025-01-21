import 'package:equatable/equatable.dart';

class ProductPart extends Equatable {
  const ProductPart({
    required this.imageFrontUrl,
    required this.productName,
    required this.packaging,
  });

  @override
  List<Object?> get props => [];

  final String imageFrontUrl;
  final String productName;
  final String packaging;
}
