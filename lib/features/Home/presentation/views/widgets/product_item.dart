import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, this.image, this.category, this.subCategory, this.brandName, this.ratingCounters, this.ratingAverage, this.price, this.quantity, this.soldNumber});
  final String? image;
  final String? category;
  final String? subCategory;
  final String? brandName;
  final String? ratingCounters;
  final String? ratingAverage;
  final String? price;
  final String? quantity;
  final String? soldNumber;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
       horizontal: 16,
      ),
      height: 120,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color(0x19202020),
            blurRadius: 17,
            offset: Offset(0, 4),
            spreadRadius: -3,
          )
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          image != null
              ? ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4),
                bottomLeft: Radius.circular(4)),
            child: CachedNetworkImage(
              imageUrl: image.toString(),
              placeholder: (context, url) => const Center(
                child: SizedBox(
                  height: 25,
                  width: 25,
                  child: CircularProgressIndicator(
                  ),
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width * .35,
              height: double.infinity,
            ),
          )
              : ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4),
                bottomLeft: Radius.circular(4)),
                child: CachedNetworkImage(
                            imageUrl: 'https://www.tiffincurry.ca/wp-content/uploads/2021/02/default-product.png',
                            placeholder: (context, url) => const Center(
                child: SizedBox(
                  height: 25,
                  width: 25,
                  child: CircularProgressIndicator(
                  ),
                ),
                            ),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width * .35,
                            height: double.infinity,
                          ),
              ),
          const SizedBox(
            width: 2,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category ?? 'not found',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black
                ),
              ),
              Text(
                subCategory ?? 'not found',
                style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                brandName ?? 'not found',
                style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black
                ),
              ),
              Text(
                '$price L.E    ($soldNumber sold)'
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.star_outlined,color: Colors.yellow,),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                    '$ratingAverage ($ratingCounters)'
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
