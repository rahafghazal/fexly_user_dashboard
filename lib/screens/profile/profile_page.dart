import 'package:fixly_app/screens/home_screens/ai_assistant.dart';
import 'package:fixly_app/screens/home_screens/home_page.dart';
import 'package:fixly_app/screens/login_page.dart';
import 'package:fixly_app/screens/store/store_page.dart';
import 'package:flutter/material.dart';
import 'package:fixly_app/theme/theme.dart';
import 'package:flutter/cupertino.dart';
class ProfilePage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: AppColors.background,
      appBar:AppBar(
        backgroundColor: AppColors.background,
       leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ) ,
       endDrawer: Drawer(
        child: Container(
          color: AppColors.background,
          child: ListView(
            children: [
              Center(
                child: DrawerHeader(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset('images/Person.jpg'),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home,color: AppColors.orange,),
                title: Text('Home',style:TextStyle(color: AppColors.orange),),
                onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
                ),
              ),
              /*ListTile(
                leading: Icon(Icons.favorite,color: AppColors.orange),
                title: Text('Favourite',style:TextStyle(color: AppColors.orange),),
                onTap: () => Navigator.pop(context),
              ),*/
               ListTile(
                leading: Icon(Icons.smart_toy,color: AppColors.orange),
                title: Text('Ai assistant',style:TextStyle(color: AppColors.orange),),
                onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AiAssistant(),
            ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.password,color: AppColors.orange),
                title: Text('Change password',style:TextStyle(color: AppColors.orange),),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: Icon(Icons.error_outline,color: AppColors.orange),
                title: Text('About Fexly',style:TextStyle(color: AppColors.orange),),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: Icon(Icons.store,color: AppColors.orange),
                title: Text('Store',style:TextStyle(color: AppColors.orange),),
                onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StorePage(),
            ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.logout,color: AppColors.red),
                title: Text('Logout',style:TextStyle(color: AppColors.red),),
                onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ),
                ),
              ),
              
              SizedBox(height: 80,),
Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
          SizedBox(width: 15),
            Icon(Icons.headset_mic,
                color: AppColors.primaryDark),
            SizedBox(width: 10),
            Text(
              'Contact Us',
              style: TextStyle(
                color: AppColors.primaryDark,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 18),
        Row(
          children: [
            SizedBox(width: 15),
            const Icon(Icons.phone,
                color: Colors.orange),
            const SizedBox(width: 12),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Call us',
                    style: TextStyle(color: Colors.orange)),
                Text('+962 76 835 2000',
                    style: TextStyle(color: Colors.orange)),
              ],
            ),
          ],
        ),
      ],
    ),
  


            ],
          ),
        ),
      ),
      body: 
        Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [  

              //Icon(Icons.person,size: 120,color: AppColors.orange,),
              ClipRRect(
            borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                  'images/Person.jpg',
                  width: 140,
                  height: 140,
                fit: BoxFit.cover,
                ),
                  ),       
              const SizedBox(height: 10),
              itemProfile('Name', 'Rahaf Ghazal ', Icons.person),
              const SizedBox(height: 10),
              itemProfile('Phone', '0790766080', Icons.phone),
              const SizedBox(height: 10),
              itemProfile('Email', 'RahafGhazal@gmail.com',Icons.mail),
              const SizedBox(height: 10,),
              itemProfile('My Requests', 'Have a look', Icons.checklist),
              const SizedBox(height: 15,),
              itemProfile('Maintenance History', 'Have a look', Icons.history),
              const SizedBox(height: 15,),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(15),
                      backgroundColor: Colors.white,
                    ),
                    child: const Text('Edit Profile',style: TextStyle(color:AppColors.primaryDark)
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
    itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
        
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow:[
              BoxShadow(
                  offset: Offset(0, 5),
                  color: AppColors.primaryDark.withOpacity(.1),
                  spreadRadius: 2,
                  blurRadius: 10
              )
            ]
        ),
        child: ListTile(
          title: Text(title,style: TextStyle(color: AppColors.primaryDark)),
          subtitle: Text(subtitle,style: TextStyle(color: AppColors.primaryDark),),
          leading: Icon(iconData, color: AppColors.textSecondary),
          trailing: Icon(Icons.remove_red_eye, color: AppColors.textSecondary),
          tileColor: Colors.white,
        
      ),
    );
  }
}