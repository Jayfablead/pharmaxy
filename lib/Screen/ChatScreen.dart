import 'package:flutter/material.dart';

class Chatscreen extends StatefulWidget {
  const Chatscreen({super.key});

  @override
  State<Chatscreen> createState() => _ChatscreenState();
}

class _ChatscreenState extends State<Chatscreen> {
  var selected = "new group";
  var isloading=false;
  TextEditingController _text = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        leadingWidth: 30.0,
        centerTitle: true,
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.orange.shade700,
              child: Icon(Icons.person_outline,color: Colors.white,),
            ),
            SizedBox(width: 10.0,),
            Expanded(
              child: Text("Admin",style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.video_call_rounded)),
          IconButton(onPressed: (){}, icon: Icon(Icons.call)),
          PopupMenuButton(
            color: Colors.blue.shade200,
            shape: OutlineInputBorder(
              borderRadius:BorderRadius.circular(11),
            ),
            position: PopupMenuPosition.over,
            onSelected: (value){
              setState(() {
                selected=value;
              });

            },
            itemBuilder:(context)
            {
              return const [
                PopupMenuItem(
                  child: Text("New group",style: TextStyle(
                      color: Colors.white
                  )),
                  value: "home",
                ),
                PopupMenuItem(
                  child: Text("New brodcast",style: TextStyle(
                      color: Colors.white
                  )),
                  value: "about",
                ),
                PopupMenuItem(
                  child: Text("Linked device",style: TextStyle(
                      color: Colors.white
                  )),
                  value: "contact",
                ),
                PopupMenuItem(
                  child: Text("Setting",style: TextStyle(
                      color: Colors.white
                  )),
                  value: "setting",
                ),
              ];
            },

          ),

        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(),
          ),
          Row(
            children: [
              Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.grey.shade100,
                      border: Border.all(color: Colors.grey)
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {

                          },
                          icon: Icon(Icons.emoji_emotions_outlined),
                        ),
                        Expanded(
                          child: TextField(
                            controller: _text,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11.0),
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade100,
                                  )
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11.0),
                                  borderSide: BorderSide(
                                    color:Colors.grey.shade100,
                                  )
                              ),
                              hintText: "Message",
                            ),
                          ),
                        ),
                        IconButton(
                           onPressed: () {

                           },
                            icon: Icon(Icons.attachment)
                        ),
                        IconButton(
                           onPressed: () {

                           },
                            icon: Icon(Icons.camera_alt)
                        ),
                        IconButton(
                            onPressed: () {

                            },
                            icon: Icon(Icons.send)
                        ),
                      ],
                    ),
                  )
              )

            ],
          )
        ],


      ),

    );
  }
}
