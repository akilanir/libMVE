package org.apache.commons.io.input;

import java.io.Closeable;
import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.nio.charset.CharsetEncoder;
import org.apache.commons.io.Charsets;
import org.apache.commons.io.IOUtils;

/* loaded from: commons-io-2.4.jar:org/apache/commons/io/input/ReversedLinesFileReader.class */
public class ReversedLinesFileReader implements Closeable {
    private final int blockSize;
    private final Charset encoding;
    private final RandomAccessFile randomAccessFile;
    private final long totalByteLength;
    private final long totalBlockCount;
    private final byte[][] newLineSequences;
    private final int avoidNewlineSplitBufferSize;
    private final int byteDecrement;
    private FilePart currentFilePart;
    private boolean trailingNewlineOfFileSkipped;

    public ReversedLinesFileReader(File file) throws IOException {
        this(file, 4096, Charset.defaultCharset().toString());
    }

    /* JADX WARN: Type inference failed for: r1v31, types: [byte[], byte[][]] */
    public ReversedLinesFileReader(File file, int blockSize, Charset encoding) throws IOException {
        this.trailingNewlineOfFileSkipped = false;
        this.blockSize = blockSize;
        this.encoding = encoding;
        this.randomAccessFile = new RandomAccessFile(file, "r");
        this.totalByteLength = this.randomAccessFile.length();
        int lastBlockLength = (int) (this.totalByteLength % blockSize);
        if (lastBlockLength > 0) {
            this.totalBlockCount = (this.totalByteLength / blockSize) + 1;
        } else {
            this.totalBlockCount = this.totalByteLength / blockSize;
            if (this.totalByteLength > 0) {
                lastBlockLength = blockSize;
            }
        }
        this.currentFilePart = new FilePart(this.totalBlockCount, lastBlockLength, null);
        Charset charset = Charsets.toCharset(encoding);
        CharsetEncoder charsetEncoder = charset.newEncoder();
        float maxBytesPerChar = charsetEncoder.maxBytesPerChar();
        if (maxBytesPerChar == 1.0f || charset == Charset.forName("UTF-8") || charset == Charset.forName("Shift_JIS")) {
            this.byteDecrement = 1;
        } else if (charset == Charset.forName("UTF-16BE") || charset == Charset.forName("UTF-16LE")) {
            this.byteDecrement = 2;
        } else {
            if (charset == Charset.forName("UTF-16")) {
                throw new UnsupportedEncodingException("For UTF-16, you need to specify the byte order (use UTF-16BE or UTF-16LE)");
            }
            throw new UnsupportedEncodingException("Encoding " + encoding + " is not supported yet (feel free to submit a patch)");
        }
        this.newLineSequences = new byte[]{IOUtils.LINE_SEPARATOR_WINDOWS.getBytes(encoding), IOUtils.LINE_SEPARATOR_UNIX.getBytes(encoding), "\r".getBytes(encoding)};
        this.avoidNewlineSplitBufferSize = this.newLineSequences[0].length;
    }

    public ReversedLinesFileReader(File file, int blockSize, String encoding) throws IOException {
        this(file, blockSize, Charsets.toCharset(encoding));
    }

    public String readLine() throws IOException {
        String line;
        String readLine = this.currentFilePart.readLine();
        while (true) {
            line = readLine;
            if (line != null) {
                break;
            }
            this.currentFilePart = this.currentFilePart.rollOver();
            if (this.currentFilePart == null) {
                break;
            }
            readLine = this.currentFilePart.readLine();
        }
        if ("".equals(line) && !this.trailingNewlineOfFileSkipped) {
            this.trailingNewlineOfFileSkipped = true;
            line = readLine();
        }
        return line;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.randomAccessFile.close();
    }

    /* loaded from: commons-io-2.4.jar:org/apache/commons/io/input/ReversedLinesFileReader$FilePart.class */
    private class FilePart {
        private final long no;
        private final byte[] data;
        private byte[] leftOver;
        private int currentLastBytePos;

        private FilePart(long no, int length, byte[] leftOverOfLastFilePart) throws IOException {
            this.no = no;
            int dataLength = length + (leftOverOfLastFilePart != null ? leftOverOfLastFilePart.length : 0);
            this.data = new byte[dataLength];
            long off = (no - 1) * ReversedLinesFileReader.this.blockSize;
            if (no > 0) {
                ReversedLinesFileReader.this.randomAccessFile.seek(off);
                int countRead = ReversedLinesFileReader.this.randomAccessFile.read(this.data, 0, length);
                if (countRead != length) {
                    throw new IllegalStateException("Count of requested bytes and actually read bytes don't match");
                }
            }
            if (leftOverOfLastFilePart != null) {
                System.arraycopy(leftOverOfLastFilePart, 0, this.data, length, leftOverOfLastFilePart.length);
            }
            this.currentLastBytePos = this.data.length - 1;
            this.leftOver = null;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public FilePart rollOver() throws IOException {
            if (this.currentLastBytePos > -1) {
                throw new IllegalStateException("Current currentLastCharPos unexpectedly positive... last readLine() should have returned something! currentLastCharPos=" + this.currentLastBytePos);
            }
            if (this.no > 1) {
                return ReversedLinesFileReader.this.new FilePart(this.no - 1, ReversedLinesFileReader.this.blockSize, this.leftOver);
            }
            if (this.leftOver != null) {
                throw new IllegalStateException("Unexpected leftover of the last block: leftOverOfThisFilePart=" + new String(this.leftOver, ReversedLinesFileReader.this.encoding));
            }
            return null;
        }

        /* JADX INFO: Access modifiers changed from: private */
        /* JADX WARN: Code restructure failed: missing block: B:25:0x00be, code lost:
        
            if (r9 == false) goto L29;
         */
        /* JADX WARN: Code restructure failed: missing block: B:27:0x00c5, code lost:
        
            if (r6.leftOver == null) goto L29;
         */
        /* JADX WARN: Code restructure failed: missing block: B:28:0x00c8, code lost:
        
            r7 = new java.lang.String(r6.leftOver, r6.this$0.encoding);
            r6.leftOver = null;
         */
        /* JADX WARN: Code restructure failed: missing block: B:30:0x00e1, code lost:
        
            return r7;
         */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public java.lang.String readLine() throws java.io.IOException {
            /*
                Method dump skipped, instructions count: 226
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: org.apache.commons.io.input.ReversedLinesFileReader.FilePart.readLine():java.lang.String");
        }

        private void createLeftOver() {
            int lineLengthBytes = this.currentLastBytePos + 1;
            if (lineLengthBytes > 0) {
                this.leftOver = new byte[lineLengthBytes];
                System.arraycopy(this.data, 0, this.leftOver, 0, lineLengthBytes);
            } else {
                this.leftOver = null;
            }
            this.currentLastBytePos = -1;
        }

        private int getNewLineMatchByteCount(byte[] data, int i) {
            byte[][] arr$ = ReversedLinesFileReader.this.newLineSequences;
            for (byte[] newLineSequence : arr$) {
                boolean match = true;
                for (int j = newLineSequence.length - 1; j >= 0; j--) {
                    int k = (i + j) - (newLineSequence.length - 1);
                    match &= k >= 0 && data[k] == newLineSequence[j];
                }
                if (match) {
                    return newLineSequence.length;
                }
            }
            return 0;
        }
    }
}
