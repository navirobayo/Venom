import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:venom/src/config/routes/router.dart';
import 'package:venom/src/features/price/domain/models/price_model.dart';
import 'package:venom/src/injectable/injectable.dart';
import 'package:venom/src/presentation/gas_price/bloc/gas_price/gas_price_bloc.dart';

@RoutePage(name: 'gas_history')
class GasHistory extends StatelessWidget {
  GasHistory({super.key});

  final TextEditingController _fuelPrice = TextEditingController(text: '');
  final TextEditingController _placeOfPurchase =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GasPriceBloc, GasPriceState>(
      bloc: getIt.get<GasPriceBloc>(),
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Gas Prices Historical Tracker'),
          ),
          body: ListView.builder(
            itemCount: state.maybeWhen(
              orElse: () {
                return 0;
              },
              idle: (prices) {
                return prices.length;
              },
            ),
            itemBuilder: (BuildContext context, int index) {
              return state.maybeWhen(
                orElse: () {
                  return const SizedBox();
                },
                idle: (prices) {
                  return Dismissible(
                    key: Key(prices[index].id),
                    onDismissed: (direction) async {
                      getIt
                          .get<GasPriceBloc>()
                          .add(GasPriceEvent.deletePrice(index));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Fuel price deleted'),
                          action: SnackBarAction(
                            label: 'Undo',
                            onPressed: () async {
                              getIt.get<GasPriceBloc>().add(
                                    GasPriceEvent.cachePrice(prices[index]),
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
                      leading: const Icon(Icons.gas_meter_outlined, size: 40),
                      title: Text('${prices[index].price} \$'),
                      subtitle: Text(
                        prices[index].placeOfPurchase,
                        style: const TextStyle(color: Colors.white54),
                        // style: const TextStyle(color: Colors.white54),
                      ),
                      onLongPress: () async {
                        final result = await showMenu(
                          context: context,
                          position: const RelativeRect.fromLTRB(2, 0, 0, 0),
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
                              .get<GasPriceBloc>()
                              .add(GasPriceEvent.deletePrice(index));
                          ScaffoldMessenger.of(
                            getIt.get<AppRouter>().navigatorKey.currentContext!,
                          ).showSnackBar(
                            SnackBar(
                              content: const Text('Fuel price deleted'),
                              action: SnackBarAction(
                                label: 'Undo',
                                onPressed: () async {
                                  getIt.get<GasPriceBloc>().add(
                                        GasPriceEvent.cachePrice(
                                          prices[index],
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
              await showDialog<Price>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Add Price'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          decoration: const InputDecoration(labelText: 'Price'),
                          keyboardType: TextInputType.number,
                          controller: _fuelPrice,
                        ),
                        TextField(
                          decoration: const InputDecoration(
                            labelText: 'Place of purchase',
                          ),
                          controller: _placeOfPurchase,
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
                          getIt.get<GasPriceBloc>().add(
                                GasPriceEvent.cachePrice(
                                  Price(
                                    placeOfPurchase: _placeOfPurchase.text,
                                    price:
                                        double.tryParse(_fuelPrice.text) ?? 0.0,
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
