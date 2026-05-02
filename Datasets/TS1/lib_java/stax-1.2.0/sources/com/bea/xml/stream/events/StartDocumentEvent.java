package com.bea.xml.stream.events;

import java.io.IOException;
import java.io.Writer;
import javax.xml.stream.events.StartDocument;

/* loaded from: stax-1.2.0.jar:com/bea/xml/stream/events/StartDocumentEvent.class */
public class StartDocumentEvent extends BaseEvent implements StartDocument {
    protected String systemId = "";
    protected String publicId = "";
    protected String encodingScheme = "UTF-8";
    protected boolean standalone = false;
    protected String version = "1.0";
    private boolean encodingSchemeSet = false;
    private boolean standaloneSet = false;

    public StartDocumentEvent() {
        init();
    }

    protected void init() {
        setEventType(7);
    }

    @Override // com.bea.xml.stream.events.BaseEvent
    public String getSystemId() {
        return this.systemId;
    }

    public String getCharacterEncodingScheme() {
        return this.encodingScheme;
    }

    public boolean isStandalone() {
        return this.standalone;
    }

    public String getVersion() {
        return this.version;
    }

    public void setStandalone(boolean standalone) {
        this.standaloneSet = true;
        this.standalone = standalone;
    }

    public void setStandalone(String standalone) {
        this.standaloneSet = true;
        if (standalone == null) {
            this.standalone = true;
        } else if (!standalone.equals("yes")) {
            this.standalone = false;
        } else {
            this.standalone = true;
        }
    }

    public boolean encodingSet() {
        return this.encodingSchemeSet;
    }

    public boolean standaloneSet() {
        return this.standaloneSet;
    }

    public void setEncoding(String encoding) {
        this.encodingScheme = encoding;
        this.encodingSchemeSet = true;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public void clear() {
        this.encodingScheme = "UTF-8";
        this.standalone = true;
        this.version = "1.0";
        this.encodingSchemeSet = false;
        this.standaloneSet = false;
    }

    @Override // com.bea.xml.stream.events.BaseEvent
    protected void doWriteAsEncodedUnicode(Writer writer) throws IOException {
        writer.write("<?xml version=\"");
        writer.write(this.version);
        writer.write("\" encoding='");
        writer.write(this.encodingScheme);
        writer.write(39);
        if (this.standaloneSet) {
            writer.write(" standalone='");
            writer.write(this.standalone ? "yes'" : "no'");
        }
        writer.write("?>");
    }
}
