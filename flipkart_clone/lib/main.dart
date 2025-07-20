import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gas Price Tracker',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool isSimulationMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cross-Chain Gas Price Tracker'),
        backgroundColor: Colors.blue,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Mode Toggle
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isSimulationMode = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isSimulationMode
                        ? Colors.grey
                        : Colors.blue,
                  ),
                  child: const Text('Live'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isSimulationMode = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isSimulationMode
                        ? Colors.blue
                        : Colors.grey,
                  ),
                  child: const Text('Simulate'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Candlestick Chart Placeholder
            Container(
              height: 300,
              color: Colors.grey[300],
              child: const Center(
                child: Text(
                  'Candlestick Chart (Placeholder)',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Cost Table (Visible in Simulation Mode)
            if (isSimulationMode)
              Expanded(
                child: Card(
                  elevation: 2,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Transaction Cost Simulation',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          decoration: const InputDecoration(
                            labelText: 'Enter ETH/MATIC Value',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Cost Comparison (USD)',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          child: ListView(
                            children: const [
                              ListTile(
                                title: Text('Ethereum'),
                                subtitle: Text('N/A'),
                              ),
                              ListTile(
                                title: Text('Polygon'),
                                subtitle: Text('N/A'),
                              ),
                              ListTile(
                                title: Text('Arbitrum'),
                                subtitle: Text('N/A'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
