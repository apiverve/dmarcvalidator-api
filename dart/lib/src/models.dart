/// Response models for the DMARC Validator API.

/// API Response wrapper.
class DmarcvalidatorResponse {
  final String status;
  final dynamic error;
  final DmarcvalidatorData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  DmarcvalidatorResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory DmarcvalidatorResponse.fromJson(Map<String, dynamic> json) => DmarcvalidatorResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? DmarcvalidatorData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the DMARC Validator API.

class DmarcvalidatorData {
  String? host;
  String? dmarcHost;
  bool? hasDmarc;
  String? dmarcRecord;
  DmarcvalidatorDataRua? rua;
  DmarcvalidatorDataRuf? ruf;
  String? v;
  String? p;
  dynamic sp;
  dynamic pct;
  dynamic adkim;
  dynamic aspf;
  dynamic fo;
  dynamic rf;
  dynamic ri;
  bool? valid;
  List<dynamic>? issues;
  bool? isEnforced;
  num? riskScore;
  String? riskLevel;

  DmarcvalidatorData({
    this.host,
    this.dmarcHost,
    this.hasDmarc,
    this.dmarcRecord,
    this.rua,
    this.ruf,
    this.v,
    this.p,
    this.sp,
    this.pct,
    this.adkim,
    this.aspf,
    this.fo,
    this.rf,
    this.ri,
    this.valid,
    this.issues,
    this.isEnforced,
    this.riskScore,
    this.riskLevel,
  });

  factory DmarcvalidatorData.fromJson(Map<String, dynamic> json) => DmarcvalidatorData(
      host: json['host'],
      dmarcHost: json['dmarcHost'],
      hasDmarc: json['hasDmarc'],
      dmarcRecord: json['dmarc_record'],
      rua: json['rua'] != null ? DmarcvalidatorDataRua.fromJson(json['rua']) : null,
      ruf: json['ruf'] != null ? DmarcvalidatorDataRuf.fromJson(json['ruf']) : null,
      v: json['v'],
      p: json['p'],
      sp: json['sp'],
      pct: json['pct'],
      adkim: json['adkim'],
      aspf: json['aspf'],
      fo: json['fo'],
      rf: json['rf'],
      ri: json['ri'],
      valid: json['valid'],
      issues: (json['issues'] as List?)?.cast<dynamic>(),
      isEnforced: json['isEnforced'],
      riskScore: json['riskScore'],
      riskLevel: json['riskLevel'],
    );
}

class DmarcvalidatorDataRua {
  String? email;
  String? domain;
  bool? valid;

  DmarcvalidatorDataRua({
    this.email,
    this.domain,
    this.valid,
  });

  factory DmarcvalidatorDataRua.fromJson(Map<String, dynamic> json) => DmarcvalidatorDataRua(
      email: json['email'],
      domain: json['domain'],
      valid: json['valid'],
    );
}

class DmarcvalidatorDataRuf {
  String? email;
  String? domain;
  bool? valid;

  DmarcvalidatorDataRuf({
    this.email,
    this.domain,
    this.valid,
  });

  factory DmarcvalidatorDataRuf.fromJson(Map<String, dynamic> json) => DmarcvalidatorDataRuf(
      email: json['email'],
      domain: json['domain'],
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
