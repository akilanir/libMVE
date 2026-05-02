package ezvcard.util;

import ezvcard.util.org.apache.commons.codec.binary.Base64;
import java.net.URI;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/util/DataUri.class */
public final class DataUri {
    private static final Pattern regex = Pattern.compile("^data:(.*?);base64,(.*)", 2);
    private final byte[] data;
    private final String contentType;

    public DataUri(String contentType, byte[] data) {
        this.contentType = contentType;
        this.data = data;
    }

    public DataUri(String uri) {
        Matcher m = regex.matcher(uri);
        if (!m.find()) {
            throw new IllegalArgumentException("Invalid data URI: " + uri);
        }
        this.contentType = m.group(1);
        this.data = Base64.decodeBase64(m.group(2));
    }

    public byte[] getData() {
        return this.data;
    }

    public String getContentType() {
        return this.contentType;
    }

    public URI toUri() {
        return URI.create(toString());
    }

    public String toString() {
        return "data:" + this.contentType + ";base64," + Base64.encodeBase64String(this.data);
    }
}
