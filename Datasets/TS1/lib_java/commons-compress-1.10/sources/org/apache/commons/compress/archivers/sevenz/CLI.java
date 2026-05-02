package org.apache.commons.compress.archivers.sevenz;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import org.apache.commons.compress.archivers.cpio.CpioConstants;

/* loaded from: commons-compress-1.10.jar:org/apache/commons/compress/archivers/sevenz/CLI.class */
public class CLI {
    private static final byte[] BUF = new byte[CpioConstants.C_ISCHR];

    /* loaded from: commons-compress-1.10.jar:org/apache/commons/compress/archivers/sevenz/CLI$Mode.class */
    private enum Mode {
        LIST("Analysing") { // from class: org.apache.commons.compress.archivers.sevenz.CLI.Mode.1
            @Override // org.apache.commons.compress.archivers.sevenz.CLI.Mode
            public void takeAction(SevenZFile archive, SevenZArchiveEntry entry) {
                System.out.print(entry.getName());
                if (entry.isDirectory()) {
                    System.out.print(" dir");
                } else {
                    System.out.print(" " + entry.getCompressedSize() + "/" + entry.getSize());
                }
                if (entry.getHasLastModifiedDate()) {
                    System.out.print(" " + entry.getLastModifiedDate());
                } else {
                    System.out.print(" no last modified date");
                }
                if (!entry.isDirectory()) {
                    System.out.println(" " + getContentMethods(entry));
                } else {
                    System.out.println("");
                }
            }

            private String getContentMethods(SevenZArchiveEntry entry) {
                StringBuilder sb = new StringBuilder();
                boolean first = true;
                for (SevenZMethodConfiguration m : entry.getContentMethods()) {
                    if (!first) {
                        sb.append(", ");
                    }
                    first = false;
                    sb.append(m.getMethod());
                    if (m.getOptions() != null) {
                        sb.append("(").append(m.getOptions()).append(")");
                    }
                }
                return sb.toString();
            }
        },
        EXTRACT("Extracting") { // from class: org.apache.commons.compress.archivers.sevenz.CLI.Mode.2
            @Override // org.apache.commons.compress.archivers.sevenz.CLI.Mode
            public void takeAction(SevenZFile archive, SevenZArchiveEntry entry) throws IOException {
                File outFile = new File(entry.getName());
                if (entry.isDirectory()) {
                    if (!outFile.isDirectory() && !outFile.mkdirs()) {
                        throw new IOException("Cannot create directory " + outFile);
                    }
                    System.out.println("created directory " + outFile);
                    return;
                }
                System.out.println("extracting to " + outFile);
                File parent = outFile.getParentFile();
                if (parent != null && !parent.exists() && !parent.mkdirs()) {
                    throw new IOException("Cannot create " + parent);
                }
                FileOutputStream fos = new FileOutputStream(outFile);
                try {
                    long total = entry.getSize();
                    long off = 0;
                    while (off < total) {
                        int toRead = (int) Math.min(total - off, CLI.BUF.length);
                        int bytesRead = archive.read(CLI.BUF, 0, toRead);
                        if (bytesRead < 1) {
                            throw new IOException("reached end of entry " + entry.getName() + " after " + off + " bytes, expected " + total);
                        }
                        off += bytesRead;
                        fos.write(CLI.BUF, 0, bytesRead);
                    }
                } finally {
                    fos.close();
                }
            }
        };

        private final String message;

        public abstract void takeAction(SevenZFile sevenZFile, SevenZArchiveEntry sevenZArchiveEntry) throws IOException;

        Mode(String message) {
            this.message = message;
        }

        public String getMessage() {
            return this.message;
        }
    }

    public static void main(String[] args) throws Exception {
        if (args.length == 0) {
            usage();
            return;
        }
        Mode mode = grabMode(args);
        System.out.println(mode.getMessage() + " " + args[0]);
        File f = new File(args[0]);
        if (!f.isFile()) {
            System.err.println(f + " doesn't exist or is a directory");
        }
        SevenZFile archive = new SevenZFile(f);
        while (true) {
            try {
                SevenZArchiveEntry ae = archive.getNextEntry();
                if (ae != null) {
                    mode.takeAction(archive, ae);
                } else {
                    return;
                }
            } finally {
                archive.close();
            }
        }
    }

    private static void usage() {
        System.out.println("Parameters: archive-name [list|extract]");
    }

    private static Mode grabMode(String[] args) {
        if (args.length < 2) {
            return Mode.LIST;
        }
        return (Mode) Enum.valueOf(Mode.class, args[1].toUpperCase());
    }
}
