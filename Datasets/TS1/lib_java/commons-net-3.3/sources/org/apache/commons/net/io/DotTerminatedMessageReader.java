package org.apache.commons.net.io;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.Reader;

/* loaded from: commons-net-3.3.jar:org/apache/commons/net/io/DotTerminatedMessageReader.class */
public final class DotTerminatedMessageReader extends BufferedReader {
    private static final char LF = '\n';
    private static final char CR = '\r';
    private static final int DOT = 46;
    private boolean atBeginning;
    private boolean eof;
    private boolean seenCR;

    public DotTerminatedMessageReader(Reader reader) {
        super(reader);
        this.atBeginning = true;
        this.eof = false;
    }

    @Override // java.io.BufferedReader, java.io.Reader
    public int read() throws IOException {
        synchronized (this.lock) {
            if (this.eof) {
                return -1;
            }
            int chint = super.read();
            if (chint == -1) {
                this.eof = true;
                return -1;
            }
            if (this.atBeginning) {
                this.atBeginning = false;
                if (chint == DOT) {
                    mark(2);
                    int chint2 = super.read();
                    if (chint2 == -1) {
                        this.eof = true;
                        return DOT;
                    }
                    if (chint2 == DOT) {
                        return chint2;
                    }
                    if (chint2 == 13) {
                        int chint3 = super.read();
                        if (chint3 == -1) {
                            reset();
                            return DOT;
                        }
                        if (chint3 == 10) {
                            this.atBeginning = true;
                            this.eof = true;
                            return -1;
                        }
                    }
                    reset();
                    return DOT;
                }
            }
            if (this.seenCR) {
                this.seenCR = false;
                if (chint == 10) {
                    this.atBeginning = true;
                }
            }
            if (chint == 13) {
                this.seenCR = true;
            }
            return chint;
        }
    }

    @Override // java.io.Reader
    public int read(char[] buffer) throws IOException {
        return read(buffer, 0, buffer.length);
    }

    @Override // java.io.BufferedReader, java.io.Reader
    public int read(char[] buffer, int offset, int length) throws IOException {
        int read;
        if (length < 1) {
            return 0;
        }
        synchronized (this.lock) {
            int read2 = read();
            int ch = read2;
            if (read2 == -1) {
                return -1;
            }
            do {
                int i = offset;
                offset++;
                buffer[i] = (char) ch;
                length--;
                if (length <= 0) {
                    break;
                }
                read = read();
                ch = read;
            } while (read != -1);
            return offset - offset;
        }
    }

    @Override // java.io.BufferedReader, java.io.Reader, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        synchronized (this.lock) {
            if (!this.eof) {
                while (read() != -1) {
                }
            }
            this.eof = true;
            this.atBeginning = false;
        }
    }

    @Override // java.io.BufferedReader
    public String readLine() throws IOException {
        StringBuilder sb = new StringBuilder();
        synchronized (this.lock) {
            while (true) {
                int intch = read();
                if (intch != -1) {
                    if (intch == 10 && this.atBeginning) {
                        return sb.substring(0, sb.length() - 1);
                    }
                    sb.append((char) intch);
                } else {
                    String string = sb.toString();
                    if (string.length() == 0) {
                        return null;
                    }
                    return string;
                }
            }
        }
    }
}
