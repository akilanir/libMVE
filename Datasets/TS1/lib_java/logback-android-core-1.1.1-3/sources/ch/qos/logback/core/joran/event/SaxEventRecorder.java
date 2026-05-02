package ch.qos.logback.core.joran.event;

import ch.qos.logback.core.Context;
import ch.qos.logback.core.joran.spi.ElementPath;
import ch.qos.logback.core.joran.spi.JoranException;
import ch.qos.logback.core.spi.ContextAware;
import ch.qos.logback.core.spi.ContextAwareImpl;
import ch.qos.logback.core.status.Status;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import org.xml.sax.Attributes;
import org.xml.sax.InputSource;
import org.xml.sax.Locator;
import org.xml.sax.SAXException;
import org.xml.sax.SAXNotSupportedException;
import org.xml.sax.SAXParseException;
import org.xml.sax.helpers.DefaultHandler;
import org.xmlpull.v1.sax2.Driver;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/joran/event/SaxEventRecorder.class */
public class SaxEventRecorder extends DefaultHandler implements ContextAware {
    private final ContextAwareImpl cai;
    private List<SaxEvent> saxEventList;
    private Locator locator;
    ElementPath globalElementPath;

    public SaxEventRecorder() {
        this.saxEventList = new ArrayList();
        this.globalElementPath = new ElementPath();
        this.cai = new ContextAwareImpl(null, this);
    }

    public SaxEventRecorder(Context context) {
        this.saxEventList = new ArrayList();
        this.globalElementPath = new ElementPath();
        this.cai = new ContextAwareImpl(context, this);
    }

    public final void recordEvents(InputStream inputStream) throws JoranException {
        recordEvents(new InputSource(inputStream));
    }

    public List<SaxEvent> recordEvents(InputSource inputSource) throws JoranException {
        Driver buildPullParser = buildPullParser();
        try {
            buildPullParser.setContentHandler(this);
            buildPullParser.setErrorHandler(this);
            buildPullParser.parse(inputSource);
            return this.saxEventList;
        } catch (EOFException e) {
            handleError(e.getLocalizedMessage(), new SAXParseException(e.getLocalizedMessage(), this.locator, e));
            throw new IllegalStateException("This point can never be reached");
        } catch (IOException e2) {
            handleError("I/O error occurred while parsing xml file", e2);
            throw new IllegalStateException("This point can never be reached");
        } catch (SAXException e3) {
            throw new JoranException("Problem parsing XML document. See previously reported errors.", e3);
        } catch (Exception e4) {
            handleError("Unexpected exception while parsing XML document.", e4);
            throw new IllegalStateException("This point can never be reached");
        }
    }

    private void handleError(String str, Throwable th) throws JoranException {
        addError(str, th);
        throw new JoranException(str, th);
    }

    private Driver buildPullParser() throws JoranException {
        try {
            Driver driver = new Driver();
            try {
                driver.setFeature("http://xml.org/sax/features/validation", false);
            } catch (SAXNotSupportedException e) {
            }
            driver.setFeature("http://xml.org/sax/features/namespaces", true);
            return driver;
        } catch (Exception e2) {
            addError("Parser configuration error occurred", e2);
            throw new JoranException("Parser configuration error occurred", e2);
        }
    }

    @Override // org.xml.sax.helpers.DefaultHandler, org.xml.sax.ContentHandler
    public void startDocument() {
    }

    public Locator getLocator() {
        return this.locator;
    }

    @Override // org.xml.sax.helpers.DefaultHandler, org.xml.sax.ContentHandler
    public void setDocumentLocator(Locator locator) {
        this.locator = locator;
    }

    @Override // org.xml.sax.helpers.DefaultHandler, org.xml.sax.ContentHandler
    public void startElement(String str, String str2, String str3, Attributes attributes) {
        String str4 = (str3 == null || str3.length() == 0) ? str2 : str3;
        this.globalElementPath.push(getTagName(str2, str3));
        this.saxEventList.add(new StartEvent(this.globalElementPath.duplicate(), str, str2, str3, attributes, getLocator()));
    }

