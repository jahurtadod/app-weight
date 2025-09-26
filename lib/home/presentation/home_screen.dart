import 'package:app_weight/weight/presentation/widgets/card_person.dart';
import 'package:app_weight/weight/presentation/widgets/grid_weights.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('VERSUS')),
      body: _HomeScreenView(),
    );
  }
}

class _HomeScreenView extends StatelessWidget {
  const _HomeScreenView();

  @override
  Widget build(BuildContext context) {
    // return Wrap(children: [CardPerson(personId: "8THRVje5cHueUkOkl2v3"), CardPerson(personId: "qAv91SfDvk22Rt4Jjvxu")]);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  CardPerson(personId: "8THRVje5cHueUkOkl2v3"),
                  const SizedBox(height: 24),
                  GridWeights(personId: "8THRVje5cHueUkOkl2v3"),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  CardPerson(personId: "qAv91SfDvk22Rt4Jjvxu"),
                  const SizedBox(height: 24),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      minHeight: 200,
                      maxHeight: double.infinity,
                    ),
                    child: GridWeights(personId: "qAv91SfDvk22Rt4Jjvxu"),
                  ),
                ],
              ),
            ),
            Expanded(flex: 3, child: Container()),
          ],
        ),
      ),
    );
  }
}
