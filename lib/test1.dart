import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class test1 extends StatelessWidget {
  const test1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final url = Uri(scheme: 'https', host: 'www.cylog.org', path: 'headers/');
    final List<MenuData> menu = [
      MenuData(Icons.move_to_inbox_outlined, 'Menu 1', url, ""),
      /*MenuData(Icons.find_in_page_outlined, 'Menu 2'),
      MenuData(Icons.find_in_page_outlined, 'Menu 3'),
      MenuData(Icons.upgrade_outlined, 'Menu 4'),
      MenuData(Icons.upgrade_outlined, 'Menu 5'),
      MenuData(Icons.play_for_work_outlined, 'Menu 6'),
      MenuData(Icons.play_for_work_outlined, 'Menu 7'),
      MenuData(Icons.assignment_turned_in_outlined, 'Menu 8'),*/
      //MenuData(Icons.assignment_turned_in_outlined, 'Menu 9'),
      //MenuData(Icons.fact_check_outlined, 'Menu 10')
    ];

    return Container(
        child: Scrollbar(
          thickness: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: menu.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1,
                        crossAxisCount: 2,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0),
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: Colors.indigo,
                        elevation: 0.2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: InkWell(
                          onTap: () async {
                           await launchUrl(menu[index].url);
                            print(menu[index].url);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                menu[index].icon,
                                size: 30,
                              ),
                              SizedBox(height: 20),
                              Text(
                                menu[index].title,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 10,
                                    color: Colors.black87),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  Center(
                    child: ElevatedButton(
                      child: Text("Button"),
                      onPressed: (){
                        print("object");
                        //launchUrlString(urlString)
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

/*urlString, {   LaunchMode mode = LaunchMode.platformDefault,   WebViewConfiguration webViewConfiguration = const WebViewConfiguration(),   String? webOnlyWindowName
*/

class MenuData {

  final IconData icon;
  final String title;
  Uri url;
  String  urlString;
  LaunchMode mode;
  WebViewConfiguration WebConfiguration;
 // String webOnlyWindowName;

  MenuData(this.icon, this.title, this.url, this.urlString, {this.mode = LaunchMode.platformDefault, this.WebConfiguration = const WebViewConfiguration()});


}

