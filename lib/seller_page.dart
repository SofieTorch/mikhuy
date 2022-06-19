

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mikhuy/models/models.dart';
import 'package:mikhuy/models/product.dart';

class SellerPage extends StatelessWidget {
  Seller _seller;
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
      body: FutureBuilder(
            future: productsRef.get(),
            builder: (_, AsyncSnapshot<QuerySnapshot<Product>> snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text('Ocurrio un error inesperado :('),
                );
              }

              if (snapshot.hasData) {
                final sellers = snapshot.data!.docs.map((e) => e.data()).toList();
                return ListProducts(sellers);
              }

              return const Center(child: CircularProgressIndicator());
            },
          )
    );
  }
  
}

class ListProducts extends StatelessWidget {
  final List<Product> list;
  const ListProducts(this.list, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 1.4 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
      itemCount: list.length,
      itemBuilder: (BuildContext ctxt, int index) {
        return Container(
          decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15)),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              Container(
                height: 100.0,
                width: 100.0,
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(list[index].image_url),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              
              ListTile(
                title: new Center( child: Text(list[index].name),),
                subtitle: Text(
                  list[index].description,
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  textAlign: TextAlign.center,
                  maxLines: 3,
                ),
              ),

              Chip(label: Text('Precio: '+ list[index].price.toString() + ' bs'))
            ],
          ),
        );
      },
    );
  }
}