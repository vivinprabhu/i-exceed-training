import 'package:flutter/material.dart';

class InsuranceCalculatorPage extends StatefulWidget {
  const InsuranceCalculatorPage({Key? key}) : super(key: key);

  @override
  State<InsuranceCalculatorPage> createState() => _InsuranceCalculatorPageState();
}

class _InsuranceCalculatorPageState extends State<InsuranceCalculatorPage> {
  final _formKey = GlobalKey<FormState>();

  String selectedInsurance = 'Home Insurance';
  final Map<String, dynamic> formData = {};

  double? estimatedPrice;

  final List<String> insuranceTypes = [
    'Home Insurance',
    'Vehicle Insurance',
    'Term Insurance',
    'Health Insurance',
  ];

  void calculatePrice() {
    double basePrice = 0;

    switch (selectedInsurance) {
      case 'Home Insurance':
        basePrice = (formData['value'] ?? 0) * 0.002;
        break;
      case 'Vehicle Insurance':
        basePrice = (formData['vehicleValue'] ?? 0) * 0.015;
        break;
      case 'Term Insurance':
        basePrice = ((formData['age'] ?? 0) * (formData['sum'] ?? 0)) * 0.0002;
        break;
      case 'Health Insurance':
        basePrice = ((formData['age'] ?? 0) + (formData['members'] ?? 0) * 1000) * 1.2;
        break;
    }

    setState(() {
      estimatedPrice = basePrice;
    });
  }

  Widget getInputFields() {
    switch (selectedInsurance) {
      case 'Home Insurance':
        return Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Home Value (in ₹)'),
              keyboardType: TextInputType.number,
              onSaved: (value) => formData['value'] = double.tryParse(value ?? '0') ?? 0,
              validator: (value) => (value == null || value.isEmpty) ? 'Enter value' : null,
            ),
          ],
        );

      case 'Vehicle Insurance':
        return Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Vehicle Value (in ₹)'),
              keyboardType: TextInputType.number,
              onSaved: (value) => formData['vehicleValue'] = double.tryParse(value ?? '0') ?? 0,
              validator: (value) => (value == null || value.isEmpty) ? 'Enter value' : null,
            ),
          ],
        );

      case 'Term Insurance':
        return Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
              onSaved: (value) => formData['age'] = int.tryParse(value ?? '0') ?? 0,
              validator: (value) => (value == null || value.isEmpty) ? 'Enter age' : null,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Sum Assured (in ₹)'),
              keyboardType: TextInputType.number,
              onSaved: (value) => formData['sum'] = double.tryParse(value ?? '0') ?? 0,
              validator: (value) => (value == null || value.isEmpty) ? 'Enter amount' : null,
            ),
          ],
        );

      case 'Health Insurance':
        return Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Your Age'),
              keyboardType: TextInputType.number,
              onSaved: (value) => formData['age'] = int.tryParse(value ?? '0') ?? 0,
              validator: (value) => (value == null || value.isEmpty) ? 'Enter age' : null,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Number of Family Members'),
              keyboardType: TextInputType.number,
              onSaved: (value) => formData['members'] = int.tryParse(value ?? '0') ?? 0,
              validator: (value) => (value == null || value.isEmpty) ? 'Enter members' : null,
            ),
          ],
        );

      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Insurance Calculator"),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                value: selectedInsurance,
                items: insuranceTypes.map((type) {
                  return DropdownMenuItem(value: type, child: Text(type));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedInsurance = value!;
                    estimatedPrice = null;
                  });
                },
                decoration: const InputDecoration(labelText: 'Select Insurance Type'),
              ),
              const SizedBox(height: 20),
              getInputFields(),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    calculatePrice();
                  }
                },
                child: const Text('Calculate Price'),
              ),
              const SizedBox(height: 30),
              if (estimatedPrice != null)
                Text(
                  "Estimated Premium: ₹${estimatedPrice!.toStringAsFixed(2)}",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
            ],
          ),
        ),
      ),
    );
  }
}