import 'package:cs_delivery/pages/admin_report_detail.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdminReport extends StatefulWidget {
  const AdminReport({super.key});

  @override
  State<AdminReport> createState() => _AdminReportState();
}

class _AdminReportState extends State<AdminReport> {
  DateTime? _dateTimeMulai;
  DateTime? _dateTimeSampai;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report\nOrder'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              'Dari Tanggal',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 70,
                  padding: EdgeInsets.only(left: 15),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(border: Border.all()),
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(_dateTimeMulai == null
                      ? 'Pilih tanggal'
                      : DateFormat('dd-MM-yyyy').format(_dateTimeMulai!)),
                ),
                IconButton(
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2099),
                      ).then((date) {
                        setState(() {
                          _dateTimeMulai = date!;
                        });
                      });
                    },
                    icon: Icon(
                      Icons.calendar_month_outlined,
                      color: Colors.grey.shade800,
                      size: 33,
                    ))
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Sampai Tanggal',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 70,
                  padding: EdgeInsets.only(left: 15),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(border: Border.all()),
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(_dateTimeSampai == null
                      ? 'Pilih tanggal'
                      : DateFormat('dd-MM-yyyy').format(_dateTimeSampai!)),
                ),
                IconButton(
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2099),
                      ).then((date) {
                        setState(() {
                          _dateTimeSampai = date;
                        });
                      });
                    },
                    icon: Icon(
                      Icons.calendar_month_outlined,
                      color: Colors.grey.shade800,
                      size: 33,
                    ))
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade800),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdminReportDetail(),
                          ));
                    },
                    child: Text('SUBMIT')))
          ],
        ),
      ),
    );
  }
}
