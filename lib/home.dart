import 'package:flutter/material.dart';
import 'package:petmealsweb/delete_oauth.dart';
import 'package:petmealsweb/login/auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 480,
          height: 260,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 32,
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Bienvenido a',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'PetMeals',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text('Si desea eliminar su cuenta, '
                  'inicie sesión con su cuenta de Google.'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  AuthApp().signInGoogle().then(
                        (value) => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DeleteOAuth()),
                        ),
                      );
                },
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Color(0xFF7fa3cc)),
                  foregroundColor: WidgetStatePropertyAll(Colors.white),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                ),
                child: const Text(
                  'Ingresar con Google',
                  style: TextStyle(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
