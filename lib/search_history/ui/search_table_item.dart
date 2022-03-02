import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poem_mobile/search_history/bloc/bloc.dart';

class TableCell extends StatelessWidget {
  final String title;
  const TableCell({Key key, this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 0, right: 2, top: 5, bottom: 5),
        child: Text(title,
            style: TextStyle(
                color: Colors.black,  fontSize: 9)));
  }
}

class SearchTablRow extends StatelessWidget {

  final SearchHistory searchHistory;

  const SearchTablRow(this.searchHistory, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(
        fontSize: 9, color: Colors.black);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15))
      ),
      padding: EdgeInsets.only(left: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 14,
            child: Text('12/19', style: textStyle)
          ),
          Expanded(
            flex: 17,
            child: Text('21:12:56', style: textStyle),
            // child: HeaderCell(title: 'Time'),
          ),
          Expanded(
            flex: 33,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset('assets/images/user1.png', width: 25, height: 25),
                const SizedBox(width: 3),
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Text('Vlad Ungureanu', style: textStyle),
                ),
              ],
            )
          ),
          Expanded(
            flex: 19,
            child: TableCell(title: 'Add. of provider\'s')
          ),
          Expanded(
            flex: 17,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    width: 3.0,
                    color: Color(0xFFE4E9F5)
                  )
                )
              ),
              child: Center(
                child: Transform.scale(
                  scale: 0.9,
                  child: CupertinoSwitch(value: searchHistory.hasConcern, onChanged: (bool value) {
                    BlocProvider.of<SearchHistoryBloc>(context).add(MarkAsConcern(providerID: searchHistory.providerId, value: value));
                  }),
                ),
              )
            )
          ),
        ],
      ),
    );
  }
}