import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({
    super.key,
    required this.summaryData,
  });

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        // add scroll view
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...summaryData.map((data) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Circle Number
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.blue[300],
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '${(data['question_id'] as int) + 1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${data['question']}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${data['user_answer']}',
                            style: TextStyle(
                                color: Colors.red[50],
                                fontWeight: FontWeight.bold,
                                fontSize: 10),
                          ),
                          Text(
                            '${data['correct_answer']}',
                            style: TextStyle(
                                color: Colors.red[100],
                                fontWeight: FontWeight.bold,
                                fontSize: 10),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
