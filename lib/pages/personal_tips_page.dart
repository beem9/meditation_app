import 'package:flutter/material.dart';
import 'package:meditation_app/providers/tips_provider.dart';
import 'package:meditation_app/widgets/dialog_tip.dart';
import 'package:provider/provider.dart';

class PersonalTipsScreen extends StatefulWidget {
  PersonalTipsScreen({super.key});

  @override
  State<PersonalTipsScreen> createState() => _PersonalTipsScreenState();
}

class _PersonalTipsScreenState extends State<PersonalTipsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My Tips"),
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
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: FutureBuilder(
        future: context.read<TipProvider>().personalTipList(),
        builder: (context, AsyncSnapshot snapshot) {
          return Consumer<TipProvider>(
            builder: (context, value, child) => ListView.builder(
              itemCount: value.personalTipsList.length,
              itemBuilder: (context, index) {
                final upvotesCount = context
                        .watch<TipProvider>()
                        .personalTipsList[index]
                        .upvotes
                        ?.length ??
                    0;
                final downvotesCount = context
                        .watch<TipProvider>()
                        .personalTipsList[index]
                        .downvotes
                        ?.length ??
                    0;
                dynamic totalVotes = upvotesCount - downvotesCount;

                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                value.personalTipsList[index].text.toString(),
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                value.personalTipsList[index].author.toString(),
                                style: TextStyle(fontSize: 14.0),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.arrow_upward),
                                  onPressed: () {
                                    // Upvote logic
                                    context.read<TipProvider>().upVouteTip(
                                        value.personalTipsList[index].id!);
                                    context
                                        .read<TipProvider>()
                                        .personalTipList();
                                  },
                                ),
                                Text(
                                  "${totalVotes}"

                                  //            value.tipsList[index].upvotes.length.toString(),

                                  , // Replace this with the actual vote count
                                  style: TextStyle(fontSize: 16),
                                ),
                                IconButton(
                                  icon: Icon(Icons.arrow_downward),
                                  onPressed: () {
                                    context.read<TipProvider>().downVoteTip(
                                        value.personalTipsList[index].id!);
                                    context
                                        .read<TipProvider>()
                                        .personalTipList();
                                    // Downvote logic
                                  },
                                ),
                              ],
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                setState(() {
                                  context.read<TipProvider>().deleteTip(
                                        value.personalTipsList[index].id!,
                                      );
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  // likes(int ups, int down, index) {
  //   int like = TipProvider().tipsList[index].upvotes!.length;
  //   int dislikes = TipProvider().tipsList[index].downvotes!.length;
  //   int total = like - dislikes;
  //   return total;
  // }
}
