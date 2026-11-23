import 'package:fixly_app/screens/home_screens/home_page.dart';
import 'package:flutter/material.dart';



class SignupPage extends StatefulWidget{
  const SignupPage({super.key});

  @override
  State<SignupPage> createState()=> _SignupPageState();

}

class _SignupPageState extends State<SignupPage>{
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
               SizedBox(height: 20,),
               //Text
               Text(isArabic ? 'إنشاء حساب' : 'Sign up',textAlign: TextAlign.center,style: TextStyle(color: Color(0xFF022953),fontSize: 30,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              //subtitle
             Text(isArabic ? 'عبأ بياناتك للبدء بإستخدام التطبيق' : 'Fill in your details to get started',textAlign: TextAlign.center,style: TextStyle(color: Colors.grey[600],fontSize: 15,)),
            
             ],
             
           )),
            Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //name
            //Image.asset('images\Welcome_page.png'),
            SizedBox(height: 40,),
            Padding(
               padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(isArabic ? 'الاسم كامل' : 'Full name',style: TextStyle(color: Color(0xFF022953),fontSize: 15,),),
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
                      hintText: 'User name',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                              ),
                    ),
                  ),)
              ),
            ),
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
              Padding(
               padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(isArabic ? 'رقم التلفون' : 'Phone number',style: TextStyle(color: Color(0xFF022953),fontSize: 15,),),
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
                      hintText: '079*******',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                              ),
                    ),
                  ),)
              ),
            ),
             //pass
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
             //conf pass
             SizedBox(height: 10,),
              Padding(
               padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(isArabic ? 'تأكيد كلمة السر' : 'Confirm password',style: TextStyle(color: Color(0xFF022953),fontSize: 15,),),
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
                      hintText: 'Confirm Password',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                              ),
                    ),
                  ),)
              ),
            ),
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
                  /*
                   style: ElevatedButton.styleFrom(
    backgroundColor: const Color(0xFF022953),
    foregroundColor: Colors.white,
  ),
                   */
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
           ],
           ),
     ),
),
  

  
);

  }
}