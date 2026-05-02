package org.unbescape.xml;

/* loaded from: unbescape-1.1.1.RELEASE.jar:org/unbescape/xml/XmlEscapeType.class */
public enum XmlEscapeType {
    CHARACTER_ENTITY_REFERENCES_DEFAULT_TO_DECIMAL(true, false),
    CHARACTER_ENTITY_REFERENCES_DEFAULT_TO_HEXA(true, true),
    DECIMAL_REFERENCES(false, false),
    HEXADECIMAL_REFERENCES(false, true);

    private final boolean useCERs;
    private final boolean useHexa;

    XmlEscapeType(boolean useCERs, boolean useHexa) {
        this.useCERs = useCERs;
        this.useHexa = useHexa;
    }

    boolean getUseCERs() {
        return this.useCERs;
    }

    boolean getUseHexa() {
        return this.useHexa;
    }
}
