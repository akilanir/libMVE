package freemarker.ext.dom;

import freemarker.core.Environment;
import freemarker.template.SimpleScalar;
import freemarker.template.Template;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.TemplateScalarModel;
import freemarker.template.TemplateSequenceModel;
import freemarker.template.utility.StringUtil;
import org.w3c.dom.Attr;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/dom/ElementModel.class */
class ElementModel extends NodeModel implements TemplateScalarModel {
    public ElementModel(Element element) {
        super(element);
    }

    @Override // freemarker.template.TemplateHashModel
    public boolean isEmpty() {
        return false;
    }

    @Override // freemarker.ext.dom.NodeModel, freemarker.template.TemplateHashModel
    public TemplateModel get(String key) throws TemplateModelException {
        if (key.equals("*")) {
            NodeListModel ns = new NodeListModel(this);
            TemplateSequenceModel children = getChildNodes();
            for (int i = 0; i < children.size(); i++) {
                NodeModel child = (NodeModel) children.get(i);
                if (child.node.getNodeType() == 1) {
                    ns.add(child);
                }
            }
            return ns;
        }
        if (key.equals("**")) {
            Element elem = (Element) this.node;
            return new NodeListModel(elem.getElementsByTagName("*"), this);
        }
        if (key.startsWith("@")) {
            if (key.equals("@@") || key.equals("@*")) {
                return new NodeListModel(this.node.getAttributes(), this);
            }
            if (key.equals("@@start_tag")) {
                NodeOutputter nodeOutputter = new NodeOutputter(this.node);
                return new SimpleScalar(nodeOutputter.getOpeningTag((Element) this.node));
            }
            if (key.equals("@@end_tag")) {
                NodeOutputter nodeOutputter2 = new NodeOutputter(this.node);
                return new SimpleScalar(nodeOutputter2.getClosingTag((Element) this.node));
            }
            if (key.equals("@@attributes_markup")) {
                StringBuffer buf = new StringBuffer();
                NodeOutputter nu = new NodeOutputter(this.node);
                nu.outputContent(this.node.getAttributes(), buf);
                return new SimpleScalar(buf.toString().trim());
            }
            if (StringUtil.isXMLID(key.substring(1))) {
                Attr att = getAttribute(key.substring(1));
                if (att == null) {
                    return new NodeListModel(this);
                }
                return wrap(att);
            }
        }
        if (StringUtil.isXMLID(key)) {
            NodeListModel result = ((NodeListModel) getChildNodes()).filterByName(key);
            if (result.size() == 1) {
                return result.get(0);
            }
            return result;
        }
        return super.get(key);
    }

    @Override // freemarker.template.TemplateScalarModel
    public String getAsString() throws TemplateModelException {
        NodeList nl = this.node.getChildNodes();
        String result = "";
        for (int i = 0; i < nl.getLength(); i++) {
            Node child = nl.item(i);
            int nodeType = child.getNodeType();
            if (nodeType == 1) {
                String msg = new StringBuffer().append("Only elements with no child elements can be processed as text.\nThis element with name \"").append(this.node.getNodeName()).append("\" has a child element named: ").append(child.getNodeName()).toString();
                throw new TemplateModelException(msg);
            }
            if (nodeType == 3 || nodeType == 4) {
                result = new StringBuffer().append(result).append(child.getNodeValue()).toString();
            }
        }
        return result;
    }

    @Override // freemarker.template.TemplateNodeModel
    public String getNodeName() {
        String result = this.node.getLocalName();
        if (result == null || result.equals("")) {
            result = this.node.getNodeName();
        }
        return result;
    }

    @Override // freemarker.ext.dom.NodeModel
    String getQualifiedName() {
        String prefix;
        String nodeName = getNodeName();
        String nsURI = getNodeNamespace();
        if (nsURI == null || nsURI.length() == 0) {
            return nodeName;
        }
        Environment env = Environment.getCurrentEnvironment();
        String defaultNS = env.getDefaultNS();
        if (defaultNS != null && defaultNS.equals(nsURI)) {
            prefix = Template.DEFAULT_NAMESPACE_PREFIX;
        } else {
            prefix = env.getPrefixForNamespace(nsURI);
        }
        if (prefix == null) {
            return null;
        }
        if (prefix.length() > 0) {
            prefix = new StringBuffer().append(prefix).append(":").toString();
        }
        return new StringBuffer().append(prefix).append(nodeName).toString();
    }

    private Attr getAttribute(String qname) {
        String uri;
        Element element = (Element) this.node;
        Attr result = element.getAttributeNode(qname);
        if (result != null) {
            return result;
        }
        int colonIndex = qname.indexOf(58);
        if (colonIndex > 0) {
            String prefix = qname.substring(0, colonIndex);
            if (prefix.equals(Template.DEFAULT_NAMESPACE_PREFIX)) {
                uri = Environment.getCurrentEnvironment().getDefaultNS();
            } else {
                uri = Environment.getCurrentEnvironment().getNamespaceForPrefix(prefix);
            }
            String localName = qname.substring(1 + colonIndex);
            if (uri != null) {
                result = element.getAttributeNodeNS(uri, localName);
            }
        }
        return result;
    }

    boolean matchesName(String name, Environment env) {
        return StringUtil.matchesName(name, getNodeName(), getNodeNamespace(), env);
    }
}
