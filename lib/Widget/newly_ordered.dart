import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../provider/ordered_item.dart' as ord;

class NewlyOrdered extends StatefulWidget {
  final ord.OrderedItem order;
  const NewlyOrdered({Key? key, required this.order}) : super(key: key);

  @override
  State<NewlyOrdered> createState() => _NewlyOrderedState();
}

class _NewlyOrderedState extends State<NewlyOrdered> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          child: ListTile(
            title: Text(
              'Ghc ${widget.order.amount}',
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: 18,
              ),
            ),
            subtitle: Text(
              DateFormat('dd mm yyyy').format(widget.order.dateTime),
            ),
            trailing: IconButton(
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
        ),
        if (_expanded)
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 4,
            ),
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
