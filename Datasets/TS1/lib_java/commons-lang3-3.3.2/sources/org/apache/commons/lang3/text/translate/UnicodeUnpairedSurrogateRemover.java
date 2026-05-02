package org.apache.commons.lang3.text.translate;

import java.io.IOException;
import java.io.Writer;

/* loaded from: commons-lang3-3.3.2.jar:org/apache/commons/lang3/text/translate/UnicodeUnpairedSurrogateRemover.class */
public class UnicodeUnpairedSurrogateRemover extends CodePointTranslator {
    @Override // org.apache.commons.lang3.text.translate.CodePointTranslator
    public boolean translate(int codepoint, Writer out) throws IOException {
        if (codepoint >= 55296 && codepoint <= 57343) {
            return true;
        }
        return false;
    }
}
