package freemarker.ext.dom;

import freemarker.template.TemplateScalarModel;
import org.w3c.dom.CharacterData;
import org.w3c.dom.Comment;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/dom/CharacterDataNodeModel.class */
class CharacterDataNodeModel extends NodeModel implements TemplateScalarModel {
    public CharacterDataNodeModel(CharacterData text) {
        super(text);
    }

    @Override // freemarker.template.TemplateScalarModel
    public String getAsString() {
        return ((CharacterData) this.node).getData();
    }

    @Override // freemarker.template.TemplateNodeModel
    public String getNodeName() {
        return this.node instanceof Comment ? "@comment" : "@text";
    }

    @Override // freemarker.template.TemplateHashModel
    public boolean isEmpty() {
        return true;
    }
}
