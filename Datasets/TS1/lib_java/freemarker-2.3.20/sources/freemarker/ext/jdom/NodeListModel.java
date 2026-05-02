package freemarker.ext.jdom;

import freemarker.core.FMParserConstants;
import freemarker.template.SimpleHash;
import freemarker.template.SimpleScalar;
import freemarker.template.Template;
import freemarker.template.TemplateCollectionModel;
import freemarker.template.TemplateHashModel;
import freemarker.template.TemplateMethodModel;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.TemplateModelIterator;
import freemarker.template.TemplateScalarModel;
import freemarker.template.TemplateSequenceModel;
import freemarker.template.utility.Collections12;
import java.io.FileReader;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.StringWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import org.jaxen.Context;
import org.jaxen.JaxenException;
import org.jaxen.NamespaceContext;
import org.jaxen.jdom.JDOMXPath;
import org.jdom.Attribute;
import org.jdom.CDATA;
import org.jdom.Comment;
import org.jdom.DocType;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.EntityRef;
import org.jdom.Namespace;
import org.jdom.ProcessingInstruction;
import org.jdom.Text;
import org.jdom.input.SAXBuilder;
import org.jdom.output.XMLOutputter;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/jdom/NodeListModel.class */
public class NodeListModel implements TemplateHashModel, TemplateMethodModel, TemplateCollectionModel, TemplateSequenceModel, TemplateScalarModel {
    private static final AttributeXMLOutputter OUTPUT = new AttributeXMLOutputter(null);
    private static final NodeListModel EMPTY = new NodeListModel((List) null, false);
    private static final Map XPATH_CACHE = new WeakHashMap();
    private static final NamedNodeOperator NAMED_CHILDREN_OP = new NamedChildrenOp(null);
    private static final NamedNodeOperator NAMED_ATTRIBUTE_OP = new NamedAttributeOp(null);
    private static final NodeOperator ALL_ATTRIBUTES_OP = new AllAttributesOp(null);
    private static final NodeOperator ALL_CHILDREN_OP = new AllChildrenOp(null);
    private static final Map OPERATIONS = createOperations();
    private static final Map SPECIAL_OPERATIONS = createSpecialOperations();
    private static final int SPECIAL_OPERATION_COPY = 0;
    private static final int SPECIAL_OPERATION_UNIQUE = 1;
    private static final int SPECIAL_OPERATION_FILTER_NAME = 2;
    private static final int SPECIAL_OPERATION_FILTER_TYPE = 3;
    private static final int SPECIAL_OPERATION_QUERY_TYPE = 4;
    private static final int SPECIAL_OPERATION_REGISTER_NAMESPACE = 5;
    private static final int SPECIAL_OPERATION_PLAINTEXT = 6;
    private final List nodes;
    private final Map namespaces;

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/jdom/NodeListModel$NamedNodeOperator.class */
    private interface NamedNodeOperator {
        List operate(Object obj, String str, Namespace namespace) throws TemplateModelException;
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/jdom/NodeListModel$NodeOperator.class */
    private interface NodeOperator {
        List operate(Object obj) throws TemplateModelException;
    }

    NodeListModel(Object x0, Map x1, AnonymousClass1 x2) {
        this(x0, x1);
    }

    public NodeListModel(Document document) {
        this.nodes = document == null ? Collections.EMPTY_LIST : Collections12.singletonList(document);
        this.namespaces = new HashMap();
    }

    public NodeListModel(Element element) {
        this.nodes = element == null ? Collections.EMPTY_LIST : Collections12.singletonList(element);
        this.namespaces = new HashMap();
    }

    private NodeListModel(Object object, Map namespaces) {
        this.nodes = object == null ? Collections.EMPTY_LIST : Collections12.singletonList(object);
        this.namespaces = namespaces;
    }

    public NodeListModel(List nodes) {
        this(nodes, true);
    }

    public NodeListModel(List nodes, boolean copy) {
        this.nodes = (!copy || nodes == null) ? nodes == null ? Collections.EMPTY_LIST : nodes : new ArrayList(nodes);
        this.namespaces = new HashMap();
    }

