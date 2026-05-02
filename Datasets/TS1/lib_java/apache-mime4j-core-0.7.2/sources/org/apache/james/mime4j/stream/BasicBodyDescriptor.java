package org.apache.james.mime4j.stream;

/* loaded from: apache-mime4j-core-0.7.2.jar:org/apache/james/mime4j/stream/BasicBodyDescriptor.class */
class BasicBodyDescriptor implements BodyDescriptor {
    private final String mimeType;
    private final String mediaType;
    private final String subType;
    private final String boundary;
    private final String charset;
    private final String transferEncoding;
    private final long contentLength;

    BasicBodyDescriptor(String mimeType, String mediaType, String subType, String boundary, String charset, String transferEncoding, long contentLength) {
        this.mimeType = mimeType;
        this.mediaType = mediaType;
        this.subType = subType;
        this.boundary = boundary;
        this.charset = charset;
        this.transferEncoding = transferEncoding;
        this.contentLength = contentLength;
    }

    @Override // org.apache.james.mime4j.stream.ContentDescriptor
    public String getMimeType() {
        return this.mimeType;
    }

    @Override // org.apache.james.mime4j.stream.ContentDescriptor
    public String getMediaType() {
        return this.mediaType;
    }

    @Override // org.apache.james.mime4j.stream.ContentDescriptor
    public String getSubType() {
        return this.subType;
    }

    @Override // org.apache.james.mime4j.stream.BodyDescriptor
    public String getBoundary() {
        return this.boundary;
    }

    @Override // org.apache.james.mime4j.stream.ContentDescriptor
    public String getCharset() {
        return this.charset;
    }

    @Override // org.apache.james.mime4j.stream.ContentDescriptor
    public String getTransferEncoding() {
        return this.transferEncoding;
    }

    @Override // org.apache.james.mime4j.stream.ContentDescriptor
    public long getContentLength() {
        return this.contentLength;
    }

    public String toString() {
        return "[mimeType=" + this.mimeType + ", mediaType=" + this.mediaType + ", subType=" + this.subType + ", boundary=" + this.boundary + ", charset=" + this.charset + "]";
    }
}
