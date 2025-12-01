dart
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/info_field_card.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 24),
      children: [
        const DashboardHeader(title: 'Profile'),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'User Profile',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
  ),
              ),
              const SizedBox(height: 20),
              Center(
                child: CircleAvatar(
                  radius: 36,
                  backgroundColor: AppColors.primary,
                  child: const Text(
                    'RA',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 22),
              const InfoFieldCard(
                label: 'Name',
                value: 'Rahima Alam',
              ),
              const SizedBox(height: 12),
              const InfoFieldCard(
                label: 'Student ID',
                value: '2221577',
              ),
              const SizedBox(height: 12),
              const InfoFieldCard(
                label: 'Email',
 value: '2221577@iub.edu.bd',
              ),
              const SizedBox(height: 16),
              const _BioCard(),
            ],
          ),
        ),
      ],
    );
  }
}

class _BioCard extends StatelessWidget {
  const _BioCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            offset: const Offset(0, 4),
            color: Colors.black.withOpacity(0.06),
          ),
        ],
 ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Bio / Story',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.textSecondary,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '"I\'m currently focusing on my studies at IUB and building my skills in mobile app '
            'development. I enjoy working on practical projects that combine design and technology."',
            style: TextStyle(
              fontSize: 13,
              color: AppColors.textPrimary,
              height: 1.4,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '(Note: Students should replace the text above with their own description here.)',
            style: TextStyle(
              fontSize: 11,
              color: AppColors.danger,
      ),
          ),
        ],
      ),
    );
  }
}
