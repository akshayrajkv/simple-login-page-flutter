import 'package:flutter/material.dart';
import 'package:flutter_learn22/screens/next_screen.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final emailController = TextEditingController();
final passController = TextEditingController();
const String email = 'admin@123';
const String pass = '1236';

class _LoginPageState extends State<LoginPage> {
  bool isPasswordVisible = false;
  final String emailError = 'Your entered wrong email';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                  'https://c4.wallpaperflare.com/wallpaper/564/261/260/simple-background-abstract-blue-artwork-wallpaper-preview.jpg',
                ),
                fit: BoxFit.cover),
                ),
        padding: const EdgeInsets.all(50),
        child: ListView(
          children: [
            const SizedBox(
              height: 130,
            ),
            
            const SizedBox(
                child: Center(
              child: Text(
                'Login',
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            ),
            const SizedBox(
              height: 20,
            ),
            emailText(),
            const SizedBox(
              height: 50,
            ),
            TextField(
              style:const TextStyle(color: Colors.white,
              ),
              controller: passController,
              
              decoration: InputDecoration(
                
                hintText: 'Enter your password',
                hintStyle: const TextStyle(color: Colors.white),
                prefixIcon: const Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isPasswordVisible=!isPasswordVisible;
                    });
                  },
                  icon: isPasswordVisible?const Icon(Icons.visibility_off,color: Colors.white,):const Icon(Icons.visibility,color: Colors.white,),
                  
                  
                ),
              ),
            ),
            const SizedBox(height: 50),
            buttonLogin(context),
          ],
        ),
      ),
    );
  }
  Widget emailText() {
  
  return TextField(
    style:const TextStyle(color: Colors.white),
    keyboardType: TextInputType.emailAddress,
    controller: emailController,
    
    decoration:const InputDecoration(
        
    
        hintText: 'Enter your email',
        hintStyle:  TextStyle(color: Colors.white),
        prefixIcon: Icon(
          Icons.mail,
          color: Colors.white,
        ),
        ),
        
  );
}
}

Widget buttonLogin(BuildContext context) {
  return ElevatedButton(
      onPressed: () {
        loginFun(context);
      },
      child: const Text('Login'));
}


void loginFun(context) {
  if (emailController.text == email && passController.text == pass) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>const NextPage(),
        ));
  }else{
    showDialog(
      
      context: context, builder:(context) => AlertDialog(
      
      actions: [
        
      Container(
        child: Column(
          children: [
        const    SizedBox(height: 15,),
     const   Center(child: const   Text('your entered wrong')),
            IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon:const Text("close"))
          ],
        ),
      )
      ],
    ), );
  }
}
