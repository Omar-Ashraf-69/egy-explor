class Error {
	bool? status;
	String? error;

	Error({this.status, this.error});

	factory Error.fromJson(Map<String, dynamic> json) => Error(
				status: json['status'] as bool?,
				error: json['error'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'status': status,
				'error': error,
			};
}
