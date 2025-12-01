dart
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/dashboard_header.dart';

class CardsPage extends StatelessWidget {
  const CardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 24),
      children: [
        const DashboardHeader(title: 'Cards'),
        const SizedBox(height: 6),
        const _MyCardsTitle(),
        const SizedBox(height: 10),
        const _MainCard(),
        const SizedBox(height: 18),
        const _CardActionRow(),
        const SizedBox(height: 18),
        const _LinkedAccountsSection(),
      ],
    );
  }
}

class _MyCardsTitle extends StatelessWidget {
  const _MyCardsTitle();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.0),
      child: Text(
        'My Cards',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }
}

class _MainCard extends StatelessWidget {
  const _MainCard();
@override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Container(
        height: 190,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [Color(0xFF1E2749), Color(0xFF050814)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 18,
              offset: const Offset(0, 10),
              color: Colors.black.withOpacity(0.3),
            ),
          ],
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
// top row: chip + BANK
            Row(
              children: [
                Container(
                  width: 34,
                  height: 24,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFC54D),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                const Spacer(),
                const Text(
                  'BANK',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const Spacer(),
            const Text(
              '4567  ****  ****  1234',
 style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                letterSpacing: 2,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                _CardDetailColumn(
                  label: 'CARD HOLDER',
                  value: 'RAHIMA ALAM',
                ),
                _CardDetailColumn(
                  label: 'EXPIRES',
                  value: '12/28',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _CardDetailColumn extends StatelessWidget {
  final String label;
  final String value;

  const _CardDetailColumn({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 10,
color: Colors.white54,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _CardActionRow extends StatelessWidget {
  const _CardActionRow();

  @override
  Widget build(BuildContext context) {
    return Padding(
 padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        children: const [
          _CardActionButton(
            icon: Icons.block,
            label: 'Block',
          ),
          _CardActionButton(
            icon: Icons.info_outline,
            label: 'Details',
          ),
          _CardActionButton(
            icon: Icons.tune,
            label: 'Limit',
          ),
        ],
      ),
    );
  }
}
class _CardActionButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const _CardActionButton({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              blurRadius: 12,
              offset: const Offset(0, 4),
              color: Colors.black.withOpacity(0.06),
            ),
  ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 22, color: AppColors.primaryDark),
            const SizedBox(height: 6),
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LinkedAccountsSection extends StatelessWidget {
  const _LinkedAccountsSection();
class _LinkedAccountsSection extends StatelessWidget {
  const _LinkedAccountsSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Linked Accounts',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(16),
 boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                  color: Colors.black.withOpacity(0.04),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFFE9F0FF),
                    border: Border.all(
                      color: const Color(0xFFD0DAFF),
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.savings_outlined,
   size: 18,
                      color: AppColors.primaryDark,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Shared Savings',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      '\$5,500.00',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
   ),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.arrow_forward_ios,
                    size: 16, color: AppColors.textSecondary),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


