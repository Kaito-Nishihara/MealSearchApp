import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mealsearchapp/model/grid_image_data.dart';

class SearchPeople extends StatefulWidget {
  const SearchPeople({Key? key}) : super(key: key);

  @override
  State<SearchPeople> createState() => _SearchPeople();
}

class _SearchPeople extends State<SearchPeople> {
  List<GridImageData> imageList = [
    GridImageData(
        name: '1人',
        id: '1',
        icon: const Icon(
          Icons.person,
          size: 60.0,
        )),
    GridImageData(
        name: '2人',
        id: '2',
        icon: const Icon(
          Icons.people,
          size: 60.0,
        )),
    GridImageData(
        name: '3人',
        id: '3',
        icon: const Icon(
          Icons.groups,
          size: 60.0,
        )),
    GridImageData(
        name: '4人以上',
        id: '4',
        icon: const Icon(
          Icons.groups,
          size: 60.0,
        )),
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(20), //4辺すべて同じ値の余白
      itemCount: imageList.length, //要素の数　表示するデータ数の最大値（texts　listの最大値）
      // GridViewを設定する引数を指定
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 30, //ボックス左右間のスペース
        mainAxisSpacing: 30, //ボックス上下間のスペース
        crossAxisCount: 2, //ボックスを横に並べる数
      ),
      //指定した要素の数分を生成
      itemBuilder: (context, index) {
        return Container(
            padding: const EdgeInsets.all(20.0),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 218, 215, 215),
                border: Border(),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: GridTile(
                child: imageList[index].icon,
                footer: Center(
                  child: Text(
                    imageList[index].name,
                  ),
                )));
      },
    );
  }
}
