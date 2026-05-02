package org.acra.util;

import android.content.Context;
import android.support.annotation.NonNull;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.util.UUID;
import org.acra.ACRA;

/* loaded from: ch.acra.acra.4.9.0.jar:org/acra/util/Installation.class */
public final class Installation {
    private static String sID;
    private static final String INSTALLATION = "ACRA-INSTALLATION";

    private Installation() {
    }

    @NonNull
    public static synchronized String id(@NonNull Context context) {
        if (sID == null) {
            File installation = new File(context.getFilesDir(), INSTALLATION);
            try {
                if (!installation.exists()) {
                    writeInstallationFile(installation);
                }
                sID = readInstallationFile(installation);
            } catch (IOException e) {
                ACRA.log.w(ACRA.LOG_TAG, "Couldn't retrieve InstallationId for " + context.getPackageName(), e);
                return "Couldn't retrieve InstallationId";
            } catch (RuntimeException e2) {
                ACRA.log.w(ACRA.LOG_TAG, "Couldn't retrieve InstallationId for " + context.getPackageName(), e2);
                return "Couldn't retrieve InstallationId";
            }
        }
        return sID;
    }

    @NonNull
    private static String readInstallationFile(@NonNull File installation) throws IOException {
        RandomAccessFile f = new RandomAccessFile(installation, "r");
        byte[] bytes = new byte[(int) f.length()];
        try {
            f.readFully(bytes);
            return new String(bytes);
        } finally {
            IOUtils.safeClose(f);
        }
    }

    private static void writeInstallationFile(@NonNull File installation) throws IOException {
        FileOutputStream out = new FileOutputStream(installation);
        try {
            String id = UUID.randomUUID().toString();
            out.write(id.getBytes());
        } finally {
            out.close();
        }
    }
}
