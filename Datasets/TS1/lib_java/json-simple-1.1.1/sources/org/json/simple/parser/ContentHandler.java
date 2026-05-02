package org.json.simple.parser;

import java.io.IOException;

/* loaded from: json-simple-1.1.1.jar:org/json/simple/parser/ContentHandler.class */
public interface ContentHandler {
    void startJSON() throws ParseException, IOException;

    void endJSON() throws ParseException, IOException;

    boolean startObject() throws ParseException, IOException;

    boolean endObject() throws ParseException, IOException;

    boolean startObjectEntry(String str) throws ParseException, IOException;

    boolean endObjectEntry() throws ParseException, IOException;

    boolean startArray() throws ParseException, IOException;

    boolean endArray() throws ParseException, IOException;

    boolean primitive(Object obj) throws ParseException, IOException;
}
