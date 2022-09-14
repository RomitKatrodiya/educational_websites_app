import 'package:flutter/material.dart';

import '../global.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green.shade400,
        title: const Text("Educational Websites"),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: Global.websiteList.length,
        itemBuilder: (context, i) {
          return Container(
            margin: const EdgeInsets.only(left: 20, top: 20, right: 20),
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              splashColor:
                  Color(Global.websiteList[i]["color"]).withOpacity(0.2),
              onTap: () {
                Global.currentWeb = Global.websiteList[i];
                Navigator.of(context).pushNamed("website_page");
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    width: 2,
                    color: Color(Global.websiteList[i]["color"]),
                  ),
                ),
                alignment: Alignment.center,
                height: 100,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Color(Global.websiteList[i]["color"])
                          .withOpacity(0.2),
                      backgroundImage:
                          NetworkImage(Global.websiteList[i]["image"]),
                    ),
                    Text(
                      "${Global.websiteList[i]["name"]}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                        color: Color(Global.websiteList[i]["color"]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext dialogContext) {
              return AlertDialog(
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                title: const Center(
                    child: Text(
                  'All Bookmarks',
                  style: TextStyle(color: Colors.green),
                )),
                content: SizedBox(
                  height: MediaQuery.of(context).size.width * 0.75,
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: ListView.separated(
                    itemCount: Global.bookMarksList.length,
                    itemBuilder: (context, i) {
                      return ListTile(
                        onTap: () {
                          Navigator.of(context).pop();
                          Global.currentWeb["website"] =
                              Global.bookMarksList[i];
                          Navigator.of(context).pushNamed("website_page");
                        },
                        title: Text(
                          Global.bookMarksList[i],
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Colors.blueAccent),
                        ),
                      );
                    },
                    separatorBuilder: (context, i) {
                      return const Divider(
                        color: Colors.black,
                        endIndent: 30,
                        indent: 30,
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
        backgroundColor: Colors.green.shade400,
        child: const Icon(Icons.bookmark_border),
      ),
    );
  }
}
