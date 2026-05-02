package org.acra.file;

import android.support.annotation.NonNull;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.Map;
import org.acra.ACRAConstants;
import org.acra.ReportField;
import org.acra.collector.CrashReportData;
import org.acra.util.IOUtils;

/* loaded from: ch.acra.acra.4.9.0.jar:org/acra/file/CrashReportPersister.class */
public final class CrashReportPersister {
    private static final int NONE = 0;
    private static final int SLASH = 1;
    private static final int UNICODE = 2;
    private static final int CONTINUE = 3;
    private static final int KEY_DONE = 4;
    private static final int IGNORE = 5;
    private static final String LINE_SEPARATOR = "\n";

    @NonNull
    public CrashReportData load(@NonNull File file) throws IOException {
        InputStream in = new BufferedInputStream(new FileInputStream(file), ACRAConstants.DEFAULT_BUFFER_SIZE_IN_BYTES);
        try {
            CrashReportData load = load(new InputStreamReader(in, "ISO8859-1"));
            IOUtils.safeClose(in);
            return load;
        } catch (Throwable th) {
            IOUtils.safeClose(in);
            throw th;
        }
    }

    public void store(@NonNull CrashReportData crashData, @NonNull File file) throws IOException {
        OutputStreamWriter writer = new OutputStreamWriter(new FileOutputStream(file), "ISO8859_1");
        try {
            StringBuilder buffer = new StringBuilder(200);
            for (Map.Entry<ReportField, String> entry : crashData.entrySet()) {
                String key = entry.getKey().toString();
                dumpString(buffer, key, true);
                buffer.append('=');
                dumpString(buffer, entry.getValue(), false);
                buffer.append(LINE_SEPARATOR);
                writer.write(buffer.toString());
                buffer.setLength(0);
            }
            writer.flush();
            IOUtils.safeClose(writer);
        } catch (Throwable th) {
            IOUtils.safeClose(writer);
            throw th;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:154:0x026f A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:61:0x01e9  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x01ef  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x0249  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x0274  */
    /* JADX WARN: Removed duplicated region for block: B:92:0x0279  */
    /* JADX WARN: Removed duplicated region for block: B:95:0x0283  */
    @android.support.annotation.NonNull
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private synchronized org.acra.collector.CrashReportData load(@android.support.annotation.NonNull java.io.Reader r7) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 807
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.acra.file.CrashReportPersister.load(java.io.Reader):org.acra.collector.CrashReportData");
    }

    private void dumpString(@NonNull StringBuilder buffer, @NonNull String string, boolean key) {
        int i = 0;
        if (!key && 0 < string.length() && string.charAt(0) == ' ') {
            buffer.append("\\ ");
            i = 0 + 1;
        }
        while (i < string.length()) {
            char ch2 = string.charAt(i);
            switch (ch2) {
                case '\t':
                    buffer.append("\\t");
                    break;
                case '\n':
                    buffer.append("\\n");
                    break;
                case 11:
                default:
                    if ("\\#!=:".indexOf(ch2) >= 0 || (key && ch2 == ' ')) {
                        buffer.append('\\');
                    }
                    if (ch2 >= ' ' && ch2 <= '~') {
                        buffer.append(ch2);
                        break;
                    } else {
                        String hex = Integer.toHexString(ch2);
                        buffer.append("\\u");
                        for (int j = 0; j < KEY_DONE - hex.length(); j++) {
                            buffer.append('0');
                        }
                        buffer.append(hex);
                        break;
                    }
                case '\f':
                    buffer.append("\\f");
                    break;
                case '\r':
                    buffer.append("\\r");
                    break;
            }
            i++;
        }
    }
}
