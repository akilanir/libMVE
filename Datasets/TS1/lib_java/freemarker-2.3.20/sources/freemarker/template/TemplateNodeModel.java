package freemarker.template;

/* loaded from: freemarker-2.3.20.jar:freemarker/template/TemplateNodeModel.class */
public interface TemplateNodeModel extends TemplateModel {
    TemplateNodeModel getParentNode() throws TemplateModelException;

    TemplateSequenceModel getChildNodes() throws TemplateModelException;

    String getNodeName() throws TemplateModelException;

    String getNodeType() throws TemplateModelException;

    String getNodeNamespace() throws TemplateModelException;
}
