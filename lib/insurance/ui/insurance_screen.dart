import 'package:flutter/material.dart';
import 'package:poem_mobile/insurance/ui/insurance_information.dart';
import 'package:poem_mobile/insurance/ui/insurance_screen2.dart';
import 'package:poem_mobile/insurance/ui/plus_icon.dart';
import 'package:poem_mobile/search_history/ui/search_hisotry_screen.dart';
import 'package:poem_mobile/widgets/widgets.dart';

class InsuranceScreen extends StatefulWidget {
  @override
  _InsuranceScreenState createState() => _InsuranceScreenState();
}

class _InsuranceScreenState extends State<InsuranceScreen> {
  
  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                PoemAppBar(title: 'Insurance information'),
                const SizedBox(height: 20),
                Text('Healthcare claims', style: TextStyle(fontSize: 14)),
                const SizedBox(height: 5),
                Description(desc: 'Dependents who want to view their own claims must set up their own accounts'),
                const SizedBox(height: 5),
                Description(desc: 'Add adult dependents who cannot manage their own accounts and minor age children as your dependents'),
                const SizedBox(height: 5),
                Text('POEM (Patient out of pocket Expenses Management)', style: TextStyle(fontSize: 14)),
                const SizedBox(height: 5),
                Description(desc: 'We are excited to welcome you to POEM',),
                const SizedBox(height: 5),
                Description(desc: 'Take control over how you pay out-of-pocket (OOP) health care expenses. Pay over time if needed.',),
                const SizedBox(height: 5),
                Description(desc: 'Confidently get the care you need when you need it.',),
                Description(desc: 'Refer to your insurance benefits for this information. Only add data for the insurances for which you want POEM’s help.',),
                const SizedBox(height: 10),
                Row(children: <Widget>[
                  Text('You', style: TextStyle(color: Color(0xFF0065FB), fontSize: 14, fontWeight: FontWeight.w500)),
                  const SizedBox(width: 5),
                  Image.asset('assets/images/downward_icon.png', width: 20, fit: BoxFit.fitWidth)
                ]),
                const SizedBox(height: 10),
                InsuranceInformation(),
                const SizedBox(height: 15),
                Text('Minor age child', style: TextStyle(fontSize: 14)),
                const SizedBox(height: 10),
                Description(desc: 'Fill this section for each minor age dependent. Complete the OOP info only if the minor is covered by separate insurance from you AND you want the POEM service to help manage out of pocket expenses'),
                const SizedBox(height: 10),
                Row(children: <Widget>[
                  PlusMark(),
                  const SizedBox(width: 10),
                  Text('Minor age child', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF0065FB)))
                ]),
                const SizedBox(height: 10),
                Text('Adult dependent', style: TextStyle(fontSize: 14)),
                const SizedBox(height: 10),
                Description(desc: 'Fill this section for each adult dependent. Complete the OOP info only if the dependent is covered by separate insurance from you AND you want the POEM service to help manage out of pocket expenses'),
                const SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Text('Adult dependent 1', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF0065FB))),
                    const SizedBox(width: 10),
                    Image.asset('assets/images/downward_icon.png', width: 20, fit: BoxFit.fitWidth)
                  ],
                ),
                const SizedBox(height: 10),
                Row(children: <Widget>[
                  PlusMark(),
                  const SizedBox(width: 10),
                  Text('Adult dependent', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF0065FB)))
                ]),
                Row(children: <Widget>[
                  Expanded(
                    flex: 6,
                    child: PoemInputWidget(
                      label: 'Full name on government issued ID*',
                    ),
                  ),   
                  const SizedBox(width: 15),              
                  Expanded(
                    flex: 2,
                    child: DropDownInputWidget(
                      label: 'Suffix',
                      itemList: ['Mr', 'Mrs', 'Miss'],
                      onChanged: (value) {},
                    ),
                  ),
                ]),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: PoemInputWidget(
                        label: 'Date of birth*',
                      ),
                    ),
                    Expanded(
                      child: DropDownInputWidget(
                        label: 'Sex',
                        itemList: ['Male', 'Female', 'Both'],
                        onChanged: (value) {

                        },
                      ),
                    ),
                    Expanded(
                    child: DropDownInputWidget(
                        label: 'Relationship',
                        itemList: ['Male', 'Female', 'Both'],
                        onChanged: (value) {
                          
                        },
                      ),
                    ),
                  ],
                ),
                FractionallySizedBox(
                  widthFactor: 0.8,
                  child: PoemInputWidget(
                    label: 'Email address',
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 4,
                      child: PoemInputWidget(
                        label: 'Social Security Number*',
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(),
                    ),
                    Expanded(
                      flex: 2,
                      child: DropDownInputWidget(
                        label: 'Martial status*',
                        itemList: ['Married', 'Single'],
                        onChanged: (value) {},
                      ),
                    )
                  ],
                ),
                PoemInputWidget(
                  label: 'Address',
                ),
                const SizedBox(height: 10),
                InsuranceInformation(),
                const SizedBox(height: 10),
                Row(children: <Widget>[
                  PlusMark(),
                  const SizedBox(width: 10),
                  Text('Adult dependent', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF0065FB)))
                ]),
                const SizedBox(height: 30),
                CustomButton(
                  text: 'Done',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => InsuranceScreen2()));
                  },
                ),
                const SizedBox(height: 30)
              ]
            ),
          ),
        ),
      ),
    );
  }
}