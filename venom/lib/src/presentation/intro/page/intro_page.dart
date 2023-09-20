import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ndialog/ndialog.dart';
import 'package:venom/src/config/routes/router.dart';
import 'package:venom/src/injectable/injectable.dart';

@RoutePage(name: 'intro')
class IntroPage extends StatelessWidget {
  IntroPage({super.key});
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: const Text('Venom Beta 1.0'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            const Text('Venom Beta 1.0', style: TextStyle(fontSize: 45)),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 300,
              child: TextField(
                controller: _nameController,
                obscureText: true,
                onSubmitted: (value) async {
                  if (value.isEmpty) {
                    await NDialog(
                      content: SizedBox(
                        width: 0.5.sw,
                        height: 80.h,
                        child:
                            const Center(child: Text('Username is required')),
                      ),
                    ).show<void>(context);
                    return;
                  }
                  if (getIt.isRegistered<String>()) {
                    getIt
                      ..unregister<String>()
                      ..registerSingleton<String>(value);
                  } else {
                    getIt.registerSingleton<String>(value);
                  }
                  await getIt.get<AppRouter>().pushNamed('/home');
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your username',
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (_nameController.text.isEmpty) {
            await NDialog(
              content: SizedBox(
                width: 0.5.sw,
                height: 80.h,
                child: const Center(child: Text('Username is required')),
              ),
            ).show<void>(context);
            return;
          }
          getIt.registerSingleton<String>(_nameController.text);
          await getIt.get<AppRouter>().pushNamed('/home');
        },
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        child: Icon(Icons.check_rounded, size: 26.r),
      ),
    );
  }
}
