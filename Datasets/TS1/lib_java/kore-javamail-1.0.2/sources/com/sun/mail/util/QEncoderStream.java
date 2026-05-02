package com.sun.mail.util;

import java.io.IOException;
import java.io.OutputStream;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/util/QEncoderStream.class */
public class QEncoderStream extends QPEncoderStream {
    private String specials;
    private static String WORD_SPECIALS = "=_?\"#$%&'(),.:;<>@[\\]^`{|}~";
    private static String TEXT_SPECIALS = "=_?";

    public QEncoderStream(OutputStream out, boolean encodingWord) {
        super(out, Integer.MAX_VALUE);
        this.specials = encodingWord ? WORD_SPECIALS : TEXT_SPECIALS;
    }

    @Override // com.sun.mail.util.QPEncoderStream, java.io.FilterOutputStream, java.io.OutputStream
    public void write(int c) throws IOException {
        int c2 = c & 255;
        if (c2 == 32) {
            output(95, false);
        } else if (c2 < 32 || c2 >= 127 || this.specials.indexOf(c2) >= 0) {
            output(c2, true);
        } else {
            output(c2, false);
        }
    }

    public static int encodedLength(byte[] b, boolean encodingWord) {
        int len = 0;
        String specials = encodingWord ? WORD_SPECIALS : TEXT_SPECIALS;
        for (byte b2 : b) {
            int c = b2 & 255;
            if (c < 32 || c >= 127 || specials.indexOf(c) >= 0) {
                len += 3;
            } else {
                len++;
            }
        }
        return len;
    }
}
