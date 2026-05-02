package de.psdev.licensesdialog.licenses;

import android.content.Context;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Serializable;

/* loaded from: de.psdev.licensesdialog.licensesdialog.1.8.0.jar:de/psdev/licensesdialog/licenses/License.class */
public abstract class License implements Serializable {
    private static final long serialVersionUID = 3100331505738956523L;
    private static final String LINE_SEPARATOR = System.getProperty("line.separator");
    private String mCachedSummaryText = null;
    private String mCachedFullText = null;

    public abstract String getName();

    public abstract String readSummaryTextFromResources(Context context);

    public abstract String readFullTextFromResources(Context context);

    public abstract String getVersion();

    public abstract String getUrl();

    public final String getSummaryText(Context context) {
        if (this.mCachedSummaryText == null) {
            this.mCachedSummaryText = readSummaryTextFromResources(context);
        }
        return this.mCachedSummaryText;
    }

    public final String getFullText(Context context) {
        if (this.mCachedFullText == null) {
            this.mCachedFullText = readFullTextFromResources(context);
        }
        return this.mCachedFullText;
    }

    protected String getContent(Context context, int contentResourceId) {
        BufferedReader reader = null;
        try {
            try {
                InputStream inputStream = context.getResources().openRawResource(contentResourceId);
                if (inputStream == null) {
                    throw new IOException("Error opening license file.");
                }
                BufferedReader reader2 = new BufferedReader(new InputStreamReader(inputStream));
                String license = toString(reader2);
                if (reader2 != null) {
                    try {
                        reader2.close();
                    } catch (IOException e) {
                    }
                }
                return license;
            } catch (IOException e2) {
                throw new IllegalStateException(e2);
            }
        } catch (Throwable th) {
            if (0 != 0) {
                try {
                    reader.close();
                } catch (IOException e3) {
                }
            }
            throw th;
        }
    }

    private String toString(BufferedReader reader) throws IOException {
        StringBuilder builder = new StringBuilder();
        while (true) {
            String line = reader.readLine();
            if (line != null) {
                builder.append(line).append(LINE_SEPARATOR);
            } else {
                return builder.toString();
            }
        }
    }
}
