# DMARC Validator API - PHP Package

DMARC Validator is a DMARC record validator API that checks the Domain-based Message Authentication, Reporting and Conformance (DMARC) record for a domain to ensure it is correctly configured.

## Installation

Install via Composer:

```bash
composer require apiverve/dmarcvalidator
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Dmarcvalidator\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute(['domain' => 'paypal.com']);

// Print the response
print_r($response);
```


### Error Handling

```php
use APIVerve\Dmarcvalidator\Client;
use APIVerve\Dmarcvalidator\Exceptions\APIException;
use APIVerve\Dmarcvalidator\Exceptions\ValidationException;

try {
    $response = $client->execute(['domain' => 'paypal.com']);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
```

## Example Response

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

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/dmarcvalidator?utm_source=packagist&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/dmarcvalidator?utm_source=php&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/dmarcvalidator?utm_source=php&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
