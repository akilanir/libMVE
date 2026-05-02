package ezvcard.io.text;

import ezvcard.util.StringUtils;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.StringReader;
import java.nio.charset.Charset;
import java.util.regex.Pattern;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/text/FoldedLineReader.class */
public class FoldedLineReader extends BufferedReader {
    private static final Pattern foldedQuotedPrintableValueRegex = Pattern.compile("[^:]*?QUOTED-PRINTABLE.*?:.*?=", 2);
    private String lastLine;
    private int lastLineNum;
    private int lineCount;
    private final Charset charset;

    public FoldedLineReader(Reader reader) {
        super(reader);
        this.lastLineNum = 0;
        this.lineCount = 0;
        if (reader instanceof InputStreamReader) {
            InputStreamReader isr = (InputStreamReader) reader;
            String charsetStr = isr.getEncoding();
            this.charset = charsetStr == null ? null : Charset.forName(charsetStr);
            return;
        }
        this.charset = null;
    }

    public FoldedLineReader(String text) {
        this(new StringReader(text));
    }

    public int getLineNum() {
        return this.lastLineNum;
    }

    public Charset getEncoding() {
        return this.charset;
    }

    private String readNonEmptyLine() throws IOException {
        String line;
        do {
            line = super.readLine();
            if (line != null) {
                this.lineCount++;
            }
            if (line == null) {
                break;
            }
        } while (line.length() == 0);
        return line;
    }

    @Override // java.io.BufferedReader
    public String readLine() throws IOException {
        String line;
        String wholeLine = this.lastLine == null ? readNonEmptyLine() : this.lastLine;
        this.lastLine = null;
        if (wholeLine == null) {
            return null;
        }
        boolean foldedQuotedPrintableLine = false;
        if (foldedQuotedPrintableValueRegex.matcher(wholeLine).matches()) {
            foldedQuotedPrintableLine = true;
            wholeLine = wholeLine.substring(0, wholeLine.length() - 1);
        }
        this.lastLineNum = this.lineCount;
        StringBuilder unfoldedLine = new StringBuilder(wholeLine);
        while (true) {
            line = foldedQuotedPrintableLine ? super.readLine() : readNonEmptyLine();
            if (line == null) {
                break;
            }
            if (foldedQuotedPrintableLine) {
                String line2 = StringUtils.ltrim(line);
                boolean endsInEquals = line2.endsWith("=");
                if (endsInEquals) {
                    line2 = line2.substring(0, line2.length() - 1);
                }
                unfoldedLine.append(line2);
                if (!endsInEquals) {
                    break;
                }
            } else {
                if (line.length() <= 0 || !Character.isWhitespace(line.charAt(0))) {
                    break;
                }
                int lastWhitespace = 1;
                while (lastWhitespace < line.length() && Character.isWhitespace(line.charAt(lastWhitespace))) {
                    lastWhitespace++;
                }
                unfoldedLine.append(line.substring(lastWhitespace));
            }
        }
        this.lastLine = line;
        return unfoldedLine.toString();
    }
}
