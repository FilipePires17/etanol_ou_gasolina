import '../atoms/comparison_atom.dart';

Future<void> makeComparison(double alcoholPrice, double gasolinePrice) async {
  if (alcoholPrice == 0 || gasolinePrice == 0) {
    comparisonAtom.value = true;
    return;
  }
  final alcoholEfficiency = alcoholPrice / gasolinePrice;

  if (alcoholEfficiency <= 0.7) {
    comparisonAtom.value = true;
  } else {
    comparisonAtom.value = false;
  }
}
