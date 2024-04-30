import 'package:flutter/material.dart';
import 'package:mostshary/controller/shared/dio_helper.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    DioHelper.init();

    return Scaffold(
      body: Center(
        child: IconButton(
            onPressed: () async {
              final data = await DioHelper.requestData(
                  messges: "is there any trips taking off from Paris?");
              print(data.data["response"]);
            },
            icon: Icon(Icons.ac_unit)),
      ),
    );
  }
}
