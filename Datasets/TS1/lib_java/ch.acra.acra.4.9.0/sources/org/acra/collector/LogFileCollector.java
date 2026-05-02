package org.acra.collector;

import android.content.Context;
import android.support.annotation.NonNull;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import org.acra.ACRA;
import org.acra.util.IOUtils;

/* loaded from: ch.acra.acra.4.9.0.jar:org/acra/collector/LogFileCollector.class */
class LogFileCollector {
    LogFileCollector() {
    }

    @NonNull
    public String collectLogFile(@NonNull Context context, @NonNull String fileName, int numberOfLines) throws IOException {
        return IOUtils.streamToString(getStream(context, fileName), numberOfLines);
    }

    @NonNull
    private static InputStream getStream(@NonNull Context context, @NonNull String fileName) {
        FileInputStream inputStream;
        try {
            if (fileName.startsWith("/")) {
                inputStream = new FileInputStream(fileName);
            } else if (fileName.contains("/")) {
                inputStream = new FileInputStream(new File(context.getFilesDir(), fileName));
            } else {
                inputStream = context.openFileInput(fileName);
            }
            return inputStream;
        } catch (FileNotFoundException e) {
            ACRA.log.e(ACRA.LOG_TAG, "Cannot find application log file : '" + fileName + '\'');
            return new ByteArrayInputStream(new byte[0]);
        }
    }
}
