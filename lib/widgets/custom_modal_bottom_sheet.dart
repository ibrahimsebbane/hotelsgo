import 'package:flutter/material.dart';

class CustomModalBottomSheet extends StatefulWidget {
  const CustomModalBottomSheet({super.key});

  @override
  State<CustomModalBottomSheet> createState() => _CustomModalBottomSheetState();
}

class _CustomModalBottomSheetState extends State<CustomModalBottomSheet> {
  double price = 20;
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
                              .copyWith(decoration: TextDecoration.underline, fontWeight: FontWeight.w900, color: Colors.grey)),
                    ),
                    Text("Filters", style: Theme.of(context).textTheme.bodyLarge),
                    TextButton(
                      child: const Icon(Icons.close, color: Colors.grey),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Column(children: [
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
                              ]),
                    ],
                  )
                ]),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Slider(
                    thumbColor: Colors.white,
                    activeColor: Theme.of(context).colorScheme.secondary,
                    inactiveColor: Colors.grey[200],
                    value: price,
                    divisions: 100,
                    onChanged: (newPrice) {
                      setState(() {
                        price = newPrice;
                        selectedPrice = double.parse(newPrice.toStringAsFixed(2));
                      });
                    },
                    max: priceLimit,
                    min: 20,
                    label: "${price.toStringAsFixed(2)}",
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("20"),
                        Text("$selectedPrice"),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
