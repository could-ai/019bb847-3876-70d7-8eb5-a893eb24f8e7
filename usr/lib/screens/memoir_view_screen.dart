import 'package:flutter/material.dart';
import 'package:couldai_user_app/data/mock_data.dart';

class MemoirViewScreen extends StatefulWidget {
  const MemoirViewScreen({super.key});

  @override
  State<MemoirViewScreen> createState() => _MemoirViewScreenState();
}

class _MemoirViewScreenState extends State<MemoirViewScreen> {
  final Set<int> _expandedQuestions = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Read & Reflect'),
        actions: [
          TextButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/write');
            },
            icon: const Icon(Icons.edit_note),
            label: const Text('Go to Writing'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Memoir Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sampleMemoir.title,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Serif',
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'by ${sampleMemoir.author}',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.grey[600],
                            fontStyle: FontStyle.italic,
                          ),
                    ),
                    const Divider(height: 32),
                    Text(
                      sampleMemoir.content,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            height: 1.8,
                            fontSize: 18,
                            fontFamily: 'Serif',
                          ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            
            // Reflection Section
            Text(
              'Reflection Points',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
            ),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: sampleMemoir.reflectionQuestions.length,
              itemBuilder: (context, index) {
                final isExpanded = _expandedQuestions.contains(index);
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (isExpanded) {
                          _expandedQuestions.remove(index);
                        } else {
                          _expandedQuestions.add(index);
                        }
                      });
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 12,
                                backgroundColor: Colors.deepPurple[100],
                                child: Text(
                                  '${index + 1}',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.deepPurple,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  sampleMemoir.reflectionQuestions[index],
                                  style: const TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ),
                              Icon(
                                isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          if (isExpanded) ...[
                            const SizedBox(height: 12),
                            TextField(
                              decoration: const InputDecoration(
                                hintText: 'Type your thoughts here...',
                                border: OutlineInputBorder(),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              maxLines: 3,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/write');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Continue to Writing Activity'),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
