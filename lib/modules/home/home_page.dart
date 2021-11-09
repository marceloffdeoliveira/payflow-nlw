import 'package:flutter/material.dart';
import 'package:payflow/modules/home/home_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final homeController = HomeController();

  final pages = [
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.blue,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
      child: Container(
        height:152,
        color: AppColors.primary,
        child: Center(
          child: ListTile(
            title: Text.rich(
              TextSpan(
                text: "Olá, ",
                style: TextStyles.titleRegular,
              children: [
                TextSpan(text: "Marcelo", style: TextStyles.titleBoldBackground)
              ] 
              ),
            ),
            subtitle: Text("Mantenha suas contas em dia", style: TextStyles.captionShape),
            trailing: Container(
              height:48,
              width:48,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(5)
              )
            ),
          ),
        )
      ), 
      preferredSize: const Size.fromHeight(152)
    ),
    body: pages[homeController.currentPage],
    bottomNavigationBar: SizedBox(
      height:90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: (){
              homeController.setPage(0);
              setState(() {
                
              });
            }, 
            icon: const Icon(Icons.home),
            color: AppColors.primary,
          ),
          GestureDetector(
            onTap: (){
              print("clicou");
            },
            child: Container(
              height:56,
              width: 56,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Icon(
                Icons.add_box_outlined,
                color: AppColors.background,
              )
            ),
          ),
          IconButton(
            onPressed: (){
              homeController.setPage(1);
              setState(() {
                
              });
            }, 
            icon: const Icon(Icons.description_outlined),
            color: AppColors.body,
          )
        ],
      )
    ),
    );
  }
}