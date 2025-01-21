import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:openfoodfacts/openfoodfacts.dart';

abstract class ScanProductState {}

class ScanProductInitial extends ScanProductState {}

class ScanProductLoading extends ScanProductState {}

class ScanProductSuccess extends ScanProductState {
  final Product? product;

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
        emit(ScanProductSuccess(result.product));
      } else {
        emit(ScanProductError('Erreur lors de la recherche du produit'));
      }
    } catch (e) {
      emit(ScanProductError('Erreur lors de la recherche du produit'));
    }
  }
}
