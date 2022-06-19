import 'package:flutter/material.dart';
import 'package:mikhuy/models/models.dart';
import 'package:mikhuy/theme/theme.dart';

class SellerProductList extends StatelessWidget {
  final List<Product> list;
  const SellerProductList(this.list, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 1 / 1.4,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: list.length,
      itemBuilder: (BuildContext ctxt, int index) {
        return Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.orangeTango.shade100,
            borderRadius: BorderRadius.circular(15),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(list[index].image_url),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              Column(
                children: [
                  Text(
                    list[index].name,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(
                    list[index].description,
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    textAlign: TextAlign.center,
                    maxLines: 3,
                  ),
                ],
              ),
              Chip(
                label: Text('Precio: ${list[index].price.toString()}bs.'),
                backgroundColor: AppColors.white,
              )
            ],
          ),
        );
      },
    );
  }
}
