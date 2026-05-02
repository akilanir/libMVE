package com.bea.xml.stream.util;

import java.util.Iterator;
import javax.xml.namespace.NamespaceContext;

/* loaded from: stax-1.2.0.jar:com/bea/xml/stream/util/NamespaceContextImpl.class */
public class NamespaceContextImpl implements NamespaceContext {
    SymbolTable prefixTable;
    SymbolTable uriTable;
    NamespaceContext rootContext;

    public NamespaceContextImpl() {
        this.prefixTable = new SymbolTable();
        this.uriTable = new SymbolTable();
        init();
    }

    public NamespaceContextImpl(NamespaceContext rootContext) {
        this.prefixTable = new SymbolTable();
        this.uriTable = new SymbolTable();
        this.rootContext = null;
        init();
    }

    public void init() {
        bindNamespace("xml", "http://www.w3.org/XML/1998/namespace");
        bindNamespace("xmlns", "http://www.w3.org/XML/1998/namespace");
    }

    public void openScope() {
        this.prefixTable.openScope();
        this.uriTable.openScope();
    }

    public void closeScope() {
        this.prefixTable.closeScope();
        this.uriTable.closeScope();
    }

    public void bindNamespace(String prefix, String uri) {
        this.prefixTable.put(prefix, uri);
        this.uriTable.put(uri, prefix);
    }

    public int getDepth() {
        return this.prefixTable.getDepth();
    }

    @Override // javax.xml.namespace.NamespaceContext
    public String getNamespaceURI(String prefix) {
        String value = this.prefixTable.get(prefix);
        if (value == null && this.rootContext != null) {
            return this.rootContext.getNamespaceURI(prefix);
        }
        return value;
    }

    @Override // javax.xml.namespace.NamespaceContext
    public String getPrefix(String uri) {
        String value = this.uriTable.get(uri);
        if (value == null && this.rootContext != null) {
            return this.rootContext.getPrefix(uri);
        }
        return value;
    }

    public void bindDefaultNameSpace(String uri) {
        bindNamespace("", uri);
    }

    public void unbindDefaultNameSpace() {
        bindNamespace("", null);
    }

    public void unbindNamespace(String prefix, String uri) {
        this.prefixTable.put(prefix, null);
        this.prefixTable.put(uri, null);
    }

    public String getDefaultNameSpace() {
        return getNamespaceURI("");
    }

    @Override // javax.xml.namespace.NamespaceContext
    public Iterator getPrefixes(String uri) {
        return this.uriTable.getAll(uri).iterator();
    }

    public static void main(String[] args) throws Exception {
        NamespaceContextImpl nci = new NamespaceContextImpl();
        nci.openScope();
        nci.bindNamespace("a", "uri");
        nci.bindNamespace("b", "uri");
        System.out.println(new StringBuffer().append("a=").append(nci.getNamespaceURI("a")).toString());
        System.out.println(new StringBuffer().append("uri=").append(nci.getPrefix("uri")).toString());
        Iterator vals = nci.getPrefixes("uri");
        while (vals.hasNext()) {
            System.out.println(new StringBuffer().append("1 uri->").append(vals.next()).toString());
        }
        nci.openScope();
        nci.bindNamespace("a", "uri2");
        Iterator vals2 = nci.getPrefixes("uri");
        while (vals2.hasNext()) {
            System.out.println(new StringBuffer().append("2 uri->").append(vals2.next()).toString());
        }
        nci.closeScope();
        nci.closeScope();
    }
}
