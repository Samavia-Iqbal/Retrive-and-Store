import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override

  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

var nameController = TextEditingController();
static const String KEYNAME = "name";
var nameValue ="No Value Saved";
@override
void initState() {
    // TODO: implement initState
    super.initState();
    getValue();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xffB81836),
      body: Center(
        child: Center(
          child: SizedBox(
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    label:const  Text('Name',style: TextStyle(color: Colors.white),),
                    border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(16),

                    )
                  ),
                ),
              const   SizedBox(height: 30,),
                InkWell(onTap: ()async{
                  var name = nameController.text.toString();
                  var prefs =  await SharedPreferences.getInstance();
                  prefs.setString(KEYNAME, nameController.text.toString());
                }, child:Container(
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: const  Center(
                    child: Text('Save',style: TextStyle(
                      color: Color(0xffB81836),
                      fontSize: 25,
                      fontWeight: FontWeight.w900
                    ),),
                  )
                )),
               const SizedBox(height: 20,),
                Text(nameValue,style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),)
              ]
            ),
          ),
        ),
      ),
    );
  }
void getValue() async{
  var prefs =await SharedPreferences.getInstance();
 var getName = prefs.getString( KEYNAME);
 nameValue = getName ?? "No Value Saved" ;
 setState(() {

 });
}
}


