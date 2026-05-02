package org.apache.commons.io;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.Reader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.StringTokenizer;

/* loaded from: commons-io-2.4.jar:org/apache/commons/io/FileSystemUtils.class */
public class FileSystemUtils {
    private static final FileSystemUtils INSTANCE = new FileSystemUtils();
    private static final int INIT_PROBLEM = -1;
    private static final int OTHER = 0;
    private static final int WINDOWS = 1;
    private static final int UNIX = 2;
    private static final int POSIX_UNIX = 3;
    private static final int OS;
    private static final String DF;

    static {
        int os;
        String osName;
        String dfPath = "df";
        try {
            osName = System.getProperty("os.name");
        } catch (Exception e) {
            os = INIT_PROBLEM;
        }
        if (osName == null) {
            throw new IOException("os.name not found");
        }
        String osName2 = osName.toLowerCase(Locale.ENGLISH);
        if (osName2.indexOf("windows") != INIT_PROBLEM) {
            os = WINDOWS;
        } else if (osName2.indexOf("linux") != INIT_PROBLEM || osName2.indexOf("mpe/ix") != INIT_PROBLEM || osName2.indexOf("freebsd") != INIT_PROBLEM || osName2.indexOf("irix") != INIT_PROBLEM || osName2.indexOf("digital unix") != INIT_PROBLEM || osName2.indexOf("unix") != INIT_PROBLEM || osName2.indexOf("mac os x") != INIT_PROBLEM) {
            os = UNIX;
        } else if (osName2.indexOf("sun os") != INIT_PROBLEM || osName2.indexOf("sunos") != INIT_PROBLEM || osName2.indexOf("solaris") != INIT_PROBLEM) {
            os = POSIX_UNIX;
            dfPath = "/usr/xpg4/bin/df";
        } else if (osName2.indexOf("hp-ux") != INIT_PROBLEM || osName2.indexOf("aix") != INIT_PROBLEM) {
            os = POSIX_UNIX;
        } else {
            os = OTHER;
        }
        OS = os;
        DF = dfPath;
    }

    @Deprecated
    public static long freeSpace(String path) throws IOException {
        return INSTANCE.freeSpaceOS(path, OS, false, -1L);
    }

    public static long freeSpaceKb(String path) throws IOException {
        return freeSpaceKb(path, -1L);
    }

    public static long freeSpaceKb(String path, long timeout) throws IOException {
        return INSTANCE.freeSpaceOS(path, OS, true, timeout);
    }

    public static long freeSpaceKb() throws IOException {
        return freeSpaceKb(-1L);
    }

    public static long freeSpaceKb(long timeout) throws IOException {
        return freeSpaceKb(new File(".").getAbsolutePath(), timeout);
    }

    long freeSpaceOS(String path, int os, boolean kb, long timeout) throws IOException {
        if (path == null) {
            throw new IllegalArgumentException("Path must not be empty");
        }
        switch (os) {
            case OTHER /* 0 */:
                throw new IllegalStateException("Unsupported operating system");
            case WINDOWS /* 1 */:
                return kb ? freeSpaceWindows(path, timeout) / FileUtils.ONE_KB : freeSpaceWindows(path, timeout);
            case UNIX /* 2 */:
                return freeSpaceUnix(path, kb, false, timeout);
            case POSIX_UNIX /* 3 */:
                return freeSpaceUnix(path, kb, true, timeout);
            default:
                throw new IllegalStateException("Exception caught when determining operating system");
        }
    }

    long freeSpaceWindows(String path, long timeout) throws IOException {
        String path2 = FilenameUtils.normalize(path, false);
        if (path2.length() > 0 && path2.charAt(OTHER) != '\"') {
            path2 = "\"" + path2 + "\"";
        }
        String[] cmdAttribs = {"cmd.exe", "/C", "dir /a /-c " + path2};
        List<String> lines = performCommand(cmdAttribs, Integer.MAX_VALUE, timeout);
        for (int i = lines.size() - WINDOWS; i >= 0; i += INIT_PROBLEM) {
            String line = lines.get(i);
            if (line.length() > 0) {
                return parseDir(line, path2);
            }
        }
        throw new IOException("Command line 'dir /-c' did not return any info for path '" + path2 + "'");
    }

