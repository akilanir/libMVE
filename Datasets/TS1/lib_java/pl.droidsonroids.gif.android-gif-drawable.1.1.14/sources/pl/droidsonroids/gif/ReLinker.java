package pl.droidsonroids.gif;

import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.os.Build;
import java.io.Closeable;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

@TargetApi(9)
/* loaded from: pl.droidsonroids.gif.android-gif-drawable.1.1.14.jar:pl/droidsonroids/gif/ReLinker.class */
class ReLinker {
    private static final String LIB_DIR = "lib";
    private static final int MAX_TRIES = 5;
    private static final int COPY_BUFFER_SIZE = 8192;

    private ReLinker() {
    }

    @SuppressLint({"UnsafeDynamicallyLoadedCode"})
    static void loadLibrary(Context context, String library) {
        String libName = System.mapLibraryName(library);
        synchronized (ReLinker.class) {
            File workaroundFile = unpackLibrary(context, libName);
            System.load(workaroundFile.getAbsolutePath());
        }
    }

    private static File unpackLibrary(Context context, final String libName) {
        File outputFile = new File(context.getDir(LIB_DIR, 0), libName + BuildConfig.VERSION_NAME);
        if (outputFile.isFile()) {
            return outputFile;
        }
        File cachedLibraryFile = new File(context.getCacheDir(), libName + BuildConfig.VERSION_NAME);
        if (cachedLibraryFile.isFile()) {
            return cachedLibraryFile;
        }
        FilenameFilter filter = new FilenameFilter() { // from class: pl.droidsonroids.gif.ReLinker.1
            @Override // java.io.FilenameFilter
            public boolean accept(File dir, String filename) {
                return filename.startsWith(libName);
            }
        };
        clearOldLibraryFiles(outputFile, filter);
        clearOldLibraryFiles(cachedLibraryFile, filter);
        ApplicationInfo appInfo = context.getApplicationInfo();
        File apkFile = new File(appInfo.sourceDir);
        ZipFile zipFile = null;
        try {
            zipFile = openZipFile(apkFile);
            int tries = 0;
            while (true) {
                int i = tries;
                tries++;
                if (i >= MAX_TRIES) {
                    break;
                }
                ZipEntry libraryEntry = findLibraryEntry(libName, zipFile);
                if (libraryEntry == null) {
                    throw new IllegalStateException("Library " + libName + " for supported ABIs not found in APK file");
                }
                InputStream inputStream = null;
                FileOutputStream fileOut = null;
                try {
                    inputStream = zipFile.getInputStream(libraryEntry);
                    fileOut = new FileOutputStream(outputFile);
                    copy(inputStream, fileOut);
                    closeSilently(inputStream);
                    closeSilently(fileOut);
                    setFilePermissions(outputFile);
                    break;
                } catch (IOException e) {
                    if (tries > 2) {
                        outputFile = cachedLibraryFile;
                    }
                    closeSilently(inputStream);
                    closeSilently(fileOut);
                } catch (Throwable th) {
                    closeSilently(inputStream);
                    closeSilently(fileOut);
                    throw th;
                }
            }
            if (zipFile != null) {
                try {
                    zipFile.close();
                } catch (IOException e2) {
                }
            }
            return outputFile;
        } catch (Throwable th2) {
            if (zipFile != null) {
                try {
                    zipFile.close();
                } catch (IOException e3) {
                    throw th2;
                }
            }
            throw th2;
        }
    }

    @TargetApi(21)
    private static ZipEntry findLibraryEntry(String libName, ZipFile zipFile) {
        if (Build.VERSION.SDK_INT >= 21) {
            for (String abi : Build.SUPPORTED_ABIS) {
                ZipEntry libraryEntry = getEntry(libName, zipFile, abi);
                if (libraryEntry != null) {
                    return libraryEntry;
                }
            }
        }
        return getEntry(libName, zipFile, Build.CPU_ABI);
    }

    private static ZipEntry getEntry(String libName, ZipFile zipFile, String abi) {
        return zipFile.getEntry("lib/" + abi + "/" + libName);
    }

    private static ZipFile openZipFile(File apkFile) {
        int tries = 0;
        ZipFile zipFile = null;
        while (true) {
            int i = tries;
            tries++;
            if (i >= MAX_TRIES) {
                break;
            }
            try {
                zipFile = new ZipFile(apkFile, 1);
                break;
            } catch (IOException e) {
            }
        }
        if (zipFile == null) {
            throw new RuntimeException("Could not open APK file: " + apkFile.getAbsolutePath());
        }
        return zipFile;
    }

    private static void clearOldLibraryFiles(File outputFile, FilenameFilter filter) {
        File[] fileList = outputFile.getParentFile().listFiles(filter);
        if (fileList != null) {
            for (File file : fileList) {
                file.delete();
            }
        }
    }

    @SuppressLint({"SetWorldReadable"})
    private static void setFilePermissions(File outputFile) {
        outputFile.setReadable(true, false);
        outputFile.setExecutable(true, false);
        outputFile.setWritable(true);
    }

    private static void copy(InputStream in, OutputStream out) throws IOException {
        byte[] buf = new byte[COPY_BUFFER_SIZE];
        while (true) {
            int bytesRead = in.read(buf);
            if (bytesRead != -1) {
                out.write(buf, 0, bytesRead);
            } else {
                return;
            }
        }
    }

    private static void closeSilently(Closeable closeable) {
        if (closeable != null) {
            try {
                closeable.close();
            } catch (IOException e) {
            }
        }
    }
}
