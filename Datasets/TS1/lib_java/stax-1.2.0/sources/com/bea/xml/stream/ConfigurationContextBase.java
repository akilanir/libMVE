package com.bea.xml.stream;

import java.util.Enumeration;
import java.util.HashSet;
import java.util.Hashtable;
import javax.xml.stream.XMLReporter;
import javax.xml.stream.XMLResolver;
import javax.xml.stream.util.XMLEventAllocator;

/* loaded from: stax-1.2.0.jar:com/bea/xml/stream/ConfigurationContextBase.class */
public class ConfigurationContextBase {
    static final String REPORT_CDATA = "http://java.sun.com/xml/stream/properties/report-cdata-event";
    private Hashtable features = new Hashtable();
    private static String EVENT_FILTER = "RI_EVENT_FILTER";
    private static String STREAM_FILTER = "RI_STREAM_FILTER";
    private static String NOTATIONS = "javax.xml.stream.notations";
    private static String ENTITIES = "javax.xml.stream.entities";
    private static HashSet supportedFeatures = new HashSet();

    static {
        supportedFeatures.add("javax.xml.stream.isValidating");
        supportedFeatures.add("javax.xml.stream.isCoalescing");
        supportedFeatures.add("javax.xml.stream.isReplacingEntityReferences");
        supportedFeatures.add("javax.xml.stream.isSupportingExternalEntities");
        supportedFeatures.add("javax.xml.stream.isRepairingNamespaces");
        supportedFeatures.add("javax.xml.stream.isNamespaceAware");
        supportedFeatures.add("javax.xml.stream.supportDTD");
        supportedFeatures.add("javax.xml.stream.reporter");
        supportedFeatures.add("javax.xml.stream.resolver");
        supportedFeatures.add("javax.xml.stream.allocator");
        supportedFeatures.add(NOTATIONS);
        supportedFeatures.add(ENTITIES);
        supportedFeatures.add(REPORT_CDATA);
    }

    public ConfigurationContextBase() {
        this.features.put("javax.xml.stream.isValidating", Boolean.FALSE);
        this.features.put("javax.xml.stream.isCoalescing", Boolean.FALSE);
        this.features.put("javax.xml.stream.isReplacingEntityReferences", Boolean.TRUE);
        this.features.put("javax.xml.stream.isSupportingExternalEntities", Boolean.FALSE);
        this.features.put("javax.xml.stream.isNamespaceAware", Boolean.TRUE);
        this.features.put("javax.xml.stream.supportDTD", Boolean.FALSE);
        this.features.put("javax.xml.stream.isRepairingNamespaces", Boolean.FALSE);
    }

    public void setEventAllocator(XMLEventAllocator a) {
        this.features.put("javax.xml.stream.allocator", a);
    }

    public XMLEventAllocator getEventAllocator() {
        return (XMLEventAllocator) this.features.get("javax.xml.stream.allocator");
    }

    public void setProperty(String name, Object feature) {
        if (name.equals("javax.xml.stream.isValidating")) {
            setValidating(((Boolean) feature).booleanValue());
            return;
        }
        if (name.equals("javax.xml.stream.isSupportingExternalEntities")) {
            setSupportExternalEntities(((Boolean) feature).booleanValue());
        } else if (name.equals("javax.xml.stream.isNamespaceAware")) {
            setNamespaceAware(((Boolean) feature).booleanValue());
        } else {
            check(name);
            this.features.put(name, feature);
        }
    }

    public void check(String name) {
        if (!supportedFeatures.contains(name)) {
            throw new IllegalArgumentException(new StringBuffer().append("Unable to access unsupported property ").append(name).toString());
        }
    }

    public Object getProperty(String name) {
        check(name);
        return this.features.get(name);
    }

    public void setXMLReporter(XMLReporter r) {
        this.features.put("javax.xml.stream.reporter", r);
    }

    public XMLReporter getXMLReporter() {
        return (XMLReporter) this.features.get("javax.xml.stream.reporter");
    }

    public void setXMLResolver(XMLResolver r) {
        this.features.put("javax.xml.stream.resolver", r);
    }

    public XMLResolver getXMLResolver() {
        return (XMLResolver) this.features.get("javax.xml.stream.resolver");
    }

    public boolean getBool(String name) {
        check(name);
        Boolean val = (Boolean) this.features.get(name);
        return val.booleanValue();
    }

    public void setBool(String name, boolean val) {
        check(name);
        this.features.put(name, val ? Boolean.TRUE : Boolean.FALSE);
    }

    public void setCoalescing(boolean val) {
        setBool("javax.xml.stream.isCoalescing", val);
    }

    public boolean isCoalescing() {
        return getBool("javax.xml.stream.isCoalescing");
    }

    public void setValidating(boolean val) {
        if (val) {
            throw new IllegalArgumentException("This implementation does not support validation");
        }
    }

    public boolean isValidating() {
        return getBool("javax.xml.stream.isValidating");
    }

    public void setReplacingEntities(boolean val) {
        setBool("javax.xml.stream.isReplacingEntityReferences", val);
    }

    public boolean isReplacingEntities() {
        return getBool("javax.xml.stream.isReplacingEntityReferences");
    }

    public void setSupportExternalEntities(boolean val) {
        if (val) {
            throw new IllegalArgumentException("This implementation does not resolve external entities ");
        }
    }

    public boolean isSupportingExternalEntities() {
        return getBool("javax.xml.stream.isSupportingExternalEntities");
    }

    public void setPrefixDefaulting(boolean val) {
        setBool("javax.xml.stream.isRepairingNamespaces", val);
    }

    public boolean isPrefixDefaulting() {
        return getBool("javax.xml.stream.isRepairingNamespaces");
    }

    public void setNamespaceAware(boolean val) {
        if (!val) {
            throw new IllegalArgumentException("This implementation does not allow disabling namespace processing");
        }
    }

    public boolean isNamespaceAware() {
        return getBool("javax.xml.stream.isNamespaceAware");
    }

    public String getVersion() {
        return "1.0";
    }

    public Enumeration getProperties() {
        return this.features.keys();
    }

    public boolean isPropertySupported(String name) {
        return supportedFeatures.contains(name);
    }
}
