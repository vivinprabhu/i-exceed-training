import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<String> _allItems = [
    'Mobile Recharge',
    'Rent Payment',
    'Transfer Money',
    'Loan',
    'EMI',
    'Electricity Bill',
    'DTH Recharge',
    'Credit Card Payment',
    'Water Bill',
    'Gas Booking',
  ];

  List<String> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = _allItems;
  }

  void _filterSearch(String query) {
    final results =
        _allItems
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();
    setState(() {
      _filteredItems = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: "Search for services...",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onChanged: _filterSearch,
          ),
          SizedBox(height: 20),
          Expanded(
            child:
                _filteredItems.isNotEmpty
                    ? ListView.builder(
                      itemCount: _filteredItems.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Icon(Icons.arrow_forward_ios, size: 18),
                          title: Text(_filteredItems[index]),
                        );
                      },
                    )
                    : Center(
                      child: Text(
                        "No results found.",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ),
          ),
        ],
      ),
    );
  }
}
