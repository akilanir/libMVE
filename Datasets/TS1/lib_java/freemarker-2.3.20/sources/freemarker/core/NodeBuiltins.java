package freemarker.core;

import freemarker.template.SimpleScalar;
import freemarker.template.SimpleSequence;
import freemarker.template.TemplateException;
import freemarker.template.TemplateMethodModel;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.TemplateNodeModel;
import freemarker.template.utility.StringUtil;
import java.util.List;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/NodeBuiltins.class */
class NodeBuiltins {

    /* renamed from: freemarker.core.NodeBuiltins$1, reason: invalid class name */
    /* loaded from: freemarker-2.3.20.jar:freemarker/core/NodeBuiltins$1.class */
    static class AnonymousClass1 {
    }

    private NodeBuiltins() {
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/NodeBuiltins$NodeBuiltIn.class */
    private static abstract class NodeBuiltIn extends BuiltIn {
        abstract TemplateModel calculateResult(TemplateNodeModel templateNodeModel, Environment environment) throws TemplateModelException;

        private NodeBuiltIn() {
        }

        NodeBuiltIn(AnonymousClass1 x0) {
            this();
        }

        @Override // freemarker.core.Expression
        TemplateModel _eval(Environment env) throws TemplateException {
            TemplateModel model = this.target.eval(env);
            if (model instanceof TemplateNodeModel) {
                return calculateResult((TemplateNodeModel) model, env);
            }
            throw new UnexpectedTypeException(this.target, model, "node", env);
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/NodeBuiltins$ancestorsBI.class */
    static class ancestorsBI extends NodeBuiltIn {
        ancestorsBI() {
            super(null);
        }

        @Override // freemarker.core.NodeBuiltins.NodeBuiltIn
        TemplateModel calculateResult(TemplateNodeModel nodeModel, Environment env) throws TemplateModelException {
            AncestorSequence result = new AncestorSequence(env);
            TemplateNodeModel parentNode = nodeModel.getParentNode();
            while (true) {
                TemplateNodeModel parent = parentNode;
                if (parent != null) {
                    result.add(parent);
                    parentNode = parent.getParentNode();
                } else {
                    return result;
                }
            }
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/NodeBuiltins$childrenBI.class */
    static class childrenBI extends NodeBuiltIn {
        childrenBI() {
            super(null);
        }

        @Override // freemarker.core.NodeBuiltins.NodeBuiltIn
        TemplateModel calculateResult(TemplateNodeModel nodeModel, Environment env) throws TemplateModelException {
            return nodeModel.getChildNodes();
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/NodeBuiltins$node_nameBI.class */
    static class node_nameBI extends NodeBuiltIn {
        node_nameBI() {
            super(null);
        }

        @Override // freemarker.core.NodeBuiltins.NodeBuiltIn
        TemplateModel calculateResult(TemplateNodeModel nodeModel, Environment env) throws TemplateModelException {
            return new SimpleScalar(nodeModel.getNodeName());
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/NodeBuiltins$node_typeBI.class */
    static class node_typeBI extends NodeBuiltIn {
        node_typeBI() {
            super(null);
        }

        @Override // freemarker.core.NodeBuiltins.NodeBuiltIn
        TemplateModel calculateResult(TemplateNodeModel nodeModel, Environment env) throws TemplateModelException {
            return new SimpleScalar(nodeModel.getNodeType());
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/NodeBuiltins$parentBI.class */
    static class parentBI extends NodeBuiltIn {
        parentBI() {
            super(null);
        }

        @Override // freemarker.core.NodeBuiltins.NodeBuiltIn
        TemplateModel calculateResult(TemplateNodeModel nodeModel, Environment env) throws TemplateModelException {
            return nodeModel.getParentNode();
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/NodeBuiltins$rootBI.class */
    static class rootBI extends NodeBuiltIn {
        rootBI() {
            super(null);
        }

        @Override // freemarker.core.NodeBuiltins.NodeBuiltIn
        TemplateModel calculateResult(TemplateNodeModel nodeModel, Environment env) throws TemplateModelException {
            TemplateNodeModel result = nodeModel;
            TemplateNodeModel parentNode = nodeModel.getParentNode();
            while (true) {
                TemplateNodeModel parent = parentNode;
                if (parent != null) {
                    result = parent;
                    parentNode = result.getParentNode();
                } else {
                    return result;
                }
            }
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/NodeBuiltins$node_namespaceBI.class */
    static class node_namespaceBI extends NodeBuiltIn {
        node_namespaceBI() {
            super(null);
        }

        @Override // freemarker.core.NodeBuiltins.NodeBuiltIn
        TemplateModel calculateResult(TemplateNodeModel nodeModel, Environment env) throws TemplateModelException {
            String nsURI = nodeModel.getNodeNamespace();
            if (nsURI == null) {
                return null;
            }
            return new SimpleScalar(nsURI);
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/NodeBuiltins$AncestorSequence.class */
    static class AncestorSequence extends SimpleSequence implements TemplateMethodModel {
        private Environment env;

        AncestorSequence(Environment env) {
            this.env = env;
        }

        @Override // freemarker.template.TemplateMethodModel
        public Object exec(List names) throws TemplateModelException {
            if (names == null || names.isEmpty()) {
                return this;
            }
            AncestorSequence result = new AncestorSequence(this.env);
            for (int i = 0; i < size(); i++) {
                TemplateNodeModel tnm = (TemplateNodeModel) get(i);
                String nodeName = tnm.getNodeName();
                String nsURI = tnm.getNodeNamespace();
                if (nsURI == null) {
                    if (names.contains(nodeName)) {
                        result.add(tnm);
                    }
                } else {
                    int j = 0;
                    while (true) {
                        if (j >= names.size()) {
                            break;
                        }
                        if (!StringUtil.matchesName((String) names.get(j), nodeName, nsURI, this.env)) {
                            j++;
                        } else {
                            result.add(tnm);
                            break;
                        }
                    }
                }
            }
            return result;
        }
    }
}
