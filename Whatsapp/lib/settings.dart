import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          const CupertinoSliverNavigationBar(
            backgroundColor: Colors.black,
            largeTitle: const Text('Settings'),
          ),
          SliverPadding(
            padding: EdgeInsets.all(16),
            sliver: SliverToBoxAdapter(
              child: CupertinoSearchTextField(
                placeholder: 'Search',
                onChanged: (query) {
                  // Handle search query changes
                },
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _buildSection('Account'),
                _buildOption('Privacy'),
                _buildOption('Security'),
                _buildOption('Two-Step Verification'),
                _buildOption('Change Number'),
                _buildSection('Chats'),
                _buildOption('Chat Wallpaper'),
                _buildOption('Chat Backup'),
                _buildOption('Export Chat'),
                _buildSection('Notifications'),
                _buildOption('Message Notifications'),
                _buildOption('In-App Notifications'),
                _buildOption('Sound & Alerts'),
                _buildSection('Data and Storage'),
                _buildOption('Network Usage'),
                _buildOption('Storage Usage'),
                _buildOption('Auto-Download'),
                _buildOption('Proxy'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
      child: Text(
        title,
        ),
      );
  }

  Widget _buildOption(String title) {
    return Material(
      color: Colors.grey.shade900,
      child: CupertinoListTile.notched(
        leading: Icon(CupertinoIcons.lock_fill),
        title: Text(title,
        style: TextStyle(
            color: Colors.white,
        ),
        ),
        trailing: Icon(CupertinoIcons.forward),
        onTap: () {
          // Handle option tap
        },
      ),
    );
  }
}
