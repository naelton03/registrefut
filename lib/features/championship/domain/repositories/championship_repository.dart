import '../entities/championship_entity.dart';

abstract class ChampionshipRepository {
  Future<List<ChampionshipEntity>> list();
  Future<int> create(ChampionshipEntity championship);
}
