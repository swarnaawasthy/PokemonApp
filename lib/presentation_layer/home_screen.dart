import 'package:flutter/material.dart';
import 'package:pokemon/application_layer/home_controller.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return SafeArea(
            child: Scaffold(
          appBar: AppBar(
            title: const Text("Pokemon"),
          ),
          body: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: List.generate(controller.characters.length, (index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.teal[100],
                ),
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Text(
                      controller.characters[index].name ?? '',
                      style: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w500),
                      
                    ),


                    /*const SizedBox(height: 10),
                    const Image(image: NetworkImage("https://assets.pokemon.com/assets/cms2/img/pokedex/detail/043.png"),
                    height: 100,width: 100,),
*/
                  ],
                ),
              );
            }),
          ),
        ));
      },
    );
  }
}
