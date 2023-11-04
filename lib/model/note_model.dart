// ignore_for_file: public_member_api_docs, sort_constructors_first
class Note {
  String id;
  String tittle;
  String subtittle;
  DateTime time;
  bool isDone;
  Note({
    required this.id,
    required this.tittle,
    required this.subtittle,
    required this.time,
    required this.isDone,
  });
}
