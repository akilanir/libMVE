package org.apache.commons.io;

import java.io.File;
import java.io.FileFilter;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.zip.CRC32;
import java.util.zip.CheckedInputStream;
import java.util.zip.Checksum;
import org.apache.commons.io.filefilter.DirectoryFileFilter;
import org.apache.commons.io.filefilter.FalseFileFilter;
import org.apache.commons.io.filefilter.FileFilterUtils;
import org.apache.commons.io.filefilter.IOFileFilter;
import org.apache.commons.io.filefilter.SuffixFileFilter;
import org.apache.commons.io.filefilter.TrueFileFilter;
import org.apache.commons.io.output.NullOutputStream;

/* loaded from: commons-io-1.3.2.jar:org/apache/commons/io/FileUtils.class */
public class FileUtils {
    public static final long ONE_KB = 1024;
    public static final long ONE_MB = 1048576;
    public static final long ONE_GB = 1073741824;
    public static final File[] EMPTY_FILE_ARRAY = new File[0];

    public static FileInputStream openInputStream(File file) throws IOException {
        if (file.exists()) {
            if (file.isDirectory()) {
                throw new IOException(new StringBuffer().append("File '").append(file).append("' exists but is a directory").toString());
            }
            if (!file.canRead()) {
                throw new IOException(new StringBuffer().append("File '").append(file).append("' cannot be read").toString());
            }
            return new FileInputStream(file);
        }
        throw new FileNotFoundException(new StringBuffer().append("File '").append(file).append("' does not exist").toString());
    }

    public static FileOutputStream openOutputStream(File file) throws IOException {
        if (file.exists()) {
            if (file.isDirectory()) {
                throw new IOException(new StringBuffer().append("File '").append(file).append("' exists but is a directory").toString());
            }
            if (!file.canWrite()) {
                throw new IOException(new StringBuffer().append("File '").append(file).append("' cannot be written to").toString());
            }
        } else {
            File parent = file.getParentFile();
            if (parent != null && !parent.exists() && !parent.mkdirs()) {
                throw new IOException(new StringBuffer().append("File '").append(file).append("' could not be created").toString());
            }
        }
        return new FileOutputStream(file);
    }

    public static String byteCountToDisplaySize(long size) {
        String displaySize;
        if (size / ONE_GB > 0) {
            displaySize = new StringBuffer().append(String.valueOf(size / ONE_GB)).append(" GB").toString();
        } else if (size / ONE_MB > 0) {
            displaySize = new StringBuffer().append(String.valueOf(size / ONE_MB)).append(" MB").toString();
        } else if (size / ONE_KB > 0) {
            displaySize = new StringBuffer().append(String.valueOf(size / ONE_KB)).append(" KB").toString();
        } else {
            displaySize = new StringBuffer().append(String.valueOf(size)).append(" bytes").toString();
        }
        return displaySize;
    }

    public static void touch(File file) throws IOException {
        if (!file.exists()) {
            OutputStream out = openOutputStream(file);
            IOUtils.closeQuietly(out);
        }
        boolean success = file.setLastModified(System.currentTimeMillis());
        if (!success) {
            throw new IOException(new StringBuffer().append("Unable to set the last modification time for ").append(file).toString());
        }
    }

    public static File[] convertFileCollectionToFileArray(Collection files) {
        return (File[]) files.toArray(new File[files.size()]);
    }

    private static void innerListFiles(Collection files, File directory, IOFileFilter filter) {
        File[] found = directory.listFiles((FileFilter) filter);
        if (found != null) {
            for (int i = 0; i < found.length; i++) {
                if (found[i].isDirectory()) {
                    innerListFiles(files, found[i], filter);
                } else {
                    files.add(found[i]);
                }
            }
        }
    }

