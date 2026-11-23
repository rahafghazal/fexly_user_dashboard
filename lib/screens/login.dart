import 'package:fixly_app/screens/login_page.dart';
import 'package:fixly_app/screens/signup_page.dart';
import 'package:flutter/material.dart';



class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState()=> _LoginScreenState();

}
bool isArabic = false;
class _LoginScreenState extends State<LoginScreen>{
  @override

  Widget build(BuildContext context){
return Scaffold(
  backgroundColor: Colors.white,
  
  appBar: 
    AppBar(
      
      backgroundColor: Colors.white,
      actions: [
        OutlinedButton.icon(
  onPressed: () {
    setState(() {
      isArabic = !isArabic;
    });
  },
  icon: Icon(
    Icons.language,
    color: Color(0xFF1B4FD8),
    size: 20,
  ),
  label: Text(
    isArabic ? 'English' : 'عربي',
    style: TextStyle(
      color: Color(0xFF1B4FD8),
      fontWeight: FontWeight.bold,
    ),
  ),
  style: OutlinedButton.styleFrom(
    side: BorderSide(
      color: Color(0xFF1B4FD8),
      width: 1.5,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    padding: EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 8,
    ),
  ),
)
      ],
    ),
  
  body: SafeArea(
    child: Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        
          //image
          Image.asset('images/Welcome_page.png',width: 300,),
          
        SizedBox(height: 20),
          //Title
          Text(isArabic ? 'كل خدمات الصيانة في مكان واحد' : 'All your maintenance in one place',textAlign: TextAlign.center,style: TextStyle(color: Color(0xFF022953),fontSize: 24,fontWeight: FontWeight.bold),),
        //Text(isArabic ? 'ن' : 'H')
          //subtitle
        SizedBox(height: 20),
          //Title
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(isArabic ? 'صيانة المنازل، وإصلاح السيارات، والمساعدة على الطريق في جميع أنحاء الأردن' : 'Home maintenance, car repair and roadside assistance across Jordan',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight(300)),),
          ),
          //Login

      
SizedBox(height: 100),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ),
          );
        },
         style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF1B4FD8),
            foregroundColor: Colors.white,
            minimumSize: Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
            ),
            elevation: 3,
          ),
        child: Text(
    isArabic ? 'تسجيل الدخول' : 'Log in ',
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  ),
            ),
      ),

    SizedBox(height: 16),




          //signup
         Padding(
           padding: EdgeInsets.symmetric(horizontal: 25.0),
           child: ElevatedButton(
                 onPressed: () {
                   Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SignupPage(),
            ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
              foregroundColor: Color(0xFF1B4FD8),
              minimumSize: Size(double.infinity, 50),
                side: BorderSide(
                color: Color(0xFF1B4FD8),
                  width: 1,
                  ),
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    ),
                    ),
                 child: Text(
    isArabic ? 'إنشاء حساب' : 'Sign Up',
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  ),
              ),
        ),
  

          ],
        ),
      ),
    ),
  ),
  );
  }
}