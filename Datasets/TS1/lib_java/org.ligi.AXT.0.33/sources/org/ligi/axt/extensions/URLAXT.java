package org.ligi.axt.extensions;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

/* loaded from: org.ligi.AXT.0.33.jar:org/ligi/axt/extensions/URLAXT.class */
public class URLAXT {
    private final URL url;

    public URLAXT(URL url) {
        this.url = url;
    }

    public String downloadToString() {
        try {
            URLConnection con = this.url.openConnection();
            InputStream in = con.getInputStream();
            try {
                String readToStringAsUtf8 = readToStringAsUtf8(in);
                in.close();
                return readToStringAsUtf8;
            } catch (Throwable th) {
                in.close();
                throw th;
            }
        } catch (IOException e) {
            return null;
        }
    }

    private String readToStringAsUtf8(InputStream in) throws IOException {
        BufferedReader reader = new BufferedReader(new InputStreamReader(in, "UTF-8"));
        try {
            StringBuilder sb = new StringBuilder();
            while (true) {
                String line = reader.readLine();
                if (line != null) {
                    sb.append(line).append("\n");
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
