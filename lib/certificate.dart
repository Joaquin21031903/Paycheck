import 'package:flutter/material.dart';

class CertificationsPage extends StatefulWidget {
  @override
  _CertificationsPageState createState() => _CertificationsPageState();
}

class _CertificationsPageState extends State<CertificationsPage> {
  String selectedReport = '- Select Report -';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF001F3F), // Navy blue background color
        title: Row(
          children: [
            Image.asset(
              'LOGO2.jpg', // Path to your mini logo
              height: 30,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PAYCHECK',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 205, 138, 50),
                  ),
                ),
                Text(
                  'Next Generation Payroll for A New Era.',
                  style: TextStyle(
                    fontSize: 8,
                    color: Color.fromARGB(255, 205, 138, 50),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Certifications', // New label added
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 205, 138, 50),
              ),
            ),
            SizedBox(height: 16),
            Card(
              elevation: 4, // Elevation for the entire card
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Report:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    DropdownButton<String>(
                      value: selectedReport,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedReport = newValue!;
                        });
                      },
                      items: <String>[
                        '- Select Report -',
                        'BIR Form 2316 (Per Employee)',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 20),
                    Visibility(
                      visible: selectedReport == 'BIR Form 2316 (Per Employee)',
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Details for BIR Form 2316',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          // Placeholder for BIR Form 2316 details
                          Text(
                            'Employee Name: Joauqin \nEmployee ID: 12345\nTax Year: 2024\nTaxable Income: \n ₱50,000.00\nTaxes Withheld: \n ₱10,000.00',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
