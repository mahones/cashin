import 'package:biz_manager_app/core/theme/colors.dart';
import 'package:biz_manager_app/widgets/profil_widget.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

enum AnalysisPeriod { daily, weekly, monthly, annual }

class FinanceDashboard extends StatefulWidget {
  const FinanceDashboard({Key? key}) : super(key: key);

  @override
  State<FinanceDashboard> createState() => _FinanceDashboardState();
}

class _FinanceDashboardState extends State<FinanceDashboard> {
  AnalysisPeriod selectedPeriod = AnalysisPeriod.daily;

  // Données simulées pour chaque période
  final Map<AnalysisPeriod, List<FlSpot>> entriesData = {
    AnalysisPeriod.daily: [
      const FlSpot(0, 50000),
      const FlSpot(4, 60000),
      const FlSpot(8, 45000),
      const FlSpot(12, 70000),
      const FlSpot(16, 55000),
      const FlSpot(20, 65000),
      const FlSpot(24, 58000),
    ],
    AnalysisPeriod.weekly: [
      const FlSpot(0, 200000),
      const FlSpot(1, 250000),
      const FlSpot(2, 180000),
      const FlSpot(3, 220000),
      const FlSpot(4, 240000),
    ],
    AnalysisPeriod.monthly: [
      const FlSpot(0, 800000),
      const FlSpot(1, 900000),
      const FlSpot(2, 750000),
      const FlSpot(3, 950000),
      const FlSpot(4, 880000),
      const FlSpot(5, 920000),
    ],
    AnalysisPeriod.annual: [
    const FlSpot(0, 9500000),
    const FlSpot(1, 10200000),
    const FlSpot(2, 9800000),
    const FlSpot(3, 11000000),
    const FlSpot(4, 10500000),
    const FlSpot(5, 11200000),
  ],
  };

  final Map<AnalysisPeriod, List<FlSpot>> expensesData = {
    AnalysisPeriod.daily: [
      const FlSpot(0, 30000),
      const FlSpot(4, 40000),
      const FlSpot(8, 35000),
      const FlSpot(12, 45000),
      const FlSpot(16, 38000),
      const FlSpot(20, 42000),
      const FlSpot(24, 36000),
    ],
    AnalysisPeriod.weekly: [
      const FlSpot(0, 150000),
      const FlSpot(1, 180000),
      const FlSpot(2, 140000),
      const FlSpot(3, 160000),
      const FlSpot(4, 170000),
    ],
    AnalysisPeriod.monthly: [
      const FlSpot(0, 600000),
      const FlSpot(1, 650000),
      const FlSpot(2, 580000),
      const FlSpot(3, 700000),
      const FlSpot(4, 620000),
      const FlSpot(5, 670000),
    ],
     AnalysisPeriod.annual: [
    const FlSpot(0, 7000000),
    const FlSpot(1, 7500000),
    const FlSpot(2, 7200000),
    const FlSpot(3, 8000000),
    const FlSpot(4, 7800000),
    const FlSpot(5, 8200000),
  ],
  };

  Map<AnalysisPeriod, String> periodTitles = {
    AnalysisPeriod.daily: 'Quotidienne',
    AnalysisPeriod.weekly: 'Hebdomadaire',
    AnalysisPeriod.monthly: 'Mensuelle',
    AnalysisPeriod.annual: 'Annuelle',
  };

  double getMaxY() {
    double maxEntry = entriesData[selectedPeriod]!
        .map((spot) => spot.y)
        .reduce((max, value) => max > value ? max : value);
    double maxExpense = expensesData[selectedPeriod]!
        .map((spot) => spot.y)
        .reduce((max, value) => max > value ? max : value);
    return (maxEntry > maxExpense ? maxEntry : maxExpense) * 1.2;
  }

  double getMaxX() {
    return entriesData[selectedPeriod]!.last.x;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                const ProfileHeader(name: 'S. Amah Mahones', date: '20 Décembre 2024'),
                const SizedBox(height: 24),
                
                // Analyses Title
                const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                     top: 10,
                     bottom: 10,
                      ),
                    child: Text(
                    'Analyse',
                    style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 24, 24, 24),
                    
                        ),),
                    ),
                ],
              ),
              
                const SizedBox(height: 16),
                
                // Filter Chips
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: AnalysisPeriod.values.map((period) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: FilterChip(
                          selected: selectedPeriod == period,
                          label: Text(periodTitles[period]!),
                          onSelected: (bool value) {
                            setState(() {
                              selectedPeriod = period;
                            });
                          },
                          showCheckmark: false,
                          backgroundColor: Colors.white,
                          selectedColor: AppColors.primary,
                          labelStyle: TextStyle(
                            color: selectedPeriod == period
                                ? Colors.white
                                : AppColors.primary,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              // Supprimer ou changer la couleur du contour ici
                              side: BorderSide(color: AppColors.primary),
                            ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 24),
                
                // Statistics Card
                Container(
                  height: 300,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                              Text(
                                'Entrées',
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                '50 000 FCFA',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children:  [
                              Text(
                                'Sorties',
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                '40 000 FCFA',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Expanded(
                        child: LineChart(
                          LineChartData(
                            gridData: FlGridData(show: false),
                            titlesData: FlTitlesData(show: false),
                            borderData: FlBorderData(show: false),
                            minX: 0,
                            maxX: getMaxX(),
                            minY: 0,
                            maxY: getMaxY(),
                            lineBarsData: [
                              // Ligne des entrées
                              LineChartBarData(
                                spots: entriesData[selectedPeriod]!,
                                isCurved: true,
                                color: Colors.green,
                                barWidth: 3,
                                dotData: FlDotData(show: false),
                                belowBarData: BarAreaData(
                                  show: true,
                                  color: Colors.green.withOpacity(0.1),
                                ),
                              ),
                              // Ligne des sorties
                              LineChartBarData(
                                spots: expensesData[selectedPeriod]!,
                                isCurved: true,
                                color: Colors.red,
                                barWidth: 3,
                                dotData: FlDotData(show: false),
                                belowBarData: BarAreaData(
                                  show: true,
                                  color: Colors.red.withOpacity(0.1),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Transactions List
                const SizedBox(height: 24),
                const Text(
                  'Transactions',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: Icon(Icons.receipt, color: Colors.white),
                        ),
                        title: Text(
                          index % 2 == 0 ? 'Une Entrée' : 'Une Sortie',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: const Text('20 sep 2024'),
                        trailing: Text(
                          '${index % 2 == 0 ? '+' : '-'} 200 000 fcfa',
                          style: TextStyle(
                            color: index % 2 == 0 ? Colors.green : Colors.red,
                            fontWeight: FontWeight.bold,
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

    );
  }
}