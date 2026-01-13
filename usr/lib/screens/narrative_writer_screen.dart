import 'package:flutter/material.dart';
import 'package:couldai_user_app/data/mock_data.dart';

class NarrativeWriterScreen extends StatefulWidget {
  const NarrativeWriterScreen({super.key});

  @override
  State<NarrativeWriterScreen> createState() => _NarrativeWriterScreenState();
}

class _NarrativeWriterScreenState extends State<NarrativeWriterScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _brainstormController = TextEditingController();
  final TextEditingController _draftController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _brainstormController.dispose();
    _draftController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Write Your Narrative'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: '1. Brainstorm'),
            Tab(text: '2. Draft'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildBrainstormTab(),
          _buildDraftTab(),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Narrative saved successfully!')),
          );
        },
        label: const Text('Save Work'),
        icon: const Icon(Icons.save),
      ),
    );
  }

  Widget _buildBrainstormTab() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.amber[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.amber.shade200),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                narrativePrompt.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
              const SizedBox(height: 8),
              Text(narrativePrompt.description),
            ],
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'Step 1: Sensory Details',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text('List sights, sounds, smells, and feelings associated with your memory.'),
        const SizedBox(height: 16),
        TextField(
          controller: _brainstormController,
          maxLines: 10,
          decoration: const InputDecoration(
            hintText: '• I saw...\n• I heard...\n• I felt...',
            border: OutlineInputBorder(),
            alignLabelWithHint: true,
          ),
        ),
      ],
    );
  }

  Widget _buildDraftTab() {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: _draftController,
              expands: true,
              maxLines: null,
              textAlignVertical: TextAlignVertical.top,
              decoration: InputDecoration(
                hintText: 'Start writing your story here...',
                border: const OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[50],
                contentPadding: const EdgeInsets.all(20),
              ),
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}
