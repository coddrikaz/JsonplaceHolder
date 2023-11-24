import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Controller/HomeController.dart';
import 'Model/Model.dart';

final HomeController controller = Get.put(HomeController());
// final controller = Get.find<HomeController>();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<UserModel> userList = controller.userList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("SHOP FUNC w FETCH PRODUCT"),
        backgroundColor: Colors.orange,
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                shrinkWrap: true,
                reverse: true,
                children: List.generate(
                  20,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        // color: Colors.red,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                userList[index].thumbnailUrl.toString()),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        child:GridTile(
                          header: Container(
                            padding: EdgeInsets.symmetric(horizontal: 17, vertical: 12),
                            child: Text(userList[index].thumbnailUrl.toString()),
                          ),
                          footer:Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              height: 60,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                 Text(
                                      userList[index].title.toString(),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey,
                                      ),
                                    ),

                                  const SizedBox(height: 5),

                                ],
                              ),
                            ),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE5E6E8),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.network(
                              userList[index].thumbnailUrl.toString(),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }


}
