import 'dart:io';

const List<List<int>> win = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9],[1, 5, 9], [3, 5, 7]];

Map<int, bool> mp = Map();

bool checkIfWin(List<int> player){
  // Determines if the given player has won the game.
  //  Parameters:
  // this function takes list of int 

  // Returns:
  // and by the possible winning combinations it returns true if the player win and false if not

  
  for(int i = 0;i < win.length;i++){
    int cnt = 0;

    for(int j = 0;j < win[i].length;j++){
      for(int k = 0;k < player.length;k++){
        if(player[k] == win[i][j]){
          cnt++;
        }
      }

      if(cnt == 3){
        // If a match is found (all 3 positions of a winning combination are chosen by the player), the function returns `true`.
        return true;
      }
    }
  }
  // If no match is found after checking all combinations, the function returns `false`.
  return false;
}
void printTicTacToe(List<int> playerX, List<int> playerO){
  // Displays the current state of the Tic Tac Toe board.

  // This function prints the 3x3 grid of the Tic Tac Toe game to the console, showing the positions chosen by Player X and Player O, as well as the remaining available positions.
  
  // Parameters:
  // list of the position that player x choose 
  // list of the position that player o choose 

  // The function iterates through all positions on the Tic Tac Toe grid (1 to 9). For each position:
  //    - If the position is in `playerX`, it prints `x`.
  //    - If the position is in `playerO`, it prints `o`.
  //    - Otherwise, it prints the position number as available.
  //  The grid is printed row by row, with vertical and horizontal separators to   format the board.
  for(int i = 1;i <= 9;i++){
    bool flag = true;
      for(int j = 0;j < playerX.length;j++){
        if(i == playerX[j]){
          stdout.write(' x ');
          flag = false;
          break;
        }
      }
      for(int j = 0;j < playerO.length;j++){
        if(i == playerO[j]){
          stdout.write(' o ');
          flag = false;
          break;
        }
      }
      if(flag){
        stdout.write(' $i ');
      }
      
      if(i % 3 == 0){
        print('');
        print('───┼───┼───');
      }
      else{
        stdout.write('|');
      }

    }
    // This function uses `stdout.write` to print on the same line for better formatting.
    // A `flag` is used to determine whether a position is already occupied by a player.


}

void playGame(){
  // This function controls the entire gameplay process, including player turns, validating inputs, updating the game board, and determining the winner or a tie.It uses a while loop to continue the game until there's a winner or a tie.
  // The function interacts with the console for input/output and does not return values.

  // The function alternates between Player X and Player O.
  // Invalid inputs are handled gracefully by prompting the player again.
  // The board state is updated and printed after each turn.
  for(int i = 1;i <= 9;i++){
    mp[i] = false;
  }

  String player = 'x';
  List<int> playerX = [];
  List<int> playerO = [];
  while(true){

    printTicTacToe(playerX, playerO);

    print('$player :');
    int? num;
    while(num == null){
      
      String? input = stdin.readLineSync();

      num = int.tryParse(input ?? '');
      if(num == null || mp[num] != false){
        print('Invalid input. Please enter a valid integer.');
        num = null;
      }
    }
    mp[num] = true;
    if(player == 'x'){

      playerX.add(num);
      if(checkIfWin(playerX)){
        printTicTacToe(playerX, playerO);
        print('winner congrat x :)');
        break;
      }
      player = 'o';
    }
    else{
      playerO.add(num);
      if(checkIfWin(playerO)){
        printTicTacToe(playerX, playerO);
        print('winner congrat o :)');
        break;
      }
      player = 'x';
    }


    if(playerO.length + playerX.length == 9){
      printTicTacToe(playerX, playerO);
      print('Tie :/ ');
      break;
    }
  }
  
}

void main(){
  
  while(true){
    playGame();
    print('Do you want to play again? (y/n)');
     String? response = stdin.readLineSync();
    if (response == null || response.toLowerCase() != 'y') {
      print('Thanks for playing! Goodbye!');
      break;
    }
  }
  
}