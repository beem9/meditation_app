import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/models/tips.dart';
import 'package:meditation_app/providers/tips_provider.dart';
import 'package:meditation_app/widgets/dialog_tip.dart';
import 'package:provider/provider.dart';

class TipsScreen extends StatefulWidget {
  TipsScreen({super.key});

  @override
  State<TipsScreen> createState() => _TipsScreenState();
}

class _TipsScreenState extends State<TipsScreen> {
  bool _reverseOrder = false;
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Tips"),
        actions: [
          IconButton(
            onPressed: () {
              GoRouter.of(context).pushNamed('ptips');
            },
            icon: Icon(Icons.person),
          ),
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                // Filter the tips list based on the search query
                context.read<TipProvider>().filterTips(value);
              },
              decoration: InputDecoration(
                labelText: 'Search Tips',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: context.read<TipProvider>().tipList(),
              builder: (context, snapshot) {
                return Consumer<TipProvider>(
                  builder: (context, value, child) {
                    List<Tips> tipsList = value.filteredTips.isNotEmpty
                        ? value.filteredTips.toList()
                        : value.tipsList.toList();

                    if (_reverseOrder) {
                      tipsList = tipsList.reversed.toList();
                    }

                    return ListView.builder(
                      itemCount: tipsList.length,
                      itemBuilder: (context, index) {
                        final upvotesCount =
                            tipsList[index].upvotes?.length ?? 0;
                        final downvotesCount =
                            tipsList[index].downvotes?.length ?? 0;
                        dynamic totalVotes = upvotesCount - downvotesCount;

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
                                        tipsList[index].text.toString(),
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 8.0),
                                      Text(
                                        tipsList[index].author.toString(),
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
                                            context
                                                .read<TipProvider>()
                                                .upVouteTip(
                                                    tipsList[index].id!);
                                            context
                                                .read<TipProvider>()
                                                .tipList();
                                          },
                                        ),
                                        Text(
                                          "${totalVotes}",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.arrow_downward),
                                          onPressed: () {
                                            context
                                                .read<TipProvider>()
                                                .downVoteTip(
                                                    tipsList[index].id!);
                                            context
                                                .read<TipProvider>()
                                                .tipList();
                                            // Downvote logic
                                          },
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.share),
                                          onPressed: () {
                                            context
                                                .read<TipProvider>()
                                                .shareTip(tipsList[index]
                                                    .text
                                                    .toString());
                                          },
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.delete),
                                          onPressed: () {
                                            setState(() {
                                              context
                                                  .read<TipProvider>()
                                                  .deleteTip(
                                                    tipsList[index].id!,
                                                  );
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _reverseOrder = !_reverseOrder;
          });
        },
        child: Icon(Icons.sort),
      ),
    );
  }
}
