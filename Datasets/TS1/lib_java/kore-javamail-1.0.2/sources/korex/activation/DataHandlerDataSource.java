package korex.activation;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/* compiled from: DataHandler.java */
/* loaded from: kore-javamail-1.0.2.jar:korex/activation/DataHandlerDataSource.class */
class DataHandlerDataSource implements DataSource {
    DataHandler dataHandler;

    public DataHandlerDataSource(DataHandler dh) {
        this.dataHandler = null;
        this.dataHandler = dh;
    }

    @Override // korex.activation.DataSource
    public InputStream getInputStream() throws IOException {
        return this.dataHandler.getInputStream();
    }

    @Override // korex.activation.DataSource
    public OutputStream getOutputStream() throws IOException {
        return this.dataHandler.getOutputStream();
    }

    @Override // korex.activation.DataSource
    public String getContentType() {
        return this.dataHandler.getContentType();
    }

    @Override // korex.activation.DataSource
    public String getName() {
        return this.dataHandler.getName();
    }
}
