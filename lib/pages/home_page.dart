dart
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/quick_action_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 24),
      children: [
        const DashboardHeader(title: 'Home'),
        const SizedBox(height: 4),
        const _BalanceCard(),
        const SizedBox(height: 18),
        const _QuickActionsRow(),
        const SizedBox(height: 18),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Row(
            children: [
              const Text(
'Recent Transactions',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              const Spacer(),
              Text(
                'View All',
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.primaryDark.withOpacity(0.9),
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 8),
        const _TransactionList(),
      ],
    );
  }
}

class _BalanceCard extends StatelessWidget {
  const _BalanceCard();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          gradient: const LinearGradient(
            colors: [AppColors.primary, AppColors.primaryDark],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.35),
              blurRadius: 18,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Total Balance',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 6),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text(
                  '\$8,945',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 2),
                Text(
                  '.32',
                  style: TextStyle(
 color: Colors.white70,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: const [
                Text(
                  'Savings: \$5,500',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                Text(
                  'Last 30 days: +\$300',
                  style: TextStyle(
                    color: Color(0xFFB8FFCB),
                    fontSize: 13,
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

class _QuickActionsRow extends StatelessWidget {
  const _QuickActionsRow();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          QuickActionButton(
            icon: Icons.sync_alt,
            label: 'Transfer',
          ),
 QuickActionButton(
            icon: Icons.receipt_long_outlined,
            label: 'Pay Bills',
          ),
          QuickActionButton(
            icon: Icons.trending_up,
            label: 'Invest',
          ),
        ],
      ),
    );
  }
}

class _TransactionList extends StatelessWidget {
  const _TransactionList();

  @override
  Widget build(BuildContext context) {
    final items = [
      _TransactionData(
        title: 'Netflix Subscription',
        subtitle: 'Entertainment · Today',
        amount: '-\$19.99',
        isCredit: false,
  ),
      _TransactionData(
        title: 'Coffee Shop',
        subtitle: 'Food & Drink · Today',
        amount: '-\$4.50',
        isCredit: false,
      ),
      _TransactionData(
        title: 'Salary Deposit',
        subtitle: 'Income · Yesterday',
        amount: '+\$3500.00',
        isCredit: true,
      ),
      _TransactionData(
        title: 'Grocery Store',
        subtitle: 'Shopping · Yesterday',
        amount: '-\$55.80',
        isCredit: false,
      ),
      _TransactionData(
        title: 'Amazon Purchase',
        subtitle: 'Shopping · 2 days ago',
        amount: '-\$120.45',
        isCredit: false,
      ),
 ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        children: [
          for (final tx in items) ...[
            _TransactionTile(data: tx),
            const SizedBox(height: 6),
          ]
        ],
      ),
    );
  }
}

class _TransactionData {
  final String title;
  final String subtitle;
  final String amount;
  final bool isCredit;

  _TransactionData({
    required this.title,
    required this.subtitle,
    required this.amount,
 required this.isCredit,
  });
}

class _TransactionTile extends StatelessWidget {
  final _TransactionData data;

  const _TransactionTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
 children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F3FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.shopping_bag,
                size: 20, color: AppColors.primary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
 data.subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            data.amount,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: data.isCredit ? AppColors.success : AppColors.danger,
            ),
          ),
        ],
      ),
    );
  }
}
