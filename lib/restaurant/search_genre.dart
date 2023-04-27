import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mealsearchapp/model/grid_data.dart';
import 'package:mealsearchapp/model/grid_image_data.dart';

class SearchGenre extends StatefulWidget {
  const SearchGenre({Key? key}) : super(key: key);

  @override
  State<SearchGenre> createState() => _SearchGenre();
}

class _SearchGenre extends State<SearchGenre> {
  List<GridData> imageList = [
    GridData(name: '居酒屋', id: 'G001'),
    GridData(name: '創作料理', id: 'G003'),
    GridData(name: '和食', id: 'G004'),
    GridData(name: '洋食', id: 'G005'),
    GridData(name: 'イタリアン', id: 'G006'),
    GridData(name: '中華', id: 'G007'),
    GridData(name: '焼肉', id: 'G008'),
    GridData(name: '韓国料理', id: 'G017'),
    GridData(name: '各国料理', id: 'G010'),
    GridData(name: 'カラオケ', id: 'G011'),
    GridData(name: 'お好み焼き', id: 'G016'),
    GridData(name: 'ラーメン', id: 'G013'),
    GridData(name: 'カフェ・スイーツ', id: 'G014'),
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
        crossAxisCount: 3, //ボックスを横に並べる数
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
            child: Text(imageList[index].name),
          ),
        );
      },
    );
  }
}
