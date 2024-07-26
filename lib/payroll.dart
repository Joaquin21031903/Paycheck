import 'package:flutter/material.dart';

class PayrollDetailsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Payroll Details',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PayrollDetailsPage(),
    );
  }
}

class PayrollDetailsPage extends StatefulWidget {
  @override
  _PayrollDetailsPageState createState() => _PayrollDetailsPageState();
}

class _PayrollDetailsPageState extends State<PayrollDetailsPage> {
  bool _payrollDetailsExpanded = false;
  bool _payrollElementsExpanded = false;
  bool _GrossExpanded = false;
  bool _payslipsExpanded = false;

  // Text editing controllers for deduction amounts
  TextEditingController _withholdingTaxController =
      TextEditingController(text: '');
  TextEditingController _sssContributionController =
      TextEditingController(text: '');
  TextEditingController _sssMpfContributionController =
      TextEditingController(text: '');
  TextEditingController _philhealthContributionController =
      TextEditingController(text: '');
  TextEditingController _hdmfContributionController =
      TextEditingController(text: '');

  // Text editing controllers for overtime and night differential
  TextEditingController _legalHolidayController =
      TextEditingController(text: '');
  TextEditingController _regularOvertimeController =
      TextEditingController(text: '');
  TextEditingController _restDaySpecialController =
      TextEditingController(text: '');
  TextEditingController _nightDifferentialController =
      TextEditingController(text: '');

  // Method to toggle the visibility of the 'DEDUCTIONS' section
  void _togglePayrollDetails() {
    setState(() {
      _payrollDetailsExpanded = !_payrollDetailsExpanded;
    });
  }

  // Method to toggle the visibility of the 'OVERTIME & NIGHT DIFFERENTIAL' section
  void _togglePayrollElements() {
    setState(() {
      _payrollElementsExpanded = !_payrollElementsExpanded;
    });
  }

//Method to toggle the visiibility of 'Gross & Night Differential' section
  void _toggleGross() {
    setState(() {
      _GrossExpanded = !_GrossExpanded;
    });
  }

  // Method to toggle the visibility of the 'Payslips' section
  void _togglePayslips() {
    setState(() {
      _payslipsExpanded = !_payslipsExpanded;
    });
  }

  // Method to compute total deductions
  double _computeTotalDeductions() {
    double withholdingTax =
        double.tryParse(_withholdingTaxController.text) ?? 0.0;
    double sssContribution =
        double.tryParse(_sssContributionController.text) ?? 0.0;
    double sssMpfContribution =
        double.tryParse(_sssMpfContributionController.text) ?? 0.0;
    double philhealthContribution =
        double.tryParse(_philhealthContributionController.text) ?? 0.0;
    double hdmfContribution =
        double.tryParse(_hdmfContributionController.text) ?? 0.0;

    return withholdingTax +
        sssContribution +
        sssMpfContribution +
        philhealthContribution +
        hdmfContribution;
  }

  // Method to compute total overtime
  double _computeTotalOvertime() {
    double legalHoliday = double.tryParse(_legalHolidayController.text) ?? 0.0;
    double regularOvertime =
        double.tryParse(_regularOvertimeController.text) ?? 0.0;
    double restDaySpecial =
        double.tryParse(_restDaySpecialController.text) ?? 0.0;
    double nightDifferential =
        double.tryParse(_nightDifferentialController.text) ?? 0.0;

    return legalHoliday * 2 +
        regularOvertime * 1.3 +
        restDaySpecial * 1.35 +
        nightDifferential * 0.1;
  }

  // Method to compute gross earnings
  double _computeGrossEarnings() {
    double totalOvertime = _computeTotalOvertime();
    double totalDeductions = _computeTotalDeductions();

    return totalOvertime - totalDeductions;
  }

