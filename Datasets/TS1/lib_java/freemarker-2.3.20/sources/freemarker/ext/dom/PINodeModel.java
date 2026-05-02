package freemarker.ext.dom;

import freemarker.template.TemplateScalarModel;
import org.w3c.dom.ProcessingInstruction;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/dom/PINodeModel.class */
class PINodeModel extends NodeModel implements TemplateScalarModel {
    public PINodeModel(ProcessingInstruction pi) {
        super(pi);
    }

    @Override // freemarker.template.TemplateScalarModel
    public String getAsString() {
        return ((ProcessingInstruction) this.node).getData();
    }

    @Override // freemarker.template.TemplateNodeModel
    public String getNodeName() {
        return new StringBuffer().append("@pi$").append(((ProcessingInstruction) this.node).getTarget()).toString();
    }

    @Override // freemarker.template.TemplateHashModel
    public boolean isEmpty() {
        return true;
    }
}
