import 'package:flutter/material.dart';
import '../scaffold_page.dart';


class PagedDataTableExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPageWidget(
      title: 'page data table',
      child: _PagedDataTableWidget()
    );
  }
}


class _PagedDataTableWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PaginatedDataTable(
        header: Text('Table'),
        columns: <DataColumn>[
          DataColumn(label: Text('column1')),
          DataColumn(label: Text('column2')),
          DataColumn(label: Text('column3')),
        ],
        source: _DataTableSource()
      ),
    );
  }
}


class _DataTableSource extends DataTableSource {
  int _selectRowCount = 0;

  @override
  DataRow getRow(int index) {
    return DataRow(cells: <DataCell>[
      DataCell(Text('column$index')),
      DataCell(Text('column$index')),
      DataCell(Text('column$index')),
    ]);
  }

  @override
  int get rowCount => 1000;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectRowCount;
}