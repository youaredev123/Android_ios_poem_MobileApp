import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poem_mobile/home/home.dart';

class Summary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      condition: ((context, state) {
        return state is DataLoaded || state is DataEmpty;
      }),
      builder: (context, state) {
        if (state is DataLoaded) {
          return Column(children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 10, right: 13, bottom: 5),
              decoration: BoxDecoration(
                  color: Color(0xFFFFD7D5),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'You would have paid without POEM',
                          style: TextStyle(
                              fontSize: 16,
                              height: 1.5,
                              fontWeight: FontWeight.w500,
                              color: Colors.red),
                        ),
                        const SizedBox(height: 15),
                        Text('\$${state.savingSummary.paidWithoutPoem}',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: Colors.red))
                      ],
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/symbol_img1.png',
                        width: 50,
                        height: 55,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(height: 10),
                      Text('\$\$\$',
                          style: TextStyle(
                              fontSize: 22,
                              height: 1,
                              fontWeight: FontWeight.w600,
                              color: Colors.red)),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 7),
            Container(
              padding: EdgeInsets.only(right: 15, top: 10, bottom: 6),
              decoration: BoxDecoration(
                  color: Color(0xFFC7DDFF),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text('With POEM you only paid', style: TextStyle(fontSize: 16, height: 1.5, color: Color(0xFF0065FB), fontWeight: FontWeight.w500)),
                        const SizedBox(height: 15),
                        Text('\$65,430', style: TextStyle(fontSize: 22, height: 1, fontWeight: FontWeight.w600, color: Color(0xFF0065FB)),)
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Image.asset('assets/images/symbol_img2.png',
                          width: 60, fit: BoxFit.fitWidth),
                      Padding(
                        padding: const EdgeInsets.only(right: 10, top: 6),
                        child: Text('\$\$', style: TextStyle(fontSize: 22, height: 1, fontWeight: FontWeight.w600, color: Color(0xFF0065FB))),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 7),
            Container(
              padding: EdgeInsets.only(top: 12, right: 15, bottom: 5),
              decoration: BoxDecoration(
                  color: Color(0xFFBAFFC5),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text('You would have paid without POEM', style: TextStyle(fontSize: 16, height: 1, fontWeight: FontWeight.w600, color: Color(0xFF0AB425))),
                        const SizedBox(height: 20),
                        Text('\$65,430', style: TextStyle(color: Color(0xFF0AB425), height: 1, fontSize: 22, fontWeight: FontWeight.w600))
                      ],
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Image.asset('assets/images/symbol_img3.png',
                            width: 90, height: 35),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text('\$', style: TextStyle(color: Color(0xFF0AB425), fontSize: 22, fontWeight: FontWeight.w600)),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 15)
          ]);
        } else {
          return Text('Unimplemented State');
        }
      },
    );
  }
}
