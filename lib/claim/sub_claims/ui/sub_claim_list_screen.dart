import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:poem_mobile/claim/claims/ui/legend_panel.dart';
import 'package:poem_mobile/claim/sub_claims/sub_claim_bloc.dart';
import 'package:poem_mobile/claim/sub_claims/sub_claim_event.dart';
import 'package:poem_mobile/claim/sub_claims/sub_claim_state.dart';
import 'package:poem_mobile/claim/sub_claims/ui/sub_claim_list_item.dart';
import 'package:poem_mobile/widgets/widgets.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SubClaimListScreen extends StatefulWidget {
  final int parentClaimId;

  const SubClaimListScreen(this.parentClaimId, {Key key}) : super(key: key);
  @override
  _SubClaimListScreenState createState() => _SubClaimListScreenState();
}

class _SubClaimListScreenState extends State<SubClaimListScreen> {
  ScrollController _controller;
  bool isScrollingUP;
  PanelController _legendPanelController;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.position.userScrollDirection == ScrollDirection.forward) {
        setState(() {
          isScrollingUP = false;
        });
        _legendPanelController.close();
      } else if (_controller.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setState(() {
          isScrollingUP = true;
        });
        _legendPanelController.close();
      }
    });
    _legendPanelController = PanelController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 20, left: 10),
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Column(children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      BackButtonWidget(color: Colors.black),
                      Text('Sub claims',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600)),
                      InkWell(
                          onTap: () {
                            setState(() {
                              if (_legendPanelController.isPanelOpen()) {
                                _legendPanelController.close();
                              } else {
                                _legendPanelController.open();
                              }
                            });
                          },
                          child: Icon(Icons.more_vert,
                              color: Color(0xFF0065FB), size: 30))
                    ]),
                const SizedBox(height: 10),
                Expanded(
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          BlocBuilder<SubClaimBloc, SubClaimState>(
                            condition: ((context, state) {
                              return !(state is SubClaimLoadingMore);
                            }),
                            builder: (context, state) {
                              if (state is SubClaimLoading || state is Initial) {
                                return Center(
                                    child: CircularProgressIndicator());
                              } else if (state is SubclaimDatachanged) {
                                return Expanded(
                                    child: LazyLoadScrollView(
                                  onEndOfPage: () {
                                    BlocProvider.of<SubClaimBloc>(context)
                                        .add(FetchMore());
                                  },
                                  child: ListView.builder(
                                    controller: _controller,
                                    itemCount: state.subClaims.length,
                                    itemBuilder: (context, int index) {
                                      return SubClaimListItem(
                                          claim: state.subClaims[index]);
                                    },
                                  ),
                                ));
                              } else {
                                return Container();
                              }
                            },
                          ),
                          BlocBuilder<SubClaimBloc, SubClaimState>(
                            builder: (context, state) {
                              return Visibility(
                                visible: state is SubClaimLoadingMore,
                                child: CircularProgressIndicator(),
                              );
                            },
                          )
                        ],
                      ),
                      Visibility(
                        visible: isScrollingUP != null,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 50, right: 20),
                          child: Align(
                              alignment: Alignment.bottomRight,
                              child: ScrollDirectionIndicator(
                                  isScrollingUp: isScrollingUP,
                                  onUp: (isUp) {})),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ]),
              SlidingUpPanel(
                  color: Colors.transparent,
                  minHeight: 0,
                  controller: _legendPanelController,
                  maxHeight: 200,
                  panel: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                        ),
                      ),
                      child: LegendPanel([
                        LegendItem('B', 'Billed by the service provider'),
                        LegendItem('AP', 'Approved for payment by payer'),
                        LegendItem('PD', 'Paid by payer'),
                        LegendItem('CA', 'Adjusted for price in contract'),
                        LegendItem('PR', 'Patient responsible for payment'),
                        LegendItem('DE',
                            'Denied because did not comply with contract'),
                        LegendItem('CP', 'Copay required by plan terms'),
                        LegendItem('DD', 'Deductible patient has to pay'),
                        LegendItem('CI',
                            'Coinsurance cost sharing according to plan terms'),
                        LegendItem(
                            'SP', 'Self pay by patient. Plan not responsible'),
                        LegendItem('Adj',
                            'Adjustments by providers after plan processed claim')
                      ]))),
            ],
          ),
        ),
      ),
    );
  }
}
