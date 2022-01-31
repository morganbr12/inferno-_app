import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CountryCodePage extends StatefulWidget {
  const CountryCodePage({Key? key}) : super(key: key);

  @override
  _CountryCodePageState createState() => _CountryCodePageState();
}

class _CountryCodePageState extends State<CountryCodePage> {
  List<dynamic>? dataRetrieved; // data decoded from the json file
  List<dynamic>? data; // data to display on the screen
  var _searchController = TextEditingController();
  var searchValue = "";

  @override
  void initState() {
    _getData();
  }

  Future _getData() async {
    final String response =
        await rootBundle.loadString('assets/CountryCodes.json');
    dataRetrieved = await json.decode(response) as List<dynamic>;
    setState(() {
      data = dataRetrieved;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        toolbarHeight: 30,
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 20),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Center(
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 30,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextFormField(
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).accentColor,
                      ),
                      cursorColor: Theme.of(context).accentColor,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 15,
                          ),
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none),
                      onChanged: (value) {
                        setState(() {
                          searchValue = value;
                        });
                      },
                      controller: _searchController,
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate((data != null)
                    ? data!
                        .where((e) => e['name']
                            .toString()
                            .toLowerCase()
                            .contains(searchValue.toLowerCase()))
                        .map((e) => ListTile(
                              // onTap: () {
                              //   print(e['name']);
                              // },
                              title: Text(e['name']),
                              trailing: Text(e['dial_code']),
                            ))
                        .toList()
                    : [
                        const Center(
                          child: Text('Loading...'),
                        )
                      ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
