import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:riders_ui/add_rider.dart';
import 'package:riders_ui/cubit/add_new_rider_cubit/add_new_rider_cubit.dart';
import 'package:riders_ui/cubit/rider_cubit/rider_cubit.dart';
import 'package:riders_ui/view_rider.dart';
import 'package:riders_ui/widgets/custom_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RiderCubit, RiderState>(builder: (context, state) {
        return Padding(
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
                itemCount: state.riders == null ? 0 : state.riders!.length,
                itemBuilder: (context, index) => Dismissible(
                  key: Key(state.riders![index].nameController!.text),
                  onDismissed: (DismissDirection direction) {
                    if (direction == DismissDirection.startToEnd) {
                      Fluttertoast.showToast(msg: 'Approved');
                    } else {
                      context
                          .read<RiderCubit>()
                          .deleteRider(state.riders![index]);
                      Fluttertoast.showToast(msg: 'Disapproved');
                    }
                   },
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewRider(
                                    user: state.riders![index],
                                    onTapReject: () {
                                      context
                                          .read<RiderCubit>()
                                          .deleteRider(state.riders![index]);
                                    },
                                  )));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey)),
                        child: Text(
                          state.riders![index].nameController!.text,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
      floatingActionButton: CustomButton(
        onTap: () {
          context.read<AddNewRiderCubit>().emit(AddNewRiderState.initial());
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddRider()));
        },
        title: 'Add',
      ),
    );
  }
}
