import 'package:flutter/material.dart';
import './transfersuccess.dart';

void main() => runApp(BillPaymentApp());

class BillPaymentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BillPaymentPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BillPaymentPage extends StatefulWidget {
  @override
  _BillPaymentPageState createState() => _BillPaymentPageState();
}

class _BillPaymentPageState extends State<BillPaymentPage> {
  final TextEditingController accountController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  String? selectedBiller;
  String? selectedSupplier;
  String? selectedSimType;
  String? selectedPlan;
  String? selectedOperator;

  final Map<String, IconData> billersWithIcons = {
    'Electricity': Icons.flash_on,
    'Water': Icons.water_drop,
    'Gas': Icons.local_gas_station,
    'Broadband': Icons.wifi,
    'FASTag Recharge': Icons.directions_car,
    'Recharge': Icons.phone_android,
  };

  final List<String> electricitySuppliers = ['BESCOM', 'TNEB', 'MSEB', 'DHBVN', 'UPPCL'];
  final List<String> waterSuppliers = ['BWSSB', 'Banglore city Board', 'Karnataka Water Supply Board'];
  final List<String> gasSuppliers = ['Indane', 'Bharat Gas', 'HP Gas'];
  final List<String> broadbandOperators = ['ACT Fibernet', 'Airtel Xstream', 'Jio Fiber'];
  final List<String> simTypes = ['Prepaid', 'Postpaid'];
  final List<String> rechargePlans = ['₹149 - 28 Days', '₹249 - 1 GB/day', '₹399 - 2 GB/day'];
  final List<String> operators = ['BSNL', 'Jio', 'Airtel'];

  bool billFetched = false;
  double? dueAmount;
  String dueDate = '30-06-2025';

  void fetchBill() {
    if (selectedBiller == null) {
      showSnackBar('Please select a biller');
      return;
    }

    if (nameController.text.isEmpty) {
      showSnackBar('Please enter your name');
      return;
    }

    if (['Electricity', 'Water', 'Gas', 'Broadband'].contains(selectedBiller)) {
      if (selectedSupplier == null || accountController.text.isEmpty) {
        showSnackBar('Please select supplier/operator and enter account number');
        return;
      }
    }

    if (selectedBiller == 'Recharge') {
      if (phoneController.text.isEmpty || selectedSimType == null || selectedOperator == null || selectedPlan == null) {
        showSnackBar('Please enter phone number, SIM type, operator, and plan');
        return;
      }
    }

    if (selectedBiller == 'FASTag Recharge' && accountController.text.isEmpty) {
      showSnackBar('Please enter vehicle number');
      return;
    }

    setState(() {
      billFetched = true;
      dueAmount = {
        'Electricity': 528.75,
        'Water': 182.00,
        'Gas': 316.50,
        'Broadband': 499.00,
        'FASTag Recharge': 100.00,
        'Recharge': double.tryParse(selectedPlan?.split('₹').last.split(' ').first ?? '0') ?? 0.0,
      }[selectedBiller];
    });
  }

