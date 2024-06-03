class Fix{
  int jobid;
  int dept_id;
  String fixed_type;
  String rate;
 double amount;

  Fix({
    required this.jobid,
    required this.dept_id,
    required this.fixed_type,
    required this.rate,
    required this.amount,
  });

   factory Fix.fromJson(Map<String, dynamic> json) {
    return Fix(
      jobid: json['jobId'] ,
      dept_id: json['depetId'],
      fixed_type: json['fixed_type'],
      rate: json['rate'],
      amount: json['ammount'] ,
    

    );
  }

}