    public static Collection listFiles(File directory, IOFileFilter fileFilter, IOFileFilter dirFilter) {
        IOFileFilter effDirFilter;
        if (!directory.isDirectory()) {
            throw new IllegalArgumentException("Parameter 'directory' is not a directory");
        }
        if (fileFilter == null) {
            throw new NullPointerException("Parameter 'fileFilter' is null");
        }
        IOFileFilter effFileFilter = FileFilterUtils.andFileFilter(fileFilter, FileFilterUtils.notFileFilter(DirectoryFileFilter.INSTANCE));
        if (dirFilter == null) {
            effDirFilter = FalseFileFilter.INSTANCE;
        } else {
            effDirFilter = FileFilterUtils.andFileFilter(dirFilter, DirectoryFileFilter.INSTANCE);
        }
        Collection files = new LinkedList();
        innerListFiles(files, directory, FileFilterUtils.orFileFilter(effFileFilter, effDirFilter));
        return files;
    }

    public static Iterator iterateFiles(File directory, IOFileFilter fileFilter, IOFileFilter dirFilter) {
        return listFiles(directory, fileFilter, dirFilter).iterator();
    }

    private static String[] toSuffixes(String[] extensions) {
        String[] suffixes = new String[extensions.length];
        for (int i = 0; i < extensions.length; i++) {
            suffixes[i] = new StringBuffer().append(".").append(extensions[i]).toString();
        }
        return suffixes;
    }

    public static Collection listFiles(File directory, String[] extensions, boolean recursive) {
        IOFileFilter filter;
        if (extensions == null) {
            filter = TrueFileFilter.INSTANCE;
        } else {
            String[] suffixes = toSuffixes(extensions);
            filter = new SuffixFileFilter(suffixes);
        }
        return listFiles(directory, filter, recursive ? TrueFileFilter.INSTANCE : FalseFileFilter.INSTANCE);
    }

    public static Iterator iterateFiles(File directory, String[] extensions, boolean recursive) {
        return listFiles(directory, extensions, recursive).iterator();
    }

    public static boolean contentEquals(File file1, File file2) throws IOException {
        boolean file1Exists = file1.exists();
        if (file1Exists != file2.exists()) {
            return false;
        }
        if (!file1Exists) {
            return true;
        }
        if (file1.isDirectory() || file2.isDirectory()) {
            throw new IOException("Can't compare directories, only files");
        }
        if (file1.length() != file2.length()) {
            return false;
        }
        if (file1.getCanonicalFile().equals(file2.getCanonicalFile())) {
            return true;
        }
        InputStream input1 = null;
        InputStream input2 = null;
        try {
            input1 = new FileInputStream(file1);
            input2 = new FileInputStream(file2);
            boolean contentEquals = IOUtils.contentEquals(input1, input2);
            IOUtils.closeQuietly(input1);
            IOUtils.closeQuietly(input2);
            return contentEquals;
        } catch (Throwable th) {
            IOUtils.closeQuietly(input1);
            IOUtils.closeQuietly(input2);
            throw th;
        }
    }

    public static File toFile(URL url) {
        if (url == null || !url.getProtocol().equals("file")) {
            return null;
        }
        String filename = url.getFile().replace('/', File.separatorChar);
        int pos = 0;
        while (true) {
            int indexOf = filename.indexOf(37, pos);
            pos = indexOf;
            if (indexOf >= 0) {
                if (pos + 2 < filename.length()) {
                    String hexStr = filename.substring(pos + 1, pos + 3);
                    char ch = (char) Integer.parseInt(hexStr, 16);
                    filename = new StringBuffer().append(filename.substring(0, pos)).append(ch).append(filename.substring(pos + 3)).toString();
                }
            } else {
                return new File(filename);
            }
        }
    }

    public static File[] toFiles(URL[] urls) {
        if (urls == null || urls.length == 0) {
            return EMPTY_FILE_ARRAY;
        }
        File[] files = new File[urls.length];
        for (int i = 0; i < urls.length; i++) {
            URL url = urls[i];
            if (url != null) {
                if (!url.getProtocol().equals("file")) {
                    throw new IllegalArgumentException(new StringBuffer().append("URL could not be converted to a File: ").append(url).toString());
                }
                files[i] = toFile(url);
            }
        }
        return files;
    }

    public static URL[] toURLs(File[] files) throws IOException {
        URL[] urls = new URL[files.length];
        for (int i = 0; i < urls.length; i++) {
            urls[i] = files[i].toURL();
        }
        return urls;
    }

