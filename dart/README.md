# DMARC Validator API - Dart/Flutter Client

DMARC Validator is a DMARC record validator API that checks the Domain-based Message Authentication, Reporting and Conformance (DMARC) record for a domain to ensure it is correctly configured.

[![pub package](https://img.shields.io/pub/v/apiverve_dmarcvalidator.svg)](https://pub.dev/packages/apiverve_dmarcvalidator)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [DMARC Validator API](https://apiverve.com/marketplace/dmarcvalidator?utm_source=dart&utm_medium=referral&utm_content=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_dmarcvalidator: ^1.2.5
```

Then run:

```bash
dart pub get
# or for Flutter
flutter pub get
```

## Usage

```dart
import 'package:apiverve_dmarcvalidator/apiverve_dmarcvalidator.dart';

void main() async {
  final client = DmarcvalidatorClient('YOUR_API_KEY');

  try {
    final response = await client.execute({
      'domain': 'paypal.com'
    });

    print('Status: ${response.status}');
    print('Data: ${response.data}');
  } catch (e) {
    print('Error: $e');
  }
}
```

## Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "host": "paypal.com",
    "dmarcHost": "_dmarc.paypal.com",
    "hasDmarc": true,
    "dmarc_record": "v=DMARC1; p=reject; rua=mailto:d@rua.agari.com,mailto:dmarc_agg@vali.email; ruf=mailto:d@ruf.agari.com,mailto:MTc4Mzcw@ruf.vali.email",
    "rua": {
      "email": "d@rua.agari.com,dmarc_agg@vali.email",
      "domain": "rua.agari.com",
      "valid": true
    },
    "ruf": {
      "email": "d@ruf.agari.com,MTc4Mzcw@ruf.vali.email",
      "domain": "ruf.agari.com",
      "valid": true
    },
    "v": "DMARC1",
    "p": "reject",
    "sp": null,
    "pct": null,
    "adkim": null,
    "aspf": null,
    "fo": null,
    "rf": null,
    "ri": null,
    "valid": true,
    "issues": [],
    "isEnforced": true,
    "riskScore": 5,
    "riskLevel": "low"
  }
}
```

## API Reference

- **API Home:** [DMARC Validator API](https://apiverve.com/marketplace/dmarcvalidator?utm_source=dart&utm_medium=referral&utm_content=readme)
- **Documentation:** [docs.apiverve.com/ref/dmarcvalidator](https://docs.apiverve.com/ref/dmarcvalidator?utm_source=dart&utm_medium=referral&utm_content=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme)
