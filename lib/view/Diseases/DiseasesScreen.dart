import 'package:app_final/core/resource/navigator.dart';
import 'package:app_final/core/style/my_colors.dart';
import 'package:app_final/core/style/my_style.dart';
import 'package:app_final/network/models/DiseasesModel.dart';
import 'package:app_final/view/Diseases/cubit/States.dart';
import 'package:app_final/view/Diseases/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'details.dart';

class DiseasesScreen extends StatefulWidget {
  const DiseasesScreen({Key? key, required this.Diseases}) : super(key: key);
  final String Diseases;

  @override
  State<DiseasesScreen> createState() => _DiseasesScreenState();
}

class _DiseasesScreenState extends State<DiseasesScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DiseasesCubit()..getHasDiseases(widget.Diseases),
      child: BlocConsumer<DiseasesCubit, DiseasesStates>(
        listener: (context, state) {
          print(state);

          // TODO: implement listener
        },
        builder: (context, state) {
          List<HasDiseasesModel> diseasesModel =
              DiseasesCubit.get(context)!.diseasesModel;

          return Scaffold(
            appBar: AppBar(
              title: Text("Diseases"),
            ),
            body: state is DiseasesLoadingtState ||
                    state is GetPhotoDiseasesLoadingtState
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Diseases in your crop:",
                              style: labelStyle2,
                            ),
                            // if (state is DiseasesSuccessState)

                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: diseasesModel.length,
                              itemBuilder: (context, index) {
                                return DiseasesContainer(context,
                                    title: diseasesModel[index]
                                        .diseases!
                                        .name
                                        .toString(),
                                    image: diseasesModel[index].photo!.photo ==
                                            null
                                        ? "https://images.pexels.com/photos/2033343/pexels-photo-2033343.jpeg?dpr=1"
                                        : diseasesModel[index]
                                            .photo!
                                            .photo
                                            .toString(),
                                    data: "${diseasesModel[index].photo!.date}"
                                        ,

                                    ontap: () {

                                  navigateTo(
                                      context,
                                      DetailsScreen(
                                        photo: diseasesModel[index]
                                            .photo!
                                            .photo
                                            .toString(),
                                        sugestedTreatment: diseasesModel[index]
                                            .diseases!
                                            .description
                                            .toString(),
                                        description: diseasesModel[index]
                                            .diseases!
                                            .sugestedTreatment
                                            .toString(),
                                        name: diseasesModel[index]
                                            .diseases!
                                            .name
                                            .toString(),
                                      ));
                                });
                              },
                            )
                          ]),
                    ),
                  ),
          );
        },
      ),
    );
  }
}

Widget DiseasesContainer(
  context, {
  required String title,
  required String image,
  required String data,
  required Function()? ontap,
}) {
  // String formattedDate = DateFormat('yyyy-MM-dd').format(data as DateTime );
  return Container(
    height: 140,
    margin: const EdgeInsets.symmetric(vertical: 7),
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      border: Border.all(color: AppColor.greenDark, width: 2),
      borderRadius: BorderRadius.all(Radius.circular(15)),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Image.network(
            image,
            fit: BoxFit.cover,
            width: 160,
            height: 96,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              title,
              style: grayText.apply(color: AppColor.greenDark),
            ),
            SizedBox(
              width: 150,
              child: Text(
                data,
                style: hintStyle2,
              ),
            ),
            InkWell(
              onTap: ontap,
              child: Container(
                height: 34,
                width: 170,
                decoration: BoxDecoration(
                  color: AppColor.greenDark,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Read More",
                        style: hintStylegreen.apply(color: AppColor.white),
                      ),
                      Container(
                        height: 22,
                        width: 25,
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Icon(Icons.navigate_next_outlined,
                            color: AppColor.greenDark),
                      )
                    ]),
              ),
            )
          ],
        )
      ]),
    ),
  );
}
