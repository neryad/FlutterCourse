import 'package:flutter/material.dart';
import 'package:scannerapp/src/bloc/scan_bloc.dart';
import 'package:scannerapp/src/models/scan_model.dart';
import 'package:scannerapp/src/utils/utils.dart' as utils ;

class DireccionesPage extends StatelessWidget {
  final scanbloc = new ScansBloc();
  @override
  Widget build(BuildContext context) {
    scanbloc.getScans();
    return StreamBuilder<List<ScanModel>>(
      stream: scanbloc.scansStreamHttp,
      builder: (BuildContext context, AsyncSnapshot<List<ScanModel>> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        final scans = snapshot.data;

        if (scans.length == 0) {
          return Center(
            child: Text('No data'),
          );
        }

        return ListView.builder(
          itemCount: scans.length,
          itemBuilder: (context, i) => Dismissible(
            key: UniqueKey(),
            background: Container(color: Colors.red),
            onDismissed: (direction) => scanbloc.deleteScan(scans[i].id),
            child: ListTile(
              leading: Icon(Icons.cloud_queue,
                  color: Theme.of(context).primaryColor),
              title: Text(scans[i].valor),
              subtitle: Text('Id: ${scans[i].id}'),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey,
              ),
              onTap: () => utils.openScan(context,scans[i]) ,
            ),
          ),
        );
      },
    );
  }
}
