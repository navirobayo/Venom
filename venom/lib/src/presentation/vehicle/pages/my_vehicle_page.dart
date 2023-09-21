import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:venom/src/config/routes/router.dart';
import 'package:venom/src/features/vehicle/domain/models/vehicle_model.dart';
import 'package:venom/src/injectable/injectable.dart';
import 'package:venom/src/presentation/vehicle/bloc/my_vehicle/my_vehicle_bloc.dart';

@RoutePage(name: 'my_vehicle')
class MyVehiclePage extends StatelessWidget {
  MyVehiclePage({super.key});
  final TextEditingController _nameController = TextEditingController(text: '');
  final TextEditingController _tankCapacity = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyVehicleBloc, MyVehicleState>(
      bloc: getIt.get<MyVehicleBloc>(),
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('My Vehicles'),
          ),
          body: ListView.builder(
            itemCount: getIt.get<MyVehicleBloc>().state.maybeWhen(
              orElse: () {
                return 0;
              },
              idle: (vehicles) {
                return vehicles.length;
              },
            ),
            itemBuilder: (BuildContext context, int index) {
              return getIt.get<MyVehicleBloc>().state.maybeWhen(
                orElse: () {
                  return const SizedBox();
                },
                idle: (vehicles) {
                  return vehicles.isEmpty
                      ? const SizedBox()
                      : Dismissible(
                          key: Key(vehicles[index].id),
                          onDismissed: (direction) async {
                            getIt
                                .get<MyVehicleBloc>()
                                .add(MyVehicleEvent.deleteVehicle(index));
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Text('${vehicles[index].name} deleted'),
                                action: SnackBarAction(
                                  label: 'Undo',
                                  onPressed: () async {
                                    getIt.get<MyVehicleBloc>().add(
                                          MyVehicleEvent.cacheVehicle(
                                            vehicles[index],
                                          ),
                                        );
                                  },
                                ),
                              ),
                            );
                          },
                          background: const ColoredBox(
                            color: Colors.red,
                            child: ListTile(
                              leading: Icon(Icons.delete, color: Colors.white),
                            ),
                          ),
                          child: ListTile(
                            leading: const Icon(Icons.motorcycle, size: 40),
                            title: Text(vehicles[index].name),
                            subtitle: Text(
                              vehicles[index].tankCapacity,
                              style: const TextStyle(color: Colors.white54),
                            ),
                            onLongPress: () async {
                              final result = await showMenu(
                                context: context,
                                position:
                                    const RelativeRect.fromLTRB(2, 0, 0, 0),
                                items: [
                                  const PopupMenuItem(
                                    value: 'delete',
                                    child: Row(
                                      children: [
                                        Icon(Icons.delete),
                                        SizedBox(width: 8),
                                        Text('Delete'),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                              if (result == 'delete') {
                                getIt
                                    .get<MyVehicleBloc>()
                                    .add(MyVehicleEvent.deleteVehicle(index));
                                ScaffoldMessenger.of(
                                  getIt
                                      .get<AppRouter>()
                                      .navigatorKey
                                      .currentContext!,
                                ).showSnackBar(
                                  SnackBar(
                                    content:
                                        Text('${vehicles[index].name} deleted'),
                                    action: SnackBarAction(
                                      label: 'Undo',
                                      onPressed: () async {
                                        getIt.get<MyVehicleBloc>().add(
                                              MyVehicleEvent.cacheVehicle(
                                                vehicles[index],
                                              ),
                                            );
                                      },
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        );
                },
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              await showDialog<Vehicle>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Add Vehicle'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          decoration: const InputDecoration(labelText: 'Name'),
                          controller: _nameController,
                        ),
                        TextField(
                          decoration: const InputDecoration(
                            labelText: 'Tank Capacity in GAL',
                          ),
                          keyboardType: TextInputType.number,
                          controller: _tankCapacity,
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () async {
                          getIt.get<MyVehicleBloc>().add(
                                MyVehicleEvent.cacheVehicle(
                                  Vehicle(
                                    name: _nameController.text,
                                    tankCapacity: _tankCapacity.text,
                                  ),
                                ),
                              );
                          Navigator.pop(context);
                        },
                        child: const Text('Add'),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
