import 'package:fixly_app/screens/home_screens/home_page.dart';
import 'package:fixly_app/screens/signup_page.dart';
import 'package:flutter/material.dart';



class LoginPage extends StatefulWidget{
  const LoginPage({super.key});

  @override
  State<LoginPage> createState()=> _LoginPageState();

}

class _LoginPageState extends State<LoginPage>{
  bool isArabic = false;
  @override
  Widget build(BuildContext context){
    
return Scaffold( 
  backgroundColor: Colors.grey[200],

  appBar: AppBar(
        backgroundColor: Colors.grey[200],
        foregroundColor: Color(0xFF1B4FD8),

        // سهم الرجوع لصفحة Welcome
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        

        actions: [
          OutlinedButton.icon(
            onPressed: () {
              setState(() {
                isArabic = !isArabic;
              });
            },
            icon: const Icon(
              Icons.language,
              color: Color(0xFF1B4FD8),
              size: 20,
            ),
            label: Text(
              isArabic ? 'English' : 'عربي',
              style: const TextStyle(
                color: Color(0xFF1B4FD8),
                fontWeight: FontWeight.bold,
              ),
            ),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(
                color: Color(0xFF1B4FD8),
                width: 1,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),

    body: 
    Container(
    color: Colors.grey[200],
  width: double.infinity,
     child: SingleChildScrollView(
       child: Column(
         children: [
           Center(child: Column(
             children: [
               SizedBox(height: 100,),
               //Text
               Text(isArabic ? ' تسجيل الدخول' : 'Log in',textAlign: TextAlign.center,style: TextStyle(color: Color(0xFF022953),fontSize: 30,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              //subtitle
             Text(isArabic ? 'اهلا من جديد! قم بتسجيل الدخول للإستمرار' : 'welcome back! login to continue',textAlign: TextAlign.center,style: TextStyle(color: Colors.grey[600],fontSize: 15,)),
            
             ],
             
           )),
            Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            SizedBox(height: 40,),
            
             //email
             SizedBox(height: 10,),
              Padding(
               padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(isArabic ? 'البريد الإلكتروني' : 'Email',style: TextStyle(color: Color(0xFF022953),fontSize: 15,),),
            ),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Name@example.com',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                              ),
                    ),
                  ),)
              ),
            ),
             //num
             SizedBox(height: 10,),
              
             SizedBox(height: 10,),
              Padding(
               padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(isArabic ? 'كلمة السر' : 'Password',style: TextStyle(color: Color(0xFF022953),fontSize: 15,),),
            ),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                              ),
                    ),
                  ),)
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.only(left: 220),
              child: Text(isArabic ? '  نسيت كلمة السر ؟  ' : 'Forgot password ?',style: TextStyle(color: Colors.orange,fontSize: 12,),),
            ),
             SizedBox(height: 10,),
              
             //signup button
             SizedBox(height: 20,),
              Padding(
           padding: EdgeInsets.symmetric(horizontal: 50.0),
           child: ElevatedButton(
            
                 onPressed: () {
                   Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
                    );
                  },
           
  
                   
                  style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              minimumSize: Size(double.infinity, 50),
              backgroundColor: const Color(0xFF1B4FD8),
                side: BorderSide(
                color: Color(0xFF1B4FD8),
                  width: 1,
                  ),
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                    ),
                    ),
                 child: Text(
    isArabic ? ' إنشاء حساب' : 'Log in',
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  ),
              ),
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 60),
              child: Text(isArabic ? ' لا تملك حساب ؟ ' : 'Don\'t have an account ?',style: TextStyle(color: Colors.grey[600],fontSize: 12,),),
            ),
            SizedBox(width: 5,),
            
            ElevatedButton(
            
                onPressed: () {
                  Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SignupPage(),
            ),
                    );
                  },
               style: ElevatedButton.styleFrom(
            
              backgroundColor: Colors.grey[200],
              
                    ),
                  child: Text(isArabic ? '  إنشاء حساب ' : 'Sign up',style: TextStyle(color: Colors.orange,fontSize: 12,),)),
          ],
        ),
          ],
        ),
           ],
           ),
     ),
),
  

  
);

  }
}