# DMARC Validator API - Ruby Gem

DMARC Validator is a DMARC record validator API that checks the Domain-based Message Authentication, Reporting and Conformance (DMARC) record for a domain to ensure it is correctly configured.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiverve_dmarcvalidator'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install apiverve_dmarcvalidator
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```ruby
require 'apiverve_dmarcvalidator'

# Initialize the client
client = APIVerve::Dmarcvalidator::Client.new(api_key: "YOUR_API_KEY")

# Make a request
response = client.execute({ domain: "paypal.com" })

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ domain: "paypal.com" })
  puts response["data"]
rescue APIVerve::Dmarcvalidator::ValidationError => e
  puts "Validation error: #{e.errors.join(', ')}"
rescue APIVerve::Dmarcvalidator::APIError => e
  puts "API error: #{e.message}"
  puts "Status code: #{e.status_code}"
end
```

### Debug Mode

```ruby
# Enable debug logging
client = APIVerve::Dmarcvalidator::Client.new(
  api_key: "YOUR_API_KEY",
  debug: true
)
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

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/dmarcvalidator?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/dmarcvalidator?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/dmarcvalidator?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).
