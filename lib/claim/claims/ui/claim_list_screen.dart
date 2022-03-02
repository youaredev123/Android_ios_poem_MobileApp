import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poem_mobile/claim/claims/claim_bloc.dart';
import 'package:poem_mobile/claim/claims/claim_state.dart';
import 'package:poem_mobile/claim/claims/claims.dart';
import 'package:poem_mobile/claim/claims/ui/claim_list_item.dart';
import 'package:poem_mobile/claim/claims/ui/header.dart';
import 'package:poem_mobile/claim/claims/ui/legend_panel.dart';
import 'package:poem_mobile/claim/claims/ui/statement_table.dart';
import 'package:poem_mobile/helpers/date_helper.dart';
import 'package:poem_mobile/models/claim.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:poem_mobile/widgets/widgets.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';


class ClaimListScreen extends StatefulWidget {
  @override
  _ClaimListScreenState createState() => _ClaimListScreenState();
}

class _ClaimListScreenState extends State<ClaimListScreen> {

  List<DropdownMenuItem<String>> items;
  
  bool isPaidClaimsOnly = false;
  bool showStatement = false;
  bool isScrollingUP;
  ScrollController _controller;
  
  PanelController _panelController;
  PanelController _legendPanelController;
  
  String selectedType = 'All claims';
  
  onClose() {
    setState(() {
      showStatement = false;
      _panelController.close();
    });
  }
  
