package freemarker.template.utility;

import freemarker.core.FMParserConstants;
import freemarker.template.TemplateTransformModel;
import java.io.IOException;
import java.io.Writer;
import java.util.Map;

/* loaded from: freemarker-2.3.20.jar:freemarker/template/utility/HtmlEscape.class */
public class HtmlEscape implements TemplateTransformModel {
    private static final char[] LT = "&lt;".toCharArray();
    private static final char[] GT = "&gt;".toCharArray();
    private static final char[] AMP = "&amp;".toCharArray();
    private static final char[] QUOT = "&quot;".toCharArray();

    @Override // freemarker.template.TemplateTransformModel
    public Writer getWriter(Writer out, Map args) {
        return new Writer(this, out) { // from class: freemarker.template.utility.HtmlEscape.1
            private final Writer val$out;
            private final HtmlEscape this$0;

            {
                this.this$0 = this;
                this.val$out = out;
            }

            @Override // java.io.Writer
            public void write(int c) throws IOException {
                switch (c) {
                    case FMParserConstants.END_ATTEMPT /* 34 */:
                        this.val$out.write(HtmlEscape.QUOT, 0, 6);
                        break;
                    case FMParserConstants.END_ASSIGN /* 38 */:
                        this.val$out.write(HtmlEscape.AMP, 0, 5);
                        break;
                    case FMParserConstants.END_ESCAPE /* 60 */:
                        this.val$out.write(HtmlEscape.LT, 0, 4);
                        break;
                    case FMParserConstants.END_NOESCAPE /* 62 */:
                        this.val$out.write(HtmlEscape.GT, 0, 4);
                        break;
                    default:
                        this.val$out.write(c);
                        break;
                }
            }

            @Override // java.io.Writer
            public void write(char[] cbuf, int off, int len) throws IOException {
                int lastoff = off;
                int lastpos = off + len;
                for (int i = off; i < lastpos; i++) {
                    switch (cbuf[i]) {
                        case FMParserConstants.END_ATTEMPT /* 34 */:
                            this.val$out.write(cbuf, lastoff, i - lastoff);
                            this.val$out.write(HtmlEscape.QUOT, 0, 6);
                            lastoff = i + 1;
                            break;
                        case FMParserConstants.END_ASSIGN /* 38 */:
                            this.val$out.write(cbuf, lastoff, i - lastoff);
                            this.val$out.write(HtmlEscape.AMP, 0, 5);
                            lastoff = i + 1;
                            break;
                        case FMParserConstants.END_ESCAPE /* 60 */:
                            this.val$out.write(cbuf, lastoff, i - lastoff);
                            this.val$out.write(HtmlEscape.LT, 0, 4);
                            lastoff = i + 1;
                            break;
                        case FMParserConstants.END_NOESCAPE /* 62 */:
                            this.val$out.write(cbuf, lastoff, i - lastoff);
                            this.val$out.write(HtmlEscape.GT, 0, 4);
                            lastoff = i + 1;
                            break;
                    }
                }
                int remaining = lastpos - lastoff;
                if (remaining > 0) {
                    this.val$out.write(cbuf, lastoff, remaining);
                }
            }

            @Override // java.io.Writer, java.io.Flushable
            public void flush() throws IOException {
                this.val$out.flush();
            }

            @Override // java.io.Writer, java.io.Closeable, java.lang.AutoCloseable
            public void close() {
            }
        };
    }
}