    public static void copyFileToDirectory(File srcFile, File destDir) throws IOException {
        copyFileToDirectory(srcFile, destDir, true);
    }

    public static void copyFileToDirectory(File srcFile, File destDir, boolean preserveFileDate) throws IOException {
        if (destDir == null) {
            throw new NullPointerException("Destination must not be null");
        }
        if (destDir.exists() && !destDir.isDirectory()) {
            throw new IllegalArgumentException(new StringBuffer().append("Destination '").append(destDir).append("' is not a directory").toString());
        }
        copyFile(srcFile, new File(destDir, srcFile.getName()), preserveFileDate);
    }

    public static void copyFile(File srcFile, File destFile) throws IOException {
        copyFile(srcFile, destFile, true);
    }

    public static void copyFile(File srcFile, File destFile, boolean preserveFileDate) throws IOException {
        if (srcFile == null) {
            throw new NullPointerException("Source must not be null");
        }
        if (destFile == null) {
            throw new NullPointerException("Destination must not be null");
        }
        if (!srcFile.exists()) {
            throw new FileNotFoundException(new StringBuffer().append("Source '").append(srcFile).append("' does not exist").toString());
        }
        if (srcFile.isDirectory()) {
            throw new IOException(new StringBuffer().append("Source '").append(srcFile).append("' exists but is a directory").toString());
        }
        if (srcFile.getCanonicalPath().equals(destFile.getCanonicalPath())) {
            throw new IOException(new StringBuffer().append("Source '").append(srcFile).append("' and destination '").append(destFile).append("' are the same").toString());
        }
        if (destFile.getParentFile() != null && !destFile.getParentFile().exists() && !destFile.getParentFile().mkdirs()) {
            throw new IOException(new StringBuffer().append("Destination '").append(destFile).append("' directory cannot be created").toString());
        }
        if (destFile.exists() && !destFile.canWrite()) {
            throw new IOException(new StringBuffer().append("Destination '").append(destFile).append("' exists but is read-only").toString());
        }
        doCopyFile(srcFile, destFile, preserveFileDate);
    }

    private static void doCopyFile(File srcFile, File destFile, boolean preserveFileDate) throws IOException {
        if (destFile.exists() && destFile.isDirectory()) {
            throw new IOException(new StringBuffer().append("Destination '").append(destFile).append("' exists but is a directory").toString());
        }
        FileInputStream input = new FileInputStream(srcFile);
        try {
            FileOutputStream output = new FileOutputStream(destFile);
            try {
                IOUtils.copy(input, output);
                IOUtils.closeQuietly(output);
                if (srcFile.length() != destFile.length()) {
                    throw new IOException(new StringBuffer().append("Failed to copy full contents from '").append(srcFile).append("' to '").append(destFile).append("'").toString());
                }
                if (preserveFileDate) {
                    destFile.setLastModified(srcFile.lastModified());
                }
            } catch (Throwable th) {
                IOUtils.closeQuietly(output);
                throw th;
            }
        } finally {
            IOUtils.closeQuietly(input);
        }
    }

    public static void copyDirectoryToDirectory(File srcDir, File destDir) throws IOException {
        if (srcDir == null) {
            throw new NullPointerException("Source must not be null");
        }
        if (srcDir.exists() && !srcDir.isDirectory()) {
            throw new IllegalArgumentException(new StringBuffer().append("Source '").append(destDir).append("' is not a directory").toString());
        }
        if (destDir == null) {
            throw new NullPointerException("Destination must not be null");
        }
        if (destDir.exists() && !destDir.isDirectory()) {
            throw new IllegalArgumentException(new StringBuffer().append("Destination '").append(destDir).append("' is not a directory").toString());
        }
        copyDirectory(srcDir, new File(destDir, srcDir.getName()), true);
    }

    public static void copyDirectory(File srcDir, File destDir) throws IOException {
        copyDirectory(srcDir, destDir, true);
    }

