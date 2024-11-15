import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FoodList extends StatefulWidget {
  const FoodList ({super.key});
  @override
  State<FoodList> createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {

  late Future<List<Map>> _foodList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _foodList = _getMenu();
  }

  Future<List<Map>> _getMenu() async {
    final response = await http.get(
        Uri.parse('http://10.0.2.2:3000/menu')
    );
    if (response.statusCode == 200) {
      return List<Map>.from(jsonDecode(response.body));
    }
    else {
      throw Exception('Failed to load');
    }
  }

  Widget _errorMessage() => const Center(child: const Text("Tidak dapat mengambil menu saat ini"));

  Widget _spinner(BuildContext context) => const Center(
    child: CircularProgressIndicator(
      value: null,
    ),
  );

  Widget _foodCardList(BuildContext context, List<Map> foodList) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      children:
        foodList.map<Widget>(
              (food) => _foodCard(context, food['image'], food['title'], food['description'], food['price'])
        ).toList()
    );
  }

  Widget _foodCard(BuildContext context, String imageUrl, String title, String description, String price) {
    const titleTextStyle = TextStyle(fontWeight: FontWeight.w700, fontSize: 25);
    const descriptionTextStyle = TextStyle(fontWeight: FontWeight.w300, fontSize: 20);
    const priceTextStyle = TextStyle(fontWeight: FontWeight.w600, fontSize: 23);

    // a container with a padding
    // containing a row containing a food image and a column of information
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(flex: 1, child: Image.asset(imageUrl, height: 90.0)),
          Expanded(flex: 3, child:
            Container(
              padding: const EdgeInsets.all(16.0),
              child:
                Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: titleTextStyle, textAlign: TextAlign.left),
                        Text(description, style: descriptionTextStyle, textAlign: TextAlign.left),
                        Text("Rp. $price", style: priceTextStyle, textAlign: TextAlign.left)
                      ],
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: ElevatedButton(
                          onPressed: () {},
                          child: const Icon(Icons.add)
                      )
                    )
                ],
              )
            )
          )
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _foodList,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return _spinner(context);
          }
          if (snapshot.hasError) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: const Text("Tidak dapat mengambil menu saat ini"))
            );
            return _errorMessage();
          }
          return Container(
              child: _foodCardList(context, snapshot.data ?? [])
          );
        }
    );
  }
}