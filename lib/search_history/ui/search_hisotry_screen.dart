import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poem_mobile/search_history/bloc/bloc.dart';
import 'package:poem_mobile/search_history/ui/search_table_header.dart';
import 'package:poem_mobile/search_history/ui/search_table_item.dart';
import 'package:poem_mobile/widgets/widgets.dart';

class Description extends StatelessWidget {
  final String desc;

  const Description({Key key, this.desc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(desc, style: TextStyle(color: Color(0xFF5A585D), fontSize: 12));
  }
}

class SearchHistoryScreen extends StatelessWidget {
  ButtonStatus _getButtonStatus(SearchHistoryState state) {
    if (state is UpdateLoading) {
      return ButtonStatus.Loading;
    } else if (state is UpdateSuccess) {
      return ButtonStatus.Success;
    } else if (state is UpdateFailure) {
      return ButtonStatus.Failure;
    } else {
      return ButtonStatus.Normal;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: LayoutBuilder(
          builder: (builder, constraints) {
            return Container(
                child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      PoemAppBar(
                        title: 'History of searches',
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 12, top: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Description(
                                desc:
                                    'These are searches of you by your full name, date of birth and SSN.'),
                            SizedBox(height: 5),
                            Description(
                              desc:
                                  'If you don\'t recognize and did not authorize the search, contact the person who did the search to check and confirm.',
                            ),
                            const SizedBox(height: 5),
                            Description(
                                desc:
                                    'If you suspect the search was unauthorized, report the incident to us to as well.')
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Card(
                        margin: EdgeInsets.all(0),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        elevation: 3,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 4),
                          decoration: BoxDecoration(
                              color: Color(0xFFE4E9F5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Column(children: <Widget>[
                            SearchTableHeader(),
                            const SizedBox(height: 3),
                            BlocBuilder<SearchHistoryBloc, SearchHistoryState>(
                              condition: ((context, state) {
                                return state is HistoryDataChanged ||
                                    state is FetchLoading;
                              }),
                              builder: (context, state) {
                                if (state is FetchLoading) {
                                  return LoadingIndicator();
                                } else if (state is HistoryDataChanged) {
                                  return Column(
                                      children: List.generate(
                                          state.historyList.length,
                                          (int index) {
                                    return SearchTablRow(
                                        state.historyList[index]);
                                  }));
                                } else {
                                  return Container();
                                }
                              },
                            )
                          ]),
                        ),
                      ),
                      SizedBox(height: 15),
                      BlocBuilder<SearchHistoryBloc, SearchHistoryState>(
                        builder: (context, state) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: CustomButton(
                                status: _getButtonStatus(state),
                                text: 'Done',
                                onPressed: () {
                                  BlocProvider.of<SearchHistoryBloc>(context)
                                      .add(Update());
                                }),
                          );
                        },
                      ),
                      Center(
                          child: TextButton(
                              text: 'Cancel',
                              style: TextStyle(
                                  fontSize: 12, color: Colors.black))),
                      SizedBox(height: 35)
                    ]),
              ),
            ));
          },
        ),
      ),
    );
  }
}
