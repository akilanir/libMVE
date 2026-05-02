package com.squareup.okhttp;

import java.nio.charset.Charset;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: okhttp-2.2.0.jar:com/squareup/okhttp/MediaType.class */
public final class MediaType {
    private static final String TOKEN = "([a-zA-Z0-9-!#$%&'*+.^_`{|}~]+)";
    private static final String QUOTED = "\"([^\"]*)\"";
    private static final Pattern TYPE_SUBTYPE = Pattern.compile("([a-zA-Z0-9-!#$%&'*+.^_`{|}~]+)/([a-zA-Z0-9-!#$%&'*+.^_`{|}~]+)");
    private static final Pattern PARAMETER = Pattern.compile(";\\s*(?:([a-zA-Z0-9-!#$%&'*+.^_`{|}~]+)=(?:([a-zA-Z0-9-!#$%&'*+.^_`{|}~]+)|\"([^\"]*)\"))?");
    private final String mediaType;
    private final String type;
    private final String subtype;
    private final String charset;

    private MediaType(String mediaType, String type, String subtype, String charset) {
        this.mediaType = mediaType;
        this.type = type;
        this.subtype = subtype;
        this.charset = charset;
    }

    public static MediaType parse(String string) {
        String group;
        Matcher typeSubtype = TYPE_SUBTYPE.matcher(string);
        if (!typeSubtype.lookingAt()) {
            return null;
        }
        String type = typeSubtype.group(1).toLowerCase(Locale.US);
        String subtype = typeSubtype.group(2).toLowerCase(Locale.US);
        String charset = null;
        Matcher parameter = PARAMETER.matcher(string);
        int end = typeSubtype.end();
        while (true) {
            int s = end;
            if (s < string.length()) {
                parameter.region(s, string.length());
                if (!parameter.lookingAt()) {
                    return null;
                }
                String name = parameter.group(1);
                if (name != null && name.equalsIgnoreCase("charset")) {
                    if (parameter.group(2) != null) {
                        group = parameter.group(2);
                    } else {
                        group = parameter.group(3);
                    }
                    String charsetParameter = group;
                    if (charset != null && !charsetParameter.equalsIgnoreCase(charset)) {
                        throw new IllegalArgumentException("Multiple different charsets: " + string);
                    }
                    charset = charsetParameter;
                }
                end = parameter.end();
            } else {
                return new MediaType(string, type, subtype, charset);
            }
        }
    }

    public String type() {
        return this.type;
    }

    public String subtype() {
        return this.subtype;
    }

    public Charset charset() {
        if (this.charset != null) {
            return Charset.forName(this.charset);
        }
        return null;
    }

    public Charset charset(Charset defaultValue) {
        return this.charset != null ? Charset.forName(this.charset) : defaultValue;
    }

    public String toString() {
        return this.mediaType;
    }

    public boolean equals(Object o) {
        return (o instanceof MediaType) && ((MediaType) o).mediaType.equals(this.mediaType);
    }

    public int hashCode() {
        return this.mediaType.hashCode();
    }
}
