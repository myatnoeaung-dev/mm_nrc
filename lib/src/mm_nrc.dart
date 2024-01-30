import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:mm_nrc/src/constants.dart';
import 'package:mm_nrc/src/model/nrc.dart';
import 'package:mm_nrc/src/model/state.dart';
import 'package:mm_nrc/src/model/township.dart';
import 'package:mm_nrc/src/model/type.dart';

class MmNrc {
  /// Check En Nrc string
  ///
  /// Return `false` if user input nrc string is not valid.
  static bool checkValid({required String enNrcString}) {
    RegExp enRegExp = RegExp(Data.enPattern);
    if (enRegExp.hasMatch(enNrcString)) {
      return true;
    }
    return false;
  }

  /// Get NRC Township by short code
  ///
  /// Return Township that related with input township short code `LAMANA,YAKANA...`,
  static Future<Township> getNrcTownshipsByShortCode(
      {required String shortCode}) async {
    List<Township> townshipList = await townships();
    Township township = townshipList.firstWhere((element) =>
        (element.short.en == shortCode || element.short.mm == shortCode));
    return township;
  }

  /// Get NRC Township by state code . 1,2,3,4,5...
  ///
  /// Return Township that related with input state code `1,2,3,4..`,
  static Future<Township> getNrcTownshipsByStateCode(
      {required String stateCode}) async {
    List<Township> townshipList = await townships();
    Township township =
        townshipList.firstWhere((element) => element.stateCode == stateCode);
    return township;
  }

  /// Get NRC Township by state id.
  ///
  /// Return Township that related with input state id,
  static Future<Township> getNrcTownshipsByStateId(
      {required String stateId}) async {
    List<Township> townshipList = await townships();
    Township township =
        townshipList.firstWhere((element) => element.stateId == stateId);
    return township;
  }

  /// Get NRC Type by id
  ///
  /// Return Type that relate with type id
  static Future<Types> getNrcTypeById({required String typeId}) async {
    List<Types> typesList = await types();
    Types type = typesList.firstWhere((element) => element.id == typeId);
    return type;
  }

  /// Get NRC Type by name
  ///
  /// Return Type that related with type name `N,E,S,T,P,Y`
  static Future<Types> getNrcTypeByName({required String nrcType}) async {
    List<Types> typesList = await types();
    Types type = typesList.firstWhere((element) =>
        (element.name.en == nrcType || element.name.mm == nrcType));
    return type;
  }

  /// Get NRC State by state code
  static Future<StateDivision?> getStateByStateCode(
      {required String stateCode}) async {
    List<StateDivision?> stateList = await states();

    StateDivision? state = stateList.firstWhere(
      (element) =>
          (element?.number.en == stateCode || element?.number.mm == stateCode),
    );
    return state;
  }

  /// Split NRC [stateCode],[townshipCode],[nrcType],[nrcNo]
  ///
  /// Return NRC(stateCode,townshipCode,nrcType,nrcNo)
  static Nrc splitNrc(String nrcFullString) {
    var list = nrcFullString.split(RegExp(r"[/()]"));
    Nrc nrc = Nrc(
        stateCode: list[0],
        townshipCode: list[1],
        nrcType: list[2],
        nrcNo: list[3]);
    return nrc;
  }

  /// Get NRC States
  static Future<List<StateDivision?>> states() async {
    final String response = await rootBundle.loadString(Data.state);
    Iterable data = await json.decode(response);
    List<StateDivision> states = List<StateDivision>.from(
        data.map((model) => StateDivision.fromMap(model)));
    return states;
  }

  /// Get NRC Townships
  static Future<List<Township>> townships() async {
    final String response = await rootBundle.loadString(Data.township);
    Iterable data = await json.decode(response);

    List<Township> township =
        List<Township>.from(data.map((model) => Township.fromMap(model)));

    return township;
  }

  /// Get NRC Types
  ///
  /// Return Type objects list
  static Future<List<Types>> types() async {
    final String response = await rootBundle.loadString(Data.type);
    Iterable data = await json.decode(response);
    List<Types> type =
        List<Types>.from(data.map((model) => Types.fromMap(model)));

    return type;
  }

  // static String convertEnNrcToMMNrc() {
  //   return '';
  // }

  // static String convertMmNrcToEnNrc() {
  //   return '';
  // }
}
