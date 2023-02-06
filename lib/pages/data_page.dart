import 'package:flutter/material.dart';
import 'package:flutter_dev_assignment/model/donut_model.dart';
import 'package:flutter_dev_assignment/provider/providers.dart';
import 'package:flutter_dev_assignment/widgets/custom_container.dart';
import 'package:flutter_dev_assignment/widgets/error_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DataPage extends ConsumerWidget {
  const DataPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final donutListProvider = ref.watch(donutProvider);
    final donutList = donutListProvider.getDonutRequested();
    final imgList = [
      'https://img.taste.com.au/f0YNQK61/taste/2016/11/donut-cake-70028-1.jpeg',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIBHxVoy85TZvTLpekKG-s4RkyORkJYIcvVECuPABBgzkklVM31tOgKAtr7WuoPumjPCQ&usqp=CAU',
      'https://images.heb.com/is/image/HEBGrocery/003334251?fit=constrain,1&wid=800&hei=800&fmt=jpg&qlt=85,0&resMode=sharp2&op_usm=1.75,0.3,2,0'
    ];
    return Scaffold(
        body: SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: FutureBuilder<List<DonutItem>>(
        future: donutList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // final error = snapshot.error;
            // print(error.toString());
            return const ErrorPage();
          } else if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return const ErrorDataPage();
            }
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                final donut = snapshot.data![index];
                return CustomConatiner(item: donut, src: imgList[index]);
              },
            );
          }
          return Container();
        },
      ),
    ));
  }
}
