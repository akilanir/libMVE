package freemarker.ext.dom;

import freemarker.core.Environment;
import freemarker.template.TemplateHashModel;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.utility.StringUtil;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/dom/DocumentModel.class */
class DocumentModel extends NodeModel implements TemplateHashModel {
    private ElementModel rootElement;

    DocumentModel(Document doc) {
        super(doc);
    }

    @Override // freemarker.template.TemplateNodeModel
    public String getNodeName() {
        return "@document";
    }

    @Override // freemarker.ext.dom.NodeModel, freemarker.template.TemplateHashModel
    public TemplateModel get(String key) throws TemplateModelException {
        if (key.equals("*")) {
            return getRootElement();
        }
        if (key.equals("**")) {
            NodeList nl = ((Document) this.node).getElementsByTagName("*");
            return new NodeListModel(nl, this);
        }
        if (StringUtil.isXMLID(key)) {
            ElementModel em = (ElementModel) NodeModel.wrap(((Document) this.node).getDocumentElement());
            if (em.matchesName(key, Environment.getCurrentEnvironment())) {
                return em;
            }
            return new NodeListModel(this);
        }
        return super.get(key);
    }

    ElementModel getRootElement() {
        if (this.rootElement == null) {
            this.rootElement = (ElementModel) wrap(((Document) this.node).getDocumentElement());
        }
        return this.rootElement;
    }

    @Override // freemarker.template.TemplateHashModel
    public boolean isEmpty() {
        return false;
    }
}
