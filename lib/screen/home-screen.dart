import 'package:flutter/material.dart';
import 'package:game_x_o/model/player_model.dart';
import 'package:game_x_o/model/x_model.dart';
import 'package:game_x_o/widget/detail_widget.dart';
import 'package:game_x_o/widget/item_widget.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});
  static String homeScreen="HomeScreen";
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int scoreX = 0;
  int scoreO = 0;
  int count = 1;

  @override
  Widget build(BuildContext context) {
    PlayerModel playerModel = ModalRoute.of(context)?.settings.arguments as PlayerModel;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              DetailWidget(text1: playerModel.playerOne, text2: playerModel.playerTwo),
              DetailWidget(
                text1: scoreX.toString(),
                text2: scoreO.toString(),
              ),
              SizedBox(
                height: 350,
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: listOfCount.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 3,
                      mainAxisSpacing: 3),
                  itemBuilder: (context, index) {
                    return ItemWidget(
                      text: listOfCount[index],
                      onPress: () {
                        setState(
                          () {
                            if (listOfCount[index] != "") return;
                            if (count % 2 == 0) {
                              listOfCount[index] =playerModel.selectX.toString();
                            } else {
                              listOfCount[index] = playerModel.selectO.toString();
                            }
                            count++;
                            if (count == 10) {
                              for (int i = 0; i <= 8; i++) {
                                listOfCount[i] = '';
                              }
                              count = 1;
                            }
                            calcMatrixScore("X");
                            calcMatrixScore("O");
                            calcRowScore("X");
                            calcRowScore("O");
                            calcColumnScore("X");
                            calcColumnScore("O");
                        //    print(listOfCount);
                            if (!listOfCount.contains("X") &&
                                !listOfCount.contains("O")) {
                              count = 1;
                            }
                          },
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void calcRowScore(
    String x,
  ) {
    for (int i = 0; i <= 8; i += 3) {
      if (listOfCount[i] == x &&
          listOfCount[i + 1] == x &&
          listOfCount[i + 2] == x) {
        for (int i = 0; i <= 8; i++) {
          listOfCount[i] = '';
        }
        if (x == "X") {
          scoreX++;
        } else {
          scoreO++;
        }
      }
    }
  }

  void calcMatrixScore(
    String x,
  ) {
    int increase = 4;
    int count = 0;
    int switchEnd = 8;
    for (int i = 0; i <= switchEnd; i += increase) {
      if (listOfCount[i] == x) {
        count++;
      } else {
        if (i==2||i==6)return;
        i = 0;
        count = 0;
        increase = 2;
        switchEnd = 6;
      }
      if (count == 3) {
        for (int i = 0; i <= 8; i++) {
          listOfCount[i] = '';
        }
        if (x == "X") {
          scoreX++;
        } else {
          scoreO++;
        }
      }
    }
  }

  void calcColumnScore(
    String x,
  ) {
    for (int i = 0; i < 3; i++) {
      if (listOfCount[i] == x &&
          listOfCount[i + 3] == x &&
          listOfCount[i + 6] == x) {
        for (int i = 0; i <= 8; i++) {
          listOfCount[i] = '';
        }
        if (x == "X") {
          scoreX++;
        } else {
          scoreO++;
        }
      }
    }
  }
}
