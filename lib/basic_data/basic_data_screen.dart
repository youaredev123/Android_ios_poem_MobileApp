import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:poem_mobile/email_verification/email_verification_screen.dart';
import 'package:poem_mobile/widgets/widgets.dart';

class BasicDataScreen extends StatefulWidget {
  @override
  _BasicDataScreenState createState() => _BasicDataScreenState();
}

class _BasicDataScreenState extends State<BasicDataScreen> {
  
  bool isHiddenFromSearch = false;
  
  @override
  Widget build(BuildContext context) {
    
    const TextStyle commentStyle = TextStyle(color: Color(0xFF5A585D), fontSize: 12, height: 1.3);
    
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
              PoemAppBar(title: 'Basic data'),
              const SizedBox(height: 13),
              Text('Lets get some information.', style: commentStyle),
              const SizedBox(height: 6),
              Text('We protect your personal and financial information, and privacy using industry standard best practices, to comply with HIPAA and applicable laws.', style: commentStyle),
              const SizedBox(height: 8),
              Text('Your data will be saved as you enter it. You can safely stop or pause if you need to and come back anytime to continue where you left off.', style: commentStyle),
              const SizedBox(height: 5),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 6,
                    child: PoemInputWidget(
                      label: 'Email address*',
                    ),
                  ),
                  const SizedBox(width: 40),
                   Expanded(
                     flex: 3,
                    child: PoemInputWidget(
                      label: 'Date of birth*',
                    ),
                  )
                ],
              ),
              const SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                    flex: 6,
                    child: PoemInputWidget(
                      label: 'Social Security Number*',
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 3,
                    child: DropDownInputWidget(
                      label: 'Sex',
                      itemList: ['Male', 'Female', 'Both'],
                      onChanged: (value) {},
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 3,
                    child: DropDownInputWidget(
                      label: 'Martial status*',
                      itemList: ['Single', 'Married', 'Divorce'],
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              PoemInputWidget(
                label: 'Address*',
              ),
              const SizedBox(height: 15),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[ 
                        Text('How long have you lived here?', style: commentStyle),
                        const SizedBox(height: 5),
                        Row(children: <Widget>[
                          Expanded(
                            child: DropDownInputWidget(
                              itemList: ['1', '2'],
                              label: 'Years*',
                              onChanged: (value) {

                              },
                            ),
                          ),
                           Expanded(
                            child: DropDownInputWidget(
                              itemList: ['1', '2'],
                              label: 'Months*',
                              onChanged: (value) {
                                
                              },
                            ),
                          ),
                           Expanded(
                            child: DropDownInputWidget(
                              itemList: ['1', '2'],
                              label: 'Status*',
                              onChanged: (value) {
                                
                              },
                            ),
                          ),
                        ])
                      ],
                    ),
                  ),
                  const SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Enter 1 year history of\nhome addresses.', style: commentStyle),
                      const SizedBox(height: 10),
                      TextButton(
                        text: '+ Add address',
                        style: TextStyle(color: Color(0xFF0065FB), fontSize: 14),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 15),
              Text('Employment', style: TextStyle(color: Color(0xFF5A585D), fontSize: 14, fontWeight: FontWeight.w500),),
              const SizedBox(height: 3),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: PoemInputWidget(
                      label: 'Employer name',
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: DropDownInputWidget(
                      label: 'Occupation',
                      itemList: ['Engineer'], onChanged: (String value) {},
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: PoemInputWidget(
                      label: 'Position',
                      
                    ),
                  )
                ],
              ),
              const SizedBox(height: 7),
              PoemInputWidget(
                label: 'Employer address',
              ),
              const SizedBox(height: 7),
              Row(
                children: <Widget>[
                  Container(
                    width: 100,
                    child: PoemInputWidget(
                      label: 'Employer no.',
                    ),
                  ),
                   Container(
                     width: 100,
                    child: PoemInputWidget(
                      label: 'Annual income',
                    ),
                  )
                ],
              ),
              const SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('How long have you worked here?', style: commentStyle),
                  const SizedBox(height: 10),
                  Row(children: <Widget>[
                    SizedBox(width: 100, child: DropDownInputWidget(
                      itemList: ['1', '2'],
                      label: 'Years*',
                      onChanged: (value) {},
                    ),),
                    SizedBox(width: 100, child: DropDownInputWidget(
                      itemList: ['1', '2'],
                      label: 'Months*',
                      onChanged: (value) {},
                    ),)
                  ]),
                ],
              ),
              const SizedBox(height: 15),
              Text('For your privacy and security, non-health care providers need your user name to search for you. They cannot search for you by your real name.', style: commentStyle),
              const SizedBox(height: 15),
              Row(
                children: <Widget>[
                  Expanded(child: Text('Slide the button to allow others to search for you by your real name', style: TextStyle(color: Color(0xFFFF0117), fontSize: 12))),
                   Transform.scale(
                    scale: 0.8,
                    child: CupertinoSwitch(
                      value: isHiddenFromSearch,
                      activeColor: Colors.blue,
                      onChanged: (value) {
                        setState(() {
                          isHiddenFromSearch = value;
                        });
                      },
                    ),
                  )
                ],
              ),
              const SizedBox(height: 0),
              CustomButton(
                text: 'Verify email',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => EmailVerificationScreen()));
                },
              ),
              const SizedBox(height: 15)
            ]),
          ),
        ),
      ),
    );
  }
}