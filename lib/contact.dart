import 'package:flutter/material.dart';

import 'theme.dart';
import 'widgets.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ItaliaAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle('Get in Touch'),
            SizedBox(height: 8.0),
            Text(
              'We would love to hear from you. Visit us, call us or send us '
              'an email, and follow us on X and Facebook using the logos at '
              'the top of the page.',
              style: TextStyle(
                fontSize: 16.0,
                height: 1.5,
                color: AppColors.textMuted,
              ),
            ),
            SizedBox(height: 20.0),
            InfoCard(
              icon: Icons.location_on,
              color: AppColors.greenLight,
              title: 'Visit us',
              text: '12 Jalan Pizza, 93400 Kuching, Sarawak',
            ),
            InfoCard(
              icon: Icons.phone,
              color: AppColors.white,
              title: 'Call us',
              text: '+60 12-345 6789',
            ),
            InfoCard(
              icon: Icons.email,
              color: AppColors.redLight,
              title: 'Email us',
              text: 'hello@italiapidja.example.com',
            ),
            InfoCard(
              icon: Icons.access_time,
              color: AppColors.greenLight,
              title: 'Opening hours',
              text: 'Every day, 10:00 AM - 10:00 PM',
            ),
          ],
        ),
      ),
    );
  }
}
