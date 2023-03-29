import 'package:intl/intl.dart';

moneyFormatSetWithComma(price) {
  var formatter = NumberFormat('###,###,###,###');
  String pri = price.toString();
  if (pri.contains('.')) {
    var p = pri.split('.');
    var m = formatter.format(int.parse(p[0]));
      if (int.parse(p[1]) == 0) {
        return (m);
      }
      else {
        return ('$m.${p[1][0]}${p[1][1]}');
    }
  } else if (pri.contains(',')) {
    return pri;
  } else if (pri == ' ') {
    return price;
  } else if (pri.contains('0') ||
      pri.contains('1') ||
      pri.contains('2') ||
      pri.contains('3') ||
      pri.contains('4') ||
      pri.contains('5') ||
      pri.contains('6') ||
      pri.contains('7') ||
      pri.contains('8') ||
      pri.contains('9')) {
    return formatter.format(int.parse(price));
  } else {
    return price;
  }
}

writeMoneyFormatSetWithComma(price) {
  var formatter = NumberFormat('###,###,###,###');
  String pri = price.toString();
  // print('price $price');
  if (pri.contains('.')) {
    var p = pri.split('.');
    if(p[0] == ' ' || p[0] == ''){
      if(p[1]==' ' || p[1]==''){
        return ('0''.');
      }else{
        return ('0.${p[1]}');
      }
    }
    else{
      var m = formatter.format(int.parse(p[0]));
      if(p[1]==' ' || p[1]==''){
        return ('$m.');
      }else {
        if (int.parse(p[1]) == 0) {
          return (m);
        }
        else {
          return ('$m.${p[1]}');
        }
      }
    }
  }
  else if (pri.contains(',')) {
    return pri;
  }
  else if (pri == ' ') {
    return price;
  }
  else if (pri.contains('0') ||
      pri.contains('1') ||
      pri.contains('2') ||
      pri.contains('3') ||
      pri.contains('4') ||
      pri.contains('5') ||
      pri.contains('6') ||
      pri.contains('7') ||
      pri.contains('8') ||
      pri.contains('9')) {
    return formatter.format(int.parse(price));
  } else {
    return price;
  }
}

String moneyFormatSetWOC(String price) {
  if (price.isNotEmpty) {
    var value = '';
    for (var i = 0; i < price.length; i++) {
      if (price[i] != ',') {
        value += price[i];
      }
    }
    return value;
  } else {
    return '0';
  }
}

