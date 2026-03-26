import '../entities/championship_entity.dart';
import '../repositories/championship_repository.dart';

class ListChampionshipsUseCase {
  ListChampionshipsUseCase(this._repository);
  final ChampionshipRepository _repository;

  Future<List<ChampionshipEntity>> call() => _repository.list();
}
