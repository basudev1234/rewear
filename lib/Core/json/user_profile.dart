// class Autogenerated {
//   String ehUserId;
//   Mobileno mobileno;
//   List<AlternateMobileno> alternateMobileno;
//   String emailId;
//   List<AlternateEmailId> alternateEmailId;
//   List<Null> address;
//   String gender;
//   String maritalStatus;
//   String dateOfBirth;
//   Weight weight;
//   Weight height;
//   int bmi;
//   String profession;
//   int salary;
//   String category;
//   String profileImage;
//   String bloodGroup;
//   List<Null> allergyList;
//   List<Null> diseaseList;
//   List<Null> splcondList;
//   List<Null> identificationMark;
//   List<Null> lifeStyle;
//   List<EmergencyContact> emergencyContact;
//   List<Null> insurance;
//   List<Vehicle> vehicle;
//   List<Null> doctorPreference;
//   List<Null> hospitalPreference;
//   List<Consent> consent;
//   List<Null> prescriptions;
//   List<String> diagnosticReports;
//   List<Allergy> allergy;
//   List<Null> dailyExposure;
//   List<Null> impairment;
//   List<Null> symptoms;
//   SocioEconomicStatus socioEconomicStatus;
//   List<Null> skills;
//   List<Null> workExperience;
//   List<Null> officeAddress;
//   List<Null> registration;
//   List<Groups> groups;
//   bool flag;
//   String qrCodeUrl;
//   String userName;
//   Aadhar aadhar;
//   String userFirstName;
//   String userLastName;
//   String organogramLevel;
//   UserDiary userDiary;
//   TagEntity tagEntity;
//   String age;
//   String bmiUnit;
//   String bmiMessage;
//   String dependentAccessToken;

//   Autogenerated(
//       {this.ehUserId,
//       this.mobileno,
//       this.alternateMobileno,
//       this.emailId,
//       this.alternateEmailId,
//       this.address,
//       this.gender,
//       this.maritalStatus,
//       this.dateOfBirth,
//       this.weight,
//       this.height,
//       this.bmi,
//       this.profession,
//       this.salary,
//       this.category,
//       this.profileImage,
//       this.bloodGroup,
//       this.allergyList,
//       this.diseaseList,
//       this.splcondList,
//       this.identificationMark,
//       this.lifeStyle,
//       this.emergencyContact,
//       this.insurance,
//       this.vehicle,
//       this.doctorPreference,
//       this.hospitalPreference,
//       this.consent,
//       this.prescriptions,
//       this.diagnosticReports,
//       this.allergy,
//       this.dailyExposure,
//       this.impairment,
//       this.symptoms,
//       this.socioEconomicStatus,
//       this.skills,
//       this.workExperience,
//       this.officeAddress,
//       this.registration,
//       this.groups,
//       this.flag,
//       this.qrCodeUrl,
//       this.userName,
//       this.aadhar,
//       this.userFirstName,
//       this.userLastName,
//       this.organogramLevel,
//       this.userDiary,
//       this.tagEntity,
//       this.age,
//       this.bmiUnit,
//       this.bmiMessage,
//       this.dependentAccessToken});

