
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
//developed by chandan

class CreateMember extends StatefulWidget {
  const CreateMember({super.key});

  @override
  State<CreateMember> createState() => _CreateMemberState();
}

class _CreateMemberState extends State<CreateMember> {

  final form = FormGroup({
    'name': FormControl<String>(
        validators: [Validators.required, Validators.minLength(3)]),
    'fatherName': FormControl<String>(
        validators: [Validators.required, Validators.minLength(3)]),
    'email': FormControl<String>(
        validators: [Validators.required, Validators.email]),
    'mobile': FormControl<String>(
        validators: [Validators.required, Validators.minLength(10),Validators.maxLength(10)]),
    'gender': FormControl<String>(value: 'M',
        validators: [Validators.required]),
    'amount': FormControl<double>(
        validators: [Validators.required, Validators.min(500)])
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width:   double.infinity,
      child: SingleChildScrollView(child:Container(
        padding: EdgeInsets.only(left: 10,top: 10,right: 10,bottom: 0),
        child: ReactiveForm(
          formGroup: form,
          child: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(
                      left: 15, top: 5, right: 15, bottom: 5),
                  child: ReactiveTextField(
                    formControlName: 'name',
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                    ),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    validationMessages: {
                      'required': (error) => 'The name must not be empty',
                      'minLength': (error) => 'Min length should be 3'
                    },
                  )
              ),
              Padding(
                  padding: EdgeInsets.only(
                      left: 15, top: 5, right: 15, bottom: 5),
                  child: ReactiveTextField(
                    formControlName: 'fatherName',
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: 'Father Name',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                    ),
                    keyboardType: TextInputType.text,
                    validationMessages: {
                      'required': (error) => 'The father name must not be empty',
                      'minLength': (error) => 'Min length should be 3'
                    },
                  )
              ),
              Padding(
                  padding: EdgeInsets.only(left: 15, top: 5, right: 15, bottom: 5),
                  child: ReactiveTextField(
                    formControlName: 'email',
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validationMessages: {
                      'required': (error) => 'The name must not be empty',
                      'email': (error) => 'please provide right email'
                    },
                  )
              ),
              Padding(
                  padding: EdgeInsets.only(left: 15, top: 5, right: 15, bottom: 5),
                  child: ReactiveTextField(
                    formControlName: 'mobile',
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: 'Mobile Number',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                    ),
                    keyboardType: TextInputType.phone,
                    validationMessages: {
                      'required': (error) => 'Required',
                      'minlength': (error) => 'min length should be 10',
                      'maxlength': (error) => 'max length should be 10'
                    },
                  )
              ),
              Padding(
                  padding: EdgeInsets.only(left: 15,top: 5,right: 15,bottom: 5),
                  child: Row(
                    children: <Widget>[
                      Text('Gender',style: TextStyle(color: Colors.black,fontSize: 15),),
                      Padding(padding:EdgeInsets.only(right: 10)),
                      ReactiveRadio(
                        value: 'M',
                        formControlName: 'gender',
                        autofocus: true,

                      ),
                      Text('Male'),
                      ReactiveRadio(value: 'F',
                        formControlName: 'gender',
                      ),
                      Text('Female'),

                    ],
                  )
              ),


              Padding(
                  padding: EdgeInsets.only(
                      left: 15, top: 5, right: 15, bottom: 5),
                  child: ReactiveTextField(
                    formControlName: 'amount',
                    decoration: InputDecoration(
                      labelText: 'Amount Paid',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                    ),
                    keyboardType: TextInputType.number,
                    validationMessages: {
                      'required':(error)=>'Amount Required !',
                      'min':(error)=>'Min amount 500 !'
                    },
                  )
              ),
              Padding(
                  padding: EdgeInsets.only(
                      left: 15, top: 15, right: 15, bottom: 5),
                  child: MaterialButton(
                    color: Colors.blue,
                    height: 50,
                    minWidth: double.infinity,
                    onPressed: () {
                      form.markAllAsTouched();
                      if(form.invalid){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Please Provide write data"),
                        ));
                      }else{
                        log(form.value.toString());
                      }
                    },
                    child: Text('Submit',style : TextStyle(color: Colors.white)),
                  )
              )
            ],
          ),
        ),
      ),
    ),
    );
  }
}
