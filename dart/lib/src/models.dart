/// Response models for the DMARC Validator API.

/// API Response wrapper.
class DmarcvalidatorResponse {
  final String status;
  final dynamic error;
  final DmarcvalidatorData? data;

  DmarcvalidatorResponse({
    required this.status,
    this.error,
    this.data,
  });

  factory DmarcvalidatorResponse.fromJson(Map<String, dynamic> json) => DmarcvalidatorResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? DmarcvalidatorData.fromJson(json['data']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
  };
}

/// Response data for the DMARC Validator API.

class DmarcvalidatorData {
  String? dmarcHost;
  String? dmarcRecord;
  bool? hasDmarc;
  String? host;
  String? p;
  DmarcvalidatorDataRua? rua;
  DmarcvalidatorDataRuf? ruf;
  String? v;
  bool? valid;

  DmarcvalidatorData({
    this.dmarcHost,
    this.dmarcRecord,
    this.hasDmarc,
    this.host,
    this.p,
    this.rua,
    this.ruf,
    this.v,
    this.valid,
  });

  factory DmarcvalidatorData.fromJson(Map<String, dynamic> json) => DmarcvalidatorData(
      dmarcHost: json['dmarcHost'],
      dmarcRecord: json['dmarc_record'],
      hasDmarc: json['hasDmarc'],
      host: json['host'],
      p: json['p'],
      rua: json['rua'] != null ? DmarcvalidatorDataRua.fromJson(json['rua']) : null,
      ruf: json['ruf'] != null ? DmarcvalidatorDataRuf.fromJson(json['ruf']) : null,
      v: json['v'],
      valid: json['valid'],
    );
}

class DmarcvalidatorDataRua {
  String? domain;
  String? email;
  bool? valid;

  DmarcvalidatorDataRua({
    this.domain,
    this.email,
    this.valid,
  });

  factory DmarcvalidatorDataRua.fromJson(Map<String, dynamic> json) => DmarcvalidatorDataRua(
      domain: json['domain'],
      email: json['email'],
      valid: json['valid'],
    );
}

class DmarcvalidatorDataRuf {
  String? domain;
  String? email;
  bool? valid;

  DmarcvalidatorDataRuf({
    this.domain,
    this.email,
    this.valid,
  });

  factory DmarcvalidatorDataRuf.fromJson(Map<String, dynamic> json) => DmarcvalidatorDataRuf(
      domain: json['domain'],
      email: json['email'],
      valid: json['valid'],
    );
}

class DmarcvalidatorRequest {
  String domain;

  DmarcvalidatorRequest({
    required this.domain,
  });

  Map<String, dynamic> toJson() => {
      'domain': domain,
    };
}
