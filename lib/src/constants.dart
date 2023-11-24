/// Data path for json file
class Data {
  /// file location for state json
  static const state = 'packages/mm_nrc/assets/jsons/state.json';

  /// file location for township json
  static const township = 'packages/mm_nrc/assets/jsons/township.json';

  /// file location for type json
  static const type = 'packages/mm_nrc/assets/jsons/type.json';

  /// regexp pattern for en nrc format
  static const enPattern = r'^[0-9]{1,2}/[a-zA-Z]+\([a-zA-Z]{1}\)[0-9]{6}$';
  // static const mmPattern =
  //     r'^[၀-၉]{1,2}/[က-အ]{3,3}\((နိုင်|ဧည့်|ပြု|သာသနာ|ယာယီ|စ)\)[၀-၉]{5,6}|[0-9]{5,6}$';
}
