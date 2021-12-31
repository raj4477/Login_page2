import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:login_page_2/pages/sec_home.dart';

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
   TextEditingController _email = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'passwords must have at least one special character')
  ]);

  bool validateEmail(String value) {
    var pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value) || value == null)
      return true;
    else
      return false;
      
      
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Expanded(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 25,),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Color(0xff34D4D4),
                    //     blurRadius: 20,
                    //     offset: const Offset(0, 8),
                    //   ),
                    // ],
                  ),
                  child: TextFormField(
                    // obscureText: true,
                    // enabled: false,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "example123@gmai.com",
                      // disabledBorder: OutlineInputBorder(
                      //   borderRadius: BorderRadius.all(Radius.circular(4)),
                      //   borderSide: BorderSide(width: 1,color: Colors.orange),
                      // ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32)),
                        borderSide: BorderSide(
                            width: 3, color: Color(0xff34D4D4)),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                        borderSide: new BorderSide(color: Colors.teal, width: 5),

                      ),
                      prefixIcon: const Icon(
                        Icons.mail_outline,
                         color: Color(0xff181f29),),
                      labelText: 'Email',
                    ),

                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (validateEmail(value!)) {
                        return "Enter Validate Email";
                      }
                      else
                        return null;
                    },
                    onChanged: (value){
                       print(value);
                    },

                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Color(0xff34D4D4),
                    //     blurRadius: 20,
                    //     offset: const Offset(0, 08),
                    //   ),
                    // ],
                  ),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "Password",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32)),
                        borderSide: BorderSide(
                            width: 3, color: Color(0xff34D4D4)),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                        borderSide: new BorderSide(color: Colors.teal, width: 5),

                      ),
                      prefixIcon: const Icon(
                        Icons.vpn_key_outlined, color: Color(0xff181f29),),
                      labelText: 'Password',
                    ),

                    // The validator receives the text that the user has entered.
                    validator: passwordValidator,

                  ),
                ),
              ),
              SizedBox(height: 20,),
              SizedBox(height: 20,),
              Container(width: 150,height: 40,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                child: ElevatedButton(
                  
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color(0xff34D4D4)),
                    // padding: MaterialStateProperty.all(EdgeInsets.all(50)),
                    // textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30)
                    // )
                  ),
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                       Navigator.push(
                     context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                          );
                    }
                    
                  },
                  child: const Text('Login', style: TextStyle(
                      color: Color(0xff181f29)
                  ),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}