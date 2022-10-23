import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/product_model.dart';
import 'package:flutter_ecommerce/pages/product_page.dart';
import 'package:flutter_ecommerce/theme.dart';

class ProductTileArrivals extends StatelessWidget {
  const ProductTileArrivals({Key? key, required this.productTile})
      : super(key: key);
  final ProductModel productTile;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, '/product');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductPage(product: productTile),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          bottom: defaultMargin,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                productTile.galleries?[0].url ?? '',
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productTile.category?.name ?? '',
                    style: subtitleTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    productTile.name ?? '',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    '\$${productTile.price ?? ''}',
                    style: priceTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
