import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:smart_eco_mobile/home/domain/model/product_part.dart';

abstract class ScanProductState {}

class ScanProductInitial extends ScanProductState {}

class ScanProductLoading extends ScanProductState {}

class ScanProductSuccess extends ScanProductState {
  final ProductPart? product;

  ScanProductSuccess(this.product);
}

class ScanProductError extends ScanProductState {
  final String message;

  ScanProductError(this.message);
}

class ScanProductController extends Cubit<ScanProductState> {
  ScanProductController() : super(ScanProductInitial());

  void scan(String barCode) async {
    try {
      emit(ScanProductLoading());
      final ProductQueryConfiguration configuration = ProductQueryConfiguration(
        barCode,
        language: OpenFoodFactsLanguage.FRENCH,
        fields: [ProductField.ALL],
        version: ProductQueryVersion.v3,
      );
      final ProductResultV3 result =
          await OpenFoodAPIClient.getProductV3(configuration);

      if (result.status == ProductResultV3.statusSuccess) {
        emit(ScanProductSuccess(result.product == null
            ? null
            : ProductPart(
                productName: result.product!.productName ?? 'Marque inconnue',
                imageFrontUrl: result.product!.imageFrontUrl ?? '',
                packaging: result.product!.packaging ?? '',
              )));
      } else {
        emit(ScanProductError('Erreur lors de la recherche du produit'));
      }
    } catch (e) {
      emit(ScanProductError('Erreur lors de la recherche du produit'));
    }
  }
}
