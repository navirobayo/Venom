import 'package:flutter/material.dart';
import 'package:venom/presentation/new_ride/results_screen.dart';

class FinalData extends StatefulWidget {
  final String userName;
  final String timeTraveled;
  final double gasLevel1;
  final double odometer1;
  final double defaultPrice;
  final double defaultTankSize;

  const FinalData(
      {Key? key,
      required this.userName,
      required this.timeTraveled,
      required this.gasLevel1,
      required this.odometer1,
      required this.defaultPrice,
      required this.defaultTankSize})
      : super(key: key);

  @override
  State<FinalData> createState() => _FinalDataState();
}

class _FinalDataState extends State<FinalData> {
  double _gasLevel2 = 0.5;
  final odometer2 = TextEditingController();
  double gasUsed = 0.0;
  double gasPrice = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Final Data"),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: <Widget>[
            Center(child: Text("Nice ride, ${widget.userName}")),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: TextField(
                controller: odometer2,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'KM that you see in the odometer',
                ),
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text("Gas level:"),
            Slider(
              value: _gasLevel2,
              activeColor: Theme.of(context).primaryColor,
              inactiveColor: Theme.of(context).focusColor,
              onChanged: (value) {
                setState(() {
                  _gasLevel2 = value;
                });
              },
              min: 0,
              max: 1,
              divisions: 10,
              label: _gasLevel2 == 0
                  ? "Empty tank"
                  : _gasLevel2 == 1
                      ? "Full tank"
                      : "",
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 35),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Theme.of(context).focusColor),
                ),
                onPressed: () {
                  final enteredOdometer2 =
                      double.tryParse(odometer2.text) ?? 0.0;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultsScreen(
                        userName: widget.userName,
                        timeTraveled: widget.timeTraveled,
                        gasLevel1: widget.gasLevel1,
                        gasLevel2: _gasLevel2,
                        odometer1: widget.odometer1,
                        odometer2: enteredOdometer2,
                        defaultPrice: widget.defaultPrice,
                        defaultTankSize: widget.defaultTankSize,
                      ),
                    ),
                  );
                },
                child: const Icon(Icons.arrow_forward_ios_rounded),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
