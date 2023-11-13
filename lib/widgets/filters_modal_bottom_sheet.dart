import 'package:flutter/material.dart';

class FiltersModalBottomSheet extends StatefulWidget {
  const FiltersModalBottomSheet({super.key});

  @override
  State<FiltersModalBottomSheet> createState() => _FiltersModalBottomSheetState();
}

class _FiltersModalBottomSheetState extends State<FiltersModalBottomSheet> {
  double priceLimit = 540;
  double selectedPrice = 540;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(100), topRight: Radius.circular(100)), color: Colors.white),
        child: Column(
          children: [
            Container(
                height: 50,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 20,
                      spreadRadius: 1,
                      offset: Offset(-3, 0.1),
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: null,
                      child: Text("Reset",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(decoration: TextDecoration.underline, fontWeight: FontWeight.w400, color: Colors.grey)),
                    ),
                    Text("Filters", style: Theme.of(context).textTheme.bodyLarge),
                    TextButton(
                      child: const Icon(Icons.close, color: Colors.grey),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("PRICE PER NIGHT", style: Theme.of(context).textTheme.bodyLarge),
                          PopupMenuButton(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                              ),
                              child: Text("$priceLimit+ \$"),
                            ),
                            onSelected: (String value) async {
                              setState(() {
                                if (selectedPrice > double.parse(value)) {
                                  selectedPrice = double.parse(value);
                                }
                              });
                              setState(() {
                                priceLimit = double.parse(value);
                              });
                            },
                            itemBuilder: (BuildContext context) => const <PopupMenuEntry<String>>[
                              PopupMenuItem<String>(
                                value: '20',
                                child: Text('20 \$'),
                              ),
                              PopupMenuItem<String>(
                                value: '100',
                                child: Text('100+ \$'),
                              ),
                              PopupMenuItem<String>(
                                value: '220',
                                child: Text('220+ \$'),
                              ),
                              PopupMenuItem<String>(
                                value: '340',
                                child: Text('340+ \$'),
                              ),
                              PopupMenuItem<String>(
                                value: '460',
                                child: Text('460+ \$'),
                              ),
                              PopupMenuItem<String>(
                                value: '520',
                                child: Text('520+ \$'),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Slider(
                        thumbColor: Colors.white,
                        activeColor: Theme.of(context).colorScheme.secondary,
                        inactiveColor: Colors.grey[200],
                        value: selectedPrice,
                        divisions: 100,
                        onChanged: (newPrice) {
                          setState(() {
                            selectedPrice = double.parse(newPrice.toStringAsFixed(2));
                          });
                        },
                        max: priceLimit,
                        min: 20,
                        label: selectedPrice.toStringAsFixed(2),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("20"),
                            Text("$selectedPrice"),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const TitleText(text: "RATING"),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RatingContainer(color: Colors.redAccent[700]!, text: "0+"),
                          RatingContainer(color: Colors.amber[700]!, text: "7+"),
                          RatingContainer(color: Colors.green[300]!, text: "7.5+"),
                          RatingContainer(color: Colors.green[700]!, text: "8+"),
                          RatingContainer(color: Colors.green[900]!, text: "8.5+"),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const TitleText(text: "HOTEL CLASS"),
                      const SizedBox(height: 20),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          HotelClassContainer(classNumber: 1),
                          HotelClassContainer(classNumber: 2),
                          HotelClassContainer(classNumber: 3),
                          HotelClassContainer(classNumber: 4),
                          HotelClassContainer(classNumber: 5),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const TitleText(text: "DISTANCE FROM"),
                      const SizedBox(height: 10),
                      const Divider(thickness: 1),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Location",
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.normal),
                          ),
                          Row(
                            children: [
                              Text(
                                "City center",
                                style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.normal),
                              ),
                              const SizedBox(width: 5),
                              const Icon(Icons.keyboard_arrow_right_sharp)
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
            Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 20,
                      spreadRadius: 1,
                      offset: Offset(3, -1),
                    )
                  ],
                ),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                height: 70,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      fixedSize: const Size(200, 40),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Center(child: Text("Show results", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white)))))
          ],
        ));
  }
}

class TitleText extends StatelessWidget {
  final String text;
  const TitleText({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.bodyLarge);
  }
}

class RatingContainer extends StatelessWidget {
  final Color color;
  final String text;
  const RatingContainer({
    required this.color,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.all(5),
      child: Center(child: Text(text, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18))),
    );
  }
}

class HotelClassContainer extends StatelessWidget {
  final int classNumber;
  const HotelClassContainer({
    required this.classNumber,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.amber)),
        padding: const EdgeInsets.all(5),
        child: Center(
          child: classNumber < 2
              ? const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.star_outline, color: Colors.amber, size: 12),
                    Icon(Icons.star, color: Colors.amber, size: 12),
                  ],
                )
              : classNumber == 2
                  ? const Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                      Icon(Icons.star, color: Colors.amber, size: 12),
                      Icon(Icons.star, color: Colors.amber, size: 12),
                    ])
                  : classNumber == 3
                      ? const Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.star, color: Colors.amber, size: 12),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(Icons.star, color: Colors.amber, size: 12),
                                Icon(Icons.star, color: Colors.amber, size: 12),
                              ],
                            )
                          ],
                        )
                      : classNumber == 4
                          ? const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                                  Icon(Icons.star, color: Colors.amber, size: 12),
                                  Icon(Icons.star, color: Colors.amber, size: 12),
                                ]),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(Icons.star, color: Colors.amber, size: 12),
                                    Icon(Icons.star, color: Colors.amber, size: 12),
                                  ],
                                )
                              ],
                            )
                          : const Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(Icons.star, color: Colors.amber, size: 12),
                                    Icon(Icons.star, color: Colors.amber, size: 12),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.star, color: Colors.amber, size: 12),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(Icons.star, color: Colors.amber, size: 12),
                                    Icon(Icons.star, color: Colors.amber, size: 12),
                                  ],
                                ),
                              ],
                            ),
        ),
      ),
    );
  }
}