//   Autogenerated.fromJson(Map<String, dynamic> json) {
//     ehUserId = json['eh_user_id'];
//     mobileno = json['mobileno'] != null
//         ? new Mobileno.fromJson(json['mobileno'])
//         : null;
//     if (json['alternate_mobileno'] != null) {
//       alternateMobileno = new List<AlternateMobileno>();
//       json['alternate_mobileno'].forEach((v) {
//         alternateMobileno.add(new AlternateMobileno.fromJson(v));
//       });
//     }
//     emailId = json['email_id'];
//     if (json['alternate_email_id'] != null) {
//       alternateEmailId = new List<AlternateEmailId>();
//       json['alternate_email_id'].forEach((v) {
//         alternateEmailId.add(new AlternateEmailId.fromJson(v));
//       });
//     }
//     if (json['address'] != null) {
//       address = new List<Null>();
//       json['address'].forEach((v) {
//         address.add(new Null.fromJson(v));
//       });
//     }
//     gender = json['gender'];
//     maritalStatus = json['marital_status'];
//     dateOfBirth = json['date_of_birth'];
//     weight =
//         json['weight'] != null ? new Weight.fromJson(json['weight']) : null;
//     height =
//         json['height'] != null ? new Weight.fromJson(json['height']) : null;
//     bmi = json['bmi'];
//     profession = json['profession'];
//     salary = json['salary'];
//     category = json['category'];
//     profileImage = json['profile_image'];
//     bloodGroup = json['blood_group'];
//     if (json['allergy_list'] != null) {
//       allergyList = new List<Null>();
//       json['allergy_list'].forEach((v) {
//         allergyList.add(new Null.fromJson(v));
//       });
//     }
//     if (json['disease_list'] != null) {
//       diseaseList = new List<Null>();
//       json['disease_list'].forEach((v) {
//         diseaseList.add(new Null.fromJson(v));
//       });
//     }
//     if (json['splcond_list'] != null) {
//       splcondList = new List<Null>();
//       json['splcond_list'].forEach((v) {
//         splcondList.add(new Null.fromJson(v));
//       });
//     }
//     if (json['identification_mark'] != null) {
//       identificationMark = new List<Null>();
//       json['identification_mark'].forEach((v) {
//         identificationMark.add(new Null.fromJson(v));
//       });
//     }
//     if (json['life_style'] != null) {
//       lifeStyle = new List<Null>();
//       json['life_style'].forEach((v) {
//         lifeStyle.add(new Null.fromJson(v));
//       });
//     }
//     if (json['emergency_contact'] != null) {
//       emergencyContact = new List<EmergencyContact>();
//       json['emergency_contact'].forEach((v) {
//         emergencyContact.add(new EmergencyContact.fromJson(v));
//       });
//     }
//     if (json['insurance'] != null) {
//       insurance = new List<Null>();
//       json['insurance'].forEach((v) {
//         insurance.add(new Null.fromJson(v));
//       });
//     }
//     if (json['vehicle'] != null) {
//       vehicle = new List<Vehicle>();
//       json['vehicle'].forEach((v) {
//         vehicle.add(new Vehicle.fromJson(v));
//       });
//     }
//     if (json['doctor_preference'] != null) {
//       doctorPreference = new List<Null>();
//       json['doctor_preference'].forEach((v) {
//         doctorPreference.add(new Null.fromJson(v));
//       });
//     }
//     if (json['hospital_preference'] != null) {
//       hospitalPreference = new List<Null>();
//       json['hospital_preference'].forEach((v) {
//         hospitalPreference.add(new Null.fromJson(v));
//       });
//     }
//     if (json['consent'] != null) {
//       consent = new List<Consent>();
//       json['consent'].forEach((v) {
//         consent.add(new Consent.fromJson(v));
//       });
//     }
//     if (json['prescriptions'] != null) {
//       prescriptions = new List<Null>();
//       json['prescriptions'].forEach((v) {
//         prescriptions.add(new Null.fromJson(v));
//       });
//     }
//     diagnosticReports = json['diagnostic_reports'].cast<String>();
//     if (json['allergy'] != null) {
//       allergy = new List<Allergy>();
//       json['allergy'].forEach((v) {
//         allergy.add(new Allergy.fromJson(v));
//       });
//     }
//     if (json['daily_exposure'] != null) {
//       dailyExposure = new List<Null>();
//       json['daily_exposure'].forEach((v) {
//         dailyExposure.add(new Null.fromJson(v));
//       });
//     }
//     if (json['impairment'] != null) {
//       impairment = new List<Null>();
//       json['impairment'].forEach((v) {
//         impairment.add(new Null.fromJson(v));
//       });
//     }
//     if (json['symptoms'] != null) {
//       symptoms = new List<Null>();
//       json['symptoms'].forEach((v) {
//         symptoms.add(new Null.fromJson(v));
//       });
//     }
//     socioEconomicStatus = json['socio_economic_status'] != null
//         ? new SocioEconomicStatus.fromJson(json['socio_economic_status'])
//         : null;
//     if (json['skills'] != null) {
//       skills = new List<Null>();
//       json['skills'].forEach((v) {
//         skills.add(new Null.fromJson(v));
//       });
//     }
//     if (json['work_experience'] != null) {
//       workExperience = new List<Null>();
//       json['work_experience'].forEach((v) {
//         workExperience.add(new Null.fromJson(v));
//       });
//     }
//     if (json['office_address'] != null) {
//       officeAddress = new List<Null>();
//       json['office_address'].forEach((v) {
//         officeAddress.add(new Null.fromJson(v));
//       });
//     }
//     if (json['registration'] != null) {
//       registration = new List<Null>();
//       json['registration'].forEach((v) {
//         registration.add(new Null.fromJson(v));
//       });
//     }
//     if (json['groups'] != null) {
//       groups = new List<Groups>();
//       json['groups'].forEach((v) {
//         groups.add(new Groups.fromJson(v));
//       });
//     }
//     flag = json['flag'];
//     qrCodeUrl = json['qr_code_url'];
//     userName = json['user_name'];
//     aadhar =
//         json['aadhar'] != null ? new Aadhar.fromJson(json['aadhar']) : null;
//     userFirstName = json['user_first_name'];
//     userLastName = json['user_last_name'];
//     organogramLevel = json['organogram_level'];
//     userDiary = json['user_diary'] != null
//         ? new UserDiary.fromJson(json['user_diary'])
//         : null;
//     tagEntity = json['tag_entity'] != null
//         ? new TagEntity.fromJson(json['tag_entity'])
//         : null;
//     age = json['age'];
//     bmiUnit = json['bmi_unit'];
//     bmiMessage = json['bmi_message'];
//     dependentAccessToken = json['dependent_access_token'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['eh_user_id'] = this.ehUserId;
//     if (this.mobileno != null) {
//       data['mobileno'] = this.mobileno.toJson();
//     }
//     if (this.alternateMobileno != null) {
//       data['alternate_mobileno'] =
//           this.alternateMobileno.map((v) => v.toJson()).toList();
//     }
//     data['email_id'] = this.emailId;
//     if (this.alternateEmailId != null) {
//       data['alternate_email_id'] =
//           this.alternateEmailId.map((v) => v.toJson()).toList();
//     }
//     if (this.address != null) {
//       data['address'] = this.address.map((v) => v.toJson()).toList();
//     }
//     data['gender'] = this.gender;
//     data['marital_status'] = this.maritalStatus;
//     data['date_of_birth'] = this.dateOfBirth;
//     if (this.weight != null) {
//       data['weight'] = this.weight.toJson();
//     }
//     if (this.height != null) {
//       data['height'] = this.height.toJson();
//     }
//     data['bmi'] = this.bmi;
//     data['profession'] = this.profession;
//     data['salary'] = this.salary;
//     data['category'] = this.category;
//     data['profile_image'] = this.profileImage;
//     data['blood_group'] = this.bloodGroup;
//     if (this.allergyList != null) {
//       data['allergy_list'] = this.allergyList.map((v) => v.toJson()).toList();
//     }
//     if (this.diseaseList != null) {
//       data['disease_list'] = this.diseaseList.map((v) => v.toJson()).toList();
//     }
//     if (this.splcondList != null) {
//       data['splcond_list'] = this.splcondList.map((v) => v.toJson()).toList();
//     }
//     if (this.identificationMark != null) {
//       data['identification_mark'] =
//           this.identificationMark.map((v) => v.toJson()).toList();
//     }
//     if (this.lifeStyle != null) {
//       data['life_style'] = this.lifeStyle.map((v) => v.toJson()).toList();
//     }
//     if (this.emergencyContact != null) {
//       data['emergency_contact'] =
//           this.emergencyContact.map((v) => v.toJson()).toList();
//     }
//     if (this.insurance != null) {
//       data['insurance'] = this.insurance.map((v) => v.toJson()).toList();
//     }
//     if (this.vehicle != null) {
//       data['vehicle'] = this.vehicle.map((v) => v.toJson()).toList();
//     }
//     if (this.doctorPreference != null) {
//       data['doctor_preference'] =
//           this.doctorPreference.map((v) => v.toJson()).toList();
//     }
//     if (this.hospitalPreference != null) {
//       data['hospital_preference'] =
//           this.hospitalPreference.map((v) => v.toJson()).toList();
//     }
//     if (this.consent != null) {
//       data['consent'] = this.consent.map((v) => v.toJson()).toList();
//     }
//     if (this.prescriptions != null) {
//       data['prescriptions'] =
//           this.prescriptions.map((v) => v.toJson()).toList();
//     }
//     data['diagnostic_reports'] = this.diagnosticReports;
//     if (this.allergy != null) {
//       data['allergy'] = this.allergy.map((v) => v.toJson()).toList();
//     }
//     if (this.dailyExposure != null) {
//       data['daily_exposure'] =
//           this.dailyExposure.map((v) => v.toJson()).toList();
//     }
//     if (this.impairment != null) {
//       data['impairment'] = this.impairment.map((v) => v.toJson()).toList();
//     }
//     if (this.symptoms != null) {
//       data['symptoms'] = this.symptoms.map((v) => v.toJson()).toList();
//     }
//     if (this.socioEconomicStatus != null) {
//       data['socio_economic_status'] = this.socioEconomicStatus.toJson();
//     }
//     if (this.skills != null) {
//       data['skills'] = this.skills.map((v) => v.toJson()).toList();
//     }
//     if (this.workExperience != null) {
//       data['work_experience'] =
//           this.workExperience.map((v) => v.toJson()).toList();
//     }
//     if (this.officeAddress != null) {
//       data['office_address'] =
//           this.officeAddress.map((v) => v.toJson()).toList();
//     }
//     if (this.registration != null) {
//       data['registration'] = this.registration.map((v) => v.toJson()).toList();
//     }
//     if (this.groups != null) {
//       data['groups'] = this.groups.map((v) => v.toJson()).toList();
//     }
//     data['flag'] = this.flag;
//     data['qr_code_url'] = this.qrCodeUrl;
//     data['user_name'] = this.userName;
//     if (this.aadhar != null) {
//       data['aadhar'] = this.aadhar.toJson();
//     }
//     data['user_first_name'] = this.userFirstName;
//     data['user_last_name'] = this.userLastName;
//     data['organogram_level'] = this.organogramLevel;
//     if (this.userDiary != null) {
//       data['user_diary'] = this.userDiary.toJson();
//     }
//     if (this.tagEntity != null) {
//       data['tag_entity'] = this.tagEntity.toJson();
//     }
//     data['age'] = this.age;
//     data['bmi_unit'] = this.bmiUnit;
//     data['bmi_message'] = this.bmiMessage;
//     data['dependent_access_token'] = this.dependentAccessToken;
//     return data;
//   }
// }

