package com.drew.metadata.iptc;

import com.drew.lang.annotations.NotNull;
import com.drew.lang.annotations.Nullable;
import java.nio.ByteBuffer;
import java.nio.charset.CharacterCodingException;
import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;

/* loaded from: metadata-extractor-2.9.1.jar:com/drew/metadata/iptc/Iso2022Converter.class */
public final class Iso2022Converter {
    private static final String ISO_8859_1 = "ISO-8859-1";
    private static final String UTF_8 = "UTF-8";
    private static final byte LATIN_CAPITAL_A = 65;
    private static final int DOT = 14844066;
    private static final byte LATIN_CAPITAL_G = 71;
    private static final byte PERCENT_SIGN = 37;
    private static final byte ESC = 27;

    @Nullable
    public static String convertISO2022CharsetToJavaCharset(@NotNull byte[] bytes) {
        if (bytes.length > 2 && bytes[0] == 27 && bytes[1] == 37 && bytes[2] == 71) {
            return UTF_8;
        }
        if (bytes.length > 3 && bytes[0] == 27 && ((bytes[3] & 255) | ((bytes[2] & 255) << 8) | ((bytes[1] & 255) << 16)) == DOT && bytes[4] == 65) {
            return ISO_8859_1;
        }
        return null;
    }

    @Nullable
    static String guessEncoding(@NotNull byte[] bytes) {
        String[] encodings = {UTF_8, System.getProperty("file.encoding"), ISO_8859_1};
        for (String encoding : encodings) {
            CharsetDecoder cs = Charset.forName(encoding).newDecoder();
            try {
                cs.decode(ByteBuffer.wrap(bytes));
                return encoding;
            } catch (CharacterCodingException e) {
            }
        }
        return null;
    }

    private Iso2022Converter() {
    }
}
