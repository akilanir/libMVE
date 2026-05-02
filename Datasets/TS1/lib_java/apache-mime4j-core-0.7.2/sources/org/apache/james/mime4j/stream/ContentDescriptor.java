package org.apache.james.mime4j.stream;

/* loaded from: apache-mime4j-core-0.7.2.jar:org/apache/james/mime4j/stream/ContentDescriptor.class */
public interface ContentDescriptor {
    String getMimeType();

    String getMediaType();

    String getSubType();

    String getCharset();

    String getTransferEncoding();

    long getContentLength();
}
