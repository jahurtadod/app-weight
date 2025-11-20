import 'package:app_weight/user/domain/entities/like.dart';
import 'package:app_weight/user/presentation/widgets/icon_like.dart';
import 'package:app_weight/weight/domain/entities/person.dart';
import 'package:flutter/material.dart';

class CardPerson extends StatelessWidget {
  const CardPerson({
    super.key,
    required this.person,
  });

  final Person person;

  @override
  Widget build(BuildContext context) {
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
                IconLike(
                  targetType: LikeTargetType.person,
                  // si tu entidad Person tiene id, mejor usa eso:
                  targetId: person.id,
                  likes: person.likes,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}