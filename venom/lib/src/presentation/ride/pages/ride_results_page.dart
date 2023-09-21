import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venom/src/features/ride/domain/models/ride_model.dart';
import 'package:venom/src/injectable/injectable.dart';
import 'package:venom/src/presentation/ride/bloc/ride_result/ride_result_bloc.dart';

@RoutePage(name: 'ride_results_page')
class RideResultsPage extends StatelessWidget {
  const RideResultsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RideResultBloc, RideResultState>(
      bloc: getIt.get<RideResultBloc>(),
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Results'),
          ),
          body: ListView(
            children: [
              const SizedBox(
                height: 25,
              ),
              Card(
                child: SizedBox(
                  width: 150,
                  height: 300,
                  child: state.maybeWhen(
                    orElse: () {
                      return const SizedBox();
                    },
                    idle: (ride) {
                      final currentRide = ride ?? Ride();
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Time traveled: ${currentRide.timeTraveled}'),
                          Text(
                            'Distance traveled: ${currentRide.distanceTravelled} km',
                          ),
                          Text(
                            'Fuel used in this ride: ${currentRide.gasUsed} Gallons',
                          ),
                          Text(
                            'Money spent in this ride: \$${currentRide.gasPrice}',
                          ),
                          Text(
                            'Average speed: ${currentRide.averageSpeed} km/h',
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Theme.of(context).focusColor),
                  ),
                  onPressed: () {
                    getIt
                        .get<RideResultBloc>()
                        .add(const RideResultEvent.analyzeRide());
                  },
                  child: const Text('Analyze ride'),
                ),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Theme.of(context).focusColor),
                  ),
                  onPressed: () async {
                    getIt.get<RideResultBloc>().state.maybeWhen(
                          orElse: () {},
                          idle: (ride) {
                            getIt
                                .get<RideResultBloc>()
                                .add(RideResultEvent.saveAndClose(ride));
                          },
                        );
                  },
                  child: const Text('Save and close'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
