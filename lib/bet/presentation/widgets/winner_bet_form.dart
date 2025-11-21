import 'package:app_weight/bet/domain/usecases/watch_bet_details.dart';
import 'package:flutter/material.dart';

class WinnerBetForm extends StatefulWidget {
  final BetDetails bet;

  const WinnerBetForm({
    super.key,
    required this.bet,
  });

  @override
  State<WinnerBetForm> createState() => _WinnerBetFormState();
}

class _WinnerBetFormState extends State<WinnerBetForm> {
  final _formKey = GlobalKey<FormState>();

  final _amountCtrl = TextEditingController();
  String? _selectedParticipant;

  @override
  void dispose() {
    _amountCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _amountCtrl,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Paxines a apostar (1 Paxine = \$1)',
              prefixText: '\$ ',
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Ingresa un monto';
              }
              final num? parsed = num.tryParse(value);
              if (parsed == null || parsed <= 0) {
                return 'Monto inválido';
              }
              return null;
            },
          ),

          const SizedBox(height: 16),

          DropdownButtonFormField<String>(
            value: _selectedParticipant,
            items: widget.bet.participants.map((participant) {
              return DropdownMenuItem<String>(
                value: participant.person.id,
                child: Text(participant.person.name),
              );
            }).toList(),
            decoration: const InputDecoration(
              labelText: 'Apuesta por:',
            ),
            onChanged: (value) => setState(() {
              _selectedParticipant = value;
            }),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Selecciona un participante';
              }
              return null;
            },
          ),

          const SizedBox(height: 20),

          // -------------------------------
          // BOTÓN CONFIRMAR
          // -------------------------------
          Align(
            alignment: Alignment.centerRight,
            child: FilledButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final amount = double.parse(_amountCtrl.text);
                  final participant = _selectedParticipant;

                  // 👉 Aquí devuelves los valores al padre si quieres
                  debugPrint('Monto apostado: $amount');
                  debugPrint('Apuesta por: $participant');

                  // TODO: llamar usecase para crear la apuesta
                }
              },
              child: const Text('CONFIRMAR'),
            ),
          ),
        ],
      ),
    );
  }
}