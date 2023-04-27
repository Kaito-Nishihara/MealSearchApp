import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mealsearchapp/model/grid_image_data.dart';

class SearchCost extends StatefulWidget {
  const SearchCost({Key? key}) : super(key: key);

  @override
  State<SearchCost> createState() => _SearchCost();
}

class _SearchCost extends State<SearchCost> {
  List<String> imageList = ["1,000円", "2,000円", "3,000円", "4,000円以上"];
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
            child: Text(imageList[index]),
          ),
        );
      },
    );
  }
}
