import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvcmvvmstructure/data/response/status.dart';
import 'package:mvcmvvmstructure/resources/components/internet_exception_widget.dart';
import 'package:mvcmvvmstructure/resources/components/rounded_button.dart';
import 'package:mvcmvvmstructure/resources/routes/routes_name.dart';
import 'package:mvcmvvmstructure/view_model/controller/user_preferences/user_preferences_view_model.dart';

import '../../view_model/controller/home/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeController = Get.put(HomeController());
  UserPreferences userPreferences = UserPreferences();

  @override
  void initState() {
    super.initState();
    homeController.userListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'.tr),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                UserPreferences()
                    .removeUser()
                    .then((value) => Get.toNamed(RoutesName.loginScreen));
              },
              icon: const Icon(Icons.logout))
        ],
        automaticallyImplyLeading: false,
      ),
      body: Obx(() {
        switch (homeController.rxRequestStatus.value) {
          case Status.LOADING:
            return const Center(child: CircularProgressIndicator());
          case Status.ERROR:
            if (homeController.error.value.toString() == 'No internet') {
              return InternetExceptionWidget(onPress: () {
                homeController.userRefreshApi();
              });
            }
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Something went Wrong'),
                RoundedButton(
                    title: 'Retry',
                    onPress: () {
                      homeController.userRefreshApi();
                    })
              ],
            ));
          case Status.COMPLETED:
            return ListView.builder(
              itemCount: homeController.userList.value.data?.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                      title: Text(homeController
                          .userList.value.data![index].firstName
                          .toString()),
                      subtitle: Text(homeController
                          .userList.value.data![index].email
                          .toString()),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(homeController
                            .userList.value.data![index].avatar
                            .toString()),
                      )),
                );
              },
            );
          default:
        }
        return const SizedBox();
      }),
    );
  }
}
