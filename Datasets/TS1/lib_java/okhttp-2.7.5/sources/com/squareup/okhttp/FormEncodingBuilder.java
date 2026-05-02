package com.squareup.okhttp;

import okio.Buffer;

/* loaded from: okhttp-2.7.5.jar:com/squareup/okhttp/FormEncodingBuilder.class */
public final class FormEncodingBuilder {
    private static final MediaType CONTENT_TYPE = MediaType.parse("application/x-www-form-urlencoded");
    private final Buffer content = new Buffer();

    public FormEncodingBuilder add(String name, String value) {
        if (this.content.size() > 0) {
            this.content.writeByte(38);
        }
        HttpUrl.canonicalize(this.content, name, 0, name.length(), " \"':;<=>@[]^`{}|/\\?#&!$(),~", false, true, true);
        this.content.writeByte(61);
        HttpUrl.canonicalize(this.content, value, 0, value.length(), " \"':;<=>@[]^`{}|/\\?#&!$(),~", false, true, true);
        return this;
    }

    public FormEncodingBuilder addEncoded(String name, String value) {
        if (this.content.size() > 0) {
            this.content.writeByte(38);
        }
        HttpUrl.canonicalize(this.content, name, 0, name.length(), " \"':;<=>@[]^`{}|/\\?#&!$(),~", true, true, true);
        this.content.writeByte(61);
        HttpUrl.canonicalize(this.content, value, 0, value.length(), " \"':;<=>@[]^`{}|/\\?#&!$(),~", true, true, true);
        return this;
    }

    public RequestBody build() {
        return RequestBody.create(CONTENT_TYPE, this.content.snapshot());
    }
}
