import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_kale_kusatmasi/oyun_kale_kusatmasi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(kaleKusatmasiConfig.title.length, 33);
    expect(kaleKusatmasiConfig.tagline.length, 33);
    for (final s in kaleKusatmasiConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(kaleKusatmasiConfig.gameId, kaleKusatmasiId);
    expect(kaleKusatmasiRules.gameId, kaleKusatmasiId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(kaleKusatmasiRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: kaleKusatmasiId, optionalMechanics: kaleKusatmasiRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(kaleKusatmasiRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
