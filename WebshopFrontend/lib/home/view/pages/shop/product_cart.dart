import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterfrontend/home/view/pages/shop/product_summary.dart';

import '../../../../constats.dart';

class ProductCard extends StatelessWidget {
  final ProductSummary product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/cart', arguments: product);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 345,
            width:  275,
            child: CachedNetworkImage(imageUrl: apiPathPicture + product.id +'/image1.png',
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
              fit: BoxFit.cover,),
          ),
          SizedBox(height: 5,),
          Container(
            width: 275,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(product.name),
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Text('€ ' + '/Price/', style: TextStyle(fontWeight: FontWeight.bold),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}