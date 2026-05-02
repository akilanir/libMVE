package org.apache.james.mime4j.stream;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import org.apache.james.mime4j.MimeException;
import org.apache.james.mime4j.codec.DecodeMonitor;
import org.apache.james.mime4j.util.MimeUtil;

/* loaded from: apache-mime4j-core-0.7.2.jar:org/apache/james/mime4j/stream/FallbackBodyDescriptorBuilder.class */
class FallbackBodyDescriptorBuilder implements BodyDescriptorBuilder {
    private static final String US_ASCII = "us-ascii";
    private static final String SUB_TYPE_EMAIL = "rfc822";
    private static final String MEDIA_TYPE_TEXT = "text";
    private static final String MEDIA_TYPE_MESSAGE = "message";
    private static final String EMAIL_MESSAGE_MIME_TYPE = "message/rfc822";
    private static final String DEFAULT_SUB_TYPE = "plain";
    private static final String DEFAULT_MEDIA_TYPE = "text";
    private static final String DEFAULT_MIME_TYPE = "text/plain";
    private final String parentMimeType;
    private final DecodeMonitor monitor;
    private String mediaType;
    private String subType;
    private String mimeType;
    private String boundary;
    private String charset;
    private String transferEncoding;
    private long contentLength;

    public FallbackBodyDescriptorBuilder() {
        this(null, null);
    }

    public FallbackBodyDescriptorBuilder(String parentMimeType, DecodeMonitor monitor) {
        this.parentMimeType = parentMimeType;
        this.monitor = monitor != null ? monitor : DecodeMonitor.SILENT;
        reset();
    }

    @Override // org.apache.james.mime4j.stream.BodyDescriptorBuilder
    public void reset() {
        this.mimeType = null;
        this.subType = null;
        this.mediaType = null;
        this.boundary = null;
        this.charset = null;
        this.transferEncoding = null;
        this.contentLength = -1L;
    }

    @Override // org.apache.james.mime4j.stream.BodyDescriptorBuilder
    public BodyDescriptorBuilder newChild() {
        return new FallbackBodyDescriptorBuilder(this.mimeType, this.monitor);
    }

    @Override // org.apache.james.mime4j.stream.BodyDescriptorBuilder
    public BodyDescriptor build() {
        String actualMimeType = this.mimeType;
        String actualMediaType = this.mediaType;
        String actualSubType = this.subType;
        String actualCharset = this.charset;
        if (actualMimeType == null) {
            if (MimeUtil.isSameMimeType("multipart/digest", this.parentMimeType)) {
                actualMimeType = EMAIL_MESSAGE_MIME_TYPE;
                actualMediaType = MEDIA_TYPE_MESSAGE;
                actualSubType = SUB_TYPE_EMAIL;
            } else {
                actualMimeType = DEFAULT_MIME_TYPE;
                actualMediaType = "text";
                actualSubType = DEFAULT_SUB_TYPE;
            }
        }
        if (actualCharset == null && "text".equals(actualMediaType)) {
            actualCharset = US_ASCII;
        }
        return new BasicBodyDescriptor(actualMimeType, actualMediaType, actualSubType, this.boundary, actualCharset, this.transferEncoding != null ? this.transferEncoding : MimeUtil.ENC_7BIT, this.contentLength);
    }

    @Override // org.apache.james.mime4j.stream.BodyDescriptorBuilder
    public Field addField(RawField field) throws MimeException {
        String name = field.getName().toLowerCase(Locale.US);
        if (name.equals("content-transfer-encoding") && this.transferEncoding == null) {
            String value = field.getBody();
            if (value != null) {
                String value2 = value.trim().toLowerCase(Locale.US);
                if (value2.length() > 0) {
                    this.transferEncoding = value2;
                    return null;
                }
                return null;
            }
            return null;
        }
        if (!name.equals("content-length") || this.contentLength != -1) {
            if (name.equals("content-type") && this.mimeType == null) {
                parseContentType(field);
                return null;
            }
            return null;
        }
        String value3 = field.getBody();
        if (value3 != null) {
            String value4 = value3.trim();
            try {
                this.contentLength = Long.parseLong(value4.trim());
                return null;
            } catch (NumberFormatException e) {
                if (this.monitor.warn("Invalid content length: " + value4, "ignoring Content-Length header")) {
                    throw new MimeException("Invalid Content-Length header: " + value4);
                }
                return null;
            }
        }
        return null;
    }

    private void parseContentType(Field field) throws MimeException {
        RawField rawfield;
        if (field instanceof RawField) {
            rawfield = (RawField) field;
        } else {
            rawfield = new RawField(field.getName(), field.getBody());
        }
        RawBody body = RawFieldParser.DEFAULT.parseRawBody(rawfield);
        String main = body.getValue();
        Map<String, String> params = new HashMap<>();
        for (NameValuePair nmp : body.getParams()) {
            String name = nmp.getName().toLowerCase(Locale.US);
            params.put(name, nmp.getValue());
        }
        String type = null;
        String subtype = null;
        if (main != null) {
            main = main.toLowerCase().trim();
            int index = main.indexOf(47);
            boolean valid = false;
            if (index != -1) {
                type = main.substring(0, index).trim();
                subtype = main.substring(index + 1).trim();
                if (type.length() > 0 && subtype.length() > 0) {
                    main = type + "/" + subtype;
                    valid = true;
                }
            }
            if (!valid) {
                main = null;
                type = null;
                subtype = null;
            }
        }
        String b = params.get("boundary");
        if (main != null && ((main.startsWith("multipart/") && b != null) || !main.startsWith("multipart/"))) {
            this.mimeType = main;
            this.mediaType = type;
            this.subType = subtype;
        }
        if (MimeUtil.isMultipart(this.mimeType)) {
            this.boundary = b;
        }
        String c = params.get("charset");
        this.charset = null;
        if (c != null) {
            String c2 = c.trim();
            if (c2.length() > 0) {
                this.charset = c2;
            }
        }
    }
}
