import 'package:flutter/material.dart';
import 'package:riders_ui/add_rider.dart';
import 'package:riders_ui/widgets/custom_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Riders',
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) => Dismissible(
                key: Key("Riders $index"),
                onDismissed: (DismissDirection direction) {
                  if (direction == DismissDirection.startToEnd) {
                    print("Approve");
                  } else {
                    print('disapprove');
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    width: double.infinity,
                    decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                    child: Text(
                      'Riders  $index',
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: CustomButton(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const AddRider()));
        },
        title: 'Add',
      ),
    );
  }
}
