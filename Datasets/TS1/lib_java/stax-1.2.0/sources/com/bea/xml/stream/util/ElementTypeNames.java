package com.bea.xml.stream.util;

/* loaded from: stax-1.2.0.jar:com/bea/xml/stream/util/ElementTypeNames.class */
public class ElementTypeNames {
    public static final String getEventTypeString(int eventType) {
        switch (eventType) {
            case 1:
                return "START_ELEMENT";
            case 2:
                return "END_ELEMENT";
            case 3:
                return "PROCESSING_INSTRUCTION";
            case 4:
                return "CHARACTERS";
            case 5:
                return "COMMENT";
            case 6:
                return "SPACE";
            case 7:
                return "START_DOCUMENT";
            case 8:
                return "END_DOCUMENT";
            case 9:
                return "ENTITY_REFERENCE";
            case 10:
                return "ATTRIBUTE";
            case 11:
                return "DTD";
            case 12:
                return "CDATA";
            case 13:
                return "NAMESPACE";
            default:
                return "UNKNOWN_EVENT_TYPE";
        }
    }

    public static int getEventType(String val) {
        if (val.equals("START_ELEMENT")) {
            return 1;
        }
        if (val.equals("SPACE")) {
            return 6;
        }
        if (val.equals("END_ELEMENT")) {
            return 2;
        }
        if (val.equals("PROCESSING_INSTRUCTION")) {
            return 3;
        }
        if (val.equals("CHARACTERS")) {
            return 4;
        }
        if (val.equals("COMMENT")) {
            return 5;
        }
        if (val.equals("START_DOCUMENT")) {
            return 7;
        }
        if (val.equals("END_DOCUMENT")) {
            return 8;
        }
        if (val.equals("ATTRIBUTE")) {
            return 10;
        }
        if (val.equals("DTD")) {
            return 11;
        }
        if (val.equals("CDATA")) {
            return 12;
        }
        if (val.equals("NAMESPACE")) {
            return 13;
        }
        return -1;
    }
}
