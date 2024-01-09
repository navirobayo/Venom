import 'package:flutter/material.dart';
import 'package:venom/components/default_vehicle_database.dart';
import 'package:venom/components/vehicle_object.dart';
import 'package:venom/components/vehicles_database.dart';

class GasCapacity extends StatefulWidget {
  const GasCapacity({Key? key}) : super(key: key);

  @override
  State<GasCapacity> createState() => _GasCapacityState();
}

class _GasCapacityState extends State<GasCapacity> {
  late Future<Vehicle> _defaultVehicleFuture;

  @override
  void initState() {
    super.initState();
    _defaultVehicleFuture = _getDefaultVehicle();
  }

  Future<Vehicle> _getDefaultVehicle() async {
    final defaultVehicleDatabase = DefaultVehicleDatabase.instance;
    final defaultVehicle = await defaultVehicleDatabase.defaultVehicle();
    final vehicle = Vehicle(
      name: defaultVehicle.vehicleName,
      tankCapacity: defaultVehicle.vehicleTankSize,
    );
    return vehicle;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Default Vehicle"),
      ),
      body: FutureBuilder<Vehicle>(
        future: _defaultVehicleFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final defaultVehicle = snapshot.data!;
            return ListView(
              children: [
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    const Spacer(),
                    Text(
                      defaultVehicle.tankCapacity,
                      style: const TextStyle(fontSize: 48.0),
                    ),
                    const Text("-GAL", style: TextStyle(fontSize: 48.0)),
                    const Spacer(),
                    Text(
                      defaultVehicle.name,
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Theme.of(context).focusColor),
                  ),
                  onPressed: () async {
                    final database = VehicleDatabase();
                    final vehicles = await database.vehicles();
                    if (vehicles.isEmpty) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('No current vehicles'),
                            content: const Text(
                                'Please add them in "My vehicles" screen'),
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
                        // Insert the selected vehicle as the new default vehicle
                        final defaultVehicle = DefaultVehicleObject(
                          vehicleName: selectedVehicle.name,
                          vehicleTankSize: selectedVehicle.tankCapacity,
                        );
                        final defaultVehicleDatabase =
                            DefaultVehicleDatabase.instance;
                        await defaultVehicleDatabase
                            .insertDefaultVehicle(defaultVehicle);

                        setState(() {
                          _defaultVehicleFuture = Future.value(selectedVehicle);
                        });
                      }
                    }
                  },
                  child: const Text('Select vehicle'),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Error"),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
