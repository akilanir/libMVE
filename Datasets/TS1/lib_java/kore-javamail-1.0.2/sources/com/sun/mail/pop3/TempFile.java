package com.sun.mail.pop3;

import java.io.File;
import java.io.IOException;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/pop3/TempFile.class */
class TempFile {
    private File file;
    private WritableSharedFile sf;

    public TempFile(File dir) throws IOException {
        this.file = File.createTempFile("pop3.", ".mbox", dir);
        this.file.deleteOnExit();
        this.sf = new WritableSharedFile(this.file);
    }

    public AppendStream getAppendStream() throws IOException {
        return this.sf.getAppendStream();
    }

    public void close() {
        try {
            this.sf.close();
        } catch (IOException e) {
        }
        this.file.delete();
    }

    protected void finalize() throws Throwable {
        super.finalize();
        close();
    }
}
