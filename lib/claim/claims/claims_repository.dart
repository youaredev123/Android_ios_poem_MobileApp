import 'package:poem_mobile/models/claim.dart';

class ClaimRepository {
  
  Future<List<Claim>> fetchClaims(ClaimType claimType, bool paid, String keyword) async {
    await Future.delayed(Duration(seconds: 2));
    List<Claim> claims = [];
    Claim claim1 = Claim();
    claim1.claimType = ClaimType.Final;
    claim1.payerId = 3;
    claim1.isPaidByPatient = true;
    claims.add(claim1);
    
    Claim claim2 = Claim();
    claim2.claimType = ClaimType.Estimated;
    claim2.isPaidByPatient = true;
    claims.add(claim2);

    Claim claim3 = Claim();
    claim3.claimType = ClaimType.Final;
    claim3.isPaidByPatient = true;
    claims.add(claim3);

    Claim claim4 = Claim();
    claim4.claimType = ClaimType.Estimated;
    claim4.isPaidByPatient = true;
    claims.add(claim4);
   
    Claim claim5 = Claim();
    claim5.claimType = ClaimType.Final;
    claim5.payerId = 3;
    claim5.isPaidByPatient = true;
    claims.add(claim5);

    Claim claim6 = Claim();
    claim6.claimType = ClaimType.Final;
    claim6.isPoemDiscount = true;
    claim6.isPaidByPatient = true;
    claims.add(claim6);
    
    
    Claim claim7 = Claim();
    claim7.claimType = ClaimType.Final;
    claim7.payerId = 3;
    claims.add(claim7);

    Claim claim8 = Claim();
    claim8.claimType = ClaimType.Estimated;
    claims.add(claim8);

    Claim claim9 = Claim();
    claim9.claimType = ClaimType.Final;
    claims.add(claim9);

    Claim claim10 = Claim();
    claim10.claimType = ClaimType.Estimated;
    claims.add(claim10);

    Claim claim11 = Claim();
    claim11.claimType = ClaimType.Final;
    claim11.payerId = 3;
    claims.add(claim11);
    
    Claim claim12 = Claim();
    claim12.claimType = ClaimType.Final;
    claim12.isPoemDiscount = true;
    claims.add(claim12);
    if(claimType == ClaimType.All) {
      claims.retainWhere((item) =>item.isPaidByPatient == paid);  
    } else {
      claims.retainWhere((item) => item.claimType == claimType && item.isPaidByPatient == paid);
    }
    return claims;
  }

  Future<List<Claim>> fetchMoreClaims(int page, ClaimType claimType, bool paid, String keyword) async {
    
    await Future.delayed(Duration(seconds: 2));
    
    List<Claim> claims = [];
    Claim claim1 = Claim();
    claim1.claimType = ClaimType.Final;
    claim1.payerId = 3;
    claim1.isPaidByPatient = true;
    claims.add(claim1);
     
    Claim claim2 = Claim();
    claim2.claimType = ClaimType.Estimated;
    claim2.isPaidByPatient = true;
    claims.add(claim2);
    
    Claim claim3 = Claim();
    claim3.claimType = ClaimType.Final;
    claim3.isPaidByPatient = true;
    claims.add(claim3);
     
    Claim claim4 = Claim();
    claim4.claimType = ClaimType.Estimated;
    claim4.isPaidByPatient = true;
    claims.add(claim4);
   
    Claim claim5 = Claim();
    claim5.claimType = ClaimType.Final;
    claim5.payerId = 3;
    claim5.isPaidByPatient = true;
    claims.add(claim5);

    Claim claim6 = Claim();
    claim6.claimType = ClaimType.Final;
    claim6.isPoemDiscount = true;
    claim6.isPaidByPatient = true;
    claims.add(claim6);
    
    
    Claim claim7 = Claim();
    claim7.claimType = ClaimType.Final;
    claim7.payerId = 3;
    claims.add(claim7);

    Claim claim8 = Claim();
    claim8.claimType = ClaimType.Estimated;
    claims.add(claim8);

    Claim claim9 = Claim();
    claim9.claimType = ClaimType.Final;
    claims.add(claim9);

    Claim claim10 = Claim();
    claim10.claimType = ClaimType.Estimated;
    claims.add(claim10);

    Claim claim11 = Claim();
    claim11.claimType = ClaimType.Final;
    claim11.payerId = 3;
    claims.add(claim11);
    
    Claim claim12 = Claim();
    claim12.claimType = ClaimType.Final;
    claim12.isPoemDiscount = true;
    claims.add(claim12);
     
    if(claimType == ClaimType.All) {
      claims.retainWhere((item) =>item.isPaidByPatient == paid);  
    } else {
      claims.retainWhere((item) => item.claimType == claimType && item.isPaidByPatient == paid);
    }
    return claims;
  }

  Future<List<Claim>> fetchSubClaims(int parentID) async {
   
    await Future.delayed(Duration(seconds: 2));
    
   List<Claim> claims = [];
    Claim claim1 = Claim();
    claim1.claimType = ClaimType.Final;
    claim1.payerId = 3;
    claim1.isPaidByPatient = true;
    claims.add(claim1);
    
    Claim claim2 = Claim();
    claim2.claimType = ClaimType.Estimated;
    claim2.isPaidByPatient = true;
    claims.add(claim2);

    Claim claim3 = Claim();
    claim3.claimType = ClaimType.Final;
    claim3.isPaidByPatient = true;
    claims.add(claim3);

    Claim claim4 = Claim();
    claim4.claimType = ClaimType.Estimated;
    claim4.isPaidByPatient = true;
    claims.add(claim4);

    Claim claim5 = Claim();
    claim5.claimType = ClaimType.Estimated;
    claim5.isPaidByPatient = true;
    claims.add(claim5);

    Claim claim6 = Claim();
    claim6.claimType = ClaimType.Estimated;
    claim6.isPaidByPatient = true;
    claims.add(claim6);

    Claim claim7 = Claim();
    claim7.claimType = ClaimType.Estimated;
    claim7.isPaidByPatient = true;
    claims.add(claim7);

    return claims;
  }
  
  Future<List<Claim>> fetchMoreSubClaims(int parentID) async {
    
    await Future.delayed(Duration(seconds: 2));
    
    List<Claim> claims = [];
    Claim claim1 = Claim();
    claim1.claimType = ClaimType.Final;
    claim1.payerId = 3;
    claim1.isPaidByPatient = true;
    claims.add(claim1);
    
    Claim claim2 = Claim();
    claim2.claimType = ClaimType.Estimated;
    claim2.isPaidByPatient = true;
    claims.add(claim2);

    Claim claim3 = Claim();
    claim3.claimType = ClaimType.Final;
    claim3.isPaidByPatient = true;
    claims.add(claim3);

    Claim claim4 = Claim();
    claim4.claimType = ClaimType.Estimated;
    claim4.isPaidByPatient = true;
    claims.add(claim4);

    Claim claim5 = Claim();
    claim5.claimType = ClaimType.Estimated;
    claim5.isPaidByPatient = true;
    claims.add(claim5);

    Claim claim6 = Claim();
    claim6.claimType = ClaimType.Estimated;
    claim6.isPaidByPatient = true;
    claims.add(claim6);

    Claim claim7 = Claim();
    claim7.claimType = ClaimType.Estimated;
    claim7.isPaidByPatient = true;
    claims.add(claim7);
    
    return claims;
  }
}