    public static void copyDirectory(File srcDir, File destDir, boolean preserveFileDate) throws IOException {
        if (srcDir == null) {
            throw new NullPointerException("Source must not be null");
        }
        if (destDir == null) {
            throw new NullPointerException("Destination must not be null");
        }
        if (!srcDir.exists()) {
            throw new FileNotFoundException(new StringBuffer().append("Source '").append(srcDir).append("' does not exist").toString());
        }
        if (!srcDir.isDirectory()) {
            throw new IOException(new StringBuffer().append("Source '").append(srcDir).append("' exists but is not a directory").toString());
        }
        if (srcDir.getCanonicalPath().equals(destDir.getCanonicalPath())) {
            throw new IOException(new StringBuffer().append("Source '").append(srcDir).append("' and destination '").append(destDir).append("' are the same").toString());
        }
        doCopyDirectory(srcDir, destDir, preserveFileDate);
    }

    private static void doCopyDirectory(File srcDir, File destDir, boolean preserveFileDate) throws IOException {
        if (destDir.exists()) {
            if (!destDir.isDirectory()) {
                throw new IOException(new StringBuffer().append("Destination '").append(destDir).append("' exists but is not a directory").toString());
            }
        } else {
            if (!destDir.mkdirs()) {
                throw new IOException(new StringBuffer().append("Destination '").append(destDir).append("' directory cannot be created").toString());
            }
            if (preserveFileDate) {
                destDir.setLastModified(srcDir.lastModified());
            }
        }
        if (!destDir.canWrite()) {
            throw new IOException(new StringBuffer().append("Destination '").append(destDir).append("' cannot be written to").toString());
        }
        File[] files = srcDir.listFiles();
        if (files == null) {
            throw new IOException(new StringBuffer().append("Failed to list contents of ").append(srcDir).toString());
        }
        for (int i = 0; i < files.length; i++) {
            File copiedFile = new File(destDir, files[i].getName());
            if (files[i].isDirectory()) {
                doCopyDirectory(files[i], copiedFile, preserveFileDate);
            } else {
                doCopyFile(files[i], copiedFile, preserveFileDate);
            }
        }
    }

    public static void copyURLToFile(URL source, File destination) throws IOException {
        InputStream input = source.openStream();
        try {
            FileOutputStream output = openOutputStream(destination);
            try {
                IOUtils.copy(input, output);
                IOUtils.closeQuietly(output);
            } catch (Throwable th) {
                IOUtils.closeQuietly(output);
                throw th;
            }
        } finally {
            IOUtils.closeQuietly(input);
        }
    }

    public static void deleteDirectory(File directory) throws IOException {
        if (!directory.exists()) {
            return;
        }
        cleanDirectory(directory);
        if (!directory.delete()) {
            String message = new StringBuffer().append("Unable to delete directory ").append(directory).append(".").toString();
            throw new IOException(message);
        }
    }

    public static void cleanDirectory(File directory) throws IOException {
        if (!directory.exists()) {
            String message = new StringBuffer().append(directory).append(" does not exist").toString();
            throw new IllegalArgumentException(message);
        }
        if (!directory.isDirectory()) {
            String message2 = new StringBuffer().append(directory).append(" is not a directory").toString();
            throw new IllegalArgumentException(message2);
        }
        File[] files = directory.listFiles();
        if (files == null) {
            throw new IOException(new StringBuffer().append("Failed to list contents of ").append(directory).toString());
        }
        IOException exception = null;
        for (File file : files) {
            try {
                forceDelete(file);
            } catch (IOException ioe) {
                exception = ioe;
            }
        }
        if (null != exception) {
            throw exception;
        }
    }

    public static boolean waitFor(File file, int seconds) {
        int timeout = 0;
        int tick = 0;
        while (!file.exists()) {
            int i = tick;
            tick++;
            if (i >= 10) {
                tick = 0;
                int i2 = timeout;
                timeout++;
                if (i2 > seconds) {
                    return false;
                }
            }
            try {
                Thread.sleep(100L);
            } catch (InterruptedException e) {
            } catch (Exception e2) {
                return true;
            }
        }
        return true;
    }

