import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_weight/weight/presentation/providers/person_providers.dart';

class CardPerson extends ConsumerWidget {
  const CardPerson({super.key, required this.personId});
  final String personId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final person = ref.watch(personByIdProvider(personId));
    final watchPerson = ref.watch(watchPersonByIdProvider(personId));

    return watchPerson.when(
      data: (person) {
        if (person == null) {
          return const Text("SIN DATOS DE COMPETIDOR");
        }
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 8,
          clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.network(person.img, fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            person.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Wrap(
                            spacing: 12,
                            runSpacing: 4,
                            children: [
                              Text('Peso inicial: ${person.initialWeight}'),
                              Text('Altura: ${person.height / 100} m'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Text('${person.likes}'),
                    const SizedBox(width: 8),
                    Icon(Icons.favorite_border), // TODO extraer widget Favotite / Hacerlo un provider/ Icon en weight o user ?
                  ],
                ),
              ],
            ),
          ),
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (error, stackTrace) => Text("Error: $error"),
    );
  }
}
