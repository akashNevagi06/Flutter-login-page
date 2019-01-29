import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
return MaterialApp(
  home:LoginPage(),
  theme:ThemeData(
     primarySwatch:  Colors.blue
  )
);
  }
}

class LoginPage extends StatefulWidget{
  @override
  State createState()=>LoginPageState();
}

class LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{

  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

@override
void initState(){
  super.initState();
  _iconAnimationController = AnimationController(
     vsync: this,
      duration: Duration( microseconds: 300)

  );
  _iconAnimation= CurvedAnimation(
    parent : _iconAnimationController,
    curve:Curves.easeInOut
  );
   _iconAnimation.addListener(()=> this.setState((){}));
  _iconAnimationController.forward();
} 

  @override
  Widget build(BuildContext context){
    return Scaffold(
       backgroundColor: Colors.pink,
       body: Stack(
         fit:StackFit.expand,
          children: <Widget>[
            Image(
              image: AssetImage("assets/girl.jpeg"),
              fit:BoxFit.cover,
              color: Colors.black87,
              colorBlendMode: BlendMode.darken,
            ),
            new Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                  FlutterLogo(
                   size: _iconAnimation.value*140,
                 ),
                 Form(child:  Theme(
                   data: ThemeData(
                      brightness: Brightness.dark,
                       primarySwatch: Colors.teal,
                       inputDecorationTheme: InputDecorationTheme(
                          labelStyle: TextStyle(
                             color: Colors.teal,
                              fontSize: 20.0
                          )
                       )
                   ),
                        child: Container(
                           padding: const EdgeInsets.all(40.0),
                          child: Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                       TextFormField(
                          decoration: InputDecoration(
                             labelText: "Enter Email",

                          ),
                           keyboardType: TextInputType.emailAddress,
                     ),
                      TextFormField(
                          decoration: InputDecoration(
                             labelText: "Enter Password",

                          ),
                           keyboardType: TextInputType.text,
                            obscureText: true,
                     ),

                      Padding(
                         padding: const EdgeInsets.only(top:20.0),
                      ),
                      new MaterialButton(
                         color: Colors.teal,
                          textColor: Colors.white,
                          child: Text("Login"),
                           onPressed: ()=>{},
                            splashColor: Colors.red,
                      )

                      ],
                   ),
                        ),
                 ),
                   
                 )
               ],
            )
          ],
       )
    );
    
  }
}