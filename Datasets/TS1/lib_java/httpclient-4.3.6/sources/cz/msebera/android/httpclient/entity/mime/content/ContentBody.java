package cz.msebera.android.httpclient.entity.mime.content;

import java.io.IOException;
import java.io.OutputStream;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/entity/mime/content/ContentBody.class */
public interface ContentBody extends ContentDescriptor {
    String getFilename();

    void writeTo(OutputStream outputStream) throws IOException;
}
