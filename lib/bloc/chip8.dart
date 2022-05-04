import 'dart:isolate';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../tmp/lib/chip8/chip8.dart';

class Chip8Bloc extends Bloc<Chip8StartEvent, Chip8State> {
  SendPort _sendPort;

  Chip8Bloc() : super(Chip8State.initial()) {
    on<Chip8StartEvent>((event, emit) async {
      await RunnableChip8.startInIsolate(event.romPath);
    });
  }
}

abstract class Chip8BlocEvent {}

class Chip8StartEvent {
  final String romPath;

  const Chip8StartEvent(this.romPath);
}

class Chip8State {
  final List<List<bool>> display;

  const Chip8State(this.display);

  factory Chip8State.initial() => const Chip8State([]);
}
