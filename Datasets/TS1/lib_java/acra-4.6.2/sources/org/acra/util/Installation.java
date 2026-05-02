package org.acra.util;

import android.content.Context;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.util.UUID;
import org.acra.ACRA;

/* loaded from: acra-4.6.2.jar:org/acra/util/Installation.class */
public class Installation {
    private static String sID;
    private static final String INSTALLATION = "ACRA-INSTALLATION";

    public static synchronized String id(Context context) {
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

    private static String readInstallationFile(File installation) throws IOException {
        RandomAccessFile f = new RandomAccessFile(installation, "r");
        byte[] bytes = new byte[(int) f.length()];
        try {
            f.readFully(bytes);
            f.close();
            return new String(bytes);
        } catch (Throwable th) {
            f.close();
            throw th;
        }
    }

    private static void writeInstallationFile(File installation) throws IOException {
        FileOutputStream out = new FileOutputStream(installation);
        try {
            String id = UUID.randomUUID().toString();
            out.write(id.getBytes());
            out.close();
        } catch (Throwable th) {
            out.close();
            throw th;
        }
    }
}