    public static String readFileToString(File file, String encoding) throws IOException {
        InputStream in = null;
        try {
            in = openInputStream(file);
            String iOUtils = IOUtils.toString(in, encoding);
            IOUtils.closeQuietly(in);
            return iOUtils;
        } catch (Throwable th) {
            IOUtils.closeQuietly(in);
            throw th;
        }
    }

    public static String readFileToString(File file) throws IOException {
        return readFileToString(file, null);
    }

    public static byte[] readFileToByteArray(File file) throws IOException {
        InputStream in = null;
        try {
            in = openInputStream(file);
            byte[] byteArray = IOUtils.toByteArray(in);
            IOUtils.closeQuietly(in);
            return byteArray;
        } catch (Throwable th) {
            IOUtils.closeQuietly(in);
            throw th;
        }
    }

    public static List readLines(File file, String encoding) throws IOException {
        InputStream in = null;
        try {
            in = openInputStream(file);
            List readLines = IOUtils.readLines(in, encoding);
            IOUtils.closeQuietly(in);
            return readLines;
        } catch (Throwable th) {
            IOUtils.closeQuietly(in);
            throw th;
        }
    }

    public static List readLines(File file) throws IOException {
        return readLines(file, null);
    }

    public static LineIterator lineIterator(File file, String encoding) throws IOException {
        InputStream in = null;
        try {
            in = openInputStream(file);
            return IOUtils.lineIterator(in, encoding);
        } catch (IOException ex) {
            IOUtils.closeQuietly(in);
            throw ex;
        } catch (RuntimeException ex2) {
            IOUtils.closeQuietly(in);
            throw ex2;
        }
    }

    public static LineIterator lineIterator(File file) throws IOException {
        return lineIterator(file, null);
    }

    public static void writeStringToFile(File file, String data, String encoding) throws IOException {
        OutputStream out = null;
        try {
            out = openOutputStream(file);
            IOUtils.write(data, out, encoding);
            IOUtils.closeQuietly(out);
        } catch (Throwable th) {
            IOUtils.closeQuietly(out);
            throw th;
        }
    }

    public static void writeStringToFile(File file, String data) throws IOException {
        writeStringToFile(file, data, null);
    }

    public static void writeByteArrayToFile(File file, byte[] data) throws IOException {
        OutputStream out = null;
        try {
            out = openOutputStream(file);
            out.write(data);
            IOUtils.closeQuietly(out);
        } catch (Throwable th) {
            IOUtils.closeQuietly(out);
            throw th;
        }
    }

    public static void writeLines(File file, String encoding, Collection lines) throws IOException {
        writeLines(file, encoding, lines, null);
    }

    public static void writeLines(File file, Collection lines) throws IOException {
        writeLines(file, null, lines, null);
    }

    public static void writeLines(File file, String encoding, Collection lines, String lineEnding) throws IOException {
        OutputStream out = null;
        try {
            out = openOutputStream(file);
            IOUtils.writeLines(lines, lineEnding, out, encoding);
            IOUtils.closeQuietly(out);
        } catch (Throwable th) {
            IOUtils.closeQuietly(out);
            throw th;
        }
    }

    public static void writeLines(File file, Collection lines, String lineEnding) throws IOException {
        writeLines(file, null, lines, lineEnding);
    }

    public static void forceDelete(File file) throws IOException {
        if (file.isDirectory()) {
            deleteDirectory(file);
        } else {
            if (!file.exists()) {
                throw new FileNotFoundException(new StringBuffer().append("File does not exist: ").append(file).toString());
            }
            if (!file.delete()) {
                String message = new StringBuffer().append("Unable to delete file: ").append(file).toString();
                throw new IOException(message);
            }
        }
    }

    public static void forceDeleteOnExit(File file) throws IOException {
        if (file.isDirectory()) {
            deleteDirectoryOnExit(file);
        } else {
            file.deleteOnExit();
        }
    }

    private static void deleteDirectoryOnExit(File directory) throws IOException {
        if (!directory.exists()) {
            return;
        }
        cleanDirectoryOnExit(directory);
        directory.deleteOnExit();
    }

