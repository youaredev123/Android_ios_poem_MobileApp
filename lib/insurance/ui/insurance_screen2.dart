import 'package:flutter/material.dart';
import 'package:poem_mobile/insurance/ui/role_select.dart';
import 'package:poem_mobile/search_history/ui/search_hisotry_screen.dart';
import 'package:poem_mobile/widgets/widgets.dart';
import 'card_capture_button.dart';
import 'finance_response_select.dart';

class InsuranceScreen2 extends StatefulWidget {
  @override
  _InsuranceScreen2State createState() => _InsuranceScreen2State();
}

class _InsuranceScreen2State extends State<InsuranceScreen2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
              PoemAppBar(title: 'Insurance information'),
              const SizedBox(height: 15),
              Row(children: <Widget>[
                Text('Health insurance - main', style: TextStyle(color: Color(0xFF0065FB), fontSize: 14, fontWeight: FontWeight.w500)),
                const SizedBox(width: 5),
                Image.asset('assets/images/downward_icon.png', width: 15, fit: BoxFit.fitWidth)
              ]),
              const SizedBox(height: 10),
              Description(desc: 'Complete applicable fields'),
              const SizedBox(height: 5),
              Description(desc: 'Enter the insurance plan name. We will fill the plan name, plan issuer, address and contact information if we have it.'),
              Row(children: <Widget>[
                Expanded(
                  flex: 3,
                  child: PoemInputWidget(
                    label: 'Plan name',
                  ),
                ),
                 Expanded(
                   flex: 3,
                  child: PoemInputWidget(
                    label: 'Plan issue',
                  ),
                ),
                 Expanded(
                   flex: 2,
                  child: PoemInputWidget(
                    label: 'Effective date',
                  ),
                ),
              ]),
              Row(children: <Widget>[
                Expanded(
                  flex: 3,
                  child: PoemInputWidget(
                    label: 'Name on card',
                  ),
                ),
                 Expanded(
                   flex: 3,
                  child: PoemInputWidget(
                    label: 'Plan issue',
                  ),
                ),
                const SizedBox(width: 20)
              ]),
               Row(children: <Widget>[
                Expanded(
                  flex: 3,
                  child: PoemInputWidget(
                    label: 'Plan address',
                  ),
                ),
                 Expanded(
                   flex: 3,
                  child: PoemInputWidget(
                    label: 'Group plan ID',
                  ),
                ),
                const SizedBox(width: 20)
              ]),
              Row(children: <Widget>[
                Expanded(
                  flex: 3,
                  child: PoemInputWidget(
                    label: 'Patient support phone number',
                  ),
                ),
                 Expanded(
                   flex: 3,
                  child: PoemInputWidget(
                    label: 'Provider support phone number',
                  ),
                ),
              ]),
              RoleSelect(),
              Description(desc: 'We will contact the primary to confirm'),
              FractionallySizedBox(
                widthFactor: 0.8,
                child: PoemInputWidget(
                  label: 'Email address of primary*',
                ),
              ),
              FinanceResoponseSelect(),
              Row(children: <Widget>[
                Expanded(
                  flex: 2,
                  child: PoemInputWidget(
                    label: 'Financial Responsible name',
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: DropDownInputWidget(
                    label: 'Relationship',
                    itemList: ['Father', 'Mother'],
                    onChanged: (value) {}
                  ),
                )
              ]),
              FractionallySizedBox(
                widthFactor: 0.8,
                child: PoemInputWidget(
                  label: 'Address',
                ),
              ),
              Description(desc: 'Take a photo of front and back of your insurance card.'),
              const SizedBox(height: 10),
              Row(children: <Widget>[
                Expanded(
                  child: CardCaptureButton(title: 'Front'),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: CardCaptureButton(title: 'Back'),
                )
              ]),
              const SizedBox(height: 10),
              InsuranceType(title: 'Health insurance - other'),
              const SizedBox(height: 10),
              InsuranceType(title: 'Dental insurance'),
              const SizedBox(height: 10),
              InsuranceType(title: 'Vision insurance'),
              const SizedBox(height: 30),
              CustomButton(text: 'Done', onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => OOPCostsScreen()));
              }),
              const SizedBox(height: 30)
            ]),
          ),
        ),
      ),
    );
  }
}


class InsuranceType extends StatelessWidget {
  
  final String title;

  const InsuranceType({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Text(title, style: TextStyle(color: Color(0xFF0065FB), fontSize: 14, fontWeight: FontWeight.w500)),
      const SizedBox(width: 5),
      Image.asset('assets/images/downward_icon.png', width: 15, fit: BoxFit.fitWidth)
    ]);
  }
}