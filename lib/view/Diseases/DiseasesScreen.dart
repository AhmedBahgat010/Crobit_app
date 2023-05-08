
import 'package:app_final/core/resource/navigator.dart';
import 'package:app_final/core/style/my_colors.dart';
import 'package:app_final/core/style/my_style.dart';
import 'package:app_final/network/models/DiseasesModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Home/Home/cubit/States.dart';
import '../Home/Home/cubit/cubit.dart';
import 'details.dart';

class DiseasesScreen extends StatefulWidget {
  const DiseasesScreen({Key? key}) : super(key: key);

  @override
  State<DiseasesScreen> createState() => _DiseasesScreenState();
}

class _DiseasesScreenState extends State<DiseasesScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getHasDiseases(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          print(state);

          // TODO: implement listener
        },
        builder: (context, state) {
          List<HasDiseasesModel> diseasesModel =
              HomeCubit.get(context)!.diseasesModel;

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
                                return BlocProvider(
                                  create: (context) => HomeCubit()
                                    ..getPhotoDiseases(
                                        diseasesModel[index].photoId)
                                    ..getDescriptionDiseases(
                                        diseasesModel[index].diseasesID),
                                  child: BlocBuilder<HomeCubit, HomeStates>(
                                    builder: (context, state) {
                                      PhotoDiseasesModel? photoDiseasesModel =
                                          HomeCubit.get(context)!
                                              .photoDiseasesModel;
                                      DescriptionDiseasesModel?
                                          descriptionDiseasesModel =
                                          HomeCubit.get(context)!
                                              .descriptionDiseasesModel;

                                      return photoDiseasesModel == null ||
                                              descriptionDiseasesModel == null
                                          ? SizedBox()
                                          : DiseasesContainer(context,
                                              title: descriptionDiseasesModel
                                                  .name
                                                  .toString(),
                                              image: photoDiseasesModel == null
                                                  ? "https://images.pexels.com/photos/2033343/pexels-photo-2033343.jpeg?dpr=1"
                                                  : photoDiseasesModel.photo
                                                      .toString(),
                                              data: diseasesModel[index]
                                                  .date
                                                  .toString(), ontap: () {
                                              navigateTo(
                                                  context,
                                                  DetailsScreen(
                                                    photo: photoDiseasesModel
                                                        .photo
                                                        .toString(),
                                                    sugestedTreatment:
                                                        descriptionDiseasesModel
                                                            .description
                                                            .toString(),
                                                    description:
                                                        descriptionDiseasesModel
                                                            .sugestedTreatment
                                                            .toString(),
                                                    name:
                                                        descriptionDiseasesModel
                                                            .name
                                                            .toString(),
                                                  ));
                                            });
                                    },
                                  ),
                                );
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
            Text(
              data,
              style: hintStyle2,
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
