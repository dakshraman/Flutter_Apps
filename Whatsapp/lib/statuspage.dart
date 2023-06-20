import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  List<String> statusItems = [
    'John Doe',
    'Jane Smith',
    'Mark Johnson',
    // Add more status items as needed
  ];

  List<String> filteredStatusItems = [];

  @override
  void initState() {
    super.initState();
    filteredStatusItems = statusItems;
  }

  void filterStatusItems(String query) {
    setState(() {
      filteredStatusItems = statusItems
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            backgroundColor: Colors.black,
            leading: TextButton(onPressed: () {  }, child: Text("Privacy",
            style: TextStyle(
              //fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            ),),
            largeTitle: Text('Status'),
          ),
          SliverPadding(
            padding: EdgeInsets.all(16),
            sliver: SliverToBoxAdapter(
              child: CupertinoSearchTextField(
                placeholder: 'Search',
                onChanged: filterStatusItems,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                final statusItem = filteredStatusItems[index];
                return _buildStatusItem(statusItem);
              },
              childCount: filteredStatusItems.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusItem(String name) {
    return Material(
      color: Colors.grey.shade900,
      child: CupertinoListTile.notched(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[400],
          ),
          child: Icon(
            CupertinoIcons.person,
            color: Colors.white,
          ),
        ),
        title: Text(name,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () {
          // Handle status item tap
        },
      ),
    );
  }
}
