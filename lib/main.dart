import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



void main() {
  runApp( ProviderScope( child: RiverpordApp()));
}

 

final fruitNameProvider = StateProvider <String> ((ref)=> 'Unknown');

class RiverpordApp extends ConsumerWidget{
  Widget build(BuildContext context , WidgetRef ref){
    final fruitName = ref.watch(fruitNameProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    home: Scaffold(appBar: AppBar(title: Text('Riverpord App - $fruitName'),),
    body: Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      fruitButton( fruit: 'Banana'),
        fruitButton( fruit: 'orange'),
          fruitButton( fruit: 'grape'),
            fruitButton( fruit: 'Apple')
    ],),),
    
    ),
    );
    
  }
}


class fruitButton extends ConsumerWidget{
  final String fruit;
  fruitButton({required this.fruit});
  Widget build(BuildContext context , WidgetRef ref){
    return ElevatedButton(onPressed: (){
      ref.read(fruitNameProvider.notifier).state = fruit;
    },
    
     child: Text(fruit));
  }

}