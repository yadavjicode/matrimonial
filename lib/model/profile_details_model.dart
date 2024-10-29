class ProfileDetailsModel {
  String? status;
  Data? data;
  String? previous;
  String? next;
  MatchData? matchData;

  ProfileDetailsModel(
      {this.status, this.data, this.previous, this.next, this.matchData});

  ProfileDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    previous = json['previous'];
    next = json['next'];
    matchData = json['match_data'] != null
        ? new MatchData.fromJson(json['match_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['previous'] = this.previous;
    data['next'] = this.next;
    if (this.matchData != null) {
      data['match_data'] = this.matchData!.toJson();
    }
    return data;
  }
}

class Data {
  dynamic id;
  dynamic matriID;
  dynamic prefix;
  dynamic dumId;
  dynamic franchiseecode;
  dynamic termsofservice;
  dynamic confirmEmail;
  dynamic confirmPassword;
  dynamic profilecreatedby;
  dynamic referenceby;
  dynamic name;
  dynamic gender;
  dynamic dOB;
  dynamic age;
  dynamic tOB;
  dynamic pOB;
  dynamic maritalstatus;
  dynamic childrenlivingstatus;
  dynamic education;
  dynamic masterEducation;
  dynamic educationDetails;
  dynamic occupation;
  dynamic employedin;
  dynamic annualincome;
  dynamic religion;
  dynamic caste;
  dynamic subcaste;
  dynamic gothram;
  dynamic language;
  dynamic star;
  dynamic moonsign;
  dynamic horosmatch;
  dynamic manglik;
  dynamic height;
  dynamic weight;
  dynamic bloodGroup;
  dynamic bodytype;
  dynamic speCases;
  dynamic complexion;
  dynamic diet;
  dynamic smoke;
  dynamic drink;
  dynamic address;
  dynamic city;
  dynamic postal;
  dynamic state;
  dynamic country;
  dynamic phone;
  dynamic mobile;
  dynamic mobilecode;
  dynamic residencystatus;
  dynamic fathername;
  dynamic mothersname;
  dynamic fatherlivingstatus;
  dynamic motherlivingstatus;
  dynamic fathersoccupation;
  dynamic mothersoccupation;
  dynamic about;
  dynamic parProfile;
  dynamic looking;
  dynamic familyDetails;
  dynamic familyvalues;
  dynamic familyType;
  dynamic familyStatus;
  dynamic familyOrigin;
  dynamic noofbrothers;
  dynamic noofsisters;
  dynamic nbm;
  dynamic nsm;
  dynamic pEFromAge;
  dynamic pEToAge;
  dynamic pEHaveChildren;
  dynamic pEHeight;
  dynamic pEComplexion;
  dynamic pEMotherTongue;
  dynamic partnerExpectations;
  dynamic pEReligion;
  dynamic pECaste;
  dynamic pEEducation;
  dynamic pECountrylivingin;
  dynamic pEResidentstatus;
  dynamic hobbies;
  dynamic otherHobbies;
  dynamic GBHobbies;
  dynamic interests;
  dynamic otherInterests;
  dynamic status;
  dynamic memtype;
  dynamic regdate;
  dynamic iP;
  dynamic lastIp;
  dynamic ref;
  dynamic agent;
  dynamic deleteAction;
  dynamic memshipExpiryDate;
  dynamic expdays;
  dynamic horoscheck;
  dynamic horosApprove;
  dynamic photoProtect;
  dynamic photoprotectPassword;
  dynamic video;
  dynamic videocheck;
  dynamic noofcontacts;
  dynamic photocheck;
  dynamic photochecklist;
  dynamic videochecklist;
  dynamic horoschecklist;
  dynamic dOBday;
  dynamic dOBmonth;
  dynamic dOByear;
  dynamic orderstatus;
  dynamic photo1;
  dynamic photo1Approve;
  dynamic photo2;
  dynamic photo2Approve;
  dynamic photo3;
  dynamic photo4;
  dynamic photo4Approve;
  dynamic photo5;
  dynamic photo5Approve;
  dynamic photo3Approve;
  dynamic photoRemindCnt;
  dynamic logincount;
  dynamic lastlogin;
  dynamic thislogin;
  dynamic dumprofile;
  dynamic prosta;
  dynamic pagecount;
  dynamic noyusisters;
  dynamic noyubrothers;
  dynamic matchalertstatus;
  dynamic matchalertsentdate;
  dynamic crop;
  dynamic pEHeight2;
  dynamic quick;
  dynamic r1;
  dynamic r2;
  dynamic r3;
  dynamic r4;
  dynamic r5;
  dynamic r6;
  dynamic r7;
  dynamic r8;
  dynamic r9;
  dynamic r10;
  dynamic r11;
  dynamic r12;
  dynamic a1;
  dynamic a2;
  dynamic a3;
  dynamic a4;
  dynamic a5;
  dynamic a6;
  dynamic a7;
  dynamic a8;
  dynamic a9;
  dynamic a10;
  dynamic a11;
  dynamic a12;
  dynamic thosam;
  dynamic horosother;
  dynamic dummy;
  dynamic dasatype;
  dynamic dasayear;
  dynamic dasamonth;
  dynamic dasadate;
  dynamic featured;
  dynamic friEmail;
  dynamic agtId;
  dynamic agtEmail;
  dynamic verifyEmail;
  dynamic onlineUsers;
  dynamic mobileverify;
  dynamic mobileverifycode;
  dynamic pEOccupation;
  dynamic pESubcaste;
  dynamic familyState;
  dynamic familyCity;
  dynamic staffid;
  dynamic staffWorkStatus;
  dynamic assignDate;
  dynamic staffId;
  dynamic memberCreated;
  dynamic admin;
  dynamic pEState;
  dynamic anyDesability;
  dynamic formStatus;
  dynamic marryCommunities;
  dynamic dosh;
  dynamic pEMaritalStatus;
  dynamic casteNOBar;
  dynamic foodPreference;
  dynamic staffPendingStatus;
  dynamic adhaarPhoto1;
  dynamic adhaarPhoto2;
  dynamic profileVerify;
  dynamic profileFor;
  dynamic followStatus;
  dynamic alternatePhone;
  dynamic alternateMobile;
  dynamic pEAnnualincome;
  dynamic nameTitle;
  dynamic surename;
  dynamic otherNameTitle;
  dynamic reference1Reletion;
  dynamic reference1Name;
  dynamic reference1Email;
  dynamic reference1Mobile;
  dynamic reference2Reletion;
  dynamic reference2Name;
  dynamic reference2Email;
  dynamic reference2Mobile;
  dynamic motherBussness;
  dynamic motherAnnualTurnover;
  dynamic motherAnnualIncome;
  dynamic motherEmployee;
  dynamic motherAnnualSalaryRang;
  dynamic fatherBussness;
  dynamic fatherAnnualTurnover;
  dynamic fatherAnnualIncome;
  dynamic fatherEmployee;
  dynamic fatherAnnualSalaryRang;
  dynamic addressType;
  dynamic permanentHouseType;
  dynamic permanentState;
  dynamic permanentCity;
  dynamic permanentPincode;
  dynamic tempState;
  dynamic tempCity;
  dynamic tempPincode;
  dynamic workState;
  dynamic workCity;
  dynamic workPincode;
  dynamic sister;
  dynamic brother;
  dynamic totalMemberInFamily;
  dynamic professionalQualification;
  dynamic groomBride;
  dynamic nightSnoring;
  dynamic lifeStyleDisease;
  dynamic pEFromWeight;
  dynamic pEToWeight;
  dynamic pELanguage;
  dynamic pEProfessional;
  dynamic pEDiet;
  dynamic pEDrink;
  dynamic pESmoking;
  dynamic motherTongue;
  dynamic createdAt;
  dynamic pEFamilyValue;
  dynamic pEFamilyType;
  dynamic timeOfBirth;
  dynamic countryOfBirth;
  dynamic stateOfBirth;
  dynamic challenged;
  dynamic anyOperation;
  dynamic cityOfBirth;
  dynamic completeProfile;
  dynamic hideIncome;
  dynamic otherMotherTongue;
  dynamic operationSurgeryType;
  dynamic otherLifeStyleDisease;
  dynamic otherQualification;
  dynamic otherProfrsionQualification;
  dynamic memberStatus;
  dynamic rejectReason;
  dynamic marriedDate;
  dynamic widowDivorceDate;
  dynamic noOfChild;
  dynamic youAreLivingWith;
  dynamic childGender;
  dynamic childAge;
  dynamic pENightSnoring;
  dynamic lastSaturdayEmailSend;
  dynamic lastSundayEmailSend;
  dynamic otp;
  dynamic deviceToken;
  dynamic workingAnywhere;
  dynamic somethingAboutYourDevotionalLife;
  dynamic iskonType;
  dynamic nameOfTemple;
  dynamic cityOfTheTemple;
  dynamic devotionalHobbies;
  dynamic nameOfTheCounselorOfMySpiritualPath;
  dynamic connectedWithMyCounselerSince;
  dynamic withWhichTempleYourCounselorIsConnectedTo;
  dynamic counselorResidingInState;
  dynamic counselorResidingInCity;
  dynamic somethingAboutMoreCounselor;
  dynamic step1;
  dynamic step2;
  dynamic step3;
  dynamic step4;
  dynamic step5;
  dynamic step6;
  dynamic step7;
  dynamic step8;
  dynamic step9;
  dynamic step10;
  dynamic step11;
  dynamic step12;
  dynamic spiritualName;
  dynamic instagramId;
  dynamic employmentSummary;
  List<ProfileImages>? profileImages;
  dynamic shortlistStatus;
  dynamic interestStatus;
  dynamic accountType;
  dynamic spiritualConnected;
  dynamic chatStatus;
  dynamic hideLastActiveStatus;
  dynamic hideOnlineStatus;
  dynamic hideProfileStatus;
  dynamic hidePhoneStatus;
  dynamic hideEmailStatus;
  dynamic hideAstroStatus;
  dynamic whichsampradaya;
  dynamic dikshaGuru;
  dynamic blockStatus;
  Data(
      {this.id,
      this.matriID,
      this.prefix,
      this.dumId,
      this.franchiseecode,
      this.termsofservice,
      this.confirmEmail,
      this.confirmPassword,
      this.profilecreatedby,
      this.referenceby,
      this.name,
      this.gender,
      this.dOB,
      this.age,
      this.tOB,
      this.pOB,
      this.maritalstatus,
      this.childrenlivingstatus,
      this.education,
      this.masterEducation,
      this.educationDetails,
      this.occupation,
      this.employedin,
      this.annualincome,
      this.religion,
      this.caste,
      this.subcaste,
      this.gothram,
      this.language,
      this.star,
      this.moonsign,
      this.horosmatch,
      this.manglik,
      this.height,
      this.weight,
      this.bloodGroup,
      this.bodytype,
      this.speCases,
      this.complexion,
      this.diet,
      this.smoke,
      this.drink,
      this.address,
      this.city,
      this.postal,
      this.state,
      this.country,
      this.phone,
      this.mobile,
      this.mobilecode,
      this.residencystatus,
      this.fathername,
      this.mothersname,
      this.fatherlivingstatus,
      this.motherlivingstatus,
      this.fathersoccupation,
      this.mothersoccupation,
      this.about,
      this.parProfile,
      this.looking,
      this.familyDetails,
      this.familyvalues,
      this.familyType,
      this.familyStatus,
      this.familyOrigin,
      this.noofbrothers,
      this.noofsisters,
      this.nbm,
      this.nsm,
      this.pEFromAge,
      this.pEToAge,
      this.pEHaveChildren,
      this.pEHeight,
      this.pEComplexion,
      this.pEMotherTongue,
      this.partnerExpectations,
      this.pEReligion,
      this.pECaste,
      this.pEEducation,
      this.pECountrylivingin,
      this.pEResidentstatus,
      this.hobbies,
      this.GBHobbies,
      this.otherHobbies,
      this.interests,
      this.otherInterests,
      this.status,
      this.memtype,
      this.regdate,
      this.iP,
      this.lastIp,
      this.ref,
      this.agent,
      this.deleteAction,
      this.memshipExpiryDate,
      this.expdays,
      this.horoscheck,
      this.horosApprove,
      this.photoProtect,
      this.photoprotectPassword,
      this.video,
      this.videocheck,
      this.noofcontacts,
      this.photocheck,
      this.photochecklist,
      this.videochecklist,
      this.horoschecklist,
      this.dOBday,
      this.dOBmonth,
      this.dOByear,
      this.orderstatus,
      this.photo1,
      this.photo1Approve,
      this.photo2,
      this.photo2Approve,
      this.photo3,
      this.photo4,
      this.photo4Approve,
      this.photo5,
      this.photo5Approve,
      this.photo3Approve,
      this.photoRemindCnt,
      this.logincount,
      this.lastlogin,
      this.thislogin,
      this.dumprofile,
      this.prosta,
      this.pagecount,
      this.noyusisters,
      this.noyubrothers,
      this.matchalertstatus,
      this.matchalertsentdate,
      this.crop,
      this.pEHeight2,
      this.quick,
      this.r1,
      this.r2,
      this.r3,
      this.r4,
      this.r5,
      this.r6,
      this.r7,
      this.r8,
      this.r9,
      this.r10,
      this.r11,
      this.r12,
      this.a1,
      this.a2,
      this.a3,
      this.a4,
      this.a5,
      this.a6,
      this.a7,
      this.a8,
      this.a9,
      this.a10,
      this.a11,
      this.a12,
      this.thosam,
      this.horosother,
      this.dummy,
      this.dasatype,
      this.dasayear,
      this.dasamonth,
      this.dasadate,
      this.featured,
      this.friEmail,
      this.agtId,
      this.agtEmail,
      this.verifyEmail,
      this.onlineUsers,
      this.mobileverify,
      this.mobileverifycode,
      this.pEOccupation,
      this.pESubcaste,
      this.familyState,
      this.familyCity,
      this.staffid,
      this.staffWorkStatus,
      this.assignDate,
      this.staffId,
      this.memberCreated,
      this.admin,
      this.pEState,
      this.anyDesability,
      this.formStatus,
      this.marryCommunities,
      this.dosh,
      this.pEMaritalStatus,
      this.casteNOBar,
      this.foodPreference,
      this.staffPendingStatus,
      this.adhaarPhoto1,
      this.adhaarPhoto2,
      this.profileVerify,
      this.profileFor,
      this.followStatus,
      this.alternatePhone,
      this.alternateMobile,
      this.pEAnnualincome,
      this.nameTitle,
      this.surename,
      this.otherNameTitle,
      this.reference1Reletion,
      this.reference1Name,
      this.reference1Email,
      this.reference1Mobile,
      this.reference2Reletion,
      this.reference2Name,
      this.reference2Email,
      this.reference2Mobile,
      this.motherBussness,
      this.motherAnnualTurnover,
      this.motherAnnualIncome,
      this.motherEmployee,
      this.motherAnnualSalaryRang,
      this.fatherBussness,
      this.fatherAnnualTurnover,
      this.fatherAnnualIncome,
      this.fatherEmployee,
      this.fatherAnnualSalaryRang,
      this.addressType,
      this.permanentHouseType,
      this.permanentState,
      this.permanentCity,
      this.permanentPincode,
      this.tempState,
      this.tempCity,
      this.tempPincode,
      this.workState,
      this.workCity,
      this.workPincode,
      this.sister,
      this.brother,
      this.totalMemberInFamily,
      this.professionalQualification,
      this.groomBride,
      this.nightSnoring,
      this.lifeStyleDisease,
      this.pEFromWeight,
      this.pEToWeight,
      this.pELanguage,
      this.pEProfessional,
      this.pEDiet,
      this.pEDrink,
      this.pESmoking,
      this.motherTongue,
      this.createdAt,
      this.pEFamilyValue,
      this.pEFamilyType,
      this.timeOfBirth,
      this.countryOfBirth,
      this.stateOfBirth,
      this.challenged,
      this.anyOperation,
      this.cityOfBirth,
      this.completeProfile,
      this.hideIncome,
      this.otherMotherTongue,
      this.operationSurgeryType,
      this.otherLifeStyleDisease,
      this.otherQualification,
      this.otherProfrsionQualification,
      this.memberStatus,
      this.rejectReason,
      this.marriedDate,
      this.widowDivorceDate,
      this.noOfChild,
      this.youAreLivingWith,
      this.childGender,
      this.childAge,
      this.pENightSnoring,
      this.lastSaturdayEmailSend,
      this.lastSundayEmailSend,
      this.otp,
      this.deviceToken,
      this.workingAnywhere,
      this.somethingAboutYourDevotionalLife,
      this.iskonType,
      this.nameOfTemple,
      this.cityOfTheTemple,
      this.devotionalHobbies,
      this.nameOfTheCounselorOfMySpiritualPath,
      this.connectedWithMyCounselerSince,
      this.withWhichTempleYourCounselorIsConnectedTo,
      this.counselorResidingInState,
      this.counselorResidingInCity,
      this.somethingAboutMoreCounselor,
      this.step1,
      this.step2,
      this.step3,
      this.step4,
      this.step5,
      this.step6,
      this.step7,
      this.step8,
      this.step9,
      this.step10,
      this.step11,
      this.step12,
      this.spiritualName,
      this.instagramId,
      this.employmentSummary,
      this.profileImages,
      this.shortlistStatus,
      this.interestStatus,
      this.accountType,
      this.spiritualConnected,
      this.chatStatus,
      this.hideLastActiveStatus,
      this.hideOnlineStatus,
      this.hidePhoneStatus,
      this.hideEmailStatus,
      this.hideProfileStatus,
      this.hideAstroStatus,
      this.whichsampradaya,
      this.dikshaGuru,
      this.blockStatus});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    matriID = json['MatriID'];
    prefix = json['Prefix'];
    dumId = json['dum_id'];
    franchiseecode = json['franchiseecode'];
    termsofservice = json['Termsofservice'];
    confirmEmail = json['ConfirmEmail'];
    confirmPassword = json['ConfirmPassword'];
    profilecreatedby = json['Profilecreatedby'];
    referenceby = json['Referenceby'];
    name = json['Name'];
    gender = json['Gender'];
    dOB = json['DOB'];
    age = json['Age'];
    tOB = json['TOB'];
    pOB = json['POB'];
    maritalstatus = json['Maritalstatus'];
    childrenlivingstatus = json['childrenlivingstatus'];
    education = json['Education'];
    masterEducation = json['master_education'];
    educationDetails = json['EducationDetails'];
    occupation = json['Occupation'];
    employedin = json['Employedin'];
    annualincome = json['Annualincome'];
    religion = json['Religion'];
    caste = json['Caste'];
    subcaste = json['Subcaste'];
    gothram = json['Gothram'];
    language = json['Language'];
    star = json['Star'];
    moonsign = json['Moonsign'];
    horosmatch = json['Horosmatch'];
    manglik = json['Manglik'];
    height = json['Height'];
    weight = json['Weight'];
    bloodGroup = json['BloodGroup'];
    bodytype = json['Bodytype'];
    speCases = json['spe_cases'];
    complexion = json['Complexion'];
    diet = json['Diet'];
    smoke = json['Smoke'];
    drink = json['Drink'];
    address = json['Address'];
    city = json['City'];
    postal = json['Postal'];
    state = json['State'];
    country = json['Country'];
    phone = json['Phone'];
    mobile = json['Mobile'];
    mobilecode = json['mobilecode'];
    residencystatus = json['Residencystatus'];
    fathername = json['Fathername'];
    mothersname = json['Mothersname'];
    fatherlivingstatus = json['Fatherlivingstatus'];
    motherlivingstatus = json['Motherlivingstatus'];
    fathersoccupation = json['Fathersoccupation'];
    mothersoccupation = json['Mothersoccupation'];
    about = json['about'];
    parProfile = json['par_profile'];
    looking = json['Looking'];
    familyDetails = json['FamilyDetails'];
    familyvalues = json['Familyvalues'];
    familyType = json['FamilyType'];
    familyStatus = json['FamilyStatus'];
    familyOrigin = json['FamilyOrigin'];
    noofbrothers = json['noofbrothers'];
    noofsisters = json['noofsisters'];
    nbm = json['nbm'];
    nsm = json['nsm'];
    pEFromAge = json['PE_FromAge'];
    pEToAge = json['PE_ToAge'];
    pEHaveChildren = json['PE_HaveChildren'];
    pEHeight = json['PE_Height'];
    pEComplexion = json['PE_Complexion'];
    pEMotherTongue = json['PE_MotherTongue'];
    partnerExpectations = json['PartnerExpectations'];
    pEReligion = json['PE_Religion'];
    pECaste = json['PE_Caste'];
    pEEducation = json['PE_Education'];
    pECountrylivingin = json['PE_Countrylivingin'];
    pEResidentstatus = json['PE_Residentstatus'];
    hobbies = json['Hobbies'];
    otherHobbies = json['OtherHobbies'];
    GBHobbies = json['GB_Hobbies'];
    interests = json['Interests'];
    otherInterests = json['OtherInterests'];
    status = json['Status'];
    memtype = json['memtype'];
    regdate = json['Regdate'];
    iP = json['IP'];
    lastIp = json['last_ip'];
    ref = json['Ref'];
    agent = json['Agent'];
    deleteAction = json['DeleteAction'];
    memshipExpiryDate = json['MemshipExpiryDate'];
    expdays = json['expdays'];
    horoscheck = json['Horoscheck'];
    horosApprove = json['HorosApprove'];
    photoProtect = json['PhotoProtect'];
    photoprotectPassword = json['PhotoprotectPassword'];
    video = json['Video'];
    videocheck = json['Videocheck'];
    noofcontacts = json['Noofcontacts'];
    photocheck = json['photocheck'];
    photochecklist = json['photochecklist'];
    videochecklist = json['videochecklist'];
    horoschecklist = json['Horoschecklist'];
    dOBday = json['DOBday'];
    dOBmonth = json['DOBmonth'];
    dOByear = json['DOByear'];
    orderstatus = json['Orderstatus'];
    photo1 = json['Photo1'];
    photo1Approve = json['Photo1Approve'];
    photo2 = json['Photo2'];
    photo2Approve = json['Photo2Approve'];
    photo3 = json['Photo3'];
    photo4 = json['Photo4'];
    photo4Approve = json['Photo4Approve'];
    photo5 = json['Photo5'];
    photo5Approve = json['Photo5Approve'];
    photo3Approve = json['Photo3Approve'];
    photoRemindCnt = json['photo_remind_cnt'];
    logincount = json['Logincount'];
    lastlogin = json['Lastlogin'];
    thislogin = json['Thislogin'];
    dumprofile = json['dumprofile'];
    prosta = json['prosta'];
    pagecount = json['pagecount'];
    noyusisters = json['noyusisters'];
    noyubrothers = json['noyubrothers'];
    matchalertstatus = json['matchalertstatus'];
    matchalertsentdate = json['matchalertsentdate'];
    crop = json['crop'];
    pEHeight2 = json['PE_Height2'];
    quick = json['quick'];
    r1 = json['r1'];
    r2 = json['r2'];
    r3 = json['r3'];
    r4 = json['r4'];
    r5 = json['r5'];
    r6 = json['r6'];
    r7 = json['r7'];
    r8 = json['r8'];
    r9 = json['r9'];
    r10 = json['r10'];
    r11 = json['r11'];
    r12 = json['r12'];
    a1 = json['a1'];
    a2 = json['a2'];
    a3 = json['a3'];
    a4 = json['a4'];
    a5 = json['a5'];
    a6 = json['a6'];
    a7 = json['a7'];
    a8 = json['a8'];
    a9 = json['a9'];
    a10 = json['a10'];
    a11 = json['a11'];
    a12 = json['a12'];
    thosam = json['thosam'];
    horosother = json['horosother'];
    dummy = json['dummy'];
    dasatype = json['dasatype'];
    dasayear = json['dasayear'];
    dasamonth = json['dasamonth'];
    dasadate = json['dasadate'];
    featured = json['featured'];
    friEmail = json['fri_email'];
    agtId = json['agt_id'];
    agtEmail = json['agt_email'];
    verifyEmail = json['verify_email'];
    onlineUsers = json['OnlineUsers'];
    mobileverify = json['mobileverify'];
    mobileverifycode = json['mobileverifycode'];
    pEOccupation = json['PE_Occupation'];
    pESubcaste = json['PE_Subcaste'];
    familyState = json['FamilyState'];
    familyCity = json['FamilyCity'];
    staffid = json['staffid'];
    staffWorkStatus = json['staff_work_status'];
    assignDate = json['assign_date'];
    staffId = json['staff_id'];
    memberCreated = json['member_created'];
    admin = json['admin'];
    pEState = json['PE_State'];
    anyDesability = json['any_desability'];
    formStatus = json['form_status'];
    marryCommunities = json['marry_communities'];
    dosh = json['Dosh'];
    pEMaritalStatus = json['PE_Marital_Status'];
    casteNOBar = json['Caste_NO_Bar'];
    foodPreference = json['Food_Preference'];
    staffPendingStatus = json['staff_pending_status'];
    adhaarPhoto1 = json['Adhaar_Photo1'];
    adhaarPhoto2 = json['Adhaar_Photo2'];
    profileVerify = json['Profile_Verify'];
    profileFor = json['profile_for'];
    followStatus = json['Follow_Status'];
    alternatePhone = json['Alternate_Phone'];
    alternateMobile = json['Alternate_Mobile'];
    pEAnnualincome = json['PE_Annualincome'];
    nameTitle = json['name_title'];
    surename = json['surename'];
    otherNameTitle = json['other_name_title'];
    reference1Reletion = json['reference1_reletion'];
    reference1Name = json['reference1_name'];
    reference1Email = json['reference1_email'];
    reference1Mobile = json['reference1_mobile'];
    reference2Reletion = json['reference2_reletion'];
    reference2Name = json['reference2_name'];
    reference2Email = json['reference2_email'];
    reference2Mobile = json['reference2_mobile'];
    motherBussness = json['mother_bussness'];
    motherAnnualTurnover = json['mother_annual_turnover'];
    motherAnnualIncome = json['mother_annual_income'];
    motherEmployee = json['mother_employee'];
    motherAnnualSalaryRang = json['mother_annual_salary_rang'];
    fatherBussness = json['father_bussness'];
    fatherAnnualTurnover = json['father_annual_turnover'];
    fatherAnnualIncome = json['father_annual_income'];
    fatherEmployee = json['father_employee'];
    fatherAnnualSalaryRang = json['father_annual_salary_rang'];
    addressType = json['address_type'];
    permanentHouseType = json['permanent_house_type'];
    permanentState = json['permanent_state'];
    permanentCity = json['permanent_city'];
    permanentPincode = json['permanent_pincode'];
    tempState = json['temp_state'];
    tempCity = json['temp_city'];
    tempPincode = json['temp_pincode'];
    workState = json['work_state'];
    workCity = json['work_city'];
    workPincode = json['work_pincode'];
    sister = json['sister'];
    brother = json['brother'];
    totalMemberInFamily = json['total_member_in_family'];
    professionalQualification = json['professional_qualification'];
    groomBride = json['groom_bride'];
    nightSnoring = json['night_snoring'];
    lifeStyleDisease = json['life_style_disease'];
    pEFromWeight = json['PE_FromWeight'];
    pEToWeight = json['PE_ToWeight'];
    pELanguage = json['PE_Language'];
    pEProfessional = json['PE_Professional'];
    pEDiet = json['PE_Diet'];
    pEDrink = json['PE_Drink'];
    pESmoking = json['PE_Smoking'];
    motherTongue = json['mother_tongue'];
    createdAt = json['created_at'];
    pEFamilyValue = json['PE_family_value'];
    pEFamilyType = json['PE_family_type'];
    timeOfBirth = json['time_of_birth'];
    countryOfBirth = json['country_of_birth'];
    stateOfBirth = json['state_of_birth'];
    challenged = json['challenged'];
    anyOperation = json['any_operation'];
    cityOfBirth = json['city_of_birth'];
    completeProfile = json['complete_profile'];
    hideIncome = json['hide_income'];
    otherMotherTongue = json['other_mother_tongue'];
    operationSurgeryType = json['operation_surgery_type'];
    otherLifeStyleDisease = json['other_life_style_disease'];
    otherQualification = json['other_qualification'];
    otherProfrsionQualification = json['other_profrsion_qualification'];
    memberStatus = json['member_status'];
    rejectReason = json['-reject_reason'];
    marriedDate = json['married_date'];
    widowDivorceDate = json['Widow_divorce_date'];
    noOfChild = json['no_of_child'];
    youAreLivingWith = json['you_are_living_with'];
    childGender = json['Child_gender'];
    childAge = json['Child_age'];
    pENightSnoring = json['PE_night_snoring'];
    lastSaturdayEmailSend = json['last_saturday_email_send'];
    lastSundayEmailSend = json['last_sunday_email_send'];
    otp = json['otp'];
    deviceToken = json['device_token'];
    workingAnywhere = json['working_anywhere'];
    somethingAboutYourDevotionalLife =
        json['something_about_your_devotional_life'];
    iskonType = json['iskon_type'];
    nameOfTemple = json['name_of_temple'];
    cityOfTheTemple = json['city_of_the_temple'];
    devotionalHobbies = json['devotional_hobbies'];
    nameOfTheCounselorOfMySpiritualPath =
        json['name_of_the_counselor_of_my_spiritual_path'];
    connectedWithMyCounselerSince = json['connected_with_my_counseler_since'];
    withWhichTempleYourCounselorIsConnectedTo =
        json['with_which_temple_your_counselor_is_connected_to'];
    counselorResidingInState = json['counselor_residing_in_state'];
    counselorResidingInCity = json['counselor_residing_in_city'];
    somethingAboutMoreCounselor = json['something_about_more_counselor'];
    step1 = json['step_1'];
    step2 = json['step_2'];
    step3 = json['step_3'];
    step4 = json['step_4'];
    step5 = json['step_5'];
    step6 = json['step_6'];
    step7 = json['step_7'];
    step8 = json['step_8'];
    step9 = json['step_9'];
    step10 = json['step_10'];
    step11 = json['step_11'];
    step12 = json['step_12'];
    spiritualName = json['spiritual_name'];
    instagramId = json['instagram_id'];
    shortlistStatus = json['shortlist_status'];
    interestStatus = json['interest_status'];
    accountType = json['account_type'];
    employmentSummary = json['employment_summary'];
    chatStatus = json['chat_status'];
    hideLastActiveStatus = json['hide_last_active'];
    hideOnlineStatus = json['hide_online_status'];
    blockStatus = json['block_status'];
    hidePhoneStatus = json['hide_phone_status'];
    hideEmailStatus = json['hide_email_status'];
    hideProfileStatus = json['hide_profile_temp'];
    hideAstroStatus = json['hide_astrological_info'];
    spiritualConnected = json['spiritual_counseler_connected'];
    whichsampradaya = json['which_sampradaya_you_belogn_to'];
    dikshaGuru = json['name_of_spiritual_master_diksha_guru'];
    if (json['profile_images'] != null) {
      profileImages = <ProfileImages>[];
      json['profile_images'].forEach((v) {
        profileImages!.add(new ProfileImages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['MatriID'] = this.matriID;
    data['Prefix'] = this.prefix;
    data['dum_id'] = this.dumId;
    data['franchiseecode'] = this.franchiseecode;
    data['Termsofservice'] = this.termsofservice;
    data['ConfirmEmail'] = this.confirmEmail;
    data['ConfirmPassword'] = this.confirmPassword;
    data['Profilecreatedby'] = this.profilecreatedby;
    data['Referenceby'] = this.referenceby;
    data['Name'] = this.name;
    data['Gender'] = this.gender;
    data['DOB'] = this.dOB;
    data['Age'] = this.age;
    data['TOB'] = this.tOB;
    data['POB'] = this.pOB;
    data['Maritalstatus'] = this.maritalstatus;
    data['childrenlivingstatus'] = this.childrenlivingstatus;
    data['Education'] = this.education;
    data['master_education'] = this.masterEducation;
    data['EducationDetails'] = this.educationDetails;
    data['Occupation'] = this.occupation;
    data['Employedin'] = this.employedin;
    data['Annualincome'] = this.annualincome;
    data['Religion'] = this.religion;
    data['Caste'] = this.caste;
    data['Subcaste'] = this.subcaste;
    data['Gothram'] = this.gothram;
    data['Language'] = this.language;
    data['Star'] = this.star;
    data['Moonsign'] = this.moonsign;
    data['Horosmatch'] = this.horosmatch;
    data['Manglik'] = this.manglik;
    data['Height'] = this.height;
    data['Weight'] = this.weight;
    data['BloodGroup'] = this.bloodGroup;
    data['Bodytype'] = this.bodytype;
    data['spe_cases'] = this.speCases;
    data['Complexion'] = this.complexion;
    data['Diet'] = this.diet;
    data['Smoke'] = this.smoke;
    data['Drink'] = this.drink;
    data['Address'] = this.address;
    data['City'] = this.city;
    data['Postal'] = this.postal;
    data['State'] = this.state;
    data['Country'] = this.country;
    data['Phone'] = this.phone;
    data['Mobile'] = this.mobile;
    data['mobilecode'] = this.mobilecode;
    data['Residencystatus'] = this.residencystatus;
    data['Fathername'] = this.fathername;
    data['Mothersname'] = this.mothersname;
    data['Fatherlivingstatus'] = this.fatherlivingstatus;
    data['Motherlivingstatus'] = this.motherlivingstatus;
    data['Fathersoccupation'] = this.fathersoccupation;
    data['Mothersoccupation'] = this.mothersoccupation;
    data['about'] = this.about;
    data['par_profile'] = this.parProfile;
    data['Looking'] = this.looking;
    data['FamilyDetails'] = this.familyDetails;
    data['Familyvalues'] = this.familyvalues;
    data['FamilyType'] = this.familyType;
    data['FamilyStatus'] = this.familyStatus;
    data['FamilyOrigin'] = this.familyOrigin;
    data['noofbrothers'] = this.noofbrothers;
    data['noofsisters'] = this.noofsisters;
    data['nbm'] = this.nbm;
    data['nsm'] = this.nsm;
    data['PE_FromAge'] = this.pEFromAge;
    data['PE_ToAge'] = this.pEToAge;
    data['PE_HaveChildren'] = this.pEHaveChildren;
    data['PE_Height'] = this.pEHeight;
    data['PE_Complexion'] = this.pEComplexion;
    data['PE_MotherTongue'] = this.pEMotherTongue;
    data['PartnerExpectations'] = this.partnerExpectations;
    data['PE_Religion'] = this.pEReligion;
    data['PE_Caste'] = this.pECaste;
    data['PE_Education'] = this.pEEducation;
    data['PE_Countrylivingin'] = this.pECountrylivingin;
    data['PE_Residentstatus'] = this.pEResidentstatus;
    data['Hobbies'] = this.hobbies;
    data['OtherHobbies'] = this.otherHobbies;
    data['GB_Hobbies'] = this.GBHobbies;
    data['Interests'] = this.interests;
    data['OtherInterests'] = this.otherInterests;
    data['Status'] = this.status;
    data['memtype'] = this.memtype;
    data['Regdate'] = this.regdate;
    data['IP'] = this.iP;
    data['last_ip'] = this.lastIp;
    data['Ref'] = this.ref;
    data['Agent'] = this.agent;
    data['DeleteAction'] = this.deleteAction;
    data['MemshipExpiryDate'] = this.memshipExpiryDate;
    data['expdays'] = this.expdays;
    data['Horoscheck'] = this.horoscheck;
    data['HorosApprove'] = this.horosApprove;
    data['PhotoProtect'] = this.photoProtect;
    data['PhotoprotectPassword'] = this.photoprotectPassword;
    data['Video'] = this.video;
    data['Videocheck'] = this.videocheck;
    data['Noofcontacts'] = this.noofcontacts;
    data['photocheck'] = this.photocheck;
    data['photochecklist'] = this.photochecklist;
    data['videochecklist'] = this.videochecklist;
    data['Horoschecklist'] = this.horoschecklist;
    data['DOBday'] = this.dOBday;
    data['DOBmonth'] = this.dOBmonth;
    data['DOByear'] = this.dOByear;
    data['Orderstatus'] = this.orderstatus;
    data['Photo1'] = this.photo1;
    data['Photo1Approve'] = this.photo1Approve;
    data['Photo2'] = this.photo2;
    data['Photo2Approve'] = this.photo2Approve;
    data['Photo3'] = this.photo3;
    data['Photo4'] = this.photo4;
    data['Photo4Approve'] = this.photo4Approve;
    data['Photo5'] = this.photo5;
    data['Photo5Approve'] = this.photo5Approve;
    data['Photo3Approve'] = this.photo3Approve;
    data['photo_remind_cnt'] = this.photoRemindCnt;
    data['Logincount'] = this.logincount;
    data['Lastlogin'] = this.lastlogin;
    data['Thislogin'] = this.thislogin;
    data['dumprofile'] = this.dumprofile;
    data['prosta'] = this.prosta;
    data['pagecount'] = this.pagecount;
    data['noyusisters'] = this.noyusisters;
    data['noyubrothers'] = this.noyubrothers;
    data['matchalertstatus'] = this.matchalertstatus;
    data['matchalertsentdate'] = this.matchalertsentdate;
    data['crop'] = this.crop;
    data['PE_Height2'] = this.pEHeight2;
    data['quick'] = this.quick;
    data['r1'] = this.r1;
    data['r2'] = this.r2;
    data['r3'] = this.r3;
    data['r4'] = this.r4;
    data['r5'] = this.r5;
    data['r6'] = this.r6;
    data['r7'] = this.r7;
    data['r8'] = this.r8;
    data['r9'] = this.r9;
    data['r10'] = this.r10;
    data['r11'] = this.r11;
    data['r12'] = this.r12;
    data['a1'] = this.a1;
    data['a2'] = this.a2;
    data['a3'] = this.a3;
    data['a4'] = this.a4;
    data['a5'] = this.a5;
    data['a6'] = this.a6;
    data['a7'] = this.a7;
    data['a8'] = this.a8;
    data['a9'] = this.a9;
    data['a10'] = this.a10;
    data['a11'] = this.a11;
    data['a12'] = this.a12;
    data['thosam'] = this.thosam;
    data['horosother'] = this.horosother;
    data['dummy'] = this.dummy;
    data['dasatype'] = this.dasatype;
    data['dasayear'] = this.dasayear;
    data['dasamonth'] = this.dasamonth;
    data['dasadate'] = this.dasadate;
    data['featured'] = this.featured;
    data['fri_email'] = this.friEmail;
    data['agt_id'] = this.agtId;
    data['agt_email'] = this.agtEmail;
    data['verify_email'] = this.verifyEmail;
    data['OnlineUsers'] = this.onlineUsers;
    data['mobileverify'] = this.mobileverify;
    data['mobileverifycode'] = this.mobileverifycode;
    data['PE_Occupation'] = this.pEOccupation;
    data['PE_Subcaste'] = this.pESubcaste;
    data['FamilyState'] = this.familyState;
    data['FamilyCity'] = this.familyCity;
    data['staffid'] = this.staffid;
    data['staff_work_status'] = this.staffWorkStatus;
    data['assign_date'] = this.assignDate;
    data['staff_id'] = this.staffId;
    data['member_created'] = this.memberCreated;
    data['admin'] = this.admin;
    data['PE_State'] = this.pEState;
    data['any_desability'] = this.anyDesability;
    data['form_status'] = this.formStatus;
    data['marry_communities'] = this.marryCommunities;
    data['Dosh'] = this.dosh;
    data['PE_Marital_Status'] = this.pEMaritalStatus;
    data['Caste_NO_Bar'] = this.casteNOBar;
    data['Food_Preference'] = this.foodPreference;
    data['staff_pending_status'] = this.staffPendingStatus;
    data['Adhaar_Photo1'] = this.adhaarPhoto1;
    data['Adhaar_Photo2'] = this.adhaarPhoto2;
    data['Profile_Verify'] = this.profileVerify;
    data['profile_for'] = this.profileFor;
    data['Follow_Status'] = this.followStatus;
    data['Alternate_Phone'] = this.alternatePhone;
    data['Alternate_Mobile'] = this.alternateMobile;
    data['PE_Annualincome'] = this.pEAnnualincome;
    data['name_title'] = this.nameTitle;
    data['surename'] = this.surename;
    data['other_name_title'] = this.otherNameTitle;
    data['reference1_reletion'] = this.reference1Reletion;
    data['reference1_name'] = this.reference1Name;
    data['reference1_email'] = this.reference1Email;
    data['reference1_mobile'] = this.reference1Mobile;
    data['reference2_reletion'] = this.reference2Reletion;
    data['reference2_name'] = this.reference2Name;
    data['reference2_email'] = this.reference2Email;
    data['reference2_mobile'] = this.reference2Mobile;
    data['mother_bussness'] = this.motherBussness;
    data['mother_annual_turnover'] = this.motherAnnualTurnover;
    data['mother_annual_income'] = this.motherAnnualIncome;
    data['mother_employee'] = this.motherEmployee;
    data['mother_annual_salary_rang'] = this.motherAnnualSalaryRang;
    data['father_bussness'] = this.fatherBussness;
    data['father_annual_turnover'] = this.fatherAnnualTurnover;
    data['father_annual_income'] = this.fatherAnnualIncome;
    data['father_employee'] = this.fatherEmployee;
    data['father_annual_salary_rang'] = this.fatherAnnualSalaryRang;
    data['address_type'] = this.addressType;
    data['permanent_house_type'] = this.permanentHouseType;
    data['permanent_state'] = this.permanentState;
    data['permanent_city'] = this.permanentCity;
    data['permanent_pincode'] = this.permanentPincode;
    data['temp_state'] = this.tempState;
    data['temp_city'] = this.tempCity;
    data['temp_pincode'] = this.tempPincode;
    data['work_state'] = this.workState;
    data['work_city'] = this.workCity;
    data['work_pincode'] = this.workPincode;
    data['sister'] = this.sister;
    data['brother'] = this.brother;
    data['total_member_in_family'] = this.totalMemberInFamily;
    data['professional_qualification'] = this.professionalQualification;
    data['groom_bride'] = this.groomBride;
    data['night_snoring'] = this.nightSnoring;
    data['life_style_disease'] = this.lifeStyleDisease;
    data['PE_FromWeight'] = this.pEFromWeight;
    data['PE_ToWeight'] = this.pEToWeight;
    data['PE_Language'] = this.pELanguage;
    data['PE_Professional'] = this.pEProfessional;
    data['PE_Diet'] = this.pEDiet;
    data['PE_Drink'] = this.pEDrink;
    data['PE_Smoking'] = this.pESmoking;
    data['mother_tongue'] = this.motherTongue;
    data['created_at'] = this.createdAt;
    data['PE_family_value'] = this.pEFamilyValue;
    data['PE_family_type'] = this.pEFamilyType;
    data['time_of_birth'] = this.timeOfBirth;
    data['country_of_birth'] = this.countryOfBirth;
    data['state_of_birth'] = this.stateOfBirth;
    data['challenged'] = this.challenged;
    data['any_operation'] = this.anyOperation;
    data['city_of_birth'] = this.cityOfBirth;
    data['complete_profile'] = this.completeProfile;
    data['hide_income'] = this.hideIncome;
    data['other_mother_tongue'] = this.otherMotherTongue;
    data['operation_surgery_type'] = this.operationSurgeryType;
    data['other_life_style_disease'] = this.otherLifeStyleDisease;
    data['other_qualification'] = this.otherQualification;
    data['other_profrsion_qualification'] = this.otherProfrsionQualification;
    data['member_status'] = this.memberStatus;
    data['-reject_reason'] = this.rejectReason;
    data['married_date'] = this.marriedDate;
    data['Widow_divorce_date'] = this.widowDivorceDate;
    data['no_of_child'] = this.noOfChild;
    data['you_are_living_with'] = this.youAreLivingWith;
    data['Child_gender'] = this.childGender;
    data['Child_age'] = this.childAge;
    data['PE_night_snoring'] = this.pENightSnoring;
    data['last_saturday_email_send'] = this.lastSaturdayEmailSend;
    data['last_sunday_email_send'] = this.lastSundayEmailSend;
    data['otp'] = this.otp;
    data['device_token'] = this.deviceToken;
    data['working_anywhere'] = this.workingAnywhere;
    data['something_about_your_devotional_life'] =
        this.somethingAboutYourDevotionalLife;
    data['iskon_type'] = this.iskonType;
    data['name_of_temple'] = this.nameOfTemple;
    data['city_of_the_temple'] = this.cityOfTheTemple;
    data['devotional_hobbies'] = this.devotionalHobbies;
    data['name_of_the_counselor_of_my_spiritual_path'] =
        this.nameOfTheCounselorOfMySpiritualPath;
    data['connected_with_my_counseler_since'] =
        this.connectedWithMyCounselerSince;
    data['with_which_temple_your_counselor_is_connected_to'] =
        this.withWhichTempleYourCounselorIsConnectedTo;
    data['counselor_residing_in_state'] = this.counselorResidingInState;
    data['counselor_residing_in_city'] = this.counselorResidingInCity;
    data['something_about_more_counselor'] = this.somethingAboutMoreCounselor;
    data['step_1'] = this.step1;
    data['step_2'] = this.step2;
    data['step_3'] = this.step3;
    data['step_4'] = this.step4;
    data['step_5'] = this.step5;
    data['step_6'] = this.step6;
    data['step_7'] = this.step7;
    data['step_8'] = this.step8;
    data['step_9'] = this.step9;
    data['step_10'] = this.step10;
    data['step_11'] = this.step11;
    data['step_12'] = this.step12;
    data['spiritual_name'] = this.spiritualName;
    data['instagram_id'] = this.instagramId;
    data['employment_summary'] = this.employmentSummary;
    data['shortlist_status'] = this.shortlistStatus;
    data['interest_status'] = this.interestStatus;
    data['account_type'] = this.accountType;
    data['hide_last_active'] = this.hideLastActiveStatus;
    data['hide_online_status'] = this.hideOnlineStatus;
    data['hide_phone_status'] = this.hidePhoneStatus;
    data['hide_email_status'] = this.hideEmailStatus;
    data['hide_profile_temp'] = this.hideProfileStatus;
    data['hide_astrological_info'] = this.hideAstroStatus;
    data['spiritual_counseler_connected'] = this.spiritualConnected;
    data['which_sampradaya_you_belogn_to'] = this.whichsampradaya;
    data['name_of_spiritual_master_diksha_guru'] = this.dikshaGuru;
    data['block_status'] = this.blockStatus;
    data['chat_status'] = this.chatStatus;
    if (this.profileImages != null) {
      data['profile_images'] =
          this.profileImages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProfileImages {
  dynamic id;
  dynamic memberId;
  dynamic image;
  dynamic isApproved;
  dynamic isProfile;
  dynamic createdAt;
  dynamic updatedAt;

  ProfileImages(
      {this.id,
      this.memberId,
      this.image,
      this.isApproved,
      this.isProfile,
      this.createdAt,
      this.updatedAt});

  ProfileImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    memberId = json['member_id'];
    image = json['image'];
    isApproved = json['is_approved'];
    isProfile = json['is_profile'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['member_id'] = this.memberId;
    data['image'] = this.image;
    data['is_approved'] = this.isApproved;
    data['is_profile'] = this.isProfile;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class MatchData {
  bool? age;
  bool? height;
  bool? maritalStatus;
  bool? religion;
  bool? country;
  bool? state;
  bool? income;
  int? matchCount;
  String? percentage;

  MatchData(
      {this.age,
      this.height,
      this.maritalStatus,
      this.religion,
      this.country,
      this.state,
      this.income,
      this.matchCount,
      this.percentage});

  MatchData.fromJson(Map<String, dynamic> json) {
    age = json['age'];
    height = json['height'];
    maritalStatus = json['marital_status'];
    religion = json['religion'];
    country = json['country'];
    state = json['state'];
    income = json['income'];
    matchCount = json['match_count'];
    percentage = json['percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['age'] = this.age;
    data['height'] = this.height;
    data['marital_status'] = this.maritalStatus;
    data['religion'] = this.religion;
    data['country'] = this.country;
    data['state'] = this.state;
    data['income'] = this.income;
    data['match_count'] = this.matchCount;
    data['percentage'] = this.percentage;
    return data;
  }
}
