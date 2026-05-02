package org.unbescape.json;

/* loaded from: unbescape-1.1.1.RELEASE.jar:org/unbescape/json/JsonEscapeType.class */
public enum JsonEscapeType {
    SINGLE_ESCAPE_CHARS_DEFAULT_TO_UHEXA(true),
    UHEXA(false);

    private final boolean useSECs;

    JsonEscapeType(boolean useSECs) {
        this.useSECs = useSECs;
    }

    boolean getUseSECs() {
        return this.useSECs;
    }
}
