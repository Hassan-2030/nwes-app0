
import 'package:flutter/material.dart';
import 'package:news0/shared/network/remote/api_manger.dart';

import '../models/SourceResponce.dart';



class HomeScreen extends StatelessWidget {
static const String routName='home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: FutureBuilder<SourceResponce>(
        future: ApiManger.getSources(),
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          if(snapshot.hasError){
            return Center(
                child:Column(
                  children: [
                    Text('Something went wrong '),
                    TextButton(onPressed: (){},
                        child: Text('try Again'))
                  ],
                ));
          }
          if(snapshot.data?.status!='ok'){
            return Column(
              children: [
                Text(snapshot.data?.message??'Error'),
                TextButton(onPressed: (){},
                    child: Text('try Again'))
              ],
            );

          }
          var sources =snapshot.data?.sources??=[];
         return ListView.builder(itemBuilder: (context,index){
           return Text(sources?[index].name??" ");
         },itemCount: sources?.length,

         );
        },
      ),
    );
  }
}
