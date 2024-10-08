import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'menu_admin.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final form = FormGroup({
    'user_id': FormControl<String>(validators: [
      Validators.required,
      Validators.minLength(3),
    ]),
    'password': FormControl<String>(
        validators: [Validators.required, Validators.minLength(3)]),
    'role':
        FormControl<String>(value: 'USER', validators: [Validators.required]),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(image: DecorationImage(
          image: AssetImage("assets/images/background.jpg"), fit: BoxFit.cover),),
      child: Center(
        child: SizedBox(
          height: 400,
          width: 350,
          child: Card(
            semanticContainer: true,
            margin: EdgeInsets.only(left: 10,right: 10),
            child: ReactiveForm(
              formGroup: form,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset('assets/images/icon.png',
                        width: 80.0, height: 80.0),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          left: 15, top: 5, right: 15, bottom: 5),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Role',
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                          Padding(padding: EdgeInsets.only(right: 10)),
                          ReactiveRadio(
                            value: 'USER',
                            formControlName: 'role',
                            autofocus: true,
                          ),
                          Text('USER', style: TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.bold)),
                          ReactiveRadio(
                            value: 'ADMIN',
                            formControlName: 'role',
                          ),
                          Text('ADMIN', style: TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.bold)),
                        ],
                      )),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 5),
                    child: ReactiveTextField(
                      formControlName: 'user_id',
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          icon: Icon(Icons.supervised_user_circle),
                          labelText: 'UserId',
                          hintText: 'Enter valid UserId',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7.0)))),
                      maxLines: 1,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 5),
                    child: ReactiveTextField(
                      formControlName: 'password',
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          icon: Icon(Icons.password),
                          labelText: 'Password',
                          hintText: 'Enter valid Password',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7.0)))),
                      maxLines: 1,
                      style: TextStyle(fontWeight: FontWeight.normal),

                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 5),
                    child: MaterialButton(
                      height: 40,
                      minWidth: double.infinity,
                      child:
                          Text('Login', style: TextStyle(color: Colors.white)),
                      color: Colors.deepPurple,
                      onPressed: () {
                        form.markAllAsTouched();
                        if (form.valid) {
                          log(form.value.toString());
                          Navigator.push(
                              context, MaterialPageRoute(builder: (_) => MenuAdmin()));
                        } else {
                          /* var errors = form.errors;
                          errors.forEach((key, value) {
                            print('$key \t $value');
                          });*/
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
