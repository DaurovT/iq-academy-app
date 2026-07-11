import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/auth/auth_controller.dart';
import '../../../core/models/common.dart';
import '../../pharmacist/home_screen.dart';
import '../../doctor/home_screen.dart';
import '../../medrep/home_screen.dart';
import '../../brand/dashboard_screen.dart';

/// Главный экран: выбирает контент под активную роль.
/// Пока реализован фармацевт; остальные роли — заглушка (следующие фазы).
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final role = ref.watch(authControllerProvider).asData?.value.activeRole;
    return switch (role) {
      Role.pharmacist => const PharmacistHome(),
      Role.doctor => const DoctorHome(),
      Role.medrep => const MedrepHome(),
      Role.productOwner => const BrandDashboardScreen(),
      null => const Scaffold(body: Center(child: CircularProgressIndicator())),
    };
  }
}
