import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/camera.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<String> chatItems = [
    'John Doe',
    'Jane Smith',
    'Mark Johnson',
    // Add more chat items as needed
  ];

  List<String> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems.addAll(chatItems);
  }

  void _filterItems(String query) {
    setState(() {
      filteredItems = chatItems
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
            leading: TextButton(onPressed: () {  }, child: Text("Edit",
              style: TextStyle(
                //fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),),
            largeTitle: Text('Chats'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                   // Navigator.push((context), MaterialPageRoute(builder: (context)=> CameraPage()));// Handle camera icon tap
                  },
                  child: Icon(CupertinoIcons.camera),
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    // Handle pencil icon tap
                  },
                  child: Icon(CupertinoIcons.pencil),
                ),
              ],
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(12),
            sliver: SliverToBoxAdapter(
              child: CupertinoSearchTextField(
                onChanged: _filterItems,
                placeholder: 'Search',
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                final item = filteredItems[index];
                return _buildChatItem(
                  item,
                  'Hello',
                  '10:00 AM',
                );
              },
              childCount: filteredItems.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatItem(
      String name,
      String lastMessage,
      String timestamp,
      ) {
    return Material(
      color: Colors.grey.shade900,
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(CupertinoIcons.person),
        ),
        title: Text(
          name,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(lastMessage,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Text(
          timestamp,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () {
          // Handle chat item tap
        },
      ),
    );
  }
}
