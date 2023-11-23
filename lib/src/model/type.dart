import 'dart:convert';

import 'state.dart';

class Types {
  final String id;
  final Name name;
  Types({
    required this.id,
    required this.name,
  });

  Types copyWith({
    String? id,
    Name? name,
  }) {
    return Types(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name.toMap(),
    };
  }

  factory Types.fromMap(Map<String, dynamic> map) {
    return Types(
      id: map['id'] as String,
      name: Name.fromMap(map['name'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Types.fromJson(String source) => Types.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Types(id: $id, name: $name)';

  @override
  bool operator ==(covariant Types other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}

// class Name {
//   final String en;
//   final String mm;
//   Name({
//     required this.en,
//     required this.mm,
//   });

//   Name copyWith({
//     String? en,
//     String? mm,
//   }) {
//     return Name(
//       en: en ?? this.en,
//       mm: mm ?? this.mm,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'en': en,
//       'mm': mm,
//     };
//   }

//   factory Name.fromMap(Map<String, dynamic> map) {
//     return Name(
//       en: map['en'] as String,
//       mm: map['mm'] as String,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Name.fromJson(String source) => Name.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() => 'Name(en: $en, mm: $mm)';

//   @override
//   bool operator ==(covariant Name other) {
//     if (identical(this, other)) return true;
  
//     return 
//       other.en == en &&
//       other.mm == mm;
//   }

//   @override
//   int get hashCode => en.hashCode ^ mm.hashCode;
// }