// class Mobileno {
//   String countryCode;
//   String number;

//   Mobileno({this.countryCode, this.number});

//   Mobileno.fromJson(Map<String, dynamic> json) {
//     countryCode = json['country_code'];
//     number = json['number'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['country_code'] = this.countryCode;
//     data['number'] = this.number;
//     return data;
//   }
// }

// class AlternateMobileno {
//   String countryCode;
//   String number;
//   int active;
//   String modifiedOn;

//   AlternateMobileno(
//       {this.countryCode, this.number, this.active, this.modifiedOn});

//   AlternateMobileno.fromJson(Map<String, dynamic> json) {
//     countryCode = json['country_code'];
//     number = json['number'];
//     active = json['active'];
//     modifiedOn = json['modified_on'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['country_code'] = this.countryCode;
//     data['number'] = this.number;
//     data['active'] = this.active;
//     data['modified_on'] = this.modifiedOn;
//     return data;
//   }
// }

// class AlternateEmailId {
//   String emailId;
//   int active;
//   String modifiedOn;

//   AlternateEmailId({this.emailId, this.active, this.modifiedOn});

//   AlternateEmailId.fromJson(Map<String, dynamic> json) {
//     emailId = json['email_id'];
//     active = json['active'];
//     modifiedOn = json['modified_on'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['email_id'] = this.emailId;
//     data['active'] = this.active;
//     data['modified_on'] = this.modifiedOn;
//     return data;
//   }
// }

