import 'package:flutter/material.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isEditing = false; // Variable para controlar el modo de edición
  final TextEditingController nameController = TextEditingController(text: 'Diego Miguel Ramirez Ortega');
  final TextEditingController emailController = TextEditingController(text: 'A');
  final TextEditingController universityController = TextEditingController(text: 'A');
  final TextEditingController carController = TextEditingController(text: 'A');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Color del fondo de la pantalla. AQUI
      appBar: AppBar(
        title: Text('PERFIL'), 
        centerTitle: true,
        ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            //seccion del avatar
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage('assets/image.png'),
                ),
              ),
            ),

            //---------Seccion de nombres
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                readOnly: !isEditing, // Hace que el campo sea de solo lectura,
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),


            //---------Seccion del email
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                readOnly: !isEditing,
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            

            //---------Seccion de Univeristy
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                readOnly: !isEditing,
                controller: universityController,
                decoration: InputDecoration(
                  labelText: 'Univeristy',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            

            //---------Seccion de car
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                readOnly: !isEditing,
                controller: carController,
                decoration: InputDecoration(
                  labelText: 'Car',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            

            //---------Boton de Save
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                      setState(() {
                      isEditing = !isEditing; // Alternar entre editar y guardar
                    });

                    if (!isEditing) {
                      // Aquí iría la lógica para guardar los cambios
                      // Puedes acceder a los valores con:
                      // nameController.text, emailController.text, etc.
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: Text(isEditing ? 'Save' : 'Edit'), // Cambia el texto del botón
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
