import 'package:dental_on_track/modules/choose_plan/choose_plan.dart';
import 'package:dental_on_track/modules/create_sub_user/create_sub_user.dart';
import 'package:dental_on_track/modules/diagnoses/add_diagnosis.dart';
import 'package:dental_on_track/modules/finance/finance_screen.dart';
import 'package:dental_on_track/modules/finance/secretary/all_receipts/all_receipts_by_safe.dart';
import 'package:dental_on_track/modules/home_page/home_page.dart';
import 'package:dental_on_track/modules/patients/add_new_patient/add_new_patient.dart';
import 'package:dental_on_track/modules/patients/medical_history/medical_hes_model.dart';
import 'package:dental_on_track/modules/patients/patient_detalis/patient_details.dart';
import 'package:dental_on_track/modules/pre_loader/pre_loader.dart';
import 'package:dental_on_track/modules/sign_up/sign_up.dart';
import 'package:dental_on_track/modules/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'components/dental_chart.dart';
import 'components/pediatric_dental_chart.dart';
import 'modules/appointments/appointments.dart';
import 'modules/book_appointment/book_appointment.dart';
import 'modules/choose_plan/wait_confirmation.dart';
import 'modules/dental_chart/dental_chart.dart';
import 'modules/finance/secretary/all_expenses/all_expenses.dart';
import 'modules/illnesses/illnesses.dart';
import 'modules/login/login.dart';
import 'modules/patients/medical_history/all_medical_history.dart';
import 'modules/patients/patients_list.dart';
import 'modules/patients/treatment_plans/treatment_plans_for_patient.dart';
import 'modules/prodecures/add_new_procedure/add_new_procedure.dart';
import 'modules/prodecures/procedures.dart';
import 'modules/profile/edit_profile.dart';
import 'modules/profile/profile.dart';

void main() {
  runApp(
    GetMaterialApp(
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => PreLoader(),
          '/login': (context) => Login(),
          '/sign_up': (context) => SignUp(),
          '/profile': (context) => ProfileScreen(),
          '/edit_profile': (context) => EditProfile(),
          '/home_page': (context) => HomePage(),
          '/patients_list': (context) => PatientsList(),
          '/finance_screen': (context) => FinanceScreen(),
          '/choose_plan': (context) => ChoosePlan(),
          '/wait_confirmation': (context) => WaitConfirmation(),
          '/add_new_patient': (context) => AddNewPatient(),
          '/procedures_list': (context) => ProcedureList(),
          '/add_new_procedure': (context) => AddNewProcedure(),
          '/create_sub_user': (context) => CreateSubUser(),
          '/patient_details': (context) => PatientDetails(),
          '/adult_dental_chart': (context) => AdultDentalChart([]),
          '/pediatric_dental_chart': (context) => PediatricDentalChart([]),
          '/book_appointment': (context) => BookAppointment(),
          '/treatment_plans_for_patinet': (context) => TreatmentPlansForPatient(),
          '/all_medical_history': (context) => AllMedicalHistory(),
          '/dental_chart': (context) => DentalChart(),
          '/all_appointments': (context) => Appointments(),
          '/diagnoses': (context) => AddDiagnoses(),
          '/all_illnesses': (context) => IllnessesList(),
          '/all_expenses': (context) => AllExpenses(),
          '/all_receipts': (context) => AllReceipts(),
          },

        builder: EasyLoading.init()),
  );
}

