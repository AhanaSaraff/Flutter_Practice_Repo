import 'package:hive/hive.dart';

class Workout{
  final DateTime date;
  final String name;
  final int duration;
  final int calories;

  Workout({
    required this.date,
    required this.name,
    required this.duration,
    required this.calories,
});
}

class WorkoutAdapter extends TypeAdapter<Workout>{

  @override
  final int typeId = 0;

  @override
  Workout read(BinaryReader reader) {
    final millis = reader.readInt();
    final name = reader.readString();
    final duration = reader.readInt();
    final calories = reader.readInt();
    return Workout(
        date: DateTime.fromMicrosecondsSinceEpoch(millis),
        name: name,
        duration: duration,
        calories: calories);
  }

  @override
  void write(BinaryWriter writer, Workout obj) {
    writer.writeInt(obj.date.millisecondsSinceEpoch);
    writer.writeString(obj.name);
    writer.writeInt(obj.duration);
    writer.writeInt(obj.calories);
  }

}