package ezvcard.io.text;

import ezvcard.util.org.apache.commons.codec.EncoderException;
import ezvcard.util.org.apache.commons.codec.net.QuotedPrintableCodec;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.nio.charset.Charset;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/text/FoldedLineWriter.class */
public class FoldedLineWriter extends Writer {
    private final Writer writer;
    private int curLineLength = 0;
    private Integer lineLength = 75;
    private String indent = " ";
    private String newline = "\r\n";

    public FoldedLineWriter(Writer writer) {
        this.writer = writer;
    }

    public void writeln(String str) throws IOException {
        write(str);
        write(this.newline);
    }

    public FoldedLineWriter append(CharSequence str, boolean quotedPrintable, Charset charset) throws IOException {
        write(str, quotedPrintable, charset);
        return this;
    }

    public void write(CharSequence str, boolean quotedPrintable, Charset charset) throws IOException {
        write(str.toString().toCharArray(), 0, str.length(), quotedPrintable, charset);
    }

    @Override // java.io.Writer
    public void write(char[] cbuf, int off, int len) throws IOException {
        write(cbuf, off, len, false, null);
    }

    public void write(char[] cbuf, int off, int len, boolean quotedPrintable, Charset charset) throws IOException {
        if (quotedPrintable) {
            if (charset == null) {
                charset = Charset.forName("UTF-8");
            }
            QuotedPrintableCodec codec = new QuotedPrintableCodec(charset.name());
            try {
                String str = new String(cbuf, off, len);
                String encoded = codec.encode(str);
                cbuf = encoded.toCharArray();
                off = 0;
                len = cbuf.length;
            } catch (EncoderException e) {
                throw new RuntimeException(e);
            }
        }
        if (this.lineLength == null) {
            this.writer.write(cbuf, off, len);
            return;
        }
        int effectiveLineLength = this.lineLength.intValue();
        if (quotedPrintable) {
            effectiveLineLength--;
        }
        int encodedCharPos = -1;
        int start = off;
        int end = off + len;
        int i = start;
        while (i < end) {
            char c = cbuf[i];
            if (encodedCharPos >= 0) {
                encodedCharPos++;
                if (encodedCharPos == 3) {
                    encodedCharPos = -1;
                }
            }
            if (c == '\n') {
                this.writer.write(cbuf, start, (i - start) + 1);
                this.curLineLength = 0;
                start = i + 1;
            } else if (c == '\r') {
                if (i == end - 1 || cbuf[i + 1] != '\n') {
                    this.writer.write(cbuf, start, (i - start) + 1);
                    this.curLineLength = 0;
                    start = i + 1;
                } else {
                    this.curLineLength++;
                }
            } else {
                if (c == '=' && quotedPrintable) {
                    encodedCharPos = 0;
                }
                if (this.curLineLength >= effectiveLineLength) {
                    if (Character.isWhitespace(c)) {
                        while (Character.isWhitespace(c) && i < end - 1) {
                            i++;
                            c = cbuf[i];
                        }
                        if (i < end - 1) {
                            break;
                            break;
                        }
                        break;
                    }
                    if (encodedCharPos > 0) {
                        i += 3 - encodedCharPos;
                        if (i >= end - 1) {
                            break;
                        }
                    }
                    this.writer.write(cbuf, start, i - start);
                    if (quotedPrintable) {
                        this.writer.write(61);
                    }
                    this.writer.write(this.newline);
                    this.writer.write(this.indent);
                    this.curLineLength = this.indent.length() + 1;
                    start = i;
                } else {
                    this.curLineLength++;
                }
            }
            i++;
        }
        this.writer.write(cbuf, start, end - start);
    }

    @Override // java.io.Writer, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.writer.close();
    }

    @Override // java.io.Writer, java.io.Flushable
    public void flush() throws IOException {
        this.writer.flush();
    }

    public Integer getLineLength() {
        return this.lineLength;
    }

    public void setLineLength(Integer lineLength) {
        if (lineLength != null && lineLength.intValue() <= 0) {
            throw new IllegalArgumentException("Line length must be greater than 0.");
        }
        this.lineLength = lineLength;
    }

    public String getIndent() {
        return this.indent;
    }

    public void setIndent(String indent) {
        if (this.lineLength != null && indent.length() >= this.lineLength.intValue()) {
            throw new IllegalArgumentException("The length of the indent string must be less than the max line length.");
        }
        this.indent = indent;
    }

    public String getNewline() {
        return this.newline;
    }

    public void setNewline(String newline) {
        this.newline = newline;
    }

    public Writer getWriter() {
        return this.writer;
    }

    public Charset getEncoding() {
        if (!(this.writer instanceof OutputStreamWriter)) {
            return null;
        }
        OutputStreamWriter osw = (OutputStreamWriter) this.writer;
        String charsetStr = osw.getEncoding();
        if (charsetStr == null) {
            return null;
        }
        return Charset.forName(charsetStr);
    }
}
