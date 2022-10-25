import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_app/shared/components/custom_card.dart';

class NewsBody extends StatelessWidget {
  const NewsBody({Key? key, required this.list}) : super(key: key);
  final List<Map<String, dynamic>> list;

  @override
  Widget build(BuildContext context) {
    return list.isEmpty
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: 10,
            separatorBuilder: (context, inex) => const Divider(
              height: 1,
            ),
            itemBuilder: (context, index) => CustomCard(dataList: list[index]),
          );
  }
}