// class Weight {
//   int value;
//   String unit;
//   String modifiedOn;

//   Weight({this.value, this.unit, this.modifiedOn});

//   Weight.fromJson(Map<String, dynamic> json) {
//     value = json['value'];
//     unit = json['unit'];
//     modifiedOn = json['modified_on'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['value'] = this.value;
//     data['unit'] = this.unit;
//     data['modified_on'] = this.modifiedOn;
//     return data;
//   }
// }

// class EmergencyContact {
//   int contactId;
//   String contactName;
//   String relation;
//   String mobileno;
//   String active;
//   String modifiedOn;

//   EmergencyContact(
//       {this.contactId,
//       this.contactName,
//       this.relation,
//       this.mobileno,
//       this.active,
//       this.modifiedOn});

//   EmergencyContact.fromJson(Map<String, dynamic> json) {
//     contactId = json['contact_id'];
//     contactName = json['contact_name'];
//     relation = json['relation'];
//     mobileno = json['mobileno'];
//     active = json['active'];
//     modifiedOn = json['modified_on'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['contact_id'] = this.contactId;
//     data['contact_name'] = this.contactName;
//     data['relation'] = this.relation;
//     data['mobileno'] = this.mobileno;
//     data['active'] = this.active;
//     data['modified_on'] = this.modifiedOn;
//     return data;
//   }
// }

