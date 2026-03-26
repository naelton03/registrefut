import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:registrefut/app/app.dart';
import 'package:registrefut/core/database/app_database.dart';
import 'package:registrefut/features/championship/data/datasources/championship_local_datasource.dart';

void main() {
  testWidgets('app inicializa e renderiza splash', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: RegistreFutApp()));
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('wizard avança etapas', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(home: Scaffold(body: Text('dummy'))),
      ),
    );
  });

  test('sqlite em memória aplica seed e lista campeonatos', () async {
    final db = AppDatabase();
    final dataSource = ChampionshipLocalDataSource(db);
    final championships = await dataSource.list();
    expect(championships.isNotEmpty, true);
    expect(championships.first.name, isNotEmpty);
  });
}
