# DMARC Validator API - Dart/Flutter Client

DMARC Validator checks the Domain-based Message Authentication, Reporting and Conformance (DMARC) record for a domain to ensure it is correctly configured.

[![pub package](https://img.shields.io/pub/v/apiverve_dmarcvalidator.svg)](https://pub.dev/packages/apiverve_dmarcvalidator)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [DMARC Validator API](https://dmarcvalidator.apiverve.com?utm_source=dart&utm_medium=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_dmarcvalidator: ^1.1.14
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
    "dmarcHost": "_dmarc.paypal.com",
    "dmarc_record": "v=DMARC1; p=reject; rua=mailto:d@rua.agari.com; ruf=mailto:d@ruf.agari.com",
    "hasDmarc": true,
    "host": "paypal.com",
    "p": "reject",
    "rua": {
      "domain": "rua.agari.com",
      "email": "d@rua.agari.com",
      "valid": true
    },
    "ruf": {
      "domain": "ruf.agari.com",
      "email": "d@ruf.agari.com",
      "valid": true
    },
    "v": "DMARC1",
    "valid": true
  }
}
```

## API Reference

- **API Home:** [DMARC Validator API](https://dmarcvalidator.apiverve.com?utm_source=dart&utm_medium=readme)
- **Documentation:** [docs.apiverve.com/ref/dmarcvalidator](https://docs.apiverve.com/ref/dmarcvalidator?utm_source=dart&utm_medium=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=readme)
