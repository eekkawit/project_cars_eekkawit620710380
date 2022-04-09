import 'package:flutter/material.dart';
import 'package:project_cars_eekkawit620710380/models/api_result.dart';
import 'package:project_cars_eekkawit620710380/models/car_item.dart';
import 'package:project_cars_eekkawit620710380/pages/car/car_data.dart';
import 'package:project_cars_eekkawit620710380/pages/car/car_details_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CarListPage extends StatefulWidget {
  const CarListPage({Key? key}) : super(key: key);

  @override
  State<CarListPage> createState() => _CarListPageState();
}

class _CarListPageState extends State<CarListPage> {
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadCars();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FLUTTER CARS'),
      ),
      body: Stack(
        children: [
          ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: CarData.list.length,
            itemBuilder: (context, index) => _buildListItem(context, index),
          ),
          if (_isLoading)
            const Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }

  _loadCars() async {
    setState(() {
      _isLoading = true;
    });
    final url = Uri.parse('https://cars.eekla.repl.co/products');
    var response = await http.get(url);
    setState(() {
      _isLoading = false;
    });

    var json = jsonDecode(response.body);
    var apiResult = ApiResult.fromJson(json);


    setState(() {
      CarData.list = apiResult.data
          .map<CarItem>((item) => CarItem.fromJson(item))
          .toList();

    });
  }

  Widget _buildListItem(BuildContext context, int index) {
    var foodItem = CarData.list[index];

    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: const EdgeInsets.all(8.0),
      elevation: 5.0,
      shadowColor: Colors.black.withOpacity(0.2),
      child: InkWell(
        onTap: () {
          _handleClickItem(index);
        },
        child: Row(
          children: <Widget>[
            Image.network(
              foodItem.image,
              width: 80.0,
              height: 80.0,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          foodItem.name,
                          style: TextStyle(
                              fontSize: 20.0
                          ),
                        ),
                        Text(
                          '${foodItem.price.toString()} บาท',
                          style: TextStyle(
                              fontSize: 15.0
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleClickItem(int foodIndex) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CarDetailsPage(carIndex: foodIndex)),
    );
  }
}