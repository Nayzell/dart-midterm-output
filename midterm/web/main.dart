import 'dart:io';
import 'dart:math';
import 'package:emojis/emojis.dart';
import 'package:emojis/emoji.dart';

// A classic Filipino game Papel, Gunting, Bato! Using Dart as the programming language

class score {
  int Wins = 0;
  int Loss = 0;
  int Draws = 0;

 score(this.Wins, this.Loss, this.Draws);

  int get WinScore {
    return Wins;
  }

  int get LossScore {
    return Loss;
  }

  int get DrawsScore {
    return Draws;
  }

 // ignore: always_declare_return_types
 currentWins(int newWins) {
    Wins += newWins;

  }

  // ignore: always_declare_return_types
  currentLoss(int newLoss) {
    Loss += newLoss;

  }

  // ignore: always_declare_return_types
  currentDraws(int newDraws) {
    Draws += newDraws;

  }
}

enum Move { bato, papel, gunting }

void main() {
  final ran = Random();
  while (true) {
    print('>>>>>>>>>Papel, Gunting, Bato!<<<<<<<<<');
    stdout.write('Papel, Gunting, Bato! What is your Pick?\n ');
    final input = stdin.readLineSync().toUpperCase();

    if (input.toLowerCase() == 'bato' || input.toLowerCase() == 'papel' ||
        input.toLowerCase() == 'gunting') {
      var playerMove;
      if (input.toLowerCase() == 'bato') {
        playerMove = Move.bato;
      }
      else if (input.toLowerCase() == 'papel') {
        playerMove = Move.papel;
      }
      else {
        playerMove = Move.gunting;
      }
     """ if (input.toLowerCase() == 'bato' || input.toLowerCase() == 'papel' ||
          input.toLowerCase() == 'gunting') {
        var playerMove;
        if (input.toLowerCase() == 'bato') {
          playerMove = ('${Emojis.oncomingFist}');
        } else if (input.toLowerCase() == 'papel') {
          playerMove = ('${Emojis.raisedHand}');
        } else {
          playerMove = ('${Emojis.victoryHand}');
        }
        """;


        var newScore = score(0, 0, 0);

        var random = ran.nextInt(3);
        var botMove = Move.values[random];

        print('You played: $playerMove \n');
        print('Bot played: $botMove \n');
        if (playerMove == botMove) {
          newScore.currentDraws(1);
          print("It's a draw \n");
        }
        else if (playerMove == Move.bato && botMove == Move.gunting ||
            playerMove == Move.papel && botMove == Move.bato ||
            playerMove == Move.gunting && botMove == Move.papel) {
          newScore.currentWins(1);
          print('You win! \n');
        }
        else {
          newScore.currentLoss(1);
          print('You lose! \n');
        }
        var scoreWin = newScore.WinScore;
        var scoreLoss = newScore.LossScore;
        var scoreDraw = newScore.DrawsScore;

        print(
            'Your scores: $scoreWin Wins, $scoreLoss Loss, and $scoreDraw Draws \n');
      }
      else if (input.toLowerCase() == 'quit') {
        break;
      }

      else {
        print('\n Please type bato, papel, or gunting. \n');
      }
    }
  }
