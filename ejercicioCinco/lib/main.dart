import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = false;

  void _login() {
    // Implementa tu lógica de inicio de sesión aquí
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(
                  0, 40, 0, 0), // Más margen en la parte superior
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: Image.network(
                  'https://i.postimg.cc/XqfRg8nz/w-4.png',
                  height: 250,
                  fit: BoxFit.none,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
              child: Container(
                width: double.infinity,
                constraints: const BoxConstraints(
                  maxWidth: 570,
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(0),
                ),
                child: Align(
                  alignment: const AlignmentDirectional(0.00, 0.00),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(32, 32, 32, 32),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 0, 16, 24),
                          child: Text(
                            'Ingresa con tu correo',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Readex Pro',
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                          child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Correo',
                                  style: TextStyle(
                                    fontSize: 16, // Tamaño más grande
                                    color: Colors.white,
                                  ),
                                ),
                                TextFormField(
                                  controller: _emailController,
                                  autofocus: true,
                                  autofillHints: const [AutofillHints.email],
                                  obscureText: false,
                                  decoration: const InputDecoration(
                                    hintText: 'Ingresa tu correo',
                                    hintStyle: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14,
                                    ),
                                    fillColor: Colors.white,
                                    filled: true,
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 12,
                                      horizontal: 10,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 2,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.start,
                                  keyboardType: TextInputType.emailAddress,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                          child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Contraseña',
                                  style: TextStyle(
                                    fontSize: 16, // Tamaño más grande
                                    color: Colors.white,
                                  ),
                                ),
                                TextFormField(
                                  controller: _passwordController,
                                  autofocus: true,
                                  autofillHints: const [AutofillHints.password],
                                  obscureText: !_passwordVisible,
                                  decoration: InputDecoration(
                                    hintText: 'Ingresa tu contraseña',
                                    hintStyle: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14,
                                    ),
                                    fillColor: Colors.white,
                                    filled: true,
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 12,
                                      horizontal: 10,
                                    ),
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 2,
                                      ),
                                    ),
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 2,
                                      ),
                                    ),
                                    suffixIcon: InkWell(
                                      onTap: () {
                                        setState(() {
                                          _passwordVisible = !_passwordVisible;
                                        });
                                      },
                                      child: Icon(
                                        _passwordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.start,
                                  keyboardType: TextInputType.text,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                          child: ElevatedButton(
                            onPressed: _login,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFF914D),
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const SizedBox(
                              width: double.infinity,
                              child: Center(
                                child: Text(
                                  'Ingresar',
                                  style: TextStyle(
                                    fontSize: 18, // Tamaño más grande
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 24),
                          child: Text(
                            'O ingresa con',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Readex Pro',
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const SizedBox(
                              width: double.infinity,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment
                                    .center, // Centra la palabra "Google"
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.google,
                                    color: Color(0xFF4285F4),
                                    size: 20,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Google',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
              child: RichText(
                textScaleFactor: MediaQuery.of(context).textScaleFactor,
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Olvidaste tu contraseña ? ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    TextSpan(
                      text: 'Recupérala aquí ',
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        color: Color(0xFFFF914D),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
