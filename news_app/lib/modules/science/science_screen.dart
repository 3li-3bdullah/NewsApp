import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/news_cubit.dart';
import 'package:news_app/shared/components/news_body.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return BlocConsumer<NewsCubit,NewsState>(
      listener: (context,state){},
      builder: (context,state){
        List<Map<String, dynamic>> list = NewsCubit.get(context).science;
      return NewsBody(list: list);
      },
      );
  }
}