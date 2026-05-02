package tk.elevenk.olapi;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.StringWriter;
import java.io.Writer;

/* loaded from: OpenLibraryAPI-1.0.jar:tk/elevenk/olapi/ApiHelpers.class */
public class ApiHelpers {
    public static String convertStreamToString(InputStream is) throws Exception {
        char[] buff = new char[1024];
        Writer stringWriter = new StringWriter();
        try {
            Reader bReader = new BufferedReader(new InputStreamReader(is, "UTF-8"));
            while (true) {
                int n = bReader.read(buff);
                if (n != -1) {
                    stringWriter.write(buff, 0, n);
                } else {
                    return stringWriter.toString();
                }
            }
        } finally {
            stringWriter.close();
            is.close();
        }
    }
}
