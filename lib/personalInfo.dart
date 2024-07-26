import 'package:flutter/material.dart';

class PersonalInformationDetailsPage extends StatelessWidget {
  final List<bool> _isOpen = [true]; // Track which panel is open

  final TextEditingController _withholdingTaxController =
      TextEditingController();
  final TextEditingController _sssContributionController =
      TextEditingController();
  final TextEditingController _sssMpfContributionController =
      TextEditingController();
  final TextEditingController _philhealthContributionController =
      TextEditingController();
  final TextEditingController _hdmfContributionController =
      TextEditingController();
  final TextEditingController _LegalHolidayController = TextEditingController();
  final TextEditingController _RegularOvertimeController =
      TextEditingController();
  final TextEditingController _RestDaySpecialController =
      TextEditingController();
  final TextEditingController _NightDifferentialController =
      TextEditingController();

  void dispose() {
    // Clean up the controllers when the widget is disposed
    _withholdingTaxController.dispose();
    _sssContributionController.dispose();
    _sssMpfContributionController.dispose();
    _philhealthContributionController.dispose();
    _hdmfContributionController.dispose();
    _LegalHolidayController.dispose();
    _RegularOvertimeController.dispose();
    _RestDaySpecialController.dispose();
    _NightDifferentialController.dispose();
  }

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
                    color: Color.fromRGBO(245, 188, 113, 1),
                  ),
                ),
                Text(
                  'Next Generation Payroll for A New Era.',
                  style: TextStyle(
                    fontSize: 8,
                    color: Color.fromRGBO(245, 188, 113, 1),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ExpansionPanelList(
            expandedHeaderPadding: EdgeInsets.zero,
            elevation: 2,
            animationDuration: Duration(milliseconds: 500),
            dividerColor: Colors.transparent,
            children: [
              ExpansionPanel(
                headerBuilder: (context, isExpanded) {
                  return ListTile(
                    title: Text(
                      'Personal Information',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Color.fromARGB(255, 205, 138, 50),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _isOpen[0] = !_isOpen[0];
                      });
                    },
                  );
                },
                body: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 205, 138, 50),
                        blurRadius: 4.0,
                        spreadRadius: 1.0,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Code'),
                      ),
                      TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'First Name'),
                      ),
                      TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'Last Name'),
                      ),
                      TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'Middle Name'),
                      ),
                      TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'Address1'),
                      ),
                      TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'Address2'),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Country'),
                      ),
                      TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'Department'),
                      ),
                      TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'Email ID'),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Gender'),
                      ),
                      TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'Birthday'),
                      ),
                      SizedBox(height: 20), // Add spacing above the button
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            // Add your submit logic here
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor:
                                Color.fromARGB(255, 205, 138, 50), // Text color
                          ),
                          child: Text('Submit'),
                        ),
                      ),
                    ],
                  ),
                ),
                isExpanded: _isOpen[0],
                canTapOnHeader: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // The following methods are added here, but ideally they should be a part of a separate stateful widget to maintain state.
  Widget _buildPayrollSection(String title, List<Widget> rows) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 205, 138, 50),
          ),
        ),
        SizedBox(height: 8.0),
        ...rows,
      ],
    );
  }

  Widget _buildTableRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 15.0),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 15.0),
          ),
        ],
      ),
    );
  }

  void setState(Null Function() param0) {}
}
