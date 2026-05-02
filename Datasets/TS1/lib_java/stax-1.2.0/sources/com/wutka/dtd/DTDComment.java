package com.wutka.dtd;

import java.io.IOException;
import java.io.PrintWriter;

/* loaded from: stax-1.2.0.jar:com/wutka/dtd/DTDComment.class */
public class DTDComment implements DTDOutput {
    public String text;

    public DTDComment() {
    }

    public DTDComment(String theText) {
        this.text = theText;
    }

    public String toString() {
        return this.text;
    }

    @Override // com.wutka.dtd.DTDOutput
    public void write(PrintWriter out) throws IOException {
        out.print("<!--");
        out.print(this.text);
        out.println("-->");
    }

    public boolean equals(Object ob) {
        if (ob == this) {
            return true;
        }
        if (!(ob instanceof DTDComment)) {
            return false;
        }
        DTDComment other = (DTDComment) ob;
        if (this.text != null || other.text == null) {
            return this.text == null || this.text.equals(other.text);
        }
        return false;
    }

    public void setText(String theText) {
        this.text = theText;
    }

    public String getText() {
        return this.text;
    }
}
