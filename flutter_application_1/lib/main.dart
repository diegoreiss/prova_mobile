// https://docs.flutter.dev/cookbook/design/tabs
// https://www.macoratti.net/19/10/flut_tabbar1.htm
// https://api.flutter.dev/flutter/widgets/Stack-class.html

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List objects = [
    {
      'nome': 'diego reis',
      'mensagem': 'cade tu?',
      'data': '4 nov',
      'qtd_notificacoes': 4,
    },
    {
      'nome': 'Gabriel dutra',
      'mensagem': 'vamos',
      'data': '14:50',
      'qtd_notificacoes': 4,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('Whatsapp', style: TextStyle(color: Colors.white),),
          actions: [
            Icon(Icons.search, color: Colors.white,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Icon(Icons.more_vert, color: Colors.white,),
            )
          ],
          bottom: TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.camera_alt)),
              Tab(text: 'CHAT'),
              Tab(text: 'STATUS',),
              Tab(text: 'CALLS',),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text('Camera'),),
            Center(
              child: Expanded(
                child: ListView.separated(
                  itemCount: objects.length,
                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.green,
                      ),
                      title: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(objects[index]['nome'], style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                                Text(objects[index]['mensagem'], style: TextStyle(color: Colors.black.withOpacity(0.6)),),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(objects[index]['data'], style: TextStyle(color: Colors.black.withOpacity(0.5), fontWeight: FontWeight.w100),),
                                CircleAvatar(
                                  backgroundColor: Colors.green,
                                  child: Text(objects[index]['qtd_notificacoes'].toString(), style: TextStyle(color: Colors.white),),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              ),
            ),
            Center(child: Text('Status'),),
            Center(child: Text('Calls'),),
          ],
        ),
      ),
    );
  }
}
