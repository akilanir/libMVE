package ch.qos.logback.core.rolling.helper;

import ch.qos.logback.core.net.SyslogConstants;
import ch.qos.logback.core.spi.ContextAwareBase;
import ch.qos.logback.core.status.ErrorStatus;
import ch.qos.logback.core.status.WarnStatus;
import ch.qos.logback.core.util.FileUtil;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.zip.GZIPOutputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/rolling/helper/Compressor.class */
public class Compressor extends ContextAwareBase {
    final CompressionMode compressionMode;
    static final int BUFFER_SIZE = 8192;

    /* renamed from: ch.qos.logback.core.rolling.helper.Compressor$1, reason: invalid class name */
    /* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/rolling/helper/Compressor$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$ch$qos$logback$core$rolling$helper$CompressionMode = new int[CompressionMode.values().length];

        static {
            try {
                $SwitchMap$ch$qos$logback$core$rolling$helper$CompressionMode[CompressionMode.GZ.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$ch$qos$logback$core$rolling$helper$CompressionMode[CompressionMode.ZIP.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$ch$qos$logback$core$rolling$helper$CompressionMode[CompressionMode.NONE.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
        }
    }

    public Compressor(CompressionMode compressionMode) {
        this.compressionMode = compressionMode;
    }

    public void compress(String str, String str2, String str3) {
        switch (AnonymousClass1.$SwitchMap$ch$qos$logback$core$rolling$helper$CompressionMode[this.compressionMode.ordinal()]) {
            case 1:
                gzCompress(str, str2);
                return;
            case 2:
                zipCompress(str, str2, str3);
                return;
            case SyslogConstants.ERROR_SEVERITY /* 3 */:
                throw new UnsupportedOperationException("compress method called in NONE compression mode");
            default:
                return;
        }
    }

    private void zipCompress(String str, String str2, String str3) {
        File file = new File(str);
        if (!file.exists()) {
            addStatus(new WarnStatus("The file to compress named [" + str + "] does not exist.", this));
            return;
        }
        if (str3 == null) {
            addStatus(new WarnStatus("The innerEntryName parameter cannot be null", this));
            return;
        }
        if (!str2.endsWith(".zip")) {
            str2 = str2 + ".zip";
        }
        File file2 = new File(str2);
        if (file2.exists()) {
            addStatus(new WarnStatus("The target compressed file named [" + str2 + "] exist already.", this));
            return;
        }
        addInfo("ZIP compressing [" + file + "] as [" + file2 + "]");
        createMissingTargetDirsIfNecessary(file2);
        BufferedInputStream bufferedInputStream = null;
        ZipOutputStream zipOutputStream = null;
        try {
            try {
                BufferedInputStream bufferedInputStream2 = new BufferedInputStream(new FileInputStream(str));
                ZipOutputStream zipOutputStream2 = new ZipOutputStream(new FileOutputStream(str2));
                zipOutputStream2.putNextEntry(computeZipEntry(str3));
                byte[] bArr = new byte[BUFFER_SIZE];
                while (true) {
                    int read = bufferedInputStream2.read(bArr);
                    if (read == -1) {
                        break;
                    } else {
                        zipOutputStream2.write(bArr, 0, read);
                    }
                }
                bufferedInputStream2.close();
                bufferedInputStream = null;
                zipOutputStream2.close();
                zipOutputStream = null;
                if (!file.delete()) {
                    addStatus(new WarnStatus("Could not delete [" + str + "].", this));
                }
                if (0 != 0) {
                    try {
                        bufferedInputStream.close();
                    } catch (IOException e) {
                    }
                }
                if (0 != 0) {
                    try {
                        zipOutputStream.close();
                    } catch (IOException e2) {
                    }
                }
            } catch (Exception e3) {
                addStatus(new ErrorStatus("Error occurred while compressing [" + str + "] into [" + str2 + "].", this, e3));
                if (bufferedInputStream != null) {
                    try {
                        bufferedInputStream.close();
                    } catch (IOException e4) {
                    }
                }
                if (zipOutputStream != null) {
                    try {
                        zipOutputStream.close();
                    } catch (IOException e5) {
                    }
                }
            }
        } catch (Throwable th) {
            if (bufferedInputStream != null) {
                try {
                    bufferedInputStream.close();
                } catch (IOException e6) {
                }
            }
            if (zipOutputStream != null) {
                try {
                    zipOutputStream.close();
                } catch (IOException e7) {
                }
            }
            throw th;
        }
    }

    ZipEntry computeZipEntry(File file) {
        return computeZipEntry(file.getName());
    }

    ZipEntry computeZipEntry(String str) {
        return new ZipEntry(computeFileNameStr_WCS(str, this.compressionMode));
    }

    private void gzCompress(String str, String str2) {
        File file = new File(str);
        if (!file.exists()) {
            addStatus(new WarnStatus("The file to compress named [" + str + "] does not exist.", this));
            return;
        }
        if (!str2.endsWith(".gz")) {
            str2 = str2 + ".gz";
        }
        File file2 = new File(str2);
        if (file2.exists()) {
            addWarn("The target compressed file named [" + str2 + "] exist already. Aborting file compression.");
            return;
        }
        addInfo("GZ compressing [" + file + "] as [" + file2 + "]");
        createMissingTargetDirsIfNecessary(file2);
        BufferedInputStream bufferedInputStream = null;
        GZIPOutputStream gZIPOutputStream = null;
        try {
            try {
                BufferedInputStream bufferedInputStream2 = new BufferedInputStream(new FileInputStream(str));
                GZIPOutputStream gZIPOutputStream2 = new GZIPOutputStream(new FileOutputStream(str2));
                byte[] bArr = new byte[BUFFER_SIZE];
                while (true) {
                    int read = bufferedInputStream2.read(bArr);
                    if (read == -1) {
                        break;
                    } else {
                        gZIPOutputStream2.write(bArr, 0, read);
                    }
                }
                bufferedInputStream2.close();
                bufferedInputStream = null;
                gZIPOutputStream2.close();
                gZIPOutputStream = null;
                if (!file.delete()) {
                    addStatus(new WarnStatus("Could not delete [" + str + "].", this));
                }
                if (0 != 0) {
                    try {
                        bufferedInputStream.close();
                    } catch (IOException e) {
                    }
                }
                if (0 != 0) {
                    try {
                        gZIPOutputStream.close();
                    } catch (IOException e2) {
                    }
                }
            } catch (Throwable th) {
                if (bufferedInputStream != null) {
                    try {
                        bufferedInputStream.close();
                    } catch (IOException e3) {
                    }
                }
                if (gZIPOutputStream != null) {
                    try {
                        gZIPOutputStream.close();
                    } catch (IOException e4) {
                    }
                }
                throw th;
            }
        } catch (Exception e5) {
            addStatus(new ErrorStatus("Error occurred while compressing [" + str + "] into [" + str2 + "].", this, e5));
            if (bufferedInputStream != null) {
                try {
                    bufferedInputStream.close();
                } catch (IOException e6) {
                }
            }
            if (gZIPOutputStream != null) {
                try {
                    gZIPOutputStream.close();
                } catch (IOException e7) {
                }
            }
        }
    }

    public static String computeFileNameStr_WCS(String str, CompressionMode compressionMode) {
        int length = str.length();
        switch (AnonymousClass1.$SwitchMap$ch$qos$logback$core$rolling$helper$CompressionMode[compressionMode.ordinal()]) {
            case 1:
                return str.endsWith(".gz") ? str.substring(0, length - 3) : str;
            case 2:
                return str.endsWith(".zip") ? str.substring(0, length - 4) : str;
            case SyslogConstants.ERROR_SEVERITY /* 3 */:
                return str;
            default:
                throw new IllegalStateException("Execution should not reach this point");
        }
    }

    void createMissingTargetDirsIfNecessary(File file) {
        if (FileUtil.isParentDirectoryCreationRequired(file)) {
            if (FileUtil.createMissingParentDirectories(file)) {
                addInfo("Created missing parent directories for [" + file.getAbsolutePath() + "]");
            } else {
                addError("Failed to create parent directories for [" + file.getAbsolutePath() + "]");
            }
        }
    }

    public String toString() {
        return getClass().getName();
    }
}
