import 'package:chip8/chip8.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

class Chip8Bloc extends Bloc<Chip8StartEvent, Chip8State> {
  final _audioPlayer = AudioPlayer();

  Chip8IsolatePortAndStreams? _portAndStreams;

  Chip8Bloc() : super(Chip8State.initial()) {
    _audioPlayer.setAsset("asset/kirby-poyo.mp3");

    on<Chip8StartEvent>((event, emit) async {
      _portAndStreams = await RunnableChip8.startInIsolate(event.romPath);

      _portAndStreams!.audioStream.listen((event) => _audioPlayer.play());
      _portAndStreams!.displayStream.listen((event) => emit(Chip8State(event)));
    });

    on<Chip8StartEvent>((event, emit) async {
      if (_portAndStreams == null) return;
      _portAndStreams!.sendPort.send(Chip8StopEvent);
    });
  }
}

abstract class Chip8BlocEvent {}

class Chip8StartEvent extends Chip8BlocEvent {
  final String romPath;

  Chip8StartEvent(this.romPath);
}

class Chip8StopEvent extends Chip8BlocEvent {}

class Chip8State {
  final List<List<int>> display;

  const Chip8State(this.display);

  factory Chip8State.initial() => const Chip8State([]);
}
