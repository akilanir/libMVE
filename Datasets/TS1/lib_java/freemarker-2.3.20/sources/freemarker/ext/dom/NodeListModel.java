package freemarker.ext.dom;

import freemarker.core.Environment;
import freemarker.template.ObjectWrapper;
import freemarker.template.SimpleScalar;
import freemarker.template.SimpleSequence;
import freemarker.template.TemplateHashModel;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.TemplateScalarModel;
import freemarker.template.TemplateSequenceModel;
import freemarker.template.utility.StringUtil;
import java.util.ArrayList;
import java.util.List;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/dom/NodeListModel.class */
class NodeListModel extends SimpleSequence implements TemplateHashModel {
    NodeModel contextNode;
    XPathSupport xpathSupport;
    private static ObjectWrapper nodeWrapper = new ObjectWrapper() { // from class: freemarker.ext.dom.NodeListModel.1
        @Override // freemarker.template.ObjectWrapper
        public TemplateModel wrap(Object obj) {
            if (obj instanceof NodeModel) {
                return (NodeModel) obj;
            }
            return NodeModel.wrap((Node) obj);
        }
    };

    NodeListModel(Node node) {
        this(NodeModel.wrap(node));
    }

    NodeListModel(NodeModel contextNode) {
        super(nodeWrapper);
        this.contextNode = contextNode;
    }

    NodeListModel(NodeList nodeList, NodeModel contextNode) {
        super(nodeWrapper);
        for (int i = 0; i < nodeList.getLength(); i++) {
            this.list.add(nodeList.item(i));
        }
        this.contextNode = contextNode;
    }

    NodeListModel(NamedNodeMap nodeList, NodeModel contextNode) {
        super(nodeWrapper);
        for (int i = 0; i < nodeList.getLength(); i++) {
            this.list.add(nodeList.item(i));
        }
        this.contextNode = contextNode;
    }

    NodeListModel(List list, NodeModel contextNode) {
        super(list, nodeWrapper);
        this.contextNode = contextNode;
    }

    NodeListModel filterByName(String name) throws TemplateModelException {
        NodeListModel result = new NodeListModel(this.contextNode);
        int size = size();
        if (size == 0) {
            return result;
        }
        Environment env = Environment.getCurrentEnvironment();
        for (int i = 0; i < size; i++) {
            NodeModel nm = (NodeModel) get(i);
            if ((nm instanceof ElementModel) && ((ElementModel) nm).matchesName(name, env)) {
                result.add(nm);
            }
        }
        return result;
    }

    @Override // freemarker.template.TemplateHashModel
    public boolean isEmpty() {
        return size() == 0;
    }

    @Override // freemarker.template.TemplateHashModel
    public TemplateModel get(String key) throws TemplateModelException {
        if (size() == 1) {
            return ((NodeModel) get(0)).get(key);
        }
        if (key.equals("@@markup") || key.equals("@@nested_markup") || key.equals("@@text")) {
            StringBuffer result = new StringBuffer();
            for (int i = 0; i < size(); i++) {
                TemplateScalarModel textModel = (TemplateScalarModel) ((NodeModel) get(i)).get(key);
                result.append(textModel.getAsString());
            }
            return new SimpleScalar(result.toString());
        }
        if (StringUtil.isXMLID(key) || ((key.startsWith("@") && StringUtil.isXMLID(key.substring(1))) || key.equals("*") || key.equals("**") || key.equals("@@") || key.equals("@*"))) {
            NodeListModel result2 = new NodeListModel(this.contextNode);
            for (int i2 = 0; i2 < size(); i2++) {
                NodeModel nm = (NodeModel) get(i2);
                if (nm instanceof ElementModel) {
                    TemplateSequenceModel tsm = (TemplateSequenceModel) ((ElementModel) nm).get(key);
                    int size = tsm == null ? 0 : tsm.size();
                    for (int j = 0; j < size; j++) {
                        result2.add(tsm.get(j));
                    }
                }
            }
            if (result2.size() == 1) {
                return result2.get(0);
            }
            return result2;
        }
        XPathSupport xps = getXPathSupport();
        if (xps != null) {
            Object context = size() == 0 ? null : rawNodeList();
            return xps.executeQuery(context, key);
        }
        throw new TemplateModelException(new StringBuffer().append("Key: '").append(key).append("' is not legal for a node sequence (").append(getClass().getName()).append("). This node sequence contains ").append(size()).append(" node(s). ").append("Some keys are valid only for node sequences of size 1. ").append("If you use Xalan (instead of Jaxen), XPath expression keys work only with ").append("node lists of size 1.").toString());
    }

    private List rawNodeList() throws TemplateModelException {
        int size = size();
        ArrayList al = new ArrayList(size);
        for (int i = 0; i < size; i++) {
            al.add(((NodeModel) get(i)).node);
        }
        return al;
    }

    XPathSupport getXPathSupport() throws TemplateModelException {
        if (this.xpathSupport == null) {
            if (this.contextNode != null) {
                this.xpathSupport = this.contextNode.getXPathSupport();
            } else if (size() > 0) {
                this.xpathSupport = ((NodeModel) get(0)).getXPathSupport();
            }
        }
        return this.xpathSupport;
    }
}
