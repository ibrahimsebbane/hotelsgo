import 'package:flutter/material.dart';

class HotelCard extends StatelessWidget {
  final String label;
  final String review;
  final String link;
  final String address;
  final int stars;
  final double reviewScore;
  final double price;
  final bool isLowestPrice;

  const HotelCard({
    required this.isLowestPrice,
    required this.label,
    required this.reviewScore,
    required this.price,
    required this.stars,
    required this.link,
    required this.review,
    required this.address,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).colorScheme.primary;
    Color secondaryColor = Theme.of(context).colorScheme.secondary;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          height: deviceHeight * .5,
          child: Card(
            elevation: 10,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: GridTile(
              footer: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(
                      height: 110,
                      child: GridTileBar(
                        backgroundColor: Colors.white,
                        title: Row(
                          children: [
                            for (int i = 0; i < stars; i++) const Icon(Icons.star, color: Colors.grey),
                            const SizedBox(width: 5),
                            Text(
                              'Hotel',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                label,
                                textAlign: TextAlign.left,
                                style: Theme.of(context).textTheme.titleLarge,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Row(
                                children: [
                                  Chip(
                                    label: Text(reviewScore.toString()),
                                    backgroundColor: primaryColor,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(review, style: Theme.of(context).textTheme.bodyMedium),
                                  const SizedBox(width: 5),
                                  const Icon(Icons.place, color: Colors.black),
                                  Expanded(
                                      child: Text(address, overflow: TextOverflow.ellipsis, softWrap: true, style: Theme.of(context).textTheme.bodyMedium)),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100, // Todo: avoid using width
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.black)),
                        child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(5),
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (isLowestPrice)
                                      Container(
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: secondaryColor.withAlpha(50)),
                                        child: Text("Our lowest price", style: Theme.of(context).textTheme.titleMedium),
                                      ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 2),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text.rich(
                                            TextSpan(children: [
                                              TextSpan(
                                                  text: "\$",
                                                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: primaryColor, fontWeight: FontWeight.w900)),
                                              TextSpan(
                                                text: price.toStringAsFixed(0),
                                                style: TextStyle(color: primaryColor, fontSize: 25, fontWeight: FontWeight.w900),
                                              )
                                            ]),
                                          ),
                                          Text(label.split(" ")[0], style: const TextStyle(color: Colors.black))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: Row(
                                        children: [
                                          Text("View Deal", style: Theme.of(context).textTheme.titleLarge),
                                          const Icon(
                                            Icons.keyboard_arrow_right,
                                            size: 30,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {},
                          child: const Text("More prices",
                              style: TextStyle(color: Colors.grey, decoration: TextDecoration.underline, fontWeight: FontWeight.bold))),
                    ),
                  ],
                ),
              ),
              child: GestureDetector(
                onTap: () {},
                child: Hero(
                  tag: 1,
                  child: FadeInImage(
                    // placeholder: AssetImage('assets/images/store-placeholder.png'),
                    placeholder: const AssetImage('assets/images/hotel.png'),
                    image: NetworkImage(link),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
            right: 20,
            top: 20,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(), padding: const EdgeInsets.all(10), backgroundColor: Colors.black26, shadowColor: Colors.transparent),
                onPressed: () {},
                child: const Icon(
                  Icons.favorite_outline,
                  size: 30,
                ))),
      ],
    );
  }
}