  // Method to compute net pay
  double _computeNetPay() {
    double grossEarnings = _computeGrossEarnings();
    double totalDeductions = _computeTotalDeductions();

    return grossEarnings - totalDeductions;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF001F3F),
        title: Row(
          children: [
            Image.asset(
              'LOGO2.jpg',
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Deductions Section
              _buildCollapsibleSection(
                'DEDUCTIONS',
                _payrollDetailsExpanded,
                _togglePayrollDetails,
                [
                  _buildTableRow('Withholding Tax', _withholdingTaxController),
                  _buildTableRow(
                      'SSS Contribution', _sssContributionController),
                  _buildTableRow(
                      'SSS MPF Contribution', _sssMpfContributionController),
                  _buildTableRow('Philhealth Contribution',
                      _philhealthContributionController),
                  _buildTableRow(
                      'HDMF Contribution', _hdmfContributionController),
                  SizedBox(height: 8.0),
                  _buildTotalDeductionsRow(),
                ],
              ),
              SizedBox(height: 13.0),

              // Overtime & Night Differential Section
              _buildCollapsibleSection(
                'OVERTIME & NIGHT DIFFERENTIAL',
                _payrollElementsExpanded,
                _togglePayrollElements,
                [
                  _buildTableRow(
                      'Legal Holiday (200%)', _legalHolidayController),
                  _buildTableRow(
                      'Regular Overtime (130%)', _regularOvertimeController),
                  _buildTableRow(
                      'Rest Day/Special (135%)', _restDaySpecialController),
                  _buildTableRow(
                      'Night Differential (10%)', _nightDifferentialController),
                  _buildTotalOvertimeRow(),
                ],
              ),
              SizedBox(height: 15.0),

              // Gross & Net Pay Section
              _buildCollapsibleSection(
                'GROSS & NET PAY',
                _GrossExpanded,
                _toggleGross,
                // No need for a toggle here
                [
                  _buildTotalEarningsRow(
                      'Total Gross:', _computeGrossEarnings()),
                  _buildTotalEarningsRow('Total Net Pay:', _computeNetPay()),
                ],
              ),
              SizedBox(height: 16.0),

              // Payslips Section
              _buildCollapsibleSection(
                'Payslips',
                _payslipsExpanded,
                _togglePayslips,
                [
                  YearFilter(),
                  SizedBox(height: 16.0),
                  ..._buildPayslipRows(
                      '2024'), // Initial data for a selected year, change as needed
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method to build a collapsible section
  Widget _buildCollapsibleSection(String title, bool isExpanded,
      VoidCallback onTap, List<Widget> children) {
    return Card(
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: isExpanded
                          ? const Color.fromARGB(255, 7, 47, 80)
                          : const Color.fromARGB(255, 180, 130, 65),
                    ),
                  ),
                  Icon(
                    isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: isExpanded
                        ? const Color.fromARGB(255, 7, 47, 80)
                        : Color.fromARGB(255, 180, 130, 65),
                  ),
                ],
              ),
            ),
          ),
          if (isExpanded) ...children, // Expanded content including rows
        ],
      ),
    );
  }

  // Method to build a table row for deductions
  Widget _buildTableRow(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(
            width: 120,
            child: TextField(
              controller: controller,
              textAlign: TextAlign.end,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              style: TextStyle(fontSize: 16.0),
              onChanged: (_) {
                setState(() {});
              },
              decoration: InputDecoration(
                labelText: 'Enter Amount',
                contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Method to build total overtime row
  Widget _buildTotalOvertimeRow() {
    double totalOvertime = _computeTotalOvertime();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Total Overtime:',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          Text(
            '\₱${totalOvertime.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // Method to build total deductions row
  Widget _buildTotalDeductionsRow() {
    double totalDeductions = _computeTotalDeductions();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Total Deductions:',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          Text(
            '\₱${totalDeductions.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // Method to build total earnings row
  Widget _buildTotalEarningsRow(String label, double amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          Text(
            '\₱${amount.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // Method to build payslip rows based on selected year
  List<Widget> _buildPayslipRows(String year) {
    // Logic to build payslip rows for the selected year
    List<Widget> payslipRows = [
      // Example payslip rows
      ListTile(title: Text('January $year')),
      ListTile(title: Text('February $year')),
      ListTile(title: Text('March $year')),
      ListTile(title: Text('April $year')),
      ListTile(title: Text('May $year')),
      ListTile(title: Text('June $year')),
      ListTile(title: Text('July $year')),
      ListTile(title: Text('August $year')),
      ListTile(title: Text('September $year')),
      ListTile(title: Text('October $year')),
      ListTile(title: Text('November $year')),
    ];

    // Add Export to PDF button under December 2024 payslip
    payslipRows.add(ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('December $year'),
          ElevatedButton(
            onPressed: () {
              _exportToPdf('December $year');
            },
            child: Text('Export to Pdf'),
          ),
        ],
      ),
    ));

    return payslipRows;
  }

  // Method to export payslip to PDF
  void _exportToPdf(String payslipTitle) {
    // Implement PDF export logic here
    // Example: use a Flutter PDF library to generate and save a PDF
    // Placeholder code:
    // pdfLib.Document pdf = pdfLib.Document();
    // pdf.addPage(pdfLib.Page(
    //   build: (pdfLib.Context context) {
    //     return pdfLib.Center(
    //       child: pdfLib.Text('Payslip for $payslipTitle'),
    //     ); // Example content, replace with actual payslip details
    //   },
    // ));
    // // Save PDF logic
    // final String dir = (await getApplicationDocumentsDirectory()).path;
    // final String path = '$dir/payslip_$payslipTitle.pdf';
    // final File file = File(path);
    // await file.writeAsBytes(await pdf.save());
    // // Show a message or open the PDF
  }

  @override
  void dispose() {
    // Clean up your controllers
    _withholdingTaxController.dispose();
    _sssContributionController.dispose();
    _sssMpfContributionController.dispose();
    _philhealthContributionController.dispose();
    _hdmfContributionController.dispose();

    _legalHolidayController.dispose();
    _regularOvertimeController.dispose();
    _restDaySpecialController.dispose();
    _nightDifferentialController.dispose();

    super.dispose();
  }
}

// Year filter widget for filtering payslips by year
class YearFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Select Year:'),
        SizedBox(width: 8.0),
        DropdownButton<String>(
          items: ['2024', '2023', '2022'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (_) {},
          value: '2024', // Initial value, change as needed
        ),
      ],
    );
  }
}
