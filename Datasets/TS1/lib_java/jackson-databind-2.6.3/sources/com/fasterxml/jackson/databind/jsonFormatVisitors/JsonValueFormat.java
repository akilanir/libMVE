package com.fasterxml.jackson.databind.jsonFormatVisitors;

/* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/jsonFormatVisitors/JsonValueFormat.class */
public enum JsonValueFormat {
    DATE_TIME("date-time"),
    DATE("date"),
    TIME("time"),
    UTC_MILLISEC("utc-millisec"),
    REGEX("regex"),
    COLOR("color"),
    STYLE("style"),
    PHONE("phone"),
    URI("uri"),
    EMAIL("email"),
    IP_ADDRESS("ip-address"),
    IPV6("ipv6"),
    HOST_NAME("host-name");

    private final String _desc;

    JsonValueFormat(String desc) {
        this._desc = desc;
    }

    @Override // java.lang.Enum
    public String toString() {
        return this._desc;
    }
}
