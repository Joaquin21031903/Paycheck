import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Homepage extends StatelessWidget {
  final List<Map<String, dynamic>> gridItems = [
    {
      'icon': Icons.person,
      'title': 'Personal Information',
      'subtitle': 'View personal information',
      'route': '/personalInformation',
      'color': Color(0xFF007AFF), // Bright blue
    },
    {
      'icon': Icons.attach_money,
      'title': 'Payslip',
      'subtitle': 'View payroll details',
      'route': '/payslip',
      'color': Color(0xFF34C759), // Bright green
    },
    {
      'icon': Icons.description,
      'title': 'Certifications',
      'subtitle': 'Generate government certificates',
      'route': '/certifications',
      'color': Color(0xFFFF9500), // Bright orange
    },
    {
      'icon': Icons.sick,
      'title': 'Sick Leave Request',
      'subtitle': 'Request sick leave',
      'route': '/sickLeaveRequest',
      'color': Color(0xFFFF3B30), // Bright red
    },
  ];

  final List<String> images = [
    'image1.jpg',
    'image2.jpg',
    'image3.jpg',
    'image4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF001F3F), // Dark blue
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
                    color: Color(0xFFF5BC71), // Light orange
                  ),
                ),
                Text(
                  'Next Generation Payroll for A New Era.',
                  style: TextStyle(
                    fontSize: 8,
                    color: Color(0xFFF5BC71), // Light orange
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Color(0xFF100B46), // Dark purple
              child: DrawerHeader(
                padding: EdgeInsets.zero,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 16.0),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(
                            'construction-worker-avatar-profile-colorful-vector-24396186.jpg'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'JOAQUIN S, SAQUITO ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Employee ID: 210931',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                          Text(
                            'Department: HR DEPARTMENT',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TableCalendar(
                      firstDay: DateTime.utc(2010, 10, 16),
                      lastDay: DateTime.utc(2030, 3, 14),
                      focusedDay: DateTime.now(),
                      calendarFormat: CalendarFormat.month,
                      headerStyle: HeaderStyle(
                        formatButtonVisible: false,
                        titleCentered: true,
                      ),
                      calendarStyle: CalendarStyle(
                        todayDecoration: BoxDecoration(
                          color: Color(0xFFFF9500), // Bright blue
                          shape: BoxShape.circle,
                        ),
                        selectedDecoration: BoxDecoration(
                          color: Color(0xFFFF9500), // Bright orange
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.help),
                    title: Text('Help'),
                    onTap: () {
                      // Handle help action
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                    onTap: () {
                      // Handle settings action
                      Navigator.pushNamed(context, '/settings');
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.exit_to_app),
                    title: Text('Sign Out'),
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/login', (route) => false);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: // Dark Blue
            Color.fromARGB(
                237, 37, 79, 124), // Set your desired background color here
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Hello,',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey[700],
                              ),
                            ),
                            Spacer(),
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: AssetImage(
                                  'construction-worker-avatar-profile-colorful-vector-24396186.jpg'),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'JOAQUIN S, SAQUITO 👋',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search...',
                                  prefixIcon: Icon(Icons.search),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            IconButton(
                              icon: Icon(Icons.settings),
                              onPressed: () {
                                // Navigate to the settings page
                                Navigator.pushNamed(context, '/settings');
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: gridItems.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, gridItems[index]['route']);
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 5,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              gridItems[index]['icon'],
                              size: 50,
                              color: gridItems[index]['color'],
                            ),
                            SizedBox(height: 8),
                            Text(
                              gridItems[index]['title'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 4),
                            Text(
                              gridItems[index]['subtitle'],
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 20),
                Container(
                  height: 350, // Increased height for a larger poster
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromARGB(
                                  255, 255, 255, 255), // Color of the border
                              width: 2.0, // Width of the border
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              images[index],
                              width: 300, // Increased width for larger images
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
