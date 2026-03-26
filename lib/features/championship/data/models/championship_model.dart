import '../../domain/entities/championship_entity.dart';

class ChampionshipModel extends ChampionshipEntity {
  ChampionshipModel({
    required super.id,
    required super.name,
    required super.sport,
    required super.status,
    required super.city,
  });

  factory ChampionshipModel.fromMap(Map<String, Object?> map) {
    return ChampionshipModel(
      id: map['id'] as int,
      name: map['name'] as String,
      sport: map['sport'] as String,
      status: map['status'] as String,
      city: map['city'] as String,
    );
  }

  Map<String, Object?> toMap() => {
        'id': id,
        'name': name,
        'sport': sport,
        'status': status,
        'city': city,
      };
}
