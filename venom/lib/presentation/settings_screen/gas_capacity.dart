import 'package:flutter/material.dart';
import 'package:venom/components/vehicle_object.dart';
import 'package:venom/components/vehicles_database.dart';

class GasCapacity extends StatefulWidget {
  const GasCapacity({Key? key}) : super(key: key);

  @override
  State<GasCapacity> createState() => _GasCapacityState();
}

class _GasCapacityState extends State<GasCapacity> {
  late Vehicle _gasVehicle;

  @override
  void initState() {
    super.initState();
    _getDefaultVehicle();
  }

  Future<void> _getDefaultVehicle() async {
    final database = VehicleDatabase();
    final vehicles = await database.vehicles();
    final defaultVehicle = vehicles.isNotEmpty
        ? vehicles.first
        : Vehicle(name: '---', tankCapacity: '---');
    final gasVehicle = Vehicle(
      id: defaultVehicle.id,
      name: defaultVehicle.name,
      tankCapacity: defaultVehicle.tankCapacity,
    );
    setState(() {
      _gasVehicle = gasVehicle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gas Capacity"),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              const Spacer(),
              Text(
                _gasVehicle.tankCapacity,
                style: const TextStyle(fontSize: 48.0),
              ),
              const Text("-GAL", style: TextStyle(fontSize: 48.0)),
              const Spacer(),
              Text(
                _gasVehicle.name,
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          ElevatedButton(
            onPressed: () async {
              final database = VehicleDatabase();
              final vehicles = await database.vehicles();
              if (vehicles.isEmpty) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('No current vehicles'),
                      content:
                          const Text('Please add them in "My vehicles" screen'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              } else {
                final selectedVehicle = await showDialog<Vehicle>(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Select a vehicle'),
                      content: SizedBox(
                        width: double.maxFinite,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: vehicles.length,
                          itemBuilder: (context, index) {
                            final vehicle = vehicles[index];
                            return ListTile(
                              title: Text(vehicle.name),
                              onTap: () {
                                Navigator.pop(context, vehicle);
                              },
                            );
                          },
                        ),
                      ),
                    );
                  },
                );
                if (selectedVehicle != null) {
                  setState(() {
                    _gasVehicle = selectedVehicle;
                  });
                }
              }
            },
            child: const Text('Select vehicle'),
          ),
        ],
      ),
    );
  }
}