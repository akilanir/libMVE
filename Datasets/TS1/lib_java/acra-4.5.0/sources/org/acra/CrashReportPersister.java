package org.acra;

import android.content.Context;
import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.util.Map;
import org.acra.collector.CrashReportData;

/* loaded from: acra-4.5.0.jar:org/acra/CrashReportPersister.class */
final class CrashReportPersister {
    private static final int NONE = 0;
    private static final int SLASH = 1;
    private static final int UNICODE = 2;
    private static final int CONTINUE = 3;
    private static final int KEY_DONE = 4;
    private static final int IGNORE = 5;
    private static final String LINE_SEPARATOR = "\n";
    private final Context context;

    CrashReportPersister(Context context) {
        this.context = context;
    }

    public CrashReportData load(String fileName) throws IOException {
        FileInputStream in = this.context.openFileInput(fileName);
        if (in == null) {
            throw new IllegalArgumentException("Invalid crash report fileName : " + fileName);
        }
        try {
            BufferedInputStream bis = new BufferedInputStream(in, ACRAConstants.DEFAULT_BUFFER_SIZE_IN_BYTES);
            bis.mark(Integer.MAX_VALUE);
            boolean isEbcdic = isEbcdic(bis);
            bis.reset();
            if (!isEbcdic) {
                CrashReportData load = load(new InputStreamReader(bis, "ISO8859-1"));
                in.close();
                return load;
            }
            CrashReportData load2 = load(new InputStreamReader(bis));
            in.close();
            return load2;
        } catch (Throwable th) {
            in.close();
            throw th;
        }
    }

    public void store(CrashReportData crashData, String fileName) throws IOException {
        OutputStream out = this.context.openFileOutput(fileName, 0);
        try {
            StringBuilder buffer = new StringBuilder(200);
            OutputStreamWriter writer = new OutputStreamWriter(out, "ISO8859_1");
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
            out.close();
        } catch (Throwable th) {
            out.close();
            throw th;
        }
    }

    private boolean isEbcdic(BufferedInputStream in) throws IOException {
        byte b;
        do {
            b = (byte) in.read();
            if (b == -1 || b == 35 || b == 10 || b == 61) {
                return false;
            }
        } while (b != 21);
        return true;
    }

    /* JADX WARN: Removed duplicated region for block: B:143:0x0270 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:61:0x01e9  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x01ef  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x024a  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x0275  */
    /* JADX WARN: Removed duplicated region for block: B:92:0x027a  */
    /* JADX WARN: Removed duplicated region for block: B:95:0x0284  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private synchronized org.acra.collector.CrashReportData load(java.io.Reader r7) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 786
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.acra.CrashReportPersister.load(java.io.Reader):org.acra.collector.CrashReportData");
    }

    private void dumpString(StringBuilder buffer, String string, boolean key) {
        int i = 0;
        if (!key && 0 < string.length() && string.charAt(0) == ' ') {
            buffer.append("\\ ");
            i = 0 + 1;
        }
        while (i < string.length()) {
            char ch = string.charAt(i);
            switch (ch) {
                case '\t':
                    buffer.append("\\t");
                    break;
                case '\n':
                    buffer.append("\\n");
                    break;
                case 11:
                default:
                    if ("\\#!=:".indexOf(ch) >= 0 || (key && ch == ' ')) {
                        buffer.append('\\');
                    }
                    if (ch >= ' ' && ch <= '~') {
                        buffer.append(ch);
                        break;
                    } else {
                        String hex = Integer.toHexString(ch);
                        buffer.append("\\u");
                        for (int j = 0; j < KEY_DONE - hex.length(); j++) {
                            buffer.append("0");
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
