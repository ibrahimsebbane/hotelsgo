import 'package:flutter/material.dart';
import 'package:hotelsgo/widgets/custom_modal_bottom_sheet.dart';
import 'package:hotelsgo/widgets/hotel_card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<dynamic> getData() async {
    final response = await http.get(Uri.parse("https://www.hotelsgo.co/test/hotels"));
    final responseData = json.decode(response.body);
    return responseData;
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            GestureDetector(
              onTap: () => showModalBottomSheet<void>(context: context, builder: (BuildContext context) => const CustomModalBottomSheet()),
              child: Row(children: [
                Image.asset("assets/images/parameters.png", height: 25, width: 25, color: Colors.cyan[900]),
                const SizedBox(width: 5),
                Text("Filters", style: textTheme.titleMedium!.copyWith(color: Colors.cyan[900]))
              ]),
            ),
            GestureDetector(
              child: Row(children: [
                Image.asset("assets/images/sort.png", height: 25, width: 25, color: Colors.cyan[900]),
                const SizedBox(width: 5),
                Text("Sort", style: textTheme.titleMedium!.copyWith(color: Colors.cyan[900]))
              ]),
            )
          ])),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  boxShadow: const [BoxShadow(blurRadius: 10, offset: Offset(-1, -1), color: Colors.black26)]),
              child: Image.asset("assets/images/maps.png", height: 60, width: 150, fit: BoxFit.fill),
            ),
            Positioned(
              bottom: 10,
              right: 40,
              child: Chip(
                label: const Text("Map", style: TextStyle(color: Colors.white)),
                backgroundColor: Theme.of(context).colorScheme.secondary.withAlpha(200),
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
          child: FutureBuilder(
              future: getData(),
              builder: (ctx, dataSnapshot) {
                if (dataSnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (dataSnapshot.error != null) {
                  return Center(child: Text("Error loading data", style: textTheme.titleSmall));
                }
                return Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      itemCount: dataSnapshot.data.length,
                      itemBuilder: (context, index) => Column(
                        children: [
                          HotelCard(
                            isLowestPrice: index == 0 ? true : false,
                            stars: dataSnapshot.data[index]['starts'],
                            label: dataSnapshot.data[index]['name'],
                            price: double.parse(dataSnapshot.data[index]['price'].toString()),
                            reviewScore: double.parse(dataSnapshot.data[index]['review_score'].toString()),
                            review: dataSnapshot.data[index]['review'],
                            address: dataSnapshot.data[index]['address'],
                            link: dataSnapshot.data[index]['image'],
                          ),
                          if (index + 1 != dataSnapshot.data.length) const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                );
              })),
    );
  }
}
