package com.koushikdutta.async.stream;

import com.koushikdutta.async.AsyncServer;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

/* loaded from: com.koushikdutta.async.androidasync.2.1.7.jar:com/koushikdutta/async/stream/FileDataSink.class */
public class FileDataSink extends OutputStreamDataSink {
    File file;

    public FileDataSink(AsyncServer server, File file) {
        super(server);
        this.file = file;
    }

    @Override // com.koushikdutta.async.stream.OutputStreamDataSink
    public OutputStream getOutputStream() throws IOException {
        OutputStream ret = super.getOutputStream();
        if (ret == null) {
            ret = new FileOutputStream(this.file);
            setOutputStream(ret);
        }
        return ret;
    }
}
