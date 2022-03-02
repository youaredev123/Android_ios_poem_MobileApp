enum OwnerType {
  Provider,
  Payer,
  Employer
}

enum ClaimType {
  All,
  Final,
  Estimated
}

enum ClaimStatus {
  Default,
  PendingApproval,
  InPaymentCycle,
  AdministrativeProcessing,
  Paid
}

class Claim {
  int id;
  int patientId;
  int ownerId;
  OwnerType ownerType;
  String payToTaxId;
  int providerEntityId;
  int billingEntityId;
  int payerId;
  ClaimType claimType;
  double coPay;
  double estimatedCoPay;
  double deductible;
  double estimatedDeductible;
  double coInsurance;
  double estimatedCoInsurance;
  double selfPay;
  double estimatedSelfPay;
  double adjustments;
  double estimatedAdjustments;
  bool isOutOfNetwork;
  bool isApprovedByPatient;
  DateTime approvedByPatientTime;
  int parentClaimId;
  String providerGeneratedId;
  String insuranceGeneratedId;
  String dateOfServiceFrom;
  String dateOfServiceTo;
  double outOfNetwork;
  double notCovered;
  double noPriorAuthorization;
  double denied;
  double charity;
  double writeOff;
  double rebate;
  double coupon;
  double other;
  ClaimStatus status;
  String unbundling;
  String duplicate;
  String billed;
  String approved;
  String contractAssignment;
  bool isActive;
  bool isPaidByPatient;
  bool isSeenByPaitient;
  bool isComplete;
  bool isPoemDiscount;
  bool isHeartFlag;
  bool isInGiftProcess;
  bool isGiftReceived;
  double patientPaidAmount;
  double patientBalanceAmount;
  double providerPaidAmount;
  double providerBalanceAmount;
  String claimDescription;
  String selfNote;
  String payerNote;
  String providerBillingNote;

  Claim() {
    payerId = 0;
    isPoemDiscount = false;
    isPaidByPatient = false;
  }
}
