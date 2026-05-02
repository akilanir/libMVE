package org.apache.http.entity.mime.content;

/* loaded from: httpmime-4.2.1.jar:org/apache/http/entity/mime/content/ContentDescriptor.class */
public interface ContentDescriptor {
    String getMimeType();

    String getMediaType();

    String getSubType();

    String getCharset();

    String getTransferEncoding();

    long getContentLength();
}
