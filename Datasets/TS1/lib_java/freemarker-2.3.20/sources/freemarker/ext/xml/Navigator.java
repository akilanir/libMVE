package freemarker.ext.xml;

import freemarker.template.TemplateModelException;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import org.jaxen.NamespaceContext;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/xml/Navigator.class */
abstract class Navigator {
    private final Map xpathCache = new WeakHashMap();
    private final Map operators = createOperatorMap();
    private final NodeOperator attributeOperator = getOperator("_attributes");
    private final NodeOperator childrenOperator = getOperator("_children");

    /* renamed from: freemarker.ext.xml.Navigator$1, reason: invalid class name */
    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/xml/Navigator$1.class */
    static class AnonymousClass1 {
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/xml/Navigator$XPathEx.class */
    interface XPathEx {
        List selectNodes(Object obj, NamespaceContext namespaceContext) throws TemplateModelException;
    }

    abstract void getAsString(Object obj, StringWriter stringWriter) throws TemplateModelException;

    abstract XPathEx createXPathEx(String str) throws TemplateModelException;

    abstract void getChildren(Object obj, String str, String str2, List list);

    abstract void getAttributes(Object obj, String str, String str2, List list);

    abstract void getDescendants(Object obj, List list);

    abstract Object getParent(Object obj);

    abstract Object getDocument(Object obj);

    abstract Object getDocumentType(Object obj);

    abstract void getContent(Object obj, List list);

    abstract String getText(Object obj);

    abstract String getLocalName(Object obj);

    abstract String getNamespacePrefix(Object obj);

    abstract String getType(Object obj);

    abstract String getNamespaceUri(Object obj);

    Navigator() {
    }

    NodeOperator getOperator(String key) {
        return (NodeOperator) this.operators.get(key);
    }

    NodeOperator getAttributeOperator() {
        return this.attributeOperator;
    }

    NodeOperator getChildrenOperator() {
        return this.childrenOperator;
    }

