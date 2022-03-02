import 'package:flutter/material.dart';
import 'package:poem_mobile/biometric_setup/biometric_setup_screen.dart';
import 'package:poem_mobile/consolidated_agreement/agreement_item.dart';
import 'package:poem_mobile/widgets/widgets.dart';

class AgreementScreen extends StatefulWidget {
  @override
  _AgreementScreenState createState() => _AgreementScreenState();
}

class _AgreementScreenState extends State<AgreementScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                PoemAppBar(title: 'Consolidated agreement'),
                const SizedBox(height: 15),
                AgreementItem(number: 1, onChanged: (value) {}, agreementTitle: 'Terms adn Conditions', agreementDescription: 'Lorem ipsum dolor sit amet, consetetur diam nonumyeirmod term is go invidunt ut la magna aliq uyamerat, sedny diaming.'),
                AgreementItem(number: 2, onChanged: (value) {}, agreementTitle: 'HIPAA Privacy Law Compliance', agreementDescription: 'Lorem ipsum dolor sit amet, consetetur diam nonumyeirmod term is go invidunt ut la magna aliq uyamerat, sedny diaming.'),
                AgreementItem(number: 4, onChanged: (value) {}, agreementTitle: 'Permission to share and request medical, personal and financial Information', agreementDescription: 'Lorem ipsum dolor sit amet, consetetur diam nonumyeirmod term is go invidunt ut la magna aliq uyamerat, sedny diaming.'),
                AgreementItem(number: 5, onChanged: (value) {}, agreementTitle: 'Permission to share and request medical, personal and financial Information', agreementDescription: 'Lorem ipsum dolor sit amet, consetetur diam nonumyeirmod term is go invidunt ut la magna aliq uyamerat, sedny diaming.'),
                AgreementItem(number: 6, onChanged: (value) {}, agreementTitle: 'Permission to share and request medical, personal and financial Information', agreementDescription: 'Lorem ipsum dolor sit amet, consetetur diam nonumyeirmod term is go invidunt ut la magna aliq uyamerat, sedny diaming.'),
                AgreementItem(number: 7, onChanged: (value) {}, agreementTitle: 'Permission to share and request medical, personal and financial Information', agreementDescription: 'Lorem ipsum dolor sit amet, consetetur diam nonumyeirmod term is go invidunt ut la magna aliq uyamerat, sedny diaming.'),
                AgreementItem(number: 8, onChanged: (value) {}, agreementTitle: 'Permission to share and request medical, personal and financial Information', agreementDescription: 'Lorem ipsum dolor sit amet, consetetur diam nonumyeirmod term is go invidunt ut la magna aliq uyamerat, sedny diaming.'),
                AgreementItem(number: 9, onChanged: (value) {}, agreementTitle: 'Permission to share and request medical, personal and financial Information', agreementDescription: 'Lorem ipsum dolor sit amet, consetetur diam nonumyeirmod term is go invidunt ut la magna aliq uyamerat, sedny diaming.'),
                AgreementItem(number: 10, onChanged: (value) {}, agreementTitle: 'Permission to share and request medical, personal and financial Information', agreementDescription: 'Lorem ipsum dolor sit amet, consetetur diam nonumyeirmod term is go invidunt ut la magna aliq uyamerat, sedny diaming.'),
                AgreementItem(number: 11, onChanged: (value) {}, agreementTitle: 'Permission to share and request medical, personal and financial Information', agreementDescription: 'Lorem ipsum dolor sit amet, consetetur diam nonumyeirmod term is go invidunt ut la magna aliq uyamerat, sedny diaming.'),
                AgreementItem(number: 12, onChanged: (value) {}, agreementTitle: 'Permission to share and request medical, personal and financial Information', agreementDescription: 'Lorem ipsum dolor sit amet, consetetur diam nonumyeirmod term is go invidunt ut la magna aliq uyamerat, sedny diaming.'),
                const SizedBox(height: 5),
                TextButton(
                  text: 'Read more',
                  style: TextStyle(color: Color(0xFF0065FB), fontSize: 14, fontWeight: FontWeight.w500),
                ),
               
                CustomButton(
                  text: 'Agree',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BiometricSetupScreen()));
                  },
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('Not now. Go to ', style: TextStyle(color: Color(0xFF333333), fontSize: 12)),
                    Text('Provider Search', style: TextStyle(color: Color(0xFF0065FB), fontSize: 14),)
                  ],
                ),
                const SizedBox(height: 20)
              ],
            ),
          ),
        ),
      ),
    );
  }
}