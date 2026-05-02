package korex.activation;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/* loaded from: kore-javamail-1.0.2.jar:korex/activation/DataSource.class */
public interface DataSource {
    InputStream getInputStream() throws IOException;

    OutputStream getOutputStream() throws IOException;

    String getContentType();

    String getName();
}
