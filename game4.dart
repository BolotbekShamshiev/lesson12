import 'dart:io';
import 'dart:math';

void main() {
  startGame();
}

// -----------------------------------------------------------------------------------
startGame() {
  print('Добро пожаловать в игру!');

  print('');
  print('Пожалуйста ознакомься с правилами:');
  print(
      'Первый игрок загадывает число от 1 до 100, второй игрок должен отгадать это число максимум за 7 попыток.');

  print(
      'Если загаданное число больше чем названное число 2-го игрока, то 1-игрок отвечает "+"');
  print(
      'Если загаданное число меньше чем названное число 2-го игрока, то 1-игрок отвечает "-"');
  print('Если 2-игрок угадывает загаданное число, то 1-игрок отвечает "да"');

  print('');
  print(
      'Играем 2 раунда, сначала 1 угадыват, 2 отгадывает, затем меняются ролями');

  print('1-й раунд: Комп загадывает число, а ты угадываешь');

  compZagadyvaet();

}

// -----------------------------------------------------------------------------------
void compZagadyvaet() {
  print('начинаем 1-й раунд.');
  print('');
  print('Компьютер загадал число от 1 до 100, попробуй отгадать, слабо?');

  int min = 1;
  int max = 100;
  int counter = 0;

  int randomNum = min + Random().nextInt(max - min);
  int compsAnswer = 0;

  print(
      'Тссс по секрету скажу, этот хитрец загадал число $randomNum, но сделай вид что ты ничего не знаешь');
  while (compsAnswer != randomNum) {
    compsAnswer = int.parse(stdin.readLineSync()!);
    counter++;

    if (compsAnswer < randomNum) {
      print('+');
    } else if (compsAnswer > randomNum) {
      print('-');
    }
  }
  print('Поздравляю, вы угадали число $randomNum за $counter попыток');
  compOtgadyvaet();
}

// -----------------------------------------------------------------------------------
int compOtgadyvaet() {
  print('Теперь начинаем 2-й раунд.');
  print('');
  print(
      'Загадывай число от 1 до 100, а этот хитрец отгадает это число за 7 попыток.');

  int min = 1;
  int max = 100;
  int mid = (min + max) ~/ 2;
  int counter = 0;

  String userAnswer = '';
  print(
      'Если число отгадано, напиши "да". Если твое число меньше, напиши "-". Если твое число больше, напиши"+".');

  while (userAnswer != 'да') {
    print('Твое число $mid? ');
    userAnswer = stdin.readLineSync()!;
    counter++;

    if (userAnswer == '-') {
      max = mid - 1;
      mid = (min + max) ~/ 2;
    } else if (userAnswer == '+') {
      min = mid + 1;
      mid = (min + max) ~/ 2;
    }
  }
  print('ура, число отгадано, попыток было $counter');
  return counter;
}
