import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poem_mobile/claim/claim_description/ui/action_button.dart';
import 'package:poem_mobile/claim/claim_description/ui/note.dart';
import 'package:poem_mobile/claim/claim_description/ui/search_list.dart';
import 'package:poem_mobile/claim/claim_description/ui/title_bar.dart';
import 'package:poem_mobile/claim/claims/ui/payer_avatar.dart';
import 'package:poem_mobile/widgets/widgets.dart';
import '../bloc.dart';

class ClaimDescriptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClaimDescriptionBloc, ClaimDescriptionState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TitleBar(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Icon(Icons.brightness_1,
                              size: 10, color: Color(0xFF0065FB)),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                PayerAvatar(),
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                          'Congratulations! You got paid 555.33',
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500)),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: <Widget>[
                                          const SizedBox(width: 10),
                                          Text('Name xyz',
                                              style: TextStyle(fontSize: 14)),
                                          Spacer(),
                                          Text('Reward',
                                              style: TextStyle(fontSize: 14)),
                                          const SizedBox(width: 10),
                                          Text(
                                            '459.00',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xFF006517)),
                                          ),
                                          const SizedBox(width: 10),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          ReadMoreText(
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s and scrambled it to make atypesetting',
                            trimLines: 2,
                            style: TextStyle(
                                fontSize: 12, color: Color(0xFF8B93A6)),
                            colorClickableText: Colors.blue,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: '...More',
                            trimExpandedText: ' ...Less ',
                          ),
                          const SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color.fromRGBO(0, 133, 254, 0.99),
                                width: 1.0
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(5))
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Description', style: TextStyle(fontSize: 14),),
                                const SizedBox(height: 5),
                                ReadMoreText(
                                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s and scrambled it to make atypesetting',
                                  trimLines: 2,
                                  style: TextStyle(
                                      fontSize: 12, color: Color(0xFF8B93A6)),
                                  colorClickableText: Colors.blue,
                                  trimMode: TrimMode.Line,
                                  trimCollapsedText: '...More',
                                  trimExpandedText: ' ...Less ',
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text('Payer cost sharing contribution', style: TextStyle(fontSize: 14)),
                          const SizedBox(height: 10),
                          Row(
                            children: <Widget>[
                              Text('Search for\nexpert', style: TextStyle(fontSize: 12, color: Colors.black)),
                              const SizedBox(width: 15),
                              Expanded(
                                child: PoemSearchBar(),
                              ),
                              const SizedBox(width: 10),
                              Text('Cancel', style: TextStyle(fontSize: 12, color: Colors.black)),
                              const SizedBox(width: 35),
                              Icon(Icons.more_vert, color: Color(0xFF0065FB))
                            ],
                          ),
                          const SizedBox(height: 15),
                          Align(alignment: Alignment.center, child: FractionallySizedBox(widthFactor: 0.6, child: SearchResult())),
                          const SizedBox(height: 15),
                          Align(alignment: Alignment.centerRight, child: ActionButton(title: 'Add')),
                          const SizedBox(height: 10),
                          NotdePanel(title: 'For me', desc: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s and scrambled it to make atypesetting', dateStr: '12/19/19',),
                          const SizedBox(height: 10),
                          NotdePanel(title: 'Provider', desc: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s and scrambled it to make atypesetting', dateStr: '12/19/19',),
                          const SizedBox(height: 10),
                          Align(alignment: Alignment.centerRight, child: ActionButton(title: 'Withdraw')),
                          const SizedBox(height: 10),
                          NotdePanel(title: 'Payer', desc: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s and scrambled it to make atypesetting', dateStr: '12/19/19',),
                          const SizedBox(height: 10),
                          NotdePanel(title: 'Withdrawl reason or comment', desc: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s and scrambled it to make atypesetting', dateStr: '12/19/19',),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
