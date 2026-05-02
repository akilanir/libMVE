package com.fasterxml.jackson.core.io;

import com.fasterxml.jackson.core.SerializableString;
import com.fasterxml.jackson.core.util.ArraysCompat;
import java.io.Serializable;

/* loaded from: jackson-core-2.3.3.jar:com/fasterxml/jackson/core/io/CharacterEscapes.class */
public abstract class CharacterEscapes implements Serializable {
    private static final long serialVersionUID = 1;
    public static final int ESCAPE_NONE = 0;
    public static final int ESCAPE_STANDARD = -1;
    public static final int ESCAPE_CUSTOM = -2;

    public abstract int[] getEscapeCodesForAscii();

    public abstract SerializableString getEscapeSequence(int i);

    public static int[] standardAsciiEscapesForJSON() {
        int[] iArr = CharTypes.get7BitOutputEscapes();
        return ArraysCompat.copyOf(iArr, iArr.length);
    }
}
