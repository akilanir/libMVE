package ch.qos.logback.classic.android;

import brut.androlib.res.decoder.AXmlResourceParser;
import ch.qos.logback.core.joran.event.SaxEvent;
import ch.qos.logback.core.joran.event.SaxEventRecorder;
import ch.qos.logback.core.joran.spi.JoranException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.xml.sax.InputSource;
import org.xml.sax.helpers.AttributesImpl;
import org.xml.sax.helpers.LocatorImpl;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/android/ASaxEventRecorder.class */
public class ASaxEventRecorder extends SaxEventRecorder {
    private int[] holderForStartAndLength = new int[2];
    private StatePassFilter filter = new StatePassFilter(new String[0]);
    private String elemNameToWatch = null;
    private Map<String, String> elemAttrs = null;

    /* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/android/ASaxEventRecorder$StatePassFilter.class */
    static class StatePassFilter {
        private final String[] _states;
        private int _depth = 0;

        public StatePassFilter(String... strArr) {
            this._states = strArr == null ? new String[0] : strArr;
        }

        public boolean checkStart(String str) {
            if (this._depth == this._states.length) {
                return true;
            }
            if (!str.equals(this._states[this._depth])) {
                return false;
            }
            this._depth++;
            return false;
        }

        public boolean checkEnd(String str) {
            if (this._depth <= 0 || !str.equals(this._states[this._depth - 1])) {
                return this._depth == this._states.length;
            }
            this._depth--;
            return false;
        }

        public int size() {
            return this._states.length;
        }

        public int depth() {
            return this._depth;
        }

        public void reset() {
            this._depth = 0;
        }

        public boolean passed() {
            return this._depth == this._states.length;
        }
    }

    public void setFilter(String... strArr) {
        this.filter = new StatePassFilter(strArr);
    }

    public void setAttributeWatch(String str) {
        this.elemNameToWatch = str;
    }

    public Map<String, String> getAttributeWatchValues() {
        return this.elemAttrs;
    }

    public List<SaxEvent> recordEvents(InputSource inputSource) throws JoranException {
        InputStream byteStream = inputSource.getByteStream();
        if (byteStream == null) {
            throw new IllegalArgumentException("Input source must specify an input stream");
        }
        try {
            XmlPullParser aXmlResourceParser = new AXmlResourceParser(byteStream);
            this.elemAttrs = null;
            while (true) {
                int next = aXmlResourceParser.next();
                if (next <= -1) {
                    break;
                }
                if (0 == next) {
                    this.filter.reset();
                    startDocument(aXmlResourceParser);
                } else {
                    if (1 == next) {
                        this.filter.reset();
                        endDocument();
                        break;
                    }
                    if (2 == next) {
                        startElement(aXmlResourceParser);
                    } else if (3 == next) {
                        endElement(aXmlResourceParser);
                    } else if (4 == next) {
                        characters(aXmlResourceParser);
                    }
                }
            }
            return getSaxEventList();
        } catch (Exception e) {
            addError(e.getMessage(), e);
            throw new JoranException("Can't parse Android XML resource", e);
        }
    }

    private void startDocument(XmlPullParser xmlPullParser) {
        super.startDocument();
        super.setDocumentLocator(new LocatorImpl());
    }

    private void characters(XmlPullParser xmlPullParser) {
        if (this.filter.passed()) {
            super.characters(xmlPullParser.getTextCharacters(this.holderForStartAndLength), this.holderForStartAndLength[0], this.holderForStartAndLength[1]);
        }
    }

    private void endElement(XmlPullParser xmlPullParser) {
        String name = xmlPullParser.getName();
        if (this.filter.checkEnd(name)) {
            endElement(xmlPullParser.getNamespace(), name, name);
        }
    }

    private void startElement(XmlPullParser xmlPullParser) {
        String name = xmlPullParser.getName();
        if (this.filter.checkStart(name)) {
            AttributesImpl attributesImpl = new AttributesImpl();
            for (int i = 0; i < xmlPullParser.getAttributeCount(); i++) {
                attributesImpl.addAttribute(xmlPullParser.getAttributeNamespace(i), xmlPullParser.getAttributeName(i), xmlPullParser.getAttributeName(i), xmlPullParser.getAttributeType(i), xmlPullParser.getAttributeValue(i));
            }
            startElement(xmlPullParser.getNamespace(), name, name, attributesImpl);
        }
        checkForWatchedAttributes(xmlPullParser);
    }

    private void checkForWatchedAttributes(XmlPullParser xmlPullParser) {
        if (this.elemNameToWatch != null && this.elemAttrs == null && xmlPullParser.getName().equals(this.elemNameToWatch)) {
            HashMap hashMap = new HashMap();
            for (int i = 0; i < xmlPullParser.getAttributeCount(); i++) {
                String str = "";
                String attributeNamespace = xmlPullParser.getAttributeNamespace(i);
                if (attributeNamespace.length() > 0) {
                    int lastIndexOf = attributeNamespace.lastIndexOf("/");
                    if (lastIndexOf > -1 && lastIndexOf + 1 < attributeNamespace.length()) {
                        attributeNamespace = attributeNamespace.substring(lastIndexOf + 1);
                    }
                    str = attributeNamespace + ":";
                }
                hashMap.put(str + xmlPullParser.getAttributeName(i), xmlPullParser.getAttributeValue(i));
            }
            this.elemAttrs = hashMap;
        }
    }
}