    private NodeListModel(List nodes, Map namespaces) {
        this.nodes = nodes == null ? Collections.EMPTY_LIST : nodes;
        this.namespaces = namespaces;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final NodeListModel createNodeListModel(List list, Map namespaces) {
        if (list != null && !list.isEmpty()) {
            return list.size() == 1 ? new NodeListModel(list.get(0), namespaces) : new NodeListModel(list, namespaces);
        }
        if (namespaces.isEmpty()) {
            return EMPTY;
        }
        return new NodeListModel(Collections.EMPTY_LIST, namespaces);
    }

    @Override // freemarker.template.TemplateHashModel
    public boolean isEmpty() {
        return this.nodes.isEmpty();
    }

    @Override // freemarker.template.TemplateScalarModel
    public String getAsString() throws TemplateModelException {
        if (isEmpty()) {
            return "";
        }
        StringWriter sw = new StringWriter(this.nodes.size() * 128);
        try {
            for (Object node : this.nodes) {
                if (node instanceof Element) {
                    OUTPUT.output((Element) node, sw);
                } else if (node instanceof Attribute) {
                    OUTPUT.output((Attribute) node, sw);
                } else if (node instanceof String) {
                    sw.write(OUTPUT.escapeElementEntities(node.toString()));
                } else if (node instanceof Text) {
                    OUTPUT.output((Text) node, sw);
                } else if (node instanceof Document) {
                    OUTPUT.output((Document) node, sw);
                } else if (node instanceof ProcessingInstruction) {
                    OUTPUT.output((ProcessingInstruction) node, sw);
                } else if (node instanceof Comment) {
                    OUTPUT.output((Comment) node, sw);
                } else if (node instanceof CDATA) {
                    OUTPUT.output((CDATA) node, sw);
                } else if (node instanceof DocType) {
                    OUTPUT.output((DocType) node, sw);
                } else if (node instanceof EntityRef) {
                    OUTPUT.output((EntityRef) node, sw);
                } else {
                    throw new TemplateModelException(new StringBuffer().append(node.getClass().getName()).append(" is not a core JDOM class").toString());
                }
            }
            return sw.toString();
        } catch (IOException e) {
            throw new TemplateModelException(e.getMessage());
        }
    }

    @Override // freemarker.template.TemplateHashModel
    public TemplateModel get(String key) throws TemplateModelException {
        List list;
        Integer specop;
        NodeListModel nodeListModel;
        if (isEmpty()) {
            return EMPTY;
        }
        if (key == null || key.length() == 0) {
            throw new TemplateModelException(new StringBuffer().append("Invalid key [").append(key).append("]").toString());
        }
        NodeOperator op = null;
        NamedNodeOperator nop = null;
        String name = null;
        switch (key.charAt(0)) {
            case FMParserConstants.END_TRANSFORM /* 42 */:
                if (key.length() == 1) {
                    op = ALL_CHILDREN_OP;
                    break;
                } else {
                    throw new TemplateModelException(new StringBuffer().append("Invalid key [").append(key).append("]").toString());
                }
            case '@':
                if (key.length() != 2 || key.charAt(1) != '*') {
                    nop = NAMED_ATTRIBUTE_OP;
                    name = key.substring(1);
                    break;
                } else {
                    op = ALL_ATTRIBUTES_OP;
                    break;
                }
            case FMParserConstants.LESS_THAN_EQUALS /* 95 */:
            case FMParserConstants.ID /* 120 */:
                op = (NodeOperator) OPERATIONS.get(key);
                if (op == null && (specop = (Integer) SPECIAL_OPERATIONS.get(key)) != null) {
                    switch (specop.intValue()) {
                        case 0:
                            synchronized (this.namespaces) {
                                nodeListModel = new NodeListModel(this.nodes, (Map) ((HashMap) this.namespaces).clone());
                            }
                            return nodeListModel;
                        case 1:
                            return new NodeListModel(removeDuplicates(this.nodes), this.namespaces);
                        case 2:
                            return new NameFilter(this, null);
                        case 3:
                            return new TypeFilter(this, null);
                        case 4:
                            return getType();
                        case 5:
                            return new RegisterNamespace(this, null);
                        case 6:
                            return getPlainText();
                    }
                }
                break;
        }
        if (op == null && nop == null) {
            nop = NAMED_CHILDREN_OP;
            name = key;
        }
        if (op != null) {
            list = evaluateElementOperation(op, this.nodes);
        } else {
            String localName = name;
            Namespace namespace = Namespace.NO_NAMESPACE;
            int colon = name.indexOf(58);
            if (colon != -1) {
                localName = name.substring(colon + 1);
                String nsPrefix = name.substring(0, colon);
                synchronized (this.namespaces) {
                    namespace = (Namespace) this.namespaces.get(nsPrefix);
                }
                if (namespace == null) {
                    if (nsPrefix.equals("xml")) {
                        namespace = Namespace.XML_NAMESPACE;
                    } else {
                        throw new TemplateModelException(new StringBuffer().append("Unregistered namespace prefix '").append(nsPrefix).append("'").toString());
                    }
                }
            }
            list = evaluateNamedElementOperation(nop, localName, namespace, this.nodes);
        }
        return createNodeListModel(list, this.namespaces);
    }

    private TemplateModel getType() {
        char code;
        if (this.nodes.size() == 0) {
            return new SimpleScalar("");
        }
        Object firstNode = this.nodes.get(0);
        if (firstNode instanceof Element) {
            code = 'e';
        } else if ((firstNode instanceof Text) || (firstNode instanceof String)) {
            code = 'x';
        } else if (firstNode instanceof Attribute) {
            code = 'a';
        } else if (firstNode instanceof EntityRef) {
            code = 'n';
        } else if (firstNode instanceof Document) {
            code = 'd';
        } else if (firstNode instanceof DocType) {
            code = 't';
        } else if (firstNode instanceof Comment) {
            code = 'c';
        } else if (firstNode instanceof ProcessingInstruction) {
            code = 'p';
        } else {
            code = '?';
        }
        return new SimpleScalar(new String(new char[]{code}));
    }

    private SimpleScalar getPlainText() throws TemplateModelException {
        List list = evaluateElementOperation((TextOp) OPERATIONS.get("_text"), this.nodes);
        StringBuffer buf = new StringBuffer();
        Iterator it = list.iterator();
        while (it.hasNext()) {
            buf.append(it.next());
        }
        return new SimpleScalar(buf.toString());
    }

    @Override // freemarker.template.TemplateCollectionModel
    public TemplateModelIterator iterator() {
        return new TemplateModelIterator(this) { // from class: freemarker.ext.jdom.NodeListModel.1
            private final Iterator it;
            private final NodeListModel this$0;

            {
                this.this$0 = this;
                this.it = this.this$0.nodes.iterator();
            }

            @Override // freemarker.template.TemplateModelIterator
            public TemplateModel next() {
                if (this.it.hasNext()) {
                    return new NodeListModel(this.it.next(), this.this$0.namespaces, null);
                }
                return null;
            }

            @Override // freemarker.template.TemplateModelIterator
            public boolean hasNext() {
                return this.it.hasNext();
            }
        };
    }

    @Override // freemarker.template.TemplateSequenceModel
    public TemplateModel get(int i) throws TemplateModelException {
        try {
            return new NodeListModel(this.nodes.get(i), this.namespaces);
        } catch (IndexOutOfBoundsException e) {
            throw new TemplateModelException(new StringBuffer().append("Index out of bounds: ").append(e.getMessage()).toString());
        }
    }

    @Override // freemarker.template.TemplateSequenceModel
    public int size() {
        return this.nodes.size();
    }

    @Override // freemarker.template.TemplateMethodModel
    public Object exec(List arguments) throws TemplateModelException {
        JDOMXPathEx xpath;
        if (arguments == null || arguments.size() != 1) {
            throw new TemplateModelException("Exactly one argument required for execute() on NodeTemplate");
        }
        String xpathString = (String) arguments.get(0);
        try {
            synchronized (XPATH_CACHE) {
                xpath = (JDOMXPathEx) XPATH_CACHE.get(xpathString);
                if (xpath == null) {
                    xpath = new JDOMXPathEx(xpathString);
                    XPATH_CACHE.put(xpathString, xpath);
                }
            }
            return createNodeListModel(xpath.selectNodes(this.nodes, this.namespaces), this.namespaces);
        } catch (Exception e) {
            throw new TemplateModelException(new StringBuffer().append("Could not evaulate XPath expression ").append(xpathString).toString(), e);
        }
    }

    public void registerNamespace(String prefix, String uri) {
        synchronized (this.namespaces) {
            this.namespaces.put(prefix, Namespace.getNamespace(prefix, uri));
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/jdom/NodeListModel$AllChildrenOp.class */
    private static final class AllChildrenOp implements NodeOperator {
        private AllChildrenOp() {
        }

        AllChildrenOp(AnonymousClass1 x0) {
            this();
        }

        @Override // freemarker.ext.jdom.NodeListModel.NodeOperator
        public List operate(Object node) {
            if (node instanceof Element) {
                return ((Element) node).getChildren();
            }
            if (node instanceof Document) {
                Element root = ((Document) node).getRootElement();
                return root == null ? Collections.EMPTY_LIST : Collections12.singletonList(root);
            }
            return null;
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/jdom/NodeListModel$NamedChildrenOp.class */
    private static final class NamedChildrenOp implements NamedNodeOperator {
        private NamedChildrenOp() {
        }

        NamedChildrenOp(AnonymousClass1 x0) {
            this();
        }

        @Override // freemarker.ext.jdom.NodeListModel.NamedNodeOperator
        public List operate(Object node, String localName, Namespace namespace) {
            if (node instanceof Element) {
                return ((Element) node).getChildren(localName, namespace);
            }
            if (node instanceof Document) {
                Element root = ((Document) node).getRootElement();
                if (root != null && root.getName().equals(localName) && root.getNamespaceURI().equals(namespace.getURI())) {
                    return Collections12.singletonList(root);
                }
                return Collections.EMPTY_LIST;
            }
            return null;
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/jdom/NodeListModel$AllAttributesOp.class */
    private static final class AllAttributesOp implements NodeOperator {
        private AllAttributesOp() {
        }

        AllAttributesOp(AnonymousClass1 x0) {
            this();
        }

        @Override // freemarker.ext.jdom.NodeListModel.NodeOperator
        public List operate(Object node) {
            if (!(node instanceof Element)) {
                return null;
            }
            return ((Element) node).getAttributes();
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/jdom/NodeListModel$NamedAttributeOp.class */
    private static final class NamedAttributeOp implements NamedNodeOperator {
        private NamedAttributeOp() {
        }

        NamedAttributeOp(AnonymousClass1 x0) {
            this();
        }

        @Override // freemarker.ext.jdom.NodeListModel.NamedNodeOperator
        public List operate(Object node, String localName, Namespace namespace) {
            Attribute attr = null;
            if (node instanceof Element) {
                Element element = (Element) node;
                attr = element.getAttribute(localName, namespace);
            } else if (node instanceof ProcessingInstruction) {
                ProcessingInstruction pi = (ProcessingInstruction) node;
                if ("target".equals(localName)) {
                    attr = new Attribute("target", pi.getTarget());
                } else if ("data".equals(localName)) {
                    attr = new Attribute("data", pi.getData());
                } else {
                    attr = new Attribute(localName, pi.getValue(localName));
                }
            } else if (node instanceof DocType) {
                DocType doctype = (DocType) node;
                if ("publicId".equals(localName)) {
                    attr = new Attribute("publicId", doctype.getPublicID());
                } else if ("systemId".equals(localName)) {
                    attr = new Attribute("systemId", doctype.getSystemID());
                } else if ("elementName".equals(localName)) {
                    attr = new Attribute("elementName", doctype.getElementName());
                }
            } else {
                return null;
            }
            return attr == null ? Collections.EMPTY_LIST : Collections12.singletonList(attr);
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/jdom/NodeListModel$NameOp.class */
    private static final class NameOp implements NodeOperator {
        private NameOp() {
        }

        NameOp(AnonymousClass1 x0) {
            this();
        }

        @Override // freemarker.ext.jdom.NodeListModel.NodeOperator
        public List operate(Object node) {
            if (node instanceof Element) {
                return Collections12.singletonList(((Element) node).getName());
            }
            if (node instanceof Attribute) {
                return Collections12.singletonList(((Attribute) node).getName());
            }
            if (node instanceof EntityRef) {
                return Collections12.singletonList(((EntityRef) node).getName());
            }
            if (node instanceof ProcessingInstruction) {
                return Collections12.singletonList(((ProcessingInstruction) node).getTarget());
            }
            if (node instanceof DocType) {
                return Collections12.singletonList(((DocType) node).getPublicID());
            }
            return null;
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/jdom/NodeListModel$QNameOp.class */
    private static final class QNameOp implements NodeOperator {
        private QNameOp() {
        }

        QNameOp(AnonymousClass1 x0) {
            this();
        }

        @Override // freemarker.ext.jdom.NodeListModel.NodeOperator
        public List operate(Object node) {
            if (node instanceof Element) {
                return Collections12.singletonList(((Element) node).getQualifiedName());
            }
            if (node instanceof Attribute) {
                return Collections12.singletonList(((Attribute) node).getQualifiedName());
            }
            return null;
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/jdom/NodeListModel$NamespaceUriOp.class */
    private static final class NamespaceUriOp implements NodeOperator {
        private NamespaceUriOp() {
        }

        NamespaceUriOp(AnonymousClass1 x0) {
            this();
        }

        @Override // freemarker.ext.jdom.NodeListModel.NodeOperator
        public List operate(Object node) {
            if (node instanceof Element) {
                return Collections12.singletonList(((Element) node).getNamespace().getURI());
            }
            if (node instanceof Attribute) {
                return Collections12.singletonList(((Attribute) node).getNamespace().getURI());
            }
            return null;
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/jdom/NodeListModel$NamespacePrefixOp.class */
    private static final class NamespacePrefixOp implements NodeOperator {
        private NamespacePrefixOp() {
        }

        NamespacePrefixOp(AnonymousClass1 x0) {
            this();
        }

        @Override // freemarker.ext.jdom.NodeListModel.NodeOperator
        public List operate(Object node) {
            if (node instanceof Element) {
                return Collections12.singletonList(((Element) node).getNamespace().getPrefix());
            }
            if (node instanceof Attribute) {
                return Collections12.singletonList(((Attribute) node).getNamespace().getPrefix());
            }
            return null;
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/jdom/NodeListModel$CanonicalNameOp.class */
    private static final class CanonicalNameOp implements NodeOperator {
        private CanonicalNameOp() {
        }

        CanonicalNameOp(AnonymousClass1 x0) {
            this();
        }

        @Override // freemarker.ext.jdom.NodeListModel.NodeOperator
        public List operate(Object node) {
            if (node instanceof Element) {
                Element element = (Element) node;
                return Collections12.singletonList(new StringBuffer().append(element.getNamespace().getURI()).append(element.getName()).toString());
            }
            if (node instanceof Attribute) {
                Attribute attribute = (Attribute) node;
                return Collections12.singletonList(new StringBuffer().append(attribute.getNamespace().getURI()).append(attribute.getName()).toString());
            }
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Element getParent(Object node) {
        if (node instanceof Element) {
            return ((Element) node).getParent();
        }
        if (node instanceof Attribute) {
            return ((Attribute) node).getParent();
        }
        if (node instanceof Text) {
            return ((Text) node).getParent();
        }
        if (node instanceof ProcessingInstruction) {
            return ((ProcessingInstruction) node).getParent();
        }
        if (node instanceof Comment) {
            return ((Comment) node).getParent();
        }
        if (node instanceof EntityRef) {
            return ((EntityRef) node).getParent();
        }
        return null;
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/jdom/NodeListModel$ParentOp.class */
    private static final class ParentOp implements NodeOperator {
        private ParentOp() {
        }

        ParentOp(AnonymousClass1 x0) {
            this();
        }

        @Override // freemarker.ext.jdom.NodeListModel.NodeOperator
        public List operate(Object node) {
            Element parent = NodeListModel.getParent(node);
            return parent == null ? Collections.EMPTY_LIST : Collections12.singletonList(parent);
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/jdom/NodeListModel$AncestorOp.class */
    private static final class AncestorOp implements NodeOperator {
        private AncestorOp() {
        }

        AncestorOp(AnonymousClass1 x0) {
            this();
        }

        @Override // freemarker.ext.jdom.NodeListModel.NodeOperator
        public List operate(Object node) {
            Element parent = NodeListModel.getParent(node);
            if (parent == null) {
                return Collections.EMPTY_LIST;
            }
            LinkedList list = new LinkedList();
            do {
                list.addFirst(parent);
                parent = parent.getParent();
            } while (parent != null);
            return list;
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/jdom/NodeListModel$AncestorOrSelfOp.class */
    private static final class AncestorOrSelfOp implements NodeOperator {
        private AncestorOrSelfOp() {
        }

        AncestorOrSelfOp(AnonymousClass1 x0) {
            this();
        }

        @Override // freemarker.ext.jdom.NodeListModel.NodeOperator
        public List operate(Object node) {
            Element parent = NodeListModel.getParent(node);
            if (parent == null) {
                return Collections12.singletonList(node);
            }
            LinkedList list = new LinkedList();
            list.addFirst(node);
            do {
                list.addFirst(parent);
                parent = parent.getParent();
            } while (parent != null);
            return list;
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/jdom/NodeListModel$DescendantOp.class */
    private static class DescendantOp implements NodeOperator {
        private DescendantOp() {
        }

        DescendantOp(AnonymousClass1 x0) {
            this();
        }

        @Override // freemarker.ext.jdom.NodeListModel.NodeOperator
        public List operate(Object node) {
            LinkedList list = new LinkedList();
            if (node instanceof Element) {
                addChildren((Element) node, list);
            } else if (node instanceof Document) {
                Element root = ((Document) node).getRootElement();
                list.add(root);
                addChildren(root, list);
            } else {
                return null;
            }
            return list;
        }

        private void addChildren(Element element, List list) {
            List<Element> children = element.getChildren();
            for (Element child : children) {
                list.add(child);
                addChildren(child, list);
            }
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/jdom/NodeListModel$DescendantOrSelfOp.class */
    private static final class DescendantOrSelfOp extends DescendantOp {
        private DescendantOrSelfOp() {
            super(null);
        }

        DescendantOrSelfOp(AnonymousClass1 x0) {
            this();
        }

        @Override // freemarker.ext.jdom.NodeListModel.DescendantOp, freemarker.ext.jdom.NodeListModel.NodeOperator
        public List operate(Object node) {
            LinkedList list = (LinkedList) super.operate(node);
            list.addFirst(node);
            return list;
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/jdom/NodeListModel$DocumentOp.class */
    private static final class DocumentOp implements NodeOperator {
        private DocumentOp() {
        }

        DocumentOp(AnonymousClass1 x0) {
            this();
        }

        @Override // freemarker.ext.jdom.NodeListModel.NodeOperator
        public List operate(Object node) {
            Document doc;
            if (node instanceof Element) {
                doc = ((Element) node).getDocument();
            } else if (node instanceof Attribute) {
                Element parent = ((Attribute) node).getParent();
                doc = parent == null ? null : parent.getDocument();
            } else if (node instanceof Text) {
                Element parent2 = ((Text) node).getParent();
                doc = parent2 == null ? null : parent2.getDocument();
            } else if (node instanceof Document) {
                doc = (Document) node;
            } else if (node instanceof ProcessingInstruction) {
                doc = ((ProcessingInstruction) node).getDocument();
            } else if (node instanceof EntityRef) {
                doc = ((EntityRef) node).getDocument();
            } else if (node instanceof Comment) {
                doc = ((Comment) node).getDocument();
            } else {
                return null;
            }
            return doc == null ? Collections.EMPTY_LIST : Collections12.singletonList(doc);
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/jdom/NodeListModel$DocTypeOp.class */
    private static final class DocTypeOp implements NodeOperator {
        private DocTypeOp() {
        }

        DocTypeOp(AnonymousClass1 x0) {
            this();
        }

        @Override // freemarker.ext.jdom.NodeListModel.NodeOperator
        public List operate(Object node) {
            if (node instanceof Document) {
                DocType doctype = ((Document) node).getDocType();
                return doctype == null ? Collections.EMPTY_LIST : Collections12.singletonList(doctype);
            }
            return null;
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/jdom/NodeListModel$ContentOp.class */
    private static final class ContentOp implements NodeOperator {
        private ContentOp() {
        }

        ContentOp(AnonymousClass1 x0) {
            this();
        }

        @Override // freemarker.ext.jdom.NodeListModel.NodeOperator
        public List operate(Object node) {
            if (node instanceof Element) {
                return ((Element) node).getContent();
            }
            if (node instanceof Document) {
                return ((Document) node).getContent();
            }
            return null;
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/jdom/NodeListModel$TextOp.class */
    private static final class TextOp implements NodeOperator {
        private TextOp() {
        }

        TextOp(AnonymousClass1 x0) {
            this();
        }

        @Override // freemarker.ext.jdom.NodeListModel.NodeOperator
        public List operate(Object node) {
            if (node instanceof Element) {
                return Collections12.singletonList(((Element) node).getTextTrim());
            }
            if (node instanceof Attribute) {
                return Collections12.singletonList(((Attribute) node).getValue());
            }
            if (node instanceof CDATA) {
                return Collections12.singletonList(((CDATA) node).getText());
            }
            if (node instanceof Comment) {
                return Collections12.singletonList(((Comment) node).getText());
            }
            if (node instanceof ProcessingInstruction) {
                return Collections12.singletonList(((ProcessingInstruction) node).getData());
            }
            return null;
        }
    }

    private static final List evaluateElementOperation(NodeOperator op, List nodes) throws TemplateModelException {
        int s = nodes.size();
        List[] lists = new List[s];
        int l = 0;
        int i = 0;
        Iterator it = nodes.iterator();
        while (it.hasNext()) {
            List list = op.operate(it.next());
            if (list != null) {
                int i2 = i;
                i++;
                lists[i2] = list;
                l += list.size();
            }
        }
        List retval = new ArrayList(l);
        for (int i3 = 0; i3 < s; i3++) {
            if (lists[i3] != null) {
                retval.addAll(lists[i3]);
            }
        }
        return retval;
    }

    private static final List evaluateNamedElementOperation(NamedNodeOperator op, String localName, Namespace namespace, List nodes) throws TemplateModelException {
        int s = nodes.size();
        List[] lists = new List[s];
        int l = 0;
        int i = 0;
        Iterator it = nodes.iterator();
        while (it.hasNext()) {
            List list = op.operate(it.next(), localName, namespace);
            int i2 = i;
            i++;
            lists[i2] = list;
            l += list.size();
        }
        List retval = new ArrayList(l);
        for (int i3 = 0; i3 < s; i3++) {
            retval.addAll(lists[i3]);
        }
        return retval;
    }

    private static final List removeDuplicates(List list) {
        int s = list.size();
        ArrayList ulist = new ArrayList(s);
        Set set = new HashSet((s * 4) / 3, 0.75f);
        for (Object o : list) {
            if (set.add(o)) {
                ulist.add(o);
            }
        }
        ulist.trimToSize();
        return ulist;
    }

    private static final Map createOperations() {
        Map map = new HashMap();
        map.put("_ancestor", new AncestorOp(null));
        map.put("_ancestorOrSelf", new AncestorOrSelfOp(null));
        map.put("_attributes", ALL_ATTRIBUTES_OP);
        map.put("_children", ALL_CHILDREN_OP);
        map.put("_cname", new CanonicalNameOp(null));
        map.put("_content", new ContentOp(null));
        map.put("_descendant", new DescendantOp(null));
        map.put("_descendantOrSelf", new DescendantOrSelfOp(null));
        map.put("_document", new DocumentOp(null));
        map.put("_doctype", new DocTypeOp(null));
        map.put("_name", new NameOp(null));
        map.put("_nsprefix", new NamespacePrefixOp(null));
        map.put("_nsuri", new NamespaceUriOp(null));
        map.put("_parent", new ParentOp(null));
        map.put("_qname", new QNameOp(null));
        map.put("_text", new TextOp(null));
        return map;
    }

    private static final Map createSpecialOperations() {
        Map map = new HashMap();
        Integer copy = new Integer(0);
        Integer unique = new Integer(1);
        Integer fname = new Integer(2);
        Integer ftype = new Integer(3);
        Integer type = new Integer(4);
        Integer regns = new Integer(5);
        Integer plaintext = new Integer(6);
        map.put("_copy", copy);
        map.put("_unique", unique);
        map.put("_fname", fname);
        map.put("_ftype", ftype);
        map.put("_type", type);
        map.put("_registerNamespace", regns);
        map.put("_plaintext", plaintext);
        map.put("x_copy", copy);
        map.put("x_unique", unique);
        map.put("x_fname", fname);
        map.put("x_ftype", ftype);
        map.put("x_type", type);
        return map;
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/jdom/NodeListModel$RegisterNamespace.class */
    private final class RegisterNamespace implements TemplateMethodModel {
        private final NodeListModel this$0;

        private RegisterNamespace(NodeListModel nodeListModel) {
            this.this$0 = nodeListModel;
        }

        RegisterNamespace(NodeListModel x0, AnonymousClass1 x1) {
            this(x0);
        }

        public boolean isEmpty() {
            return false;
        }

        @Override // freemarker.template.TemplateMethodModel
        public Object exec(List arguments) throws TemplateModelException {
            if (arguments.size() != 2) {
                throw new TemplateModelException("_registerNamespace(prefix, uri) requires two arguments");
            }
            this.this$0.registerNamespace((String) arguments.get(0), (String) arguments.get(1));
            return TemplateScalarModel.EMPTY_STRING;
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/jdom/NodeListModel$NameFilter.class */
    private final class NameFilter implements TemplateMethodModel {
        private final NodeListModel this$0;

        private NameFilter(NodeListModel nodeListModel) {
            this.this$0 = nodeListModel;
        }

        NameFilter(NodeListModel x0, AnonymousClass1 x1) {
            this(x0);
        }

        public boolean isEmpty() {
            return false;
        }

        @Override // freemarker.template.TemplateMethodModel
        public Object exec(List arguments) {
            Set names = new HashSet(arguments);
            List list = new LinkedList(this.this$0.nodes);
            Iterator it = list.iterator();
            while (it.hasNext()) {
                Object node = it.next();
                String name = null;
                if (node instanceof Element) {
                    name = ((Element) node).getName();
                } else if (node instanceof Attribute) {
                    name = ((Attribute) node).getName();
                } else if (node instanceof ProcessingInstruction) {
                    name = ((ProcessingInstruction) node).getTarget();
                } else if (node instanceof EntityRef) {
                    name = ((EntityRef) node).getName();
                } else if (node instanceof DocType) {
                    name = ((DocType) node).getPublicID();
                }
                if (name == null || !names.contains(name)) {
                    it.remove();
                }
            }
            return NodeListModel.createNodeListModel(list, this.this$0.namespaces);
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/jdom/NodeListModel$TypeFilter.class */
    private final class TypeFilter implements TemplateMethodModel {
        private final NodeListModel this$0;

        private TypeFilter(NodeListModel nodeListModel) {
            this.this$0 = nodeListModel;
        }

        TypeFilter(NodeListModel x0, AnonymousClass1 x1) {
            this(x0);
        }

        public boolean isEmpty() {
            return false;
        }

        @Override // freemarker.template.TemplateMethodModel
        public Object exec(List arguments) throws TemplateModelException {
            if (arguments == null || arguments.size() == 0) {
                throw new TemplateModelException("_type expects exactly one argument");
            }
            String arg = (String) arguments.get(0);
            boolean invert = arg.indexOf(33) != -1;
            boolean a = invert != (arg.indexOf(97) == -1);
            boolean c = invert != (arg.indexOf(99) == -1);
            boolean d = invert != (arg.indexOf(100) == -1);
            boolean e = invert != (arg.indexOf(FMParserConstants.DOUBLE_STAR) == -1);
            boolean n = invert != (arg.indexOf(FMParserConstants.COLON) == -1);
            boolean p = invert != (arg.indexOf(FMParserConstants.CLOSE_BRACKET) == -1);
            boolean t = invert != (arg.indexOf(FMParserConstants.CLOSE_BRACE) == -1);
            boolean x = invert != (arg.indexOf(FMParserConstants.ID) == -1);
            LinkedList list = new LinkedList(this.this$0.nodes);
            Iterator it = list.iterator();
            while (it.hasNext()) {
                Object node = it.next();
                if (((node instanceof Element) && e) || (((node instanceof Attribute) && a) || (((node instanceof String) && x) || (((node instanceof Text) && x) || (((node instanceof ProcessingInstruction) && p) || (((node instanceof Comment) && c) || (((node instanceof EntityRef) && n) || (((node instanceof Document) && d) || ((node instanceof DocType) && t))))))))) {
                    it.remove();
                }
            }
            return NodeListModel.createNodeListModel(list, this.this$0.namespaces);
        }
    }

    public static void main(String[] args) throws Exception {
        SAXBuilder builder = new SAXBuilder();
        Document document = builder.build(System.in);
        SimpleHash model = new SimpleHash();
        model.put("document", new NodeListModel(document));
        FileReader fr = new FileReader(args[0]);
        Template template = new Template(args[0], fr);
        Writer w = new OutputStreamWriter(System.out);
        template.process(model, w);
        w.flush();
        w.close();
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/jdom/NodeListModel$AttributeXMLOutputter.class */
    private static final class AttributeXMLOutputter extends XMLOutputter {
        private AttributeXMLOutputter() {
        }

        AttributeXMLOutputter(AnonymousClass1 x0) {
            this();
        }

        public void output(Attribute attribute, Writer out) throws IOException {
            out.write(" ");
            out.write(attribute.getQualifiedName());
            out.write("=");
            out.write("\"");
            out.write(escapeAttributeEntities(attribute.getValue()));
            out.write("\"");
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/jdom/NodeListModel$JDOMXPathEx.class */
    private static final class JDOMXPathEx extends JDOMXPath {
        JDOMXPathEx(String path) throws JaxenException {
            super(path);
        }

        public List selectNodes(Object object, Map namespaces) throws JaxenException {
            Context context = getContext(object);
            context.getContextSupport().setNamespaceContext(new NamespaceContextImpl(namespaces));
            return selectNodesForContext(context);
        }

        /* loaded from: freemarker-2.3.20.jar:freemarker/ext/jdom/NodeListModel$JDOMXPathEx$NamespaceContextImpl.class */
        private static final class NamespaceContextImpl implements NamespaceContext {
            private final Map namespaces;

            NamespaceContextImpl(Map namespaces) {
                this.namespaces = namespaces;
            }

            public String translateNamespacePrefixToUri(String prefix) {
                String uri;
                if (prefix.length() == 0) {
                    return prefix;
                }
                synchronized (this.namespaces) {
                    Namespace ns = (Namespace) this.namespaces.get(prefix);
                    uri = ns == null ? null : ns.getURI();
                }
                return uri;
            }
        }
    }
}
