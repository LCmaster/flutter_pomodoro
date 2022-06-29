import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

class AudioController extends GetxController {
  final AudioPlayer _ringPlayer = AudioPlayer();
  final AudioPlayer _tickPlayer = AudioPlayer();
  final String _ringSource = 'audio/ring.wav';
  final String _tickSource = 'audio/tick.wav';

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  @override
  void onClose() {
    _dispose();
  }

  Future<void> _init() async {
    await _ringPlayer.setVolume(1.0);
    await _ringPlayer.setSource(AssetSource(_ringSource));
    // await _player.setPlayerMode(PlayerMode.lowLatency);
    // await _ringPlayer.setReleaseMode(ReleaseMode.loop);

    await _tickPlayer.setVolume(1.0);
    final bytes = await AudioCache.instance.loadAsBytes(_tickSource);
    await _tickPlayer.setSource(BytesSource(bytes));
    // await _player.setPlayerMode(PlayerMode.lowLatency);
    await _tickPlayer.setReleaseMode(ReleaseMode.loop);
  }

  Future<void> _dispose() async {
    await _ringPlayer.release();
    await _ringPlayer.dispose();

    await _tickPlayer.release();
    await _tickPlayer.dispose();
  }

  Future<void> ring() async {
    await _ringPlayer.stop();
    await _ringPlayer.resume();
  }

  Future<void> startTicking() async {
    await _tickPlayer.seek(Duration.zero);
    await _tickPlayer.resume();
  }

  Future<void> stopTicking() async {
    await _tickPlayer.stop();
  }
}