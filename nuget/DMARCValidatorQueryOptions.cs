using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.DMARCValidator
{
    /// <summary>
    /// Query options for the DMARC Validator API
    /// </summary>
    public class DMARCValidatorQueryOptions
    {
        /// <summary>
        /// The domain to validate the DMARC record for
        /// </summary>
        [JsonProperty("domain")]
        public string Domain { get; set; }
    }
}
