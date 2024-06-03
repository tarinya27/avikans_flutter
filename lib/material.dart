

//import 'dart:ffi';



class Materials {
  String mat_id;
  int status;
  String jobid;
  String material;
  int qty;
  double ammout;
  String date;
  int rate;
  String reasons;


  Materials(

      {required this.jobid,
      required this.reasons,
      required this.mat_id,
      required this.material,
      required this.qty,
      required this.ammout,
      required this.date,
      required this.rate,
      required this.status,
      
      });

      
  factory Materials.fromJson(Map<String, dynamic> json) {
    return Materials(
      jobid: json['job_item_id'] ,
      material: json['matrial'],
      qty: json['qty'],
      ammout: json['amount'],
      date: json['added_date'] ,
      rate: json['rate'],
      mat_id: json["mat_id"],
      status: json["approval_status_id"],
      reasons: json["reasons"],

    );
  }
}