// class Vehicle {
//   int vehicleId;
//   String vehicleType;
//   String vehicleModel;
//   String registrationNo;
//   String vehicleColor;
//   String notes;
//   String active;
//   String modifiedOn;

//   Vehicle(
//       {this.vehicleId,
//       this.vehicleType,
//       this.vehicleModel,
//       this.registrationNo,
//       this.vehicleColor,
//       this.notes,
//       this.active,
//       this.modifiedOn});

//   Vehicle.fromJson(Map<String, dynamic> json) {
//     vehicleId = json['vehicle_id'];
//     vehicleType = json['vehicle_type'];
//     vehicleModel = json['vehicle_model'];
//     registrationNo = json['registration_no'];
//     vehicleColor = json['vehicle_color'];
//     notes = json['notes'];
//     active = json['active'];
//     modifiedOn = json['modified_on'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['vehicle_id'] = this.vehicleId;
//     data['vehicle_type'] = this.vehicleType;
//     data['vehicle_model'] = this.vehicleModel;
//     data['registration_no'] = this.registrationNo;
//     data['vehicle_color'] = this.vehicleColor;
//     data['notes'] = this.notes;
//     data['active'] = this.active;
//     data['modified_on'] = this.modifiedOn;
//     return data;
//   }
// }

// class Consent {
//   String emergencyProtocol;
//   String locationTracking;
//   String organDonation;
//   String hospitalization;
//   String modifiedOn;

//   Consent(
//       {this.emergencyProtocol,
//       this.locationTracking,
//       this.organDonation,
//       this.hospitalization,
//       this.modifiedOn});

//   Consent.fromJson(Map<String, dynamic> json) {
//     emergencyProtocol = json['emergency_protocol'];
//     locationTracking = json['location_tracking'];
//     organDonation = json['organ_donation'];
//     hospitalization = json['hospitalization'];
//     modifiedOn = json['modified_on'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['emergency_protocol'] = this.emergencyProtocol;
//     data['location_tracking'] = this.locationTracking;
//     data['organ_donation'] = this.organDonation;
//     data['hospitalization'] = this.hospitalization;
//     data['modified_on'] = this.modifiedOn;
//     return data;
//   }
// }

// class Allergy {
//   String allergen;
//   int value;
//   int allergyId;
//   int active;
//   String modifiedOn;

//   Allergy(
//       {this.allergen,
//       this.value,
//       this.allergyId,
//       this.active,
//       this.modifiedOn});

//   Allergy.fromJson(Map<String, dynamic> json) {
//     allergen = json['allergen'];
//     value = json['value'];
//     allergyId = json['allergy_id'];
//     active = json['active'];
//     modifiedOn = json['modified_on'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['allergen'] = this.allergen;
//     data['value'] = this.value;
//     data['allergy_id'] = this.allergyId;
//     data['active'] = this.active;
//     data['modified_on'] = this.modifiedOn;
//     return data;
//   }
// }

// class SocioEconomicStatus {
//   String occupationLevel;
//   String educationLevel;
//   String monthlyIncome;
//   Null currency;
//   int score;
//   int category;
//   String message;

//   SocioEconomicStatus(
//       {this.occupationLevel,
//       this.educationLevel,
//       this.monthlyIncome,
//       this.currency,
//       this.score,
//       this.category,
//       this.message});

