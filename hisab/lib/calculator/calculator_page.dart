import 'package:flutter/material.dart';
import 'package:hisab/calculator/calculator_provider.dart';
import 'package:provider/provider.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final List<TextEditingController> _priceControllers = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _syncControllers();
  }

  void _syncControllers() {
    final calculatorProvider =
        Provider.of<CalculatorProvider>(context, listen: false);

    // Clear and recreate controllers to match item count
    _priceControllers.clear();
    for (var item in calculatorProvider.items) {
      TextEditingController controller =
          TextEditingController(text: item.price.toString());
      _priceControllers.add(controller);
    }
  }

  @override
  Widget build(BuildContext context) {
    final calculatorProvider = Provider.of<CalculatorProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Total Amount
            Text(
              'Total Amount: \$${calculatorProvider.totalAmount.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Table Header
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Item',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  Text('Price (\$)',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 5),

            // List of Items
            Expanded(
              child: ListView.builder(
                itemCount: calculatorProvider.items.length,
                itemBuilder: (context, index) {
                  // Ensure controllers list is in sync
                  if (index >= _priceControllers.length) {
                    _priceControllers.add(TextEditingController(
                        text:
                            calculatorProvider.items[index].price.toString()));
                  }

                  return Dismissible(
                    key: Key(calculatorProvider.items[index].name),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    onDismissed: (direction) {
                      calculatorProvider.removeItem(index);
                      _priceControllers.removeAt(index);
                      setState(() {}); // Refresh UI
                    },
                    child: Card(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // Item Name
                            Expanded(
                              child: Text(
                                calculatorProvider.items[index].name,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),

                            // Price Input
                            SizedBox(
                              width: 100,
                              child: TextField(
                                controller: _priceControllers[index],
                                keyboardType: TextInputType.number,
                                decoration:
                                    const InputDecoration(hintText: '0.0'),
                                onChanged: (value) {
                                  double price = double.tryParse(value) ?? 0.0;
                                  calculatorProvider.updateItemPrice(
                                      index, price);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Add New Item Button
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () =>
                        _showAddItemDialog(context, calculatorProvider),
                    icon: const Icon(Icons.add),
                    label: const Text("Add Item"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Show Dialog to Enter Item Name
  void _showAddItemDialog(
      BuildContext context, CalculatorProvider calculatorProvider) {
    final TextEditingController itemController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Enter Item Name"),
          content: TextField(
            controller: itemController,
            decoration: const InputDecoration(labelText: "Item Name"),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                if (itemController.text.isNotEmpty) {
                  calculatorProvider.addItem(itemController.text, 0.0);
                  _priceControllers.add(TextEditingController(text: "0.0"));
                  Navigator.pop(context);
                  setState(() {}); // Ensure UI updates
                }
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }
}
