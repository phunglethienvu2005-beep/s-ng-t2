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
      title: 'Profile UI - Buổi 4',
      theme: ThemeData(
        fontFamily: 'Inter',
        scaffoldBackgroundColor: const Color(0xFFF8F9FD),
        useMaterial3: true,
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FD),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // --- 1. Top Navigation Bar ---
                  _buildTopBar(context),
                  const SizedBox(height: 24),

                  // --- 2. Avatar with Gradient Border & Verified Badge ---
                  _buildAvatarSection(),
                  const SizedBox(height: 14),

                  // Name & Title
                  const Text(
                    'Thiên Vũ',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF0F172A),
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Lead Mobile Engineer',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF64748B),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Location Tag
                  _buildLocationChip('Hồ Chí Minh'),
                  const SizedBox(height: 24),

                  // --- 3. Stats Card ---
                  _buildStatsCard(),
                  const SizedBox(height: 24),

                  // --- 4. About Me Section ---
                  _buildSectionHeader('About Me'),
                  const SizedBox(height: 8),
                  const Text(
                    'Passionate Lead Mobile Engineer specialized in Flutter, Dart, and building high-performance cross-platform applications. Focused on elegant architecture, smooth animations, and clean code.',
                    style: TextStyle(
                      fontSize: 13.5,
                      height: 1.55,
                      color: Color(0xFF64748B),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // --- 5. Skills & Expertise Section ---
                  _buildSectionHeader('Skills & Expertise'),
                  const SizedBox(height: 12),
                  _buildSkillsSection(),
                  const SizedBox(height: 24),

                  // --- 6. Featured Projects Section ---
                  _buildSectionHeader('Featured Projects'),
                  const SizedBox(height: 12),
                  _buildFeaturedProjects(),
                  const SizedBox(height: 24),

                  // --- 7. Contact Information Card ---
                  _buildContactCard(),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // 1. Top Bar Widget
  Widget _buildTopBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildCircularButton(
          icon: Icons.chevron_left_rounded,
          onTap: () {},
        ),
        const Text(
          'Profile',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xFF0F172A),
          ),
        ),
        _buildCircularButton(
          icon: Icons.share_outlined,
          size: 19,
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildCircularButton({
    required IconData icon,
    double size = 22,
    required VoidCallback onTap,
  }) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFF1F5F9), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Icon(icon, size: size, color: const Color(0xFF1E293B)),
        ),
      ),
    );
  }

  // 2. Avatar with Gradient Border & Badge
  Widget _buildAvatarSection() {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          // Gradient Circle Ring
          Container(
            width: 120,
            height: 120,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: SweepGradient(
                colors: [
                  Color(0xFFFB923C), // Amber/Orange
                  Color(0xFFF43F5E), // Coral/Pink
                  Color(0xFF60A5FA), // Light Blue
                  Color(0xFFFB923C), // Back to Orange
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0), // Gap between border and avatar
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/avatar.png',
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.network(
                          'avatar.png',
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                          errorBuilder: (context, error2, stackTrace2) {
                            return Container(
                              color: const Color(0xFFE2E8F0),
                              child: const Icon(
                                Icons.person,
                                size: 55,
                                color: Color(0xFF94A3B8),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Blue Verified Badge at Bottom-Right
          Positioned(
            right: 4,
            bottom: 4,
            child: Container(
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                color: const Color(0xFF0284C7), // Blue badge
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2.5),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF0284C7).withValues(alpha: 0.3),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Icon(
                Icons.check_rounded,
                color: Colors.white,
                size: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Location Chip
  Widget _buildLocationChip(String location) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.location_on_outlined,
            size: 15,
            color: Color(0xFF64748B),
          ),
          const SizedBox(width: 4),
          Text(
            location,
            style: const TextStyle(
              fontSize: 12.5,
              fontWeight: FontWeight.w500,
              color: Color(0xFF475569),
            ),
          ),
        ],
      ),
    );
  }

  // 3. Stats Card
  Widget _buildStatsCard() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFF1F5F9), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F172A).withValues(alpha: 0.04),
            blurRadius: 18,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatColumn('148', 'Projects'),
          _buildStatDivider(),
          _buildStatColumn('9 Yrs', 'Experience'),
          _buildStatDivider(),
          _buildStatColumn('4.9', 'Rating', hasStar: true),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String value, String label, {bool hasStar = false}) {
    return Expanded(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF0F172A),
                  letterSpacing: -0.3,
                ),
              ),
              if (hasStar) ...[
                const SizedBox(width: 4),
                const Icon(
                  Icons.star_rounded,
                  color: Color(0xFFF59E0B),
                  size: 20,
                ),
              ],
            ],
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF64748B),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatDivider() {
    return Container(
      width: 1,
      height: 32,
      color: const Color(0xFFE2E8F0),
    );
  }

  // Section Header
  Widget _buildSectionHeader(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Color(0xFF0F172A),
          letterSpacing: -0.2,
        ),
      ),
    );
  }

  // 5. Skills & Expertise Chips
  Widget _buildSkillsSection() {
    final skills = [
      _SkillItem('Flutter', Icons.flutter_dash, const Color(0xFF0284C7), const Color(0xFFE0F2FE)),
      _SkillItem('Dart', Icons.code_rounded, const Color(0xFF16A34A), const Color(0xFFDCFCE7)),
      _SkillItem('Clean Arch', Icons.layers_outlined, const Color(0xFFE11D48), const Color(0xFFFFE4E6)),
      _SkillItem('UI/UX', Icons.draw_outlined, const Color(0xFF9333EA), const Color(0xFFF3E8FF)),
      _SkillItem('Firebase', Icons.local_fire_department_rounded, const Color(0xFFD97706), const Color(0xFFFEF3C7)),
    ];

    return Align(
      alignment: Alignment.centerLeft,
      child: Wrap(
        spacing: 8,
        runSpacing: 10,
        children: skills.map((skill) => _buildSkillChip(skill)).toList(),
      ),
    );
  }

  Widget _buildSkillChip(_SkillItem skill) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        color: skill.bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(skill.icon, size: 15, color: skill.color),
          const SizedBox(width: 6),
          Text(
            skill.title,
            style: TextStyle(
              fontSize: 12.5,
              fontWeight: FontWeight.w600,
              color: skill.color,
            ),
          ),
        ],
      ),
    );
  }

  // 6. Featured Projects
  Widget _buildFeaturedProjects() {
    return Row(
      children: [
        Expanded(
          child: _buildProjectCard(
            title: 'E-Shop Flutter',
            subtitle: 'Mobile App • 2026',
            imageUrl: 'https://images.unsplash.com/photo-1472851294608-062f824d29cc?auto=format&fit=crop&w=400&q=80',
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: _buildProjectCard(
            title: 'Crypto Vault',
            subtitle: 'Finance • Clean Arch',
            imageUrl: 'https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe?auto=format&fit=crop&w=400&q=80',
          ),
        ),
      ],
    );
  }

  Widget _buildProjectCard({
    required String title,
    required String subtitle,
    required String imageUrl,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFF1F5F9), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F172A).withValues(alpha: 0.03),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
            child: SizedBox(
              height: 96,
              width: double.infinity,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: const Color(0xFFE2E8F0),
                    child: const Icon(Icons.image_outlined, color: Color(0xFF94A3B8)),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF0F172A),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF64748B),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 7. Contact Information Card
  Widget _buildContactCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFF1F5F9), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F172A).withValues(alpha: 0.04),
            blurRadius: 18,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildContactRow(
            iconWidget: const Icon(Icons.alternate_email_rounded, size: 18, color: Color(0xFF0F172A)),
            title: 'Contact Information',
            isHeader: true,
          ),
          _buildContactDivider(),
          _buildContactRow(
            iconWidget: const Icon(Icons.mail_outline_rounded, size: 18, color: Color(0xFF64748B)),
            title: 'alex.rivers@email.com',
          ),
          _buildContactDivider(),
          _buildContactRow(
            iconWidget: const Icon(Icons.phone_outlined, size: 18, color: Color(0xFF64748B)),
            title: '+81 (90) 1234-5678',
          ),
        ],
      ),
    );
  }

  Widget _buildContactRow({
    required Widget iconWidget,
    required String title,
    bool isHeader = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          iconWidget,
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 13.5,
                fontWeight: isHeader ? FontWeight.w700 : FontWeight.w500,
                color: isHeader ? const Color(0xFF0F172A) : const Color(0xFF334155),
              ),
            ),
          ),
          const Icon(
            Icons.chevron_right_rounded,
            size: 20,
            color: Color(0xFFCBD5E1),
          ),
        ],
      ),
    );
  }

  Widget _buildContactDivider() {
    return const Divider(
      height: 1,
      thickness: 1,
      indent: 16,
      endIndent: 16,
      color: Color(0xFFF1F5F9),
    );
  }
}

class _SkillItem {
  final String title;
  final IconData icon;
  final Color color;
  final Color bgColor;

  _SkillItem(this.title, this.icon, this.color, this.bgColor);
}
