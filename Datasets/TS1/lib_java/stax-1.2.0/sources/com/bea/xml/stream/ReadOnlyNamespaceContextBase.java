package com.bea.xml.stream;

import java.io.FileReader;
import java.util.HashSet;
import java.util.Iterator;
import javax.xml.namespace.NamespaceContext;

/* loaded from: stax-1.2.0.jar:com/bea/xml/stream/ReadOnlyNamespaceContextBase.class */
public class ReadOnlyNamespaceContextBase implements NamespaceContext {
    private String[] prefixes;
    private String[] uris;

    public ReadOnlyNamespaceContextBase(String[] prefixArray, String[] uriArray, int size) {
        this.prefixes = new String[size];
        this.uris = new String[size];
        System.arraycopy(prefixArray, 0, this.prefixes, 0, this.prefixes.length);
        System.arraycopy(uriArray, 0, this.uris, 0, this.uris.length);
    }

    @Override // javax.xml.namespace.NamespaceContext
    public String getNamespaceURI(String prefix) {
        if (prefix == null) {
            throw new IllegalArgumentException("Prefix may not be null.");
        }
        if (prefix.length() > 0) {
            for (int i = this.uris.length - 1; i >= 0; i--) {
                if (prefix.equals(this.prefixes[i])) {
                    return this.uris[i];
                }
            }
            if ("xml".equals(prefix)) {
                return "http://www.w3.org/XML/1998/namespace";
            }
            if ("xmlns".equals(prefix)) {
                return "http://www.w3.org/2000/xmlns/";
            }
            return null;
        }
        for (int i2 = this.uris.length - 1; i2 >= 0; i2--) {
            if (this.prefixes[i2] == null) {
                return this.uris[i2];
            }
        }
        return null;
    }

    @Override // javax.xml.namespace.NamespaceContext
    public String getPrefix(String uri) {
        if (uri == null) {
            throw new IllegalArgumentException("uri may not be null");
        }
        if (uri.length() == 0) {
            throw new IllegalArgumentException("uri may not be empty string");
        }
        for (int i = this.uris.length - 1; i >= 0; i--) {
            if (uri.equals(this.uris[i])) {
                String prefix = this.prefixes[i];
                if (prefix == null) {
                    for (int j = this.uris.length - 1; j > i; j--) {
                        if (this.prefixes[j] == null) {
                            break;
                        }
                    }
                    return "";
                }
                for (int j2 = this.uris.length - 1; j2 > i; j2--) {
                    if (prefix.equals(this.prefixes[j2])) {
                        break;
                    }
                }
                return prefix;
            }
        }
        if ("http://www.w3.org/XML/1998/namespace".equals(uri)) {
            return "xml";
        }
        if ("http://www.w3.org/2000/xmlns/".equals(uri)) {
            return "xmlns";
        }
        return null;
    }

    public String getDefaultNameSpace() {
        for (int i = this.uris.length - 1; i >= 0; i--) {
            if (this.prefixes[i] == null) {
                return this.uris[i];
            }
        }
        return null;
    }

    private String checkNull(String s) {
        return s == null ? "" : s;
    }

    @Override // javax.xml.namespace.NamespaceContext
    public Iterator getPrefixes(String uri) {
        if (uri == null) {
            throw new IllegalArgumentException("uri may not be null");
        }
        if ("".equals(uri)) {
            throw new IllegalArgumentException("uri may not be empty string");
        }
        HashSet s = new HashSet();
        for (int i = this.uris.length - 1; i >= 0; i--) {
            String prefix = checkNull(this.prefixes[i]);
            if (uri.equals(this.uris[i]) && !s.contains(prefix)) {
                if (prefix.length() == 0) {
                    for (int j = this.uris.length - 1; j > i; j--) {
                        if (this.prefixes[j] == null) {
                            break;
                        }
                    }
                    s.add(prefix);
                } else {
                    for (int j2 = this.uris.length - 1; j2 > i; j2--) {
                        if (prefix.equals(this.prefixes[j2])) {
                            break;
                        }
                    }
                    s.add(prefix);
                }
            }
        }
        return s.iterator();
    }

    public String toString() {
        StringBuffer b = new StringBuffer();
        for (int i = 0; i < this.uris.length; i++) {
            b.append(new StringBuffer().append("[").append(checkNull(this.prefixes[i])).append("<->").append(this.uris[i]).append("]").toString());
        }
        return b.toString();
    }

    public static void main(String[] args) throws Exception {
        MXParser p = new MXParser();
        p.setInput(new FileReader(args[0]));
        while (p.hasNext()) {
            if (p.isStartElement()) {
                System.out.println(new StringBuffer().append("context[").append(p.getNamespaceContext()).append("]").toString());
                Iterator i = p.getNamespaceContext().getPrefixes("a");
                while (i.hasNext()) {
                    System.out.println(new StringBuffer().append("Found prefix:").append(i.next()).toString());
                }
            }
            p.next();
        }
    }
}
