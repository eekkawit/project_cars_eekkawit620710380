import 'package:flutter/material.dart';
import 'package:project_cars_eekkawit620710380/pages/car/car_data.dart';


class CarDetailsPage extends StatefulWidget {
  final int carIndex;

  const CarDetailsPage({Key? key, required this.carIndex}) : super(key: key);

  @override
  State<CarDetailsPage> createState() => _CarDetailsPageState();
}

class _CarDetailsPageState extends State<CarDetailsPage> {
  late int _carIndex;

  @override
  void initState() {
    super.initState();
    _carIndex = widget.carIndex;
  }

  @override
  Widget build(BuildContext context) {
    var carItem = CarData.list[_carIndex];

    return Scaffold(
      appBar: AppBar(title: Text('${carItem.name} ${carItem.price} บาท')),
      body: Stack(
        children: [
          Column(
            children: [
              AspectRatio(
                aspectRatio: 1.7,
                child: Image.network(
                  carItem.image,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text(
                  carItem.name,
                  style: TextStyle(
                      fontSize: 25.0
                  ),
                ),
              ),
              Text(
                '${carItem.price} บาท',
                style: TextStyle(
                    fontSize: 20.0
                ),
              ),
            ],
          ),
          if (_carIndex > 0)
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: ElevatedButton.icon(
                  onPressed: () => _handleClickButton(-1),
                  label: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('ก่อนหน้า'),
                  ),
                  icon: const Icon(
                    Icons.keyboard_arrow_left,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

          if (_carIndex < CarData.list.length - 1)
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ElevatedButton.icon(
                    onPressed: () => _handleClickButton(1),
                    label: const Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Text('ถัดไป'),
                    ),
                    icon: const Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('รุ่นที่ ${_carIndex + 1}/${CarData.list.length}'),
            ),
          ),
        ],
      ),
    );
  }

  void _handleClickButton(int value) {
    final newIndex = _carIndex + value;
    if (newIndex < 0 || newIndex > CarData.list.length - 1) return;

    setState(() {
      _carIndex += value;
    });
  }
}