    private static void cleanDirectoryOnExit(File directory) throws IOException {
        if (!directory.exists()) {
            String message = new StringBuffer().append(directory).append(" does not exist").toString();
            throw new IllegalArgumentException(message);
        }
        if (!directory.isDirectory()) {
            String message2 = new StringBuffer().append(directory).append(" is not a directory").toString();
            throw new IllegalArgumentException(message2);
        }
        File[] files = directory.listFiles();
        if (files == null) {
            throw new IOException(new StringBuffer().append("Failed to list contents of ").append(directory).toString());
        }
        IOException exception = null;
        for (File file : files) {
            try {
                forceDeleteOnExit(file);
            } catch (IOException ioe) {
                exception = ioe;
            }
        }
        if (null != exception) {
            throw exception;
        }
    }

    public static void forceMkdir(File directory) throws IOException {
        if (directory.exists()) {
            if (directory.isFile()) {
                String message = new StringBuffer().append("File ").append(directory).append(" exists and is ").append("not a directory. Unable to create directory.").toString();
                throw new IOException(message);
            }
        } else if (!directory.mkdirs()) {
            String message2 = new StringBuffer().append("Unable to create directory ").append(directory).toString();
            throw new IOException(message2);
        }
    }

    public static long sizeOfDirectory(File directory) {
        long j;
        long length;
        if (!directory.exists()) {
            String message = new StringBuffer().append(directory).append(" does not exist").toString();
            throw new IllegalArgumentException(message);
        }
        if (!directory.isDirectory()) {
            String message2 = new StringBuffer().append(directory).append(" is not a directory").toString();
            throw new IllegalArgumentException(message2);
        }
        long size = 0;
        File[] files = directory.listFiles();
        if (files == null) {
            return 0L;
        }
        for (File file : files) {
            if (file.isDirectory()) {
                j = size;
                length = sizeOfDirectory(file);
            } else {
                j = size;
                length = file.length();
            }
            size = j + length;
        }
        return size;
    }

    public static boolean isFileNewer(File file, File reference) {
        if (reference == null) {
            throw new IllegalArgumentException("No specified reference file");
        }
        if (!reference.exists()) {
            throw new IllegalArgumentException(new StringBuffer().append("The reference file '").append(file).append("' doesn't exist").toString());
        }
        return isFileNewer(file, reference.lastModified());
    }

    public static boolean isFileNewer(File file, Date date) {
        if (date == null) {
            throw new IllegalArgumentException("No specified date");
        }
        return isFileNewer(file, date.getTime());
    }

    public static boolean isFileNewer(File file, long timeMillis) {
        if (file == null) {
            throw new IllegalArgumentException("No specified file");
        }
        return file.exists() && file.lastModified() > timeMillis;
    }

    public static boolean isFileOlder(File file, File reference) {
        if (reference == null) {
            throw new IllegalArgumentException("No specified reference file");
        }
        if (!reference.exists()) {
            throw new IllegalArgumentException(new StringBuffer().append("The reference file '").append(file).append("' doesn't exist").toString());
        }
        return isFileOlder(file, reference.lastModified());
    }

    public static boolean isFileOlder(File file, Date date) {
        if (date == null) {
            throw new IllegalArgumentException("No specified date");
        }
        return isFileOlder(file, date.getTime());
    }

    public static boolean isFileOlder(File file, long timeMillis) {
        if (file == null) {
            throw new IllegalArgumentException("No specified file");
        }
        return file.exists() && file.lastModified() < timeMillis;
    }

    public static long checksumCRC32(File file) throws IOException {
        CRC32 crc = new CRC32();
        checksum(file, crc);
        return crc.getValue();
    }

    public static Checksum checksum(File file, Checksum checksum) throws IOException {
        if (file.isDirectory()) {
            throw new IllegalArgumentException("Checksums can't be computed on directories");
        }
        InputStream in = null;
        try {
            in = new CheckedInputStream(new FileInputStream(file), checksum);
            IOUtils.copy(in, new NullOutputStream());
            IOUtils.closeQuietly(in);
            return checksum;
        } catch (Throwable th) {
            IOUtils.closeQuietly(in);
            throw th;
        }
    }
}
