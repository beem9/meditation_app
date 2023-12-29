import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/providers/tips_provider.dart';
import 'package:meditation_app/widgets/dialog_tip.dart';
import 'package:provider/provider.dart';

class TipsScreen extends StatefulWidget {
  TipsScreen({super.key});

  @override
  State<TipsScreen> createState() => _TipsScreenState();
}

class _TipsScreenState extends State<TipsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Book app"),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AddTipDialog();
                    },
                  );
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: FutureBuilder(
            future: context.read<TipProvider>().tipList(),
            builder: (context, snapshot) {
              return Consumer<TipProvider>(
                  builder: (context, value, child) => ListView.builder(
                      itemCount: value.tipsList.length,
                      itemBuilder: (context, index) {
                        context.read<TipProvider>().tipList();

                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        value.tipsList[index].text.toString(),
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 8.0),
                                      Text(
                                        value.tipsList[index].author.toString(),
                                        style: TextStyle(fontSize: 14.0),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: Text("KD"),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () {
                                        setState(() {
                                          context.read<TipProvider>().deleteTip(
                                              value.tipsList[index].id!);
                                        });
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.edit),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );

                        /*ListTile(
                          title: Text(value.booksList[index].title.toString()),
                          trailing: IconButton(
                              onPressed: () {
                                context.read<BookProvider>().deleteBook(
                                    value.booksList[index].id.toString());
                              },
                              icon: Icon(Icons.delete)),
                        );*/
                      }));
            }));
  }
}