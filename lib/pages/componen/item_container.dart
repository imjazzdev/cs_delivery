import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ItemContainer extends StatelessWidget {
  final int id;
  final String status;
  final List<Widget> icon;
  ItemContainer({required this.id, required this.status, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(left: 15, top: 7, bottom: 7, right: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.blue.withOpacity(0.2),
                offset: Offset(1, 3),
                blurRadius: 10,
                spreadRadius: 2)
          ],
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                'Order $id',
                style: TextStyle(fontSize: 23),
              ),
              Text(
                '$status',
                style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
              ),
            ],
          ),
          Row(
            children: icon,
          )
        ],
      ),
    );
  }
}
