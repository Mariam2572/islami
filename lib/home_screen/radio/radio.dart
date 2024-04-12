// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/Api/api_manager.dart';
import 'package:islami/home_screen/radio/cubit/radio_cubit.dart';
import 'package:islami/home_screen/radio/cubit/states.dart';
import 'package:islami/home_screen/radio/radio_item.dart';
import 'package:islami/model/radio_response.dart';
import 'package:islami/theme.dart';

class RadioTab extends StatefulWidget {
  
  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
@override

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => RadioCubit()..getRadio(),
    child: BlocBuilder<RadioCubit,RadioState>(
     
      builder: (context, state){
 if (state is RadioLoadingState) {
    return Center(
          child: CircularProgressIndicator(
            color: MyTheme.primaryLightMode,
          ),
        );
          } else if (state is RadioErrorState) {
            return Center(
              child: Text(state.errorMessage),
            );
          }
          else if(state is RadioSuccessState){
                return  
       Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Image.asset('assets/images/radio_image.png')),
          Expanded(
            flex: 2,
            child: RadioItem(),
          ) ,
          
       ],
      ),
    );
       
          }
    return Container();  
    },
    ),
    );
    
   
      
    // FutureBuilder(future: ApiManager.getRadio(),
    //  builder: (context, snapshot) {
    //    if (snapshot.connectionState == ConnectionState.waiting) {
    //     return Center(
    //       child: CircularProgressIndicator(
    //         color: MyTheme.primaryLightMode,
    //       ),
    //     );
      
    //    }else if (snapshot.hasError){
    //     return Center(
    //       child: Text('Something went wrong'),
    //     );
    //    }
    //    var radioResponse = snapshot.data as RadioResponse;
    //    List<Radios> radios = radioResponse.radios ?? [];
    //    return  
    //    Scaffold(
    //   body: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Expanded(
    //         flex: 2,
    //         child: Image.asset('assets/images/radio_image.png')),
    //       Expanded(
    //         flex: 2,
    //         child:ListView.builder(
    //         scrollDirection: Axis.horizontal,
    //         physics: PageScrollPhysics(),
    //         itemCount: radios.length,
    //         itemBuilder: (context, index)=> RadioItem(radios: radios[index],),
    //       ) ,
    //       )
    //    ],
    //   ),
    // );
  
    //  },);
   
   }
}
