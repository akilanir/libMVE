package org.openintents.openpgp.util;

import android.os.ParcelFileDescriptor;
import android.util.Log;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/* loaded from: org.sufficientlysecure.openpgp-api.9.0.jar:org/openintents/openpgp/util/ParcelFileDescriptorUtil.class */
public class ParcelFileDescriptorUtil {
    public static ParcelFileDescriptor pipeFrom(InputStream inputStream) throws IOException {
        ParcelFileDescriptor[] pipe = ParcelFileDescriptor.createPipe();
        ParcelFileDescriptor readSide = pipe[0];
        ParcelFileDescriptor writeSide = pipe[1];
        new TransferThread(inputStream, new ParcelFileDescriptor.AutoCloseOutputStream(writeSide)).start();
        return readSide;
    }

    public static TransferThread pipeTo(OutputStream outputStream, ParcelFileDescriptor output) throws IOException {
        TransferThread t = new TransferThread(new ParcelFileDescriptor.AutoCloseInputStream(output), outputStream);
        t.start();
        return t;
    }

    /* loaded from: org.sufficientlysecure.openpgp-api.9.0.jar:org/openintents/openpgp/util/ParcelFileDescriptorUtil$TransferThread.class */
    static class TransferThread extends Thread {
        final InputStream mIn;
        final OutputStream mOut;

        TransferThread(InputStream in, OutputStream out) {
            super("IPC Transfer Thread");
            this.mIn = in;
            this.mOut = out;
            setDaemon(true);
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            byte[] buf = new byte[4096];
            while (true) {
                try {
                    try {
                        int len = this.mIn.read(buf);
                        if (len <= 0) {
                            break;
                        } else {
                            this.mOut.write(buf, 0, len);
                        }
                    } catch (IOException e) {
                        Log.e(OpenPgpApi.TAG, "IOException when writing to out", e);
                        try {
                            this.mIn.close();
                        } catch (IOException e2) {
                        }
                        try {
                            this.mOut.close();
                            return;
                        } catch (IOException e3) {
                            return;
                        }
                    }
                } catch (Throwable th) {
                    try {
                        this.mIn.close();
                    } catch (IOException e4) {
                    }
                    try {
                        this.mOut.close();
                    } catch (IOException e5) {
                    }
                    throw th;
                }
            }
            try {
                this.mIn.close();
            } catch (IOException e6) {
            }
            try {
                this.mOut.close();
            } catch (IOException e7) {
            }
        }
    }
}
