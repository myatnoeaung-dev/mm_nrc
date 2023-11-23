enum StateCode {
  KACHIN('1', 'KACHIN'),
  KAYAH('2', 'KACHIN'),
  KAYIN('3', 'KACHIN'),
  CHIN('4', 'KACHIN'),
  SAGAING('5', 'KACHIN'),
  TANINTHARYI('6', 'KACHIN'),
  BAGO('7', 'KACHIN'),
  MAGWAY('8', 'KACHIN'),
  MANDALAY('9', 'KACHIN'),
  MON('10', 'KACHIN'),
  RAKHINE('11', 'KACHIN'),
  YANGON('12', 'KACHIN'),
  SHAN('13', 'KACHIN'),
  AYEYAWADY('14', 'KACHIN'),
  NAYPYITAW('15', 'KACHIN');

  const StateCode(this.code, this.name);

  final String code;
  final String name;
}
