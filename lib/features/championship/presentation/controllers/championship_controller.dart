import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/database/app_database.dart';
import '../../data/datasources/championship_local_datasource.dart';
import '../../data/repositories_impl/championship_repository_impl.dart';
import '../../domain/entities/championship_entity.dart';
import '../../domain/usecases/list_championships_usecase.dart';

final championshipRepositoryProvider = Provider((ref) {
  final db = ref.watch(appDatabaseProvider);
  return ChampionshipRepositoryImpl(ChampionshipLocalDataSource(db));
});

final championshipsProvider = FutureProvider<List<ChampionshipEntity>>((ref) async {
  final repo = ref.watch(championshipRepositoryProvider);
  return ListChampionshipsUseCase(repo).call();
});