  void showSnackBar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  void dispose() {
    accountController.dispose();
    phoneController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bill Payment'),
        backgroundColor: Color.fromARGB(255, 30, 60, 100),
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select Biller', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            SizedBox(height: 12),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: billersWithIcons.entries.map((entry) {
                final isSelected = selectedBiller == entry.key;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedBiller = entry.key;
                      selectedSupplier = null;
                      billFetched = false;
                      accountController.clear();
                      phoneController.clear();
                      nameController.clear();
                      selectedSimType = null;
                      selectedPlan = null;
                      selectedOperator = null;
                    });
                  },
                  child: Container(
                    width: 100,
                    height: 90,
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.indigo.shade100 : Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected ? Color.fromARGB(255, 30, 60, 100) : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(child: Icon(entry.value, size: 30, color: Color.fromARGB(255, 30, 60, 100))),
                          SizedBox(height: 8),
                          Text(entry.key, textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 24),

            if (selectedBiller != null) buildTextField('Name', nameController, TextInputType.name),

            if (selectedBiller == 'Electricity') buildDropdown('Select Supplier', electricitySuppliers),
            if (selectedBiller == 'Water') buildDropdown('Select Water Supplier', waterSuppliers),
            if (selectedBiller == 'Gas') buildDropdown('Select Gas Supplier', gasSuppliers),
            if (selectedBiller == 'Broadband') buildDropdown('Select Broadband Operator', broadbandOperators),

            if (selectedBiller == 'Recharge') ...[
              buildTextField('Phone Number', phoneController, TextInputType.phone),
              buildDropdown('SIM Type', simTypes, isSimType: true),
              buildDropdown('Operator', operators, isOperator: true),
              buildDropdown('Select Plan', rechargePlans, isPlan: true),
            ],

            if (selectedBiller != null && selectedBiller != 'Recharge') ...[
              Text(
                selectedBiller == 'FASTag Recharge' ? 'Vehicle Number' : 'Account / Consumer Number',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              TextField(
                controller: accountController,
                decoration: InputDecoration(
                  hintText: 'Enter number',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 30, 60, 100), width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 30, 60, 100), width: 2),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 30, 60, 100)),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],

            ElevatedButton(
              onPressed: fetchBill,
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 45),
                backgroundColor: Colors.white,
                foregroundColor: Color.fromARGB(255, 30, 60, 100),
              ),
              child: Text(
                'Fetch Bill',
                style: TextStyle(
                  color: Color.fromARGB(255, 30, 60, 100),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            if (billFetched && dueAmount != null) ...[
              SizedBox(height: 30),
              Card(
                elevation: 3,
                margin: EdgeInsets.only(bottom: 20),
                child: ListTile(
                  leading: Icon(Icons.receipt_long, color: Color.fromARGB(255, 30, 60, 100)),
                  title: Text('Due Amount: ₹${dueAmount!.toStringAsFixed(2)}'),
                  subtitle: Text(
                    selectedBiller == 'Recharge'
                        ? 'Operator: $selectedOperator \n Plan: $selectedPlan'
                        : selectedBiller == 'FASTag Recharge'
                        ? 'Vehicle Number: ${accountController.text}'
                        : 'Due Date: $dueDate',
                  ),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () async {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Row(
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(width: 20),
                            Text("Processing..."),
                          ],
                        ),
                      );
                    },
                  );

                  await Future.delayed(Duration(seconds: 2));
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TransferSuccessPage(
                        amount: dueAmount!.toStringAsFixed(2),
                        beneficiary: nameController.text,
                        biller: selectedBiller!,
                        supplier: selectedSupplier,
                        accountNumber: (selectedBiller == 'FASTag Recharge' || selectedBiller != 'Recharge')
                            ? accountController.text
                            : null,
                        phoneNumber: selectedBiller == 'Recharge' ? phoneController.text : null,
                        simType: selectedSimType,
                        operator: selectedOperator,
                        plan: selectedPlan,
                        dueDate: selectedBiller == 'Recharge' ? null : dueDate,
                      ),
                    ),
                  );
                },
                icon: Icon(Icons.payment),
                label: Text('Pay Now'),
              )
            ],
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller, TextInputType type) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: type,
          decoration: InputDecoration(
            hintText: 'Enter $label',
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 30, 60, 100), width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 30, 60, 100), width: 1),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 30, 60, 100)),
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget buildDropdown(String label, List<String> options,
      {bool isSimType = false, bool isPlan = false, bool isOperator = false}) {
    String? selectedValue;
    if (isSimType) selectedValue = selectedSimType;
    else if (isPlan) selectedValue = selectedPlan;
    else if (isOperator) selectedValue = selectedOperator;
    else selectedValue = selectedSupplier;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: selectedValue,
          items: options.map((value) => DropdownMenuItem(child: Text(value), value: value)).toList(),
          onChanged: (value) {
            setState(() {
              if (isSimType) selectedSimType = value;
              else if (isPlan) selectedPlan = value;
              else if (isOperator) selectedOperator = value;
              else selectedSupplier = value;
            });
          },
          decoration: InputDecoration(
            hintText: 'Enter $label',
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 30, 60, 100), width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 30, 60, 100), width: 1),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 30, 60, 100)),
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
