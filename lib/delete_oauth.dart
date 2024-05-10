import 'package:flutter/material.dart';
import 'package:petmealsweb/home.dart';
import 'package:petmealsweb/login/auth.dart';

class DeleteOAuth extends StatelessWidget {
  const DeleteOAuth({super.key});

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
                'Eliminar cuenta',
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
              const Text('Seguro que desea eliminar '
                  'su cuenta?'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('¿Deseas eliminar su cuenta?'),
                        icon: const Icon(Icons.warning_amber_rounded),
                        iconColor: const Color(0xFFe84a5f),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        content: const Text(
                            'Al eliminar su cuenta perderá todos los datos de forma permanente.'),
                        actions: [
                          TextButton(
                            style: const ButtonStyle(
                                foregroundColor: MaterialStatePropertyAll(
                                    Color(0xFFe84a5f))),
                            onPressed: () {
                              AuthApp().deleteUserAuth().then(
                                    (value) => Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomePage()),
                                    ),
                                  );
                            },
                            child: const Text('Eliminar'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('Cancelar'),
                          ),
                        ],
                      );
                    },
                  );
                },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Color(0xFFe84a5f)),
                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                ),
                child: const Text(
                  'Eliminar cuenta',
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
