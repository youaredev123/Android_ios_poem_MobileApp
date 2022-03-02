import 'package:flutter/material.dart';
import 'package:poem_mobile/insurance/ui/oop_costs/benefit_table.dart';
import 'package:poem_mobile/widgets/widgets.dart';

import '../insurance_screen2.dart';

class OOPCostsScreen extends StatefulWidget {
  @override
  _OOPCostsScreenState createState() => _OOPCostsScreenState();
}

class _OOPCostsScreenState extends State<OOPCostsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(children: <Widget>[
              PoemAppBar(title: 'Out of pocket costs'),
              const SizedBox(height: 15),
              InsuranceType(title: 'Insurance - main',),
              BenefitTableWidget(description: 'Do you have an out-of-pocket maximum for in-network benefits ?*', onIndividualDeductibleChanged: (value) {
                // individualDedPktMaxInNetBenefits = value;
              }, onIndividualOOPMaximumChanged: (value) {
                // individualOutOfPktMaxInNetBenefits = value;
              }, onFamilyDeductibleChanged: (value) {
                // familyDedPktMaxInNetBenefits = value;
              }, onFamilyOOPMaximumChaged: (value) {
                // familyOutOfPktMax = value;
              }, isHasOOPMaximum: (value) {
                // isOutOfPocketMaxInNetWorkBenefits = value;
              },),
               BenefitTableWidget(description: 'Out-of-networ benefits.*', onIndividualDeductibleChanged: (value) {
                // individualDedPktMaxInNetBenefits = value;
              }, onIndividualOOPMaximumChanged: (value) {
                // individualOutOfPktMaxInNetBenefits = value;
              }, onFamilyDeductibleChanged: (value) {
                // familyDedPktMaxInNetBenefits = value;
              }, onFamilyOOPMaximumChaged: (value) {
                // familyOutOfPktMax = value;
              }, isHasOOPMaximum: (value) {
                // isOutOfPocketMaxInNetWorkBenefits = value;
              },),
              const SizedBox(height: 10),
              InsuranceType(title: 'Dental Insurance',),
              const SizedBox(height: 10),
              InsuranceType(title: 'Vision Insurance',),
              const SizedBox(height: 30),
              CustomButton(text: 'Done', onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => PoemSummaryScreen()));
              }),
              const SizedBox(height: 30)
            ]),
          ),
        ),
      ),
    );
  }
}