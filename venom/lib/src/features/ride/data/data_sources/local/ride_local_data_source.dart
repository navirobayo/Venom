import 'package:database_service/database_service.dart';
import 'package:venom/src/features/ride/domain/models/ride_list.dart';

class RideLocalDataSource extends DatabaseCommonOperations<RideList> {

  RideLocalDataSource(this.dbService)
      : super(
          boxName: 'RideDataSource',
          databaseService: dbService,
        );
  final DatabaseService dbService;
}
