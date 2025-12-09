// Converter.java

// To use this code, add the following Maven dependency to your project:
//
//
//     com.fasterxml.jackson.core     : jackson-databind          : 2.9.0
//     com.fasterxml.jackson.datatype : jackson-datatype-jsr310   : 2.9.0
//
// Import this package:
//
//     import com.apiverve.data.Converter;
//
// Then you can deserialize a JSON string with
//
//     DMARCValidatorData data = Converter.fromJsonString(jsonString);

package com.apiverve.dmarcvalidator.data;

import java.io.IOException;
import com.fasterxml.jackson.databind.*;
import com.fasterxml.jackson.databind.module.SimpleModule;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import java.util.*;
import java.time.LocalDate;
import java.time.OffsetDateTime;
import java.time.OffsetTime;
import java.time.ZoneOffset;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.time.temporal.ChronoField;

public class Converter {
    // Date-time helpers

    private static final DateTimeFormatter DATE_TIME_FORMATTER = new DateTimeFormatterBuilder()
            .appendOptional(DateTimeFormatter.ISO_DATE_TIME)
            .appendOptional(DateTimeFormatter.ISO_OFFSET_DATE_TIME)
            .appendOptional(DateTimeFormatter.ISO_INSTANT)
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SX"))
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ssX"))
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))
            .toFormatter()
            .withZone(ZoneOffset.UTC);

    public static OffsetDateTime parseDateTimeString(String str) {
        return ZonedDateTime.from(Converter.DATE_TIME_FORMATTER.parse(str)).toOffsetDateTime();
    }

    private static final DateTimeFormatter TIME_FORMATTER = new DateTimeFormatterBuilder()
            .appendOptional(DateTimeFormatter.ISO_TIME)
            .appendOptional(DateTimeFormatter.ISO_OFFSET_TIME)
            .parseDefaulting(ChronoField.YEAR, 2020)
            .parseDefaulting(ChronoField.MONTH_OF_YEAR, 1)
            .parseDefaulting(ChronoField.DAY_OF_MONTH, 1)
            .toFormatter()
            .withZone(ZoneOffset.UTC);

    public static OffsetTime parseTimeString(String str) {
        return ZonedDateTime.from(Converter.TIME_FORMATTER.parse(str)).toOffsetDateTime().toOffsetTime();
    }
    // Serialize/deserialize helpers

    public static DMARCValidatorData fromJsonString(String json) throws IOException {
        return getObjectReader().readValue(json);
    }

    public static String toJsonString(DMARCValidatorData obj) throws JsonProcessingException {
        return getObjectWriter().writeValueAsString(obj);
    }

    private static ObjectReader reader;
    private static ObjectWriter writer;

    private static void instantiateMapper() {
        ObjectMapper mapper = new ObjectMapper();
        mapper.findAndRegisterModules();
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        mapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
        SimpleModule module = new SimpleModule();
        module.addDeserializer(OffsetDateTime.class, new JsonDeserializer<OffsetDateTime>() {
            @Override
            public OffsetDateTime deserialize(JsonParser jsonParser, DeserializationContext deserializationContext) throws IOException, JsonProcessingException {
                String value = jsonParser.getText();
                return Converter.parseDateTimeString(value);
            }
        });
        mapper.registerModule(module);
        reader = mapper.readerFor(DMARCValidatorData.class);
        writer = mapper.writerFor(DMARCValidatorData.class);
    }

    private static ObjectReader getObjectReader() {
        if (reader == null) instantiateMapper();
        return reader;
    }

    private static ObjectWriter getObjectWriter() {
        if (writer == null) instantiateMapper();
        return writer;
    }
}

// DMARCValidatorData.java

package com.apiverve.dmarcvalidator.data;

import com.fasterxml.jackson.annotation.*;

public class DMARCValidatorData {
    private String dmarcHost;
    private String dmarcRecord;
    private boolean hasDmarc;
    private String host;
    private String p;
    private Rua rua;
    private Rua ruf;
    private String v;
    private boolean valid;

    @JsonProperty("dmarcHost")
    public String getDmarcHost() { return dmarcHost; }
    @JsonProperty("dmarcHost")
    public void setDmarcHost(String value) { this.dmarcHost = value; }

    @JsonProperty("dmarc_record")
    public String getDmarcRecord() { return dmarcRecord; }
    @JsonProperty("dmarc_record")
    public void setDmarcRecord(String value) { this.dmarcRecord = value; }

    @JsonProperty("hasDmarc")
    public boolean getHasDmarc() { return hasDmarc; }
    @JsonProperty("hasDmarc")
    public void setHasDmarc(boolean value) { this.hasDmarc = value; }

    @JsonProperty("host")
    public String getHost() { return host; }
    @JsonProperty("host")
    public void setHost(String value) { this.host = value; }

    @JsonProperty("p")
    public String getP() { return p; }
    @JsonProperty("p")
    public void setP(String value) { this.p = value; }

    @JsonProperty("rua")
    public Rua getRua() { return rua; }
    @JsonProperty("rua")
    public void setRua(Rua value) { this.rua = value; }

    @JsonProperty("ruf")
    public Rua getRuf() { return ruf; }
    @JsonProperty("ruf")
    public void setRuf(Rua value) { this.ruf = value; }

    @JsonProperty("v")
    public String getV() { return v; }
    @JsonProperty("v")
    public void setV(String value) { this.v = value; }

    @JsonProperty("valid")
    public boolean getValid() { return valid; }
    @JsonProperty("valid")
    public void setValid(boolean value) { this.valid = value; }
}

// Rua.java

package com.apiverve.dmarcvalidator.data;

import com.fasterxml.jackson.annotation.*;

public class Rua {
    private String domain;
    private String email;
    private boolean valid;

    @JsonProperty("domain")
    public String getDomain() { return domain; }
    @JsonProperty("domain")
    public void setDomain(String value) { this.domain = value; }

    @JsonProperty("email")
    public String getEmail() { return email; }
    @JsonProperty("email")
    public void setEmail(String value) { this.email = value; }

    @JsonProperty("valid")
    public boolean getValid() { return valid; }
    @JsonProperty("valid")
    public void setValid(boolean value) { this.valid = value; }
}