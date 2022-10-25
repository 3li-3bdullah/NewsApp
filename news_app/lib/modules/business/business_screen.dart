import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/news_cubit.dart';
import 'package:news_app/shared/components/custom_card.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsState>(
      listener: (context,state){},
      builder: (context,state){
        List<Map<String, dynamic>> list = NewsCubit.get(context).business;
       return state is NewsGetBusinessLoadingState ? 
       const Center(child: CircularProgressIndicator(),) :
       ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount:  10,
        separatorBuilder: (context,inex) => const Divider(height: 1,),
        itemBuilder: (context,index) => CustomCard(dataList: list[index]),
        ) ;
      },
      );
  }
}
