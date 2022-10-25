import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, required this.dataList}) : super(key: key);
  final Map<String, dynamic> dataList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Container(
            height: 130,
            width: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(image: NetworkImage('${dataList['urlToImage']}')),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: SizedBox(
              height: 130,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${dataList['title']}',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                 Text('${dataList['publishedAt']}',style: const TextStyle(color: Colors.grey),),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}