    @Override // org.xml.sax.helpers.DefaultHandler, org.xml.sax.ContentHandler
    public void characters(char[] cArr, int i, int i2) {
        String str = new String(cArr, i, i2);
        SaxEvent lastEvent = getLastEvent();
        if (lastEvent instanceof BodyEvent) {
            ((BodyEvent) lastEvent).append(str);
        } else {
            if (isSpaceOnly(str)) {
                return;
            }
            this.saxEventList.add(new BodyEvent(str, getLocator()));
        }
    }

    boolean isSpaceOnly(String str) {
        return str.trim().length() == 0;
    }

    SaxEvent getLastEvent() {
        if (this.saxEventList.isEmpty()) {
            return null;
        }
        return this.saxEventList.get(this.saxEventList.size() - 1);
    }

    @Override // org.xml.sax.helpers.DefaultHandler, org.xml.sax.ContentHandler
    public void endElement(String str, String str2, String str3) {
        String str4 = (str3 == null || str3.length() == 0) ? str2 : str3;
        this.saxEventList.add(new EndEvent(str, str2, str3, getLocator()));
        this.globalElementPath.pop();
    }

    String getTagName(String str, String str2) {
        String str3 = str;
        if (str3 == null || str3.length() < 1) {
            str3 = str2;
        }
        return str3;
    }

    @Override // org.xml.sax.helpers.DefaultHandler, org.xml.sax.ErrorHandler
    public void error(SAXParseException sAXParseException) throws SAXException {
        addError("XML_PARSING - Parsing error on line " + sAXParseException.getLineNumber() + " and column " + sAXParseException.getColumnNumber(), sAXParseException);
    }

    @Override // org.xml.sax.helpers.DefaultHandler, org.xml.sax.ErrorHandler
    public void fatalError(SAXParseException sAXParseException) throws SAXException {
        addError("XML_PARSING - Parsing fatal error on line " + sAXParseException.getLineNumber() + " and column " + sAXParseException.getColumnNumber(), sAXParseException);
    }

    @Override // org.xml.sax.helpers.DefaultHandler, org.xml.sax.ErrorHandler
    public void warning(SAXParseException sAXParseException) throws SAXException {
        addWarn("XML_PARSING - Parsing warning on line " + sAXParseException.getLineNumber() + " and column " + sAXParseException.getColumnNumber(), sAXParseException);
    }

    @Override // ch.qos.logback.core.spi.ContextAware
    public void addError(String str) {
        this.cai.addError(str);
    }

    @Override // ch.qos.logback.core.spi.ContextAware
    public void addError(String str, Throwable th) {
        this.cai.addError(str, th);
    }

    @Override // ch.qos.logback.core.spi.ContextAware
    public void addInfo(String str) {
        this.cai.addInfo(str);
    }

    @Override // ch.qos.logback.core.spi.ContextAware
    public void addInfo(String str, Throwable th) {
        this.cai.addInfo(str, th);
    }

    @Override // ch.qos.logback.core.spi.ContextAware
    public void addStatus(Status status) {
        this.cai.addStatus(status);
    }

    @Override // ch.qos.logback.core.spi.ContextAware
    public void addWarn(String str) {
        this.cai.addWarn(str);
    }

    @Override // ch.qos.logback.core.spi.ContextAware
    public void addWarn(String str, Throwable th) {
        this.cai.addWarn(str, th);
    }

    @Override // ch.qos.logback.core.spi.ContextAware
    public Context getContext() {
        return this.cai.getContext();
    }

    @Override // ch.qos.logback.core.spi.ContextAware
    public void setContext(Context context) {
        this.cai.setContext(context);
    }

    public List<SaxEvent> getSaxEventList() {
        return this.saxEventList;
    }
}
