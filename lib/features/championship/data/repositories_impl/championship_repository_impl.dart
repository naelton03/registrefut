import '../../domain/entities/championship_entity.dart';
import '../../domain/repositories/championship_repository.dart';
import '../datasources/championship_local_datasource.dart';
import '../models/championship_model.dart';

class ChampionshipRepositoryImpl implements ChampionshipRepository {
  ChampionshipRepositoryImpl(this._local);

  final ChampionshipLocalDataSource _local;

  @override
  Future<int> create(ChampionshipEntity championship) {
    return _local.create(
      ChampionshipModel(
        id: championship.id,
        name: championship.name,
        sport: championship.sport,
        status: championship.status,
        city: championship.city,
      ),
    );
  }

  @override
  Future<List<ChampionshipEntity>> list() => _local.list();
}