  onViewStatement() {
     showMonthPicker(context, [2014, 2015, 2016, 2017, 2018, 2019], (year, month) {
      print('selected $year $month');
      setState(() {
        showStatement = true;
        _panelController.open();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    
    _controller = ScrollController();
    _controller.addListener(() {
      if(_controller.position.userScrollDirection == ScrollDirection.forward) {
         setState(() {
          isScrollingUP = false;
        });
        _panelController.open();
        _legendPanelController.close();
      } else if(_controller.position.userScrollDirection == ScrollDirection.reverse) {
        setState(() {
          isScrollingUP = true;
        });
        _panelController.close();
        _legendPanelController.close();
      }
    });
    
    _legendPanelController = PanelController();
    _panelController = PanelController();
    
    items = [];
    items.add(DropdownMenuItem<String>(value: 'All claims', child: Text('All claims', style: TextStyle(fontSize: 12, color: Color(0xFF5A585D)),)));
    items.add(DropdownMenuItem<String>(value: 'Estimated claims', child: Text('Estimated claims', style: TextStyle(fontSize: 12, color: Color(0xFF5A585D)),)));
    items.add(DropdownMenuItem<String>(value: 'Final claims', child: Text('Final claims', style: TextStyle(fontSize: 12, color: Color(0xFF5A585D)),)));
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ClaimHeader(),
                  const SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: PoemSearchBar(),
                      ),
                      Spacer(),
                      InkWell(onTap: () {
                        setState(() {
                          if(_legendPanelController.isPanelOpen()) {
                            _legendPanelController.close();
                          } else {
                            _legendPanelController.open();
                          }
                        });
                      }, child: Icon(Icons.more_vert, color: Color(0xFF0065FB), size: 30))
                    ],
                  ),
                  const SizedBox(height: 10),
                  DecoratedTabBar(
                    tabBar: TabBar(
                      onTap: (index) {
                        if(index == 0 && isPaidClaimsOnly) {
                          setState(() {
                            isPaidClaimsOnly = false;
                          });
                          BlocProvider.of<ClaimBloc>(context).add(ChangeClaimStatus(true));
                        } else if(index == 1 && !isPaidClaimsOnly){
                          setState(() {
                            isPaidClaimsOnly = true;
                          });
                          BlocProvider.of<ClaimBloc>(context).add(ChangeClaimStatus(false));
                        }
                      },
                      isScrollable: false,
                      labelColor: Color(0xff4a414e),
                      labelStyle: TextStyle(fontSize: 12),
                      unselectedLabelColor: Color(0xff69666b),
                      indicatorColor: Colors.black,
                      tabs: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('With balance'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Paid up'),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xFF4A414E),
                          width: 1.0
                        )
                      )
                    ),
                  ),
                  Visibility(
                    visible: !isPaidClaimsOnly,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child: InkWell(
                              onTap: () {
                                // DatePicker.showDatePicker(context);
                               onViewStatement();
                              },
                              child: Text('View statement', style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF0065FB),
                                fontWeight: FontWeight.w500
                              ),),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Text('Current balance \$98,466.78', style: TextStyle(
                              color: Color(0xFF0A0A10),
                              fontSize: 14
                            )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: true,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Visibility(visible: showStatement, child: StatementTable()),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 5),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFF8B93A6),
                        width: 1.0
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(3))
                    ),
                    child: DropdownButtonHideUnderline (
                      child: ButtonTheme(
                        child: DropdownButton(
                          value: selectedType,
                          items: items,
                          isDense: true,
                          onChanged: (value) {
                            if(value == 'All claims' && selectedType != 'All claims') {
                              BlocProvider.of<ClaimBloc>(context).add(ChangeClaimType(ClaimType.All));
                            } else if(value == 'Estimated claims' && selectedType != 'Estimated claims') {
                              BlocProvider.of<ClaimBloc>(context).add(ChangeClaimType(ClaimType.Estimated));
                            } else if(value == 'Final claims' && selectedType != 'Final claims') {
                              BlocProvider.of<ClaimBloc>(context).add(ChangeClaimType(ClaimType.Final));
                            }
                            setState(() {
                              selectedType = value;
                            });
                          }
                        )
                      )
                    )
                  ),
                  Expanded(
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Expanded(
                              child: BlocBuilder<ClaimBloc, ClaimState>(
                                condition: ((context, state) {
                                  return state is Intial || state is ClaimLoading || state is ClaimDataChanged;
                                }),
                                builder: (context, state) {
                                  if(state is Intial || state is ClaimLoading) {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else if(state is ClaimDataChanged) {
                                    return LazyLoadScrollView(   
                                      onEndOfPage: () {
                                        BlocProvider.of<ClaimBloc>(context).add(FetchMore());
                                      },                 
                                      child: ListView.builder(
                                        controller: _controller,
                                        itemCount: state.claims.length,
                                        itemBuilder: (context, int index) {
                                          return ClaimListItem(claim: state.claims[index]);
                                        },
                                      )
                                    );  
                                  }
                                  return Container();
                                },
                              ),
                            ),
                            BlocBuilder<ClaimBloc, ClaimState>(
                              builder: (context, state) {
                                if(state is ClaimLoadingMore) {
                                  return CircularProgressIndicator();
                                } else {
                                  return Container();
                                }
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
                              child: ScrollDirectionIndicator(isScrollingUp: isScrollingUP, onUp: (isUp) {
                                
                              })
                            ),
                          ),
                        ),                                        
                      ],
                    ),
                  )
                ]
              ),
              Visibility(
                visible: !isPaidClaimsOnly,
                child: SlidingUpPanel(
                  color: Colors.transparent,
                  minHeight: 0,
                  controller: _panelController,
                  maxHeight: 50,
                  panel: Opacity(
                    opacity: 0.8,
                    child: Container(                          
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                          InkWell(onTap: onClose, child: Text('Close', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500))),
                          InkWell(onTap: onViewStatement, child: Text('View statement', style: TextStyle(fontSize: 14, color: Color(0xFF0065FB), fontWeight: FontWeight.w500))),
                          InkWell(onTap: () {
                            Navigator.pushNamed(context, '/paymentOrderScreen');
                          }, child: Text('Pay now', style: TextStyle(fontSize: 22, color: Color(0xFF0065FB), fontWeight: FontWeight.w500))),
                        ]),
                      )
                    ),
                  )
                ),
              ),
              SlidingUpPanel(
                color: Colors.transparent,
                minHeight: 0,
                controller: _legendPanelController,
                maxHeight: 200,
                panel: Container(                          
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0
                    ),
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
                      LegendItem('DE', 'Denied because did not comply with contract'),
                      LegendItem('CP', 'Copay required by plan terms'),
                      LegendItem('DD', 'Deductible patient has to pay'),
                      LegendItem('CI', 'Coinsurance cost sharing according to plan terms'),
                      LegendItem('SP', 'Self pay by patient. Plan not responsible'),
                      LegendItem('Adj', 'Adjustments by providers after plan processed claim')
                  ])
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}