    long parseDir(String line, String path) throws IOException {
        int bytesStart = OTHER;
        int bytesEnd = OTHER;
        int j = line.length() - WINDOWS;
        while (true) {
            if (j < 0) {
                break;
            }
            if (Character.isDigit(line.charAt(j))) {
                bytesEnd = j + WINDOWS;
                break;
            }
            j += INIT_PROBLEM;
        }
        while (true) {
            if (j < 0) {
                break;
            }
            char c = line.charAt(j);
            if (!Character.isDigit(c) && c != ',' && c != '.') {
                bytesStart = j + WINDOWS;
                break;
            }
            j += INIT_PROBLEM;
        }
        if (j < 0) {
            throw new IOException("Command line 'dir /-c' did not return valid info for path '" + path + "'");
        }
        StringBuilder buf = new StringBuilder(line.substring(bytesStart, bytesEnd));
        int k = OTHER;
        while (k < buf.length()) {
            if (buf.charAt(k) == ',' || buf.charAt(k) == '.') {
                int i = k;
                k += INIT_PROBLEM;
                buf.deleteCharAt(i);
            }
            k += WINDOWS;
        }
        return parseBytes(buf.toString(), path);
    }

    long freeSpaceUnix(String path, boolean kb, boolean posix, long timeout) throws IOException {
        if (path.length() == 0) {
            throw new IllegalArgumentException("Path must not be empty");
        }
        String flags = "-";
        if (kb) {
            flags = flags + "k";
        }
        if (posix) {
            flags = flags + "P";
        }
        String[] cmdAttribs = flags.length() > WINDOWS ? new String[]{DF, flags, path} : new String[]{DF, path};
        List<String> lines = performCommand(cmdAttribs, POSIX_UNIX, timeout);
        if (lines.size() < UNIX) {
            throw new IOException("Command line '" + DF + "' did not return info as expected for path '" + path + "'- response was " + lines);
        }
        String line2 = lines.get(WINDOWS);
        StringTokenizer tok = new StringTokenizer(line2, " ");
        if (tok.countTokens() < 4) {
            if (tok.countTokens() == WINDOWS && lines.size() >= POSIX_UNIX) {
                String line3 = lines.get(UNIX);
                tok = new StringTokenizer(line3, " ");
            } else {
                throw new IOException("Command line '" + DF + "' did not return data as expected for path '" + path + "'- check path is valid");
            }
        } else {
            tok.nextToken();
        }
        tok.nextToken();
        tok.nextToken();
        String freeSpace = tok.nextToken();
        return parseBytes(freeSpace, path);
    }

    long parseBytes(String freeSpace, String path) throws IOException {
        try {
            long bytes = Long.parseLong(freeSpace);
            if (bytes < 0) {
                throw new IOException("Command line '" + DF + "' did not find free space in response for path '" + path + "'- check path is valid");
            }
            return bytes;
        } catch (NumberFormatException ex) {
            throw new IOExceptionWithCause("Command line '" + DF + "' did not return numeric data as expected for path '" + path + "'- check path is valid", ex);
        }
    }

    List<String> performCommand(String[] cmdAttribs, int max, long timeout) throws IOException {
        List<String> lines = new ArrayList<>(20);
        Process proc = null;
        InputStream in = null;
        OutputStream out = null;
        InputStream err = null;
        BufferedReader inr = null;
        try {
            try {
                Thread monitor = ThreadMonitor.start(timeout);
                proc = openProcess(cmdAttribs);
                in = proc.getInputStream();
                out = proc.getOutputStream();
                err = proc.getErrorStream();
                inr = new BufferedReader(new InputStreamReader(in));
                for (String line = inr.readLine(); line != null && lines.size() < max; line = inr.readLine()) {
                    lines.add(line.toLowerCase(Locale.ENGLISH).trim());
                }
                proc.waitFor();
                ThreadMonitor.stop(monitor);
                if (proc.exitValue() != 0) {
                    throw new IOException("Command line returned OS error code '" + proc.exitValue() + "' for command " + Arrays.asList(cmdAttribs));
                }
                if (lines.isEmpty()) {
                    throw new IOException("Command line did not return any info for command " + Arrays.asList(cmdAttribs));
                }
                return lines;
            } catch (InterruptedException ex) {
                throw new IOExceptionWithCause("Command line threw an InterruptedException for command " + Arrays.asList(cmdAttribs) + " timeout=" + timeout, ex);
            }
        } finally {
            IOUtils.closeQuietly(in);
            IOUtils.closeQuietly(out);
            IOUtils.closeQuietly(err);
            IOUtils.closeQuietly((Reader) inr);
            if (proc != null) {
                proc.destroy();
            }
        }
    }

    Process openProcess(String[] cmdAttribs) throws IOException {
        return Runtime.getRuntime().exec(cmdAttribs);
    }
}
