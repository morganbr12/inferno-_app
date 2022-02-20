import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../provider/ordered_item.dart';

class HistoryPage extends StatefulWidget {
  final OrderedItem order;

  const HistoryPage({required this.order, Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            "Ghc ${widget.order.amount}",
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontSize: 14,
              fontFamily: "Poppins",
            ),
          ),
          subtitle: Text(
            DateFormat('dd - MM - yyyy hh:mm').format(widget.order.dateTime),
            style: const TextStyle(
              color: Colors.white30,
              fontSize: 12,
              fontFamily: "Poppins",
            ),
          ),
          trailing: IconButton(
            splashColor: Theme.of(context).accentColor.withOpacity(0.4),
            onPressed: () {
              setState(() {
                _expanded = !_expanded;
              });
            },
            icon: Icon(
              _expanded ? Icons.expand_less : Icons.expand_more,
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
        if (_expanded)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
            height: min(widget.order.products.length * 20.0 + 10, 200),
            child: ListView(
              children: widget.order.products
                  .map((prod) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            prod.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: "Poppins",
                            ),
                          ),
                          Text(
                            '${prod.quantity}x \ghc ${prod.price}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ],
                      ))
                  .toList(),
            ),
          )
      ],
    );
  }
}
