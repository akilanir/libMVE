package retrofit.mime;

import java.io.IOException;
import java.io.InputStream;

/* loaded from: retrofit-1.9.0.jar:retrofit/mime/TypedInput.class */
public interface TypedInput {
    String mimeType();

    long length();

    InputStream in() throws IOException;
}
