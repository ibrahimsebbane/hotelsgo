import 'package:flutter/material.dart';

class SortModalBottomSheet extends StatefulWidget {
  const SortModalBottomSheet({super.key});

  @override
  State<SortModalBottomSheet> createState() => _SortModalBottomSheetState();
}

class _SortModalBottomSheetState extends State<SortModalBottomSheet> {
  @override
  Widget build(BuildContext context) {
    TextStyle bodyMediumStyle = Theme.of(context).textTheme.bodyMedium!;
    return Container(
        decoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(100), topRight: Radius.circular(100)), color: Colors.white),
        child: Column(children: [
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
                  Container(),
                  Text("Sort by", style: Theme.of(context).textTheme.bodyLarge),
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
                      child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Text("Our recommendations", style: bodyMediumStyle),
                        const SizedBox(height: 10),
                        const Divider(thickness: 1),
                        const SizedBox(height: 10),
                        Text("Rating & Recommended", style: bodyMediumStyle),
                        const SizedBox(height: 10),
                        const Divider(thickness: 1),
                        const SizedBox(height: 10),
                        Text("Price & Recommended", style: bodyMediumStyle),
                        const SizedBox(height: 10),
                        const Divider(thickness: 1),
                        const SizedBox(height: 10),
                        Text("Distance & Recommended", style: bodyMediumStyle),
                        const SizedBox(height: 10),
                        const Divider(thickness: 1),
                        const SizedBox(height: 10),
                        Text("Rating only", style: bodyMediumStyle),
                        const SizedBox(height: 10),
                        const Divider(thickness: 1),
                        const SizedBox(height: 10),
                        Text("Price only", style: bodyMediumStyle),
                        const SizedBox(height: 10),
                        const Divider(thickness: 1),
                        const SizedBox(height: 10),
                        Text("Distance only", style: bodyMediumStyle),
                        const SizedBox(height: 10),
                        const Divider(thickness: 1),
                      ],
                    ),
                  ))))
        ]));
  }
}
