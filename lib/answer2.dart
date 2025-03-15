import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ShippingCalculatorScreen(),
    );
  }
}

class ShippingCalculatorScreen extends StatefulWidget {
  const ShippingCalculatorScreen({super.key});

  @override
  _ShippingCalculatorScreenState createState() =>
      _ShippingCalculatorScreenState();
}

class _ShippingCalculatorScreenState extends State<ShippingCalculatorScreen> {
  final TextEditingController _weightController = TextEditingController();
  String _selectedDistance = "ในเมือง";

  bool _extraPackage = false;
  bool _insurance = false;

  String _selectedSpeed = "ปกติ";
  //String _selectedExpress = "ด่วนพิเศษ";
  double _totalCost = 0.0;

  void _calculateShippingCost() {
    double baseCost = 0.0;
    double weight = double.tryParse(_weightController.text) ?? 0.0;

    if (weight > 0) {
      if (_selectedDistance == "ในเมือง") {
        baseCost = weight * 10;
      } else if (_selectedDistance == "ต่างจังหวัด") {
        baseCost = weight * 15;
      } else if (_selectedDistance == "ต่างประเทศ") {
        baseCost = weight * 50;
      }
    }

//คำนวณค่าบริการเสริม
    if (_extraPackage) baseCost += 20;
    if (_insurance) baseCost += 50;

    //คำนวณค่าความเร่งด่วน
    if (_selectedSpeed == "ด่วน") baseCost += 30;
    if (_selectedSpeed == "ด่วนพิเศษ") baseCost += 50;

    setState(() {
      _totalCost = baseCost;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("คำนวณค่าจัดส่ง")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("น้ำหนักสินค้า (กก.):"),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),
            const Text("เลือกระยะทาง:"),
            DropdownButton<String>(
              value: _selectedDistance,
              isExpanded: true,
              items:
                  ["ในเมือง", "ต่างจังหวัด", "ต่างประเทศ"].map((String value) {
                return DropdownMenuItem(value: value, child: Text(value));
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedDistance = newValue!;
                });
              },
            ),
            const SizedBox(height: 10),
            const Text("บริการเสริม:"),
            CheckboxListTile(
              title: const Text("แพ็คกิ้งพิเศษ (+20 บาท)"),
              value: _extraPackage,
              onChanged: (bool? value) {
                setState(() {
                  _extraPackage = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("ประกันพัสดุ (+50 บาท)"),
              value: _insurance,
              onChanged: (bool? value) {
                setState(() {
                  _insurance = value!;
                });
              },
            ),
            const SizedBox(height: 10),
            const Text("เลือกความเร่งด่วน:"),
            RadioListTile(
              title: const Text("ปกติ"),
              value: "ปกติ",
              groupValue: _selectedSpeed,
              onChanged: (value) {
                setState(() {
                  _selectedSpeed = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text("ด่วน"),
              value: "ด่วน",
              groupValue: _selectedSpeed,
              onChanged: (value) {
                setState(() {
                  _selectedSpeed = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text("ด่วนพิเศษ"),
              value: "ด่วนพิเศษ",
              groupValue: _selectedSpeed,
              onChanged: (value) {
                setState(() {
                  _selectedSpeed = value.toString();
                });
              },
            ),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: _calculateShippingCost,
                child: const Text("คำนวณราคา"),
              ),
            ),
            const SizedBox(height: 10),
            if (_totalCost > 0)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                color: Colors.blue,
                child: Text(
                  "ค่าจัดส่งทั้งหมด: ฿${_totalCost.toStringAsFixed(1)}",
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
