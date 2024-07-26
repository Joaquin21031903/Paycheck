import 'package:flutter/material.dart';

class SickLeaveRequestPage extends StatefulWidget {
  @override
  _SickLeaveRequestPageState createState() => _SickLeaveRequestPageState();
}

class _SickLeaveRequestPageState extends State<SickLeaveRequestPage> {
  DateTime? _selectedDate;
  TextEditingController _reasonController = TextEditingController();

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDatePicker(),
            SizedBox(height: 16),
            _buildReasonTextField(),
            SizedBox(height: 16),
            _buildSubmitButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildDatePicker() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: ListTile(
          title: Text(
            'Selected Date: ${_selectedDate != null ? _selectedDate!.toLocal().toString().split(' ')[0] : 'No date selected'}',
            style: TextStyle(fontSize: 16),
          ),
          trailing: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  Color.fromARGB(191, 205, 138, 50), // Button color
            ),
            onPressed: () async {
              DateTime? picked = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2021),
                lastDate: DateTime(2101),
              );
              if (picked != null && picked != _selectedDate) {
                setState(() {
                  _selectedDate = picked;
                });
              }
            },
            child: Text(
              'Select Date',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildReasonTextField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: TextField(
          controller: _reasonController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Reason',
          ),
          maxLines: 4,
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  Color.fromARGB(188, 205, 138, 50), // Button color
            ),
            onPressed: () {
              // Show confirmation dialog before submission
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Confirm Submission"),
                    content: Text(
                        "Are you sure you want to submit this sick leave request?"),
                    actions: <Widget>[
                      TextButton(
                        child: Text("Cancel"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text("Submit"),
                        onPressed: () {
                          // Handle sick leave request submission
                          if (_selectedDate != null &&
                              _reasonController.text.isNotEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Sick leave request submitted'),
                              ),
                            );
                            Navigator.of(context).pop(); // Close the dialog
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Please select a date and provide a reason',
                                  style: TextStyle(
                                    color: Color.fromARGB(
                                        255, 226, 0, 0), // Font color
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: Text(
              'Submit Request',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255), // Font color
              ),
            ),
          ),
        ),
      ),
    );
  }
}
