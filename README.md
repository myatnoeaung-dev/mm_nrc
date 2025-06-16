# Myanmar NRC Data and Utils Helpers

<p align="center">
  <img src="https://raw.githubusercontent.com/myatnoeaung-dev/mm_nrc/refs/heads/main/assets/mm_nrc_logo.png" width="150" alt="Mm Nrc Logo">
</p>

[![pub package](https://img.shields.io/pub/v/mm_nrc.svg)](https://pub.dev/packages/mm_nrc)

### Installation
To use this plugin, add `mm_nrc` as a [dependency in your pubspec.yaml file](https://flutter.dev/docs/development/platform-integration/platform-channels).

### Examples
Here are small examples that show you how to use the API.

```dart
Nrc nrc = MmNrc.splitNrc('12/LAMANA(N)123456');
print('State Code : ${nrc.stateCode}');
print('Township Code : ${nrc.townshipCode}');
print('Nrc Type : ${nrc.nrcType}');
print('Nrc Number : ${nrc.nrcNo}');
```
      
### Get NRC States List
```dart
 List<StateDivision?> state = await MmNrc.states();
```

### Get NRC Township List
```dart
 List<Township> townships = await MmNrc.townships();
```

### Get NRC Types List
```dart
 List<Types> types = await MmNrc.types();
```

### Get NRC State by state code
```dart
 StateDivision states = await MmNrc.getStateByStateCode(stateCode:nrc.stateCode );
 StateDivision states = await MmNrc.getStateByStateCode(stateCode:StateCode.YANGON.code );

 print('${states?.code} ${states?.number.mm}');
```

### Get NRC Township by state code . 1,2,3,4,5...
```dart
 Township township = await MmNrc.getNrcTownshipsByStateCode(stateCode:nrc.stateCode);
 Township township = await MmNrc.getNrcTownshipsByStateCode(stateCode:StateCode.YANGON.code );
```

### Get NRC Township by short code
```dart
 Township township = await MmNrc.getNrcTownshipsByShortCode(shortCode: nrc.townshipCode);
 Township township = await MmNrc.getNrcTownshipsByShortCode(shortCode:"LAMANA");
```

### Get NRC Township by short code
```dart
--nrctype-- N|E|P|T|Y|S
 Types type=await MmNrc.getNrcTypeByName(nrcType: 'N');
```
