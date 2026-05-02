package cz.msebera.android.httpclient.entity.mime.content;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/entity/mime/content/ContentDescriptor.class */
public interface ContentDescriptor {
    String getMimeType();

    String getMediaType();

    String getSubType();

    String getCharset();

    String getTransferEncoding();

    long getContentLength();
}