    List applyXPath(List nodes, String xpathString, Object namespaces) throws TemplateModelException {
        XPathEx xpath;
        try {
            synchronized (this.xpathCache) {
                xpath = (XPathEx) this.xpathCache.get(xpathString);
                if (xpath == null) {
                    xpath = createXPathEx(xpathString);
                    this.xpathCache.put(xpathString, xpath);
                }
            }
            return xpath.selectNodes(nodes, (NamespaceContext) namespaces);
        } catch (Exception e) {
            throw new TemplateModelException(new StringBuffer().append("Could not evaulate XPath expression ").append(xpathString).toString(), e);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void getAncestors(Object node, List result) {
        while (true) {
            Object parent = getParent(node);
            if (parent != null) {
                result.add(parent);
                node = parent;
            } else {
                return;
            }
        }
    }

    String getQualifiedName(Object node) {
        String lname = getLocalName(node);
        if (lname == null) {
            return null;
        }
        String nsprefix = getNamespacePrefix(node);
        if (nsprefix == null || nsprefix.length() == 0) {
            return lname;
        }
        return new StringBuffer().append(nsprefix).append(":").append(lname).toString();
    }

    boolean equal(String s1, String s2) {
        return s1 == null ? s2 == null : s1.equals(s2);
    }

    private Map createOperatorMap() {
        Map map = new HashMap();
        map.put("_attributes", new AttributesOp(this, null));
        map.put("@*", map.get("_attributes"));
        map.put("_children", new ChildrenOp(this, null));
        map.put("*", map.get("_children"));
        map.put("_descendantOrSelf", new DescendantOrSelfOp(this, null));
        map.put("_descendant", new DescendantOp(this, null));
        map.put("_document", new DocumentOp(this, null));
        map.put("_doctype", new DocumentTypeOp(this, null));
        map.put("_ancestor", new AncestorOp(this, null));
        map.put("_ancestorOrSelf", new AncestorOrSelfOp(this, null));
        map.put("_content", new ContentOp(this, null));
        map.put("_name", new LocalNameOp(this, null));
        map.put("_nsprefix", new NamespacePrefixOp(this, null));
        map.put("_nsuri", new NamespaceUriOp(this, null));
        map.put("_parent", new ParentOp(this, null));
        map.put("_qname", new QualifiedNameOp(this, null));
        map.put("_text", new TextOp(this, null));
        map.put("_type", new TypeOp(this, null));
        return map;
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/xml/Navigator$ChildrenOp.class */
    private class ChildrenOp implements NodeOperator {
        private final Navigator this$0;

        private ChildrenOp(Navigator navigator) {
            this.this$0 = navigator;
        }

        ChildrenOp(Navigator x0, AnonymousClass1 x1) {
            this(x0);
        }

        @Override // freemarker.ext.xml.NodeOperator
        public void process(Object node, String localName, String namespaceUri, List result) {
            this.this$0.getChildren(node, localName, namespaceUri, result);
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/xml/Navigator$AttributesOp.class */
    private class AttributesOp implements NodeOperator {
        private final Navigator this$0;

        private AttributesOp(Navigator navigator) {
            this.this$0 = navigator;
        }

        AttributesOp(Navigator x0, AnonymousClass1 x1) {
            this(x0);
        }

        @Override // freemarker.ext.xml.NodeOperator
        public void process(Object node, String localName, String namespaceUri, List result) {
            this.this$0.getAttributes(node, localName, namespaceUri, result);
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/xml/Navigator$DescendantOrSelfOp.class */
    private class DescendantOrSelfOp implements NodeOperator {
        private final Navigator this$0;

        private DescendantOrSelfOp(Navigator navigator) {
            this.this$0 = navigator;
        }

        DescendantOrSelfOp(Navigator x0, AnonymousClass1 x1) {
            this(x0);
        }

        @Override // freemarker.ext.xml.NodeOperator
        public void process(Object node, String localName, String namespaceUri, List result) {
            result.add(node);
            this.this$0.getDescendants(node, result);
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/xml/Navigator$DescendantOp.class */
    private class DescendantOp implements NodeOperator {
        private final Navigator this$0;

        private DescendantOp(Navigator navigator) {
            this.this$0 = navigator;
        }

        DescendantOp(Navigator x0, AnonymousClass1 x1) {
            this(x0);
        }

        @Override // freemarker.ext.xml.NodeOperator
        public void process(Object node, String localName, String namespaceUri, List result) {
            this.this$0.getDescendants(node, result);
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/xml/Navigator$AncestorOrSelfOp.class */
    private class AncestorOrSelfOp implements NodeOperator {
        private final Navigator this$0;

        private AncestorOrSelfOp(Navigator navigator) {
            this.this$0 = navigator;
        }

        AncestorOrSelfOp(Navigator x0, AnonymousClass1 x1) {
            this(x0);
        }

        @Override // freemarker.ext.xml.NodeOperator
        public void process(Object node, String localName, String namespaceUri, List result) {
            result.add(node);
            this.this$0.getAncestors(node, result);
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/xml/Navigator$AncestorOp.class */
    private class AncestorOp implements NodeOperator {
        private final Navigator this$0;

        private AncestorOp(Navigator navigator) {
            this.this$0 = navigator;
        }

        AncestorOp(Navigator x0, AnonymousClass1 x1) {
            this(x0);
        }

        @Override // freemarker.ext.xml.NodeOperator
        public void process(Object node, String localName, String namespaceUri, List result) {
            this.this$0.getAncestors(node, result);
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/xml/Navigator$ParentOp.class */
    private class ParentOp implements NodeOperator {
        private final Navigator this$0;

        private ParentOp(Navigator navigator) {
            this.this$0 = navigator;
        }

        ParentOp(Navigator x0, AnonymousClass1 x1) {
            this(x0);
        }

        @Override // freemarker.ext.xml.NodeOperator
        public void process(Object node, String localName, String namespaceUri, List result) {
            Object parent = this.this$0.getParent(node);
            if (parent != null) {
                result.add(parent);
            }
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/xml/Navigator$DocumentOp.class */
    private class DocumentOp implements NodeOperator {
        private final Navigator this$0;

        private DocumentOp(Navigator navigator) {
            this.this$0 = navigator;
        }

        DocumentOp(Navigator x0, AnonymousClass1 x1) {
            this(x0);
        }

        @Override // freemarker.ext.xml.NodeOperator
        public void process(Object node, String localName, String namespaceUri, List result) {
            Object document = this.this$0.getDocument(node);
            if (document != null) {
                result.add(document);
            }
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/xml/Navigator$DocumentTypeOp.class */
    private class DocumentTypeOp implements NodeOperator {
        private final Navigator this$0;

        private DocumentTypeOp(Navigator navigator) {
            this.this$0 = navigator;
        }

        DocumentTypeOp(Navigator x0, AnonymousClass1 x1) {
            this(x0);
        }

        @Override // freemarker.ext.xml.NodeOperator
        public void process(Object node, String localName, String namespaceUri, List result) {
            Object documentType = this.this$0.getDocumentType(node);
            if (documentType != null) {
                result.add(documentType);
            }
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/xml/Navigator$ContentOp.class */
    private class ContentOp implements NodeOperator {
        private final Navigator this$0;

        private ContentOp(Navigator navigator) {
            this.this$0 = navigator;
        }

        ContentOp(Navigator x0, AnonymousClass1 x1) {
            this(x0);
        }

        @Override // freemarker.ext.xml.NodeOperator
        public void process(Object node, String localName, String namespaceUri, List result) {
            this.this$0.getContent(node, result);
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/xml/Navigator$TextOp.class */
    private class TextOp implements NodeOperator {
        private final Navigator this$0;

        private TextOp(Navigator navigator) {
            this.this$0 = navigator;
        }

        TextOp(Navigator x0, AnonymousClass1 x1) {
            this(x0);
        }

        @Override // freemarker.ext.xml.NodeOperator
        public void process(Object node, String localName, String namespaceUri, List result) {
            String text = this.this$0.getText(node);
            if (text != null) {
                result.add(text);
            }
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/xml/Navigator$LocalNameOp.class */
    private class LocalNameOp implements NodeOperator {
        private final Navigator this$0;

        private LocalNameOp(Navigator navigator) {
            this.this$0 = navigator;
        }

        LocalNameOp(Navigator x0, AnonymousClass1 x1) {
            this(x0);
        }

        @Override // freemarker.ext.xml.NodeOperator
        public void process(Object node, String localName, String namespaceUri, List result) {
            String text = this.this$0.getLocalName(node);
            if (text != null) {
                result.add(text);
            }
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/xml/Navigator$QualifiedNameOp.class */
    private class QualifiedNameOp implements NodeOperator {
        private final Navigator this$0;

        private QualifiedNameOp(Navigator navigator) {
            this.this$0 = navigator;
        }

        QualifiedNameOp(Navigator x0, AnonymousClass1 x1) {
            this(x0);
        }

        @Override // freemarker.ext.xml.NodeOperator
        public void process(Object node, String localName, String namespaceUri, List result) {
            String qname = this.this$0.getQualifiedName(node);
            if (qname != null) {
                result.add(qname);
            }
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/xml/Navigator$NamespacePrefixOp.class */
    private class NamespacePrefixOp implements NodeOperator {
        private final Navigator this$0;

        private NamespacePrefixOp(Navigator navigator) {
            this.this$0 = navigator;
        }

        NamespacePrefixOp(Navigator x0, AnonymousClass1 x1) {
            this(x0);
        }

        @Override // freemarker.ext.xml.NodeOperator
        public void process(Object node, String localName, String namespaceUri, List result) {
            String text = this.this$0.getNamespacePrefix(node);
            if (text != null) {
                result.add(text);
            }
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/xml/Navigator$NamespaceUriOp.class */
    private class NamespaceUriOp implements NodeOperator {
        private final Navigator this$0;

        private NamespaceUriOp(Navigator navigator) {
            this.this$0 = navigator;
        }

        NamespaceUriOp(Navigator x0, AnonymousClass1 x1) {
            this(x0);
        }

        @Override // freemarker.ext.xml.NodeOperator
        public void process(Object node, String localName, String namespaceUri, List result) {
            String text = this.this$0.getNamespaceUri(node);
            if (text != null) {
                result.add(text);
            }
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/xml/Navigator$TypeOp.class */
    private class TypeOp implements NodeOperator {
        private final Navigator this$0;

        private TypeOp(Navigator navigator) {
            this.this$0 = navigator;
        }

        TypeOp(Navigator x0, AnonymousClass1 x1) {
            this(x0);
        }

        @Override // freemarker.ext.xml.NodeOperator
        public void process(Object node, String localName, String namespaceUri, List result) {
            result.add(this.this$0.getType(node));
        }
    }
}
