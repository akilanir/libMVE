package retrofit.mime;

import java.io.IOException;
import java.io.OutputStream;

/* loaded from: retrofit-1.9.0.jar:retrofit/mime/TypedOutput.class */
public interface TypedOutput {
    String fileName();

    String mimeType();

    long length();

    void writeTo(OutputStream outputStream) throws IOException;
}
