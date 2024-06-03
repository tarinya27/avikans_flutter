class Labor{
  String Employee;
  int jobid;
  String hour;
  String rate;
  double ammount;
  int employee_id;
  int status;
  String resoan;


  Labor({

    required this.Employee,
    required this.jobid,
    required this.hour,
    required this.rate,
    required this.ammount,
    required this.employee_id,
    required this.status,
    required this.resoan,
  });

   factory Labor.fromJson(Map<String, dynamic> json) {
    return Labor(
      jobid: json['jobId'] ,
      Employee: json['emmployee'],
      hour: json['hour'],
      rate: json['rate'],
      ammount: json['ammount'] ,
      employee_id: json["employee_id"],
      status: json["status_id"],
      resoan: json["resoan"],
    

    );
  }
}

