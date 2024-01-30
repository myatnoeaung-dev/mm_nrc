/// State code enum for State Name and Code
enum StateCode {
  KACHIN('1', 'KACHIN'),
  KAYAH('2', 'KAYAH'),
  KAYIN('3', 'KAYIN'),
  CHIN('4', 'CHIN'),
  SAGAING('5', 'SAGAING'),
  TANINTHARYI('6', 'TANINTHARYI'),
  BAGO('7', 'BAGO'),
  MAGWAY('8', 'MAGWAY'),
  MANDALAY('9', 'MANDALAY'),
  MON('10', 'MON'),
  RAKHINE('11', 'RAKHINE'),
  YANGON('12', 'YANGON'),
  SHAN('13', 'SHAN'),
  AYEYAWADY('14', 'AYEYAWADY'),
  NAYPYITAW('15', 'NAYPYITAW');

  /// Represent for state code.
  final String code;

  /// Represent for state name.
  final String name;

  const StateCode(this.code, this.name);
}
