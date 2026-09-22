import 'package:flutter/material.dart';
import './tela2.dart';
import './tela3.dart';
import './tela4.dart';
import './tela5.dart';

void main() {
  runApp(const MaterialApp(home: Tela1()));
}

class Tela1 extends StatelessWidget {
  const Tela1({super.key});

  Widget _buildNavButton(
    BuildContext context, {
    required String label,
    required Widget destination,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF5B6CFF),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
        },
        child: Text(label),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FF),
      appBar: AppBar(
        title: const Text('Tela inicial'),
        centerTitle: true,
        backgroundColor: const Color(0xFF5B6CFF),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFEAF0FF), Color(0xFFF5F7FF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.grid_view_rounded,
                  size: 72,
                  color: Color(0xFF5B6CFF),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Menu principal',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2A44),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Escolha uma tela para navegar.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF6C7280),
                  ),
                ),
                const SizedBox(height: 28),
                _buildNavButton(context, label: 'Tela 2', destination: const Tela2()),
                const SizedBox(height: 12),
                _buildNavButton(context, label: 'Tela 3', destination: const Tela3()),
                const SizedBox(height: 12),
                _buildNavButton(context, label: 'Tela 4', destination: const Tela4()),
                const SizedBox(height: 12),
                _buildNavButton(context, label: 'Tela 5', destination: const Tela5()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
