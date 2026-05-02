package org.ligi.axt.extensions;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

/* loaded from: org.ligi.AXT.0.33.jar:org/ligi/axt/extensions/InputStreamAXT.class */
public class InputStreamAXT {
    private static final int CHARACTER_READ_BUFFER_SIZE = 1024;
    private final InputStream inputStream;

    public InputStreamAXT(InputStream inputStream) {
        this.inputStream = inputStream;
    }

    public void toFile(File f) throws IOException {
        FileOutputStream fos = new FileOutputStream(f);
        try {
            byte[] buffer = new byte[CHARACTER_READ_BUFFER_SIZE];
            while (true) {
                int len = this.inputStream.read(buffer);
                if (len > 0) {
                    fos.write(buffer, 0, len);
                } else {
                    return;
                }
            }
        } finally {
            fos.close();
        }
    }

    public String readToString() throws IOException {
        InputStreamReader is = new InputStreamReader(this.inputStream);
        try {
            return readFromInputStreamReaderToString(is);
        } finally {
            is.close();
        }
    }

    private String readFromInputStreamReaderToString(InputStreamReader is) throws IOException {
        BufferedReader reader = new BufferedReader(is, CHARACTER_READ_BUFFER_SIZE);
        try {
            char[] buffer = new char[CHARACTER_READ_BUFFER_SIZE];
            StringBuilder sb = new StringBuilder();
            while (true) {
                int len = reader.read(buffer);
                if (len >= 0) {
                    sb.append(buffer, 0, len);
                } else {
                    String sb2 = sb.toString();
                    reader.close();
                    return sb2;
                }
            }
        } catch (Throwable th) {
            reader.close();
            throw th;
        }
    }
}
