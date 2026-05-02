package ch.qos.logback.core.util;

import ch.qos.logback.core.Context;
import ch.qos.logback.core.rolling.RolloverFailure;
import ch.qos.logback.core.spi.ContextAwareBase;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/util/FileUtil.class */
public class FileUtil extends ContextAwareBase {
    static final int BUF_SIZE = 32768;

    public FileUtil(Context context) {
        setContext(context);
    }

    public static URL fileToURL(File file) {
        try {
            return file.toURI().toURL();
        } catch (MalformedURLException e) {
            throw new RuntimeException("Unexpected exception on file [" + file + "]", e);
        }
    }

    public static boolean isParentDirectoryCreationRequired(File file) {
        File parentFile = file.getParentFile();
        return (parentFile == null || parentFile.exists()) ? false : true;
    }

    public static boolean createMissingParentDirectories(File file) {
        File parentFile = file.getParentFile();
        if (parentFile == null) {
            throw new IllegalStateException(file + " should not have a null parent");
        }
        if (parentFile.exists()) {
            throw new IllegalStateException(file + " should not have existing parent directory");
        }
        return parentFile.mkdirs();
    }

    public static String prefixRelativePath(String str, String str2) {
        if (str != null && !OptionHelper.isEmpty(str.trim()) && !new File(str2).isAbsolute()) {
            str2 = str + "/" + str2;
        }
        return str2;
    }

    public void copy(String str, String str2) throws RolloverFailure {
        BufferedInputStream bufferedInputStream = null;
        BufferedOutputStream bufferedOutputStream = null;
        try {
            try {
                BufferedInputStream bufferedInputStream2 = new BufferedInputStream(new FileInputStream(str));
                BufferedOutputStream bufferedOutputStream2 = new BufferedOutputStream(new FileOutputStream(str2));
                byte[] bArr = new byte[BUF_SIZE];
                while (true) {
                    int read = bufferedInputStream2.read(bArr);
                    if (read == -1) {
                        break;
                    } else {
                        bufferedOutputStream2.write(bArr, 0, read);
                    }
                }
                bufferedInputStream2.close();
                bufferedInputStream = null;
                bufferedOutputStream2.close();
                bufferedOutputStream = null;
                if (0 != 0) {
                    try {
                        bufferedInputStream.close();
                    } catch (IOException e) {
                    }
                }
                if (0 != 0) {
                    try {
                        bufferedOutputStream.close();
                    } catch (IOException e2) {
                    }
                }
            } catch (IOException e3) {
                String str3 = "Failed to copy [" + str + "] to [" + str2 + "]";
                addError(str3, e3);
                throw new RolloverFailure(str3);
            }
        } catch (Throwable th) {
            if (bufferedInputStream != null) {
                try {
                    bufferedInputStream.close();
                } catch (IOException e4) {
                }
            }
            if (bufferedOutputStream != null) {
                try {
                    bufferedOutputStream.close();
                } catch (IOException e5) {
                }
            }
            throw th;
        }
    }
}