//   SocioEconomicStatus.fromJson(Map<String, dynamic> json) {
//     occupationLevel = json['occupation_level'];
//     educationLevel = json['education_level'];
//     monthlyIncome = json['monthly_income'];
//     currency = json['currency'];
//     score = json['score'];
//     category = json['category'];
//     message = json['message'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['occupation_level'] = this.occupationLevel;
//     data['education_level'] = this.educationLevel;
//     data['monthly_income'] = this.monthlyIncome;
//     data['currency'] = this.currency;
//     data['score'] = this.score;
//     data['category'] = this.category;
//     data['message'] = this.message;
//     return data;
//   }
// }

// class Groups {
//   String groupName;
//   String groupId;

//   Groups({this.groupName, this.groupId});

//   Groups.fromJson(Map<String, dynamic> json) {
//     groupName = json['group_name'];
//     groupId = json['group_id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['group_name'] = this.groupName;
//     data['group_id'] = this.groupId;
//     return data;
//   }
// }

// class Aadhar {
//   String name;
//   String dateOfBirth;
//   String gender;
//   String aadharNumber;
//   String address;
//   String url;
//   String faceUrl;
//   String uidType;
//   String modifiedOn;

//   Aadhar(
//       {this.name,
//       this.dateOfBirth,
//       this.gender,
//       this.aadharNumber,
//       this.address,
//       this.url,
//       this.faceUrl,
//       this.uidType,
//       this.modifiedOn});

//   Aadhar.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     dateOfBirth = json['date_of_birth'];
//     gender = json['gender'];
//     aadharNumber = json['aadhar_number'];
//     address = json['address'];
//     url = json['url'];
//     faceUrl = json['face_url'];
//     uidType = json['uid_type'];
//     modifiedOn = json['modified_on'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['date_of_birth'] = this.dateOfBirth;
//     data['gender'] = this.gender;
//     data['aadhar_number'] = this.aadharNumber;
//     data['address'] = this.address;
//     data['url'] = this.url;
//     data['face_url'] = this.faceUrl;
//     data['uid_type'] = this.uidType;
//     data['modified_on'] = this.modifiedOn;
//     return data;
//   }
// }

// class UserDiary {
//   int id;
//   String file;
//   Null text;
//   int active;
//   String modifiedOn;

//   UserDiary({this.id, this.file, this.text, this.active, this.modifiedOn});

//   UserDiary.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     file = json['file'];
//     text = json['text'];
//     active = json['active'];
//     modifiedOn = json['modified_on'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['file'] = this.file;
//     data['text'] = this.text;
//     data['active'] = this.active;
//     data['modified_on'] = this.modifiedOn;
//     return data;
//   }
// }

// class TagEntity {
//   String tagId;
//   String tagName;
//   String entityTypeId;
//   String entityType;
//   int entityId;
//   String ehEntityId;
//   String entityLink;
//   Null tagText;
//   String modifiedOn;
//   int active;
//   String tagEntityId;

//   TagEntity(
//       {required this.tagId,
//       this.tagName,
//       this.entityTypeId,
//       this.entityType,
//       this.entityId,
//       this.ehEntityId,
//       this.entityLink,
//       this.tagText,
//       this.modifiedOn,
//       this.active,
//       this.tagEntityId});

//   TagEntity.fromJson(Map<String, dynamic> json) {
//     tagId = json['tag_id'];
//     tagName = json['tag_name'];
//     entityTypeId = json['entity_type_id'];
//     entityType = json['entity_type'];
//     entityId = json['entity_id'];
//     ehEntityId = json['eh_entity_id'];
//     entityLink = json['entity_link'];
//     tagText = json['tag_text'];
//     modifiedOn = json['modified_on'];
//     active = json['active'];
//     tagEntityId = json['tag_entity_id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['tag_id'] = this.tagId;
//     data['tag_name'] = this.tagName;
//     data['entity_type_id'] = this.entityTypeId;
//     data['entity_type'] = this.entityType;
//     data['entity_id'] = this.entityId;
//     data['eh_entity_id'] = this.ehEntityId;
//     data['entity_link'] = this.entityLink;
//     data['tag_text'] = this.tagText;
//     data['modified_on'] = this.modifiedOn;
//     data['active'] = this.active;
//     data['tag_entity_id'] = this.tagEntityId;
//     return data;
//   }
// }
