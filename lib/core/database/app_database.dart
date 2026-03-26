import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) => AppDatabase());

class AppDatabase {
  Database? _db;

  Future<Database> get database async {
    _db ??= await _open();
    return _db!;
  }

  Future<Database> _open() async {
    sqfliteFfiInit();
    final factory = databaseFactoryFfi;
    final db = await factory.openDatabase(
      inMemoryDatabasePath,
      options: OpenDatabaseOptions(
        version: 1,
        onCreate: _onCreate,
        onOpen: _onOpen,
      ),
    );
    return db;
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('CREATE TABLE users (id INTEGER PRIMARY KEY, name TEXT, email TEXT, is_organizer INTEGER)');
    await db.execute('CREATE TABLE organizers (id INTEGER PRIMARY KEY, user_id INTEGER, display_name TEXT, bio TEXT)');
    await db.execute('CREATE TABLE championships (id INTEGER PRIMARY KEY, organizer_id INTEGER, name TEXT, sport TEXT, status TEXT, city TEXT, updated_at TEXT)');
    await db.execute('CREATE TABLE categories (id INTEGER PRIMARY KEY, championship_id INTEGER, name TEXT)');
    await db.execute('CREATE TABLE phases (id INTEGER PRIMARY KEY, championship_id INTEGER, name TEXT, type TEXT, sort_order INTEGER)');
    await db.execute('CREATE TABLE rounds (id INTEGER PRIMARY KEY, phase_id INTEGER, name TEXT, sort_order INTEGER)');
    await db.execute('CREATE TABLE teams (id INTEGER PRIMARY KEY, championship_id INTEGER, name TEXT, coach TEXT)');
    await db.execute('CREATE TABLE players (id INTEGER PRIMARY KEY, team_id INTEGER, name TEXT, number INTEGER)');
    await db.execute('CREATE TABLE staff_members (id INTEGER PRIMARY KEY, team_id INTEGER, name TEXT, role TEXT)');
    await db.execute('CREATE TABLE matches (id INTEGER PRIMARY KEY, championship_id INTEGER, phase_id INTEGER, round_id INTEGER, home_team_id INTEGER, away_team_id INTEGER, home_score INTEGER, away_score INTEGER, status TEXT, starts_at TEXT, venue TEXT)');
    await db.execute('CREATE TABLE match_events (id INTEGER PRIMARY KEY, match_id INTEGER, team_id INTEGER, player_id INTEGER, type TEXT, minute INTEGER)');
    await db.execute('CREATE TABLE standings (id INTEGER PRIMARY KEY, championship_id INTEGER, team_id INTEGER, points INTEGER, played INTEGER, won INTEGER, drawn INTEGER, lost INTEGER, goals_for INTEGER, goals_against INTEGER)');
    await db.execute('CREATE TABLE statistics (id INTEGER PRIMARY KEY, championship_id INTEGER, player_id INTEGER, goals INTEGER, assists INTEGER, yellow_cards INTEGER, red_cards INTEGER)');
    await db.execute('CREATE TABLE notifications (id INTEGER PRIMARY KEY, user_id INTEGER, title TEXT, body TEXT, created_at TEXT)');
    await db.execute('CREATE TABLE followed_championships (id INTEGER PRIMARY KEY, user_id INTEGER, championship_id INTEGER)');
    await _seed(db);
  }

  Future<void> _onOpen(Database db) async {}

  Future<void> _seed(Database db) async {
    await db.insert('users', {'id': 1, 'name': 'Ana Costa', 'email': 'ana@mock.dev', 'is_organizer': 1});
    await db.insert('users', {'id': 2, 'name': 'Carlos Lima', 'email': 'carlos@mock.dev', 'is_organizer': 0});
    await db.insert('organizers', {'id': 1, 'user_id': 1, 'display_name': 'Liga Azul', 'bio': 'Organizador oficial'});
    await db.insert('championships', {
      'id': 1,
      'organizer_id': 1,
      'name': 'Copa Metropolitana',
      'sport': 'Futebol',
      'status': 'Em andamento',
      'city': 'São Paulo',
      'updated_at': DateTime.now().toIso8601String(),
    });
    await db.insert('teams', {'id': 1, 'championship_id': 1, 'name': 'Tubarões FC', 'coach': 'Marcos Silva'});
    await db.insert('teams', {'id': 2, 'championship_id': 1, 'name': 'Leões FC', 'coach': 'Rafael Dias'});
    await db.insert('phases', {'id': 1, 'championship_id': 1, 'name': 'Fase Única', 'type': 'pontos_corridos', 'sort_order': 1});
    await db.insert('rounds', {'id': 1, 'phase_id': 1, 'name': 'Rodada 1', 'sort_order': 1});
    await db.insert('matches', {
      'id': 1,
      'championship_id': 1,
      'phase_id': 1,
      'round_id': 1,
      'home_team_id': 1,
      'away_team_id': 2,
      'home_score': 2,
      'away_score': 1,
      'status': 'encerrada',
      'starts_at': DateTime.now().add(const Duration(days: 1)).toIso8601String(),
      'venue': 'Arena Central'
    });
    await db.insert('standings', {'id': 1, 'championship_id': 1, 'team_id': 1, 'points': 3, 'played': 1, 'won': 1, 'drawn': 0, 'lost': 0, 'goals_for': 2, 'goals_against': 1});
    await db.insert('statistics', {'id': 1, 'championship_id': 1, 'player_id': 1, 'goals': 2, 'assists': 1, 'yellow_cards': 0, 'red_cards': 0});
    await db.insert('notifications', {'id': 1, 'user_id': 2, 'title': 'Resultado atualizado', 'body': 'Tubarões 2 x 1 Leões', 'created_at': DateTime.now().toIso8601String()});
    await db.insert('followed_championships', {'id': 1, 'user_id': 2, 'championship_id': 1});
  }
}
