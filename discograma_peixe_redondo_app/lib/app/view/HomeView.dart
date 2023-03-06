// ignore_for_file: file_names
import 'package:flutter/material.dart';

import '../model/Collaborator.dart';

class Homeview extends StatefulWidget {
  const Homeview({super.key});

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  static List<Collaborator> getCollaborator() {
    const profile = [
      {
        "name": "Lucas Gois",
        "sector": "Informática",
        "graduated": "Analista de Sistemas",
        "img": "assets/image/avatar/lucas_avatar.png"
      },
      {
        "name": "Andrey Costa",
        "sector": "Informática",
        "graduated": "Analista de Sistemas",
        "img": "assets/image/avatar/andrey_avatar.png"
      }
    ];
    return profile.map<Collaborator>(Collaborator.fromJson).toList();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 120, 20, 225),
      // drawer: const Drawer(        backgroundColor: Color.fromRGBO(0, 120, 20, 200),      ),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 100, 60, 100),
        title: const Center(child: Text('Discograma: Peixes Redondos - TO')),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: getCollaborator().length,
          itemBuilder: (BuildContext context, int index) {
            return ExpansionPanelList(
              animationDuration: const Duration(milliseconds: 1000),
              dividerColor: Colors.red,
              elevation: 1,
              children: [
                ExpansionPanel(
                  body: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          getCollaborator()[index].collaboratorImg,
                          fit: BoxFit.cover,
                          height: MediaQuery.of(context).size.height * 0.10,
                          width: MediaQuery.of(context).size.width * 0.20,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          textAlign: TextAlign.justify,
                          getCollaborator()[index].collaboratorName,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              letterSpacing: 0.3,
                              height: 1.3),
                        ),
                      ],
                    ),
                  ),
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        getCollaborator()[index].collaboratordiscription,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    );
                  },
                  isExpanded: getCollaborator()[index].expanded,
                )
              ],
              expansionCallback: (int item, bool status) {
                setState(() {
                  getCollaborator()[index].expanded =
                      !getCollaborator()[index].expanded;
                });
              },
            );
          },
        ),
      ),
    );
  }

//           future: DefaultAssetBundle.of(context).loadString('../lib/data/collaborator.json'),
//           builder: (context, snapshot) {
//             // Decode the JSON
//              newData = json.decode(snapshot.data.toString());
//           },

//                 itemBuilder: (BuildContext context, int index) {
//                   return Card(
//                     child: Padding(
//                       padding: const EdgeInsets.only(
//                           top: 32, bottom: 32, left: 16, right: 16),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: <Widget>[
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[

//                             ],
//                             ),
//                             ],
//                             ),
//         ),
//       ),
//     );
//   }
}
