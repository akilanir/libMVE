package freemarker.template.utility;

import freemarker.template.TemplateTransformModel;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Reader;
import java.io.StringReader;
import java.io.StringWriter;
import java.io.Writer;
import java.util.Map;

/* loaded from: freemarker-2.3.20.jar:freemarker/template/utility/NormalizeNewlines.class */
public class NormalizeNewlines implements TemplateTransformModel {
    @Override // freemarker.template.TemplateTransformModel
    public Writer getWriter(Writer out, Map args) {
        StringBuffer buf = new StringBuffer();
        return new Writer(this, buf, out) { // from class: freemarker.template.utility.NormalizeNewlines.1
            private final StringBuffer val$buf;
            private final Writer val$out;
            private final NormalizeNewlines this$0;

            {
                this.this$0 = this;
                this.val$buf = buf;
                this.val$out = out;
            }

            @Override // java.io.Writer
            public void write(char[] cbuf, int off, int len) {
                this.val$buf.append(cbuf, off, len);
            }

            @Override // java.io.Writer, java.io.Flushable
            public void flush() throws IOException {
                this.val$out.flush();
            }

            @Override // java.io.Writer, java.io.Closeable, java.lang.AutoCloseable
            public void close() throws IOException {
                StringReader sr = new StringReader(this.val$buf.toString());
                StringWriter sw = new StringWriter();
                this.this$0.transform(sr, sw);
                this.val$out.write(sw.toString());
            }
        };
    }

    public void transform(Reader in, Writer out) throws IOException {
        BufferedReader br = in instanceof BufferedReader ? (BufferedReader) in : new BufferedReader(in);
        PrintWriter pw = out instanceof PrintWriter ? (PrintWriter) out : new PrintWriter(out);
        String line = br.readLine();
        if (line != null && line.length() > 0) {
            pw.println(line);
        }
        while (true) {
            String line2 = br.readLine();
            if (line2 != null) {
                pw.println(line2);
            } else {
                return;
            }
        }
    }
}
