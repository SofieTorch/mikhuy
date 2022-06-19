import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mikhuy/models/models.dart';
import 'package:mikhuy/seller_product_list.dart';

class SellerPage extends StatelessWidget {
  final Seller _seller;
  SellerPage(this._seller, {Key? key}) : super(key: key);

  final sellersRef =
      FirebaseFirestore.instance.collection('seller').withConverter<Seller>(
            fromFirestore: (snapshots, _) => Seller.fromJson(
              snapshots.data()!,
              snapshots.id,
            ),
            toFirestore: (seller, _) => seller.toJson(),
          );

  @override
  Widget build(BuildContext context) {
    final productsRef =
        sellersRef.doc(_seller.id).collection('product').withConverter<Product>(
              fromFirestore: (snapshots, _) => Product.fromJson(
                snapshots.data()!,
                snapshots.id,
              ),
              toFirestore: (product, _) => product.toJson(),
            );

    return Scaffold(
      appBar: AppBar(
        title: Text(_seller.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Local'),
            Text(
              _seller.name,
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(height: 6),
            Text(
              _seller.address,
              style: Theme.of(context).textTheme.subtitle2,
            ),
            const SizedBox(height: 16),
            Text(
              'Ahora disponible:',
              style: Theme.of(context).textTheme.headline3,
            ),
            const SizedBox(height: 8),
            FutureBuilder(
              future: productsRef.get(),
              builder: (_, AsyncSnapshot<QuerySnapshot<Product>> snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                    child: Text('Ocurrio un error inesperado :('),
                  );
                }

                if (snapshot.hasData) {
                  final products =
                      snapshot.data!.docs.map((e) => e.data()).toList();
                  return SellerProductList(products);
                }

                return const Center(child: CircularProgressIndicator());
              },
            ),
          ],
        ),
      ),
    );
  }
}
