package cz.msebera.android.httpclient.entity.mime;

import java.io.IOException;
import java.io.OutputStream;
import java.nio.charset.Charset;
import java.util.Iterator;
import java.util.List;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/entity/mime/HttpStrictMultipart.class */
class HttpStrictMultipart extends AbstractMultipartForm {
    private final List<FormBodyPart> parts;

    public HttpStrictMultipart(String subType, Charset charset, String boundary, List<FormBodyPart> parts) {
        super(subType, charset, boundary);
        this.parts = parts;
    }

    @Override // cz.msebera.android.httpclient.entity.mime.AbstractMultipartForm
    public List<FormBodyPart> getBodyParts() {
        return this.parts;
    }

    @Override // cz.msebera.android.httpclient.entity.mime.AbstractMultipartForm
    protected void formatMultipartHeader(FormBodyPart part, OutputStream out) throws IOException {
        Header header = part.getHeader();
        Iterator<MinimalField> it = header.iterator();
        while (it.hasNext()) {
            MinimalField field = it.next();
            writeField(field, out);
        }
    }
}
