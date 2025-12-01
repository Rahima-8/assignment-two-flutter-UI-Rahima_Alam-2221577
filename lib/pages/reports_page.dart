dart
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/dashboard_header.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 24),
      children: const [
        DashboardHeader(title: 'Reports'),
        SizedBox(height: 6),
        _MonthlyReportCard(),
        SizedBox(height: 18),
        _SpendingBreakdownCard(),
      ],
    );
  }
}

class _MonthlyReportCard extends StatelessWidget {
  const _MonthlyReportCard();

  @override
  Widget build(BuildContext context) {
    return Padding(
 padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              blurRadius: 14,
              offset: const Offset(0, 6),
              color: Colors.black.withOpacity(0.06),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Monthly Spending Report',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Total Expenses (Last 30 days)',
              style: TextStyle(
                fontSize: 12,
  color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              '-\$1270.00',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.danger,
              ),
            ),
            const SizedBox(height: 6),
            Row(
              children: const [
                Icon(Icons.arrow_upward, size: 16, color: AppColors.danger),
                SizedBox(width: 4),
                Text(
                  'Up 12% from last month',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.danger,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
   ),
    );
  }
}

class _SpendingBreakdownCard extends StatelessWidget {
  const _SpendingBreakdownCard();

  @override
  Widget build(BuildContext context) {
    final items = [
      _CategoryData('Food & Drink', 450, 0.35),
      _CategoryData('Shopping', 320, 0.25),
      _CategoryData('Housing', 280, 0.22),
      _CategoryData('Transport', 150, 0.12),
      _CategoryData('Other', 70, 0.06),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              blurRadius: 14,
              offset: const Offset(0, 6),
              color: Colors.black.withOpacity(0.05),
            ),
  ],
        ),
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Spending Breakdown',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            for (final cat in items) ...[
              _CategoryRow(data: cat),
              const SizedBox(height: 12),
            ],
          ],
        ),
      ),
    );
  }
}

class _CategoryData {
  final String label;
  final double amount;
  final double ratio;
_CategoryData(this.label, this.amount, this.ratio);
}

class _CategoryRow extends StatelessWidget {
  final _CategoryData data;

  const _CategoryRow({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                data.label,
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                ),
              ),
            ),
            Text(
              '\$${data.amount.toStringAsFixed(0)} '
              '(${(data.ratio * 100).toStringAsFixed(0)}%)',
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
   color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            minHeight: 8,
            value: data.ratio,
            backgroundColor: const Color(0xFFE7E9F5),
          ),
        ),
      ],
    );
  }
}

