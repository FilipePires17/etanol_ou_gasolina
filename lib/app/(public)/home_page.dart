import 'package:asp/asp.dart';
import 'package:flutter/material.dart';

import '../interactor/actions/compare.dart';
import '../interactor/atoms/comparison_atom.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final formKey = GlobalKey<FormState>();
  double alcoholPrice = 0;
  double gasolinePrice = 0;

  void onSaveAction() {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      makeComparison(alcoholPrice, gasolinePrice);
    }
  }

  @override
  Widget build(BuildContext context) {
    return RxBuilder(
      builder: (_) {
        final fuelComparison = comparisonAtom.value;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Etanol ou Gasolina'),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Preço da gasolina',
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            gasolinePrice = double.parse(value);
                            onSaveAction();
                          }
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Preço do etanol',
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            alcoholPrice = double.parse(value);
                            onSaveAction();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'Etanol é ${fuelComparison ? 'mais' : 'menos'} eficiente',
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
