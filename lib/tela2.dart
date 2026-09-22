import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MaterialApp(home: Tela2(), debugShowCheckedModeBanner: false));
}

class Tela2 extends StatefulWidget {
  const Tela2({super.key});

  @override
  State<Tela2> createState() => _TelaPostState();
}

class _TelaPostState extends State<Tela2> {
  // Variáveis para armazenar os dados do CEP
  String cep = '';
  String logradouro = '';
  String complemento = '';
  String unidade = '';
  String bairro = '';
  String localidade = '';
  String uf = '';
  String estado = '';
  String regiao = '';
  String ibge = '';
  String gia = '';
  String ddd = '';
  String siafi = '';

  bool carregando = true;

  @override
  void initState() {
    super.initState();
    buscarPost();
  }

  Future<void> buscarPost() async {
    final url = Uri.parse('https://viacep.com.br/ws/01001000/json/');

    final resposta = await http.get(url);

    if (resposta.statusCode == 200) {
      final dados = jsonDecode(resposta.body);

      // Atualiza os dados recebidos da API
      setState(() {
        cep = dados['cep'];
        logradouro = dados['logradouro'];
        complemento = dados['complemento'];
        unidade = dados['unidade'];
        bairro = dados['bairro'];
        localidade = dados['localidade'];
        uf = dados['uf'];
        estado = dados['estado'];
        regiao = dados['regiao'];
        ibge = dados['ibge'];
        gia = dados['gia'];
        ddd = dados['ddd'];
        siafi = dados['siafi'];

        carregando = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (carregando) {
      return Scaffold(
        backgroundColor: const Color(0xFFF5F7FF),
        appBar: AppBar(
          title: const Text('Consulta CEP - 3F'),
          centerTitle: true,
          backgroundColor: const Color(0xFF5B6CFF),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(color: Color(0xFF5B6CFF)),
              SizedBox(height: 16),
              Text('Carregando endereço...'),
            ],
          ),
        ),
      );
    }

    final dados = [
      {'label': 'CEP', 'valor': cep},
      {'label': 'Logradouro', 'valor': logradouro},
      {'label': 'Complemento', 'valor': complemento},
      {'label': 'Unidade', 'valor': unidade},
      {'label': 'Bairro', 'valor': bairro},
      {'label': 'Localidade', 'valor': localidade},
      {'label': 'UF', 'valor': uf},
      {'label': 'Estado', 'valor': estado},
      {'label': 'Região', 'valor': regiao},
      {'label': 'IBGE', 'valor': ibge},
      {'label': 'GIA', 'valor': gia},
      {'label': 'DDD', 'valor': ddd},
      {'label': 'SIAFI', 'valor': siafi},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FF),
      appBar: AppBar(
        title: const Text('Consulta CEP - 3F'),
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
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.location_on, color: Color(0xFF5B6CFF)),
                    SizedBox(width: 8),
                    Text(
                      'Dados do endereço',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1F2A44),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ...dados.map((item) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['label'] as String,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF6C7280),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item['valor']?.toString() ?? '-',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF1F2A44),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
