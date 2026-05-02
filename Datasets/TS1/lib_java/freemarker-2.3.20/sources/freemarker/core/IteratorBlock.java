package freemarker.core;

import freemarker.template.SimpleNumber;
import freemarker.template.TemplateBooleanModel;
import freemarker.template.TemplateCollectionModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelIterator;
import freemarker.template.TemplateSequenceModel;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/IteratorBlock.class */
final class IteratorBlock extends TemplateElement {
    private Expression listSource;
    private String loopVariableName;
    private boolean isForEach;

    IteratorBlock(Expression listExpression, String indexName, TemplateElement nestedBlock, boolean isForEach) {
        this.listSource = listExpression;
        this.loopVariableName = indexName;
        this.isForEach = isForEach;
        this.nestedBlock = nestedBlock;
    }

    @Override // freemarker.core.TemplateElement
    void accept(Environment env) throws TemplateException, IOException {
        TemplateModel baseModel = this.listSource.eval(env);
        if (baseModel == null) {
            if (env.isClassicCompatible()) {
                return;
            } else {
                this.listSource.assertNonNull(baseModel, env);
            }
        }
        env.visitIteratorBlock(new Context(this, baseModel));
    }

    @Override // freemarker.core.TemplateElement
    protected String dump(boolean canonical) {
        StringBuffer buf = new StringBuffer();
        if (canonical) {
            buf.append('<');
        }
        buf.append(getNodeTypeSymbol());
        buf.append(' ');
        if (this.isForEach) {
            buf.append(this.loopVariableName);
            buf.append(" in ");
            buf.append(this.listSource.getCanonicalForm());
        } else {
            buf.append(this.listSource.getCanonicalForm());
            buf.append(" as ");
            buf.append(this.loopVariableName);
        }
        if (canonical) {
            buf.append(">");
            if (this.nestedBlock != null) {
                buf.append(this.nestedBlock.getCanonicalForm());
            }
            buf.append("</");
            buf.append(getNodeTypeSymbol());
            buf.append('>');
        }
        return buf.toString();
    }

    @Override // freemarker.core.TemplateObject
    int getParameterCount() {
        return 2;
    }

    @Override // freemarker.core.TemplateObject
    Object getParameterValue(int idx) {
        switch (idx) {
            case 0:
                return this.listSource;
            case 1:
                return this.loopVariableName;
            default:
                throw new IndexOutOfBoundsException();
        }
    }

    @Override // freemarker.core.TemplateObject
    ParameterRole getParameterRole(int idx) {
        switch (idx) {
            case 0:
                return ParameterRole.LIST_SOURCE;
            case 1:
                return ParameterRole.TARGET_LOOP_VARIABLE;
            default:
                throw new IndexOutOfBoundsException();
        }
    }

    @Override // freemarker.core.TemplateObject
    String getNodeTypeSymbol() {
        return this.isForEach ? "#foreach" : "#list";
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/IteratorBlock$Context.class */
    class Context implements LocalContext {
        private boolean hasNext;
        private TemplateModel loopVar;
        private int index;
        private Collection variableNames = null;
        private TemplateModel list;
        private final IteratorBlock this$0;

        Context(IteratorBlock iteratorBlock, TemplateModel list) {
            this.this$0 = iteratorBlock;
            this.list = list;
        }

        void runLoop(Environment env) throws TemplateException, IOException {
            if (this.list instanceof TemplateCollectionModel) {
                TemplateCollectionModel baseListModel = (TemplateCollectionModel) this.list;
                TemplateModelIterator it = baseListModel.iterator();
                this.hasNext = it.hasNext();
                while (this.hasNext) {
                    this.loopVar = it.next();
                    this.hasNext = it.hasNext();
                    if (this.this$0.nestedBlock != null) {
                        env.visit(this.this$0.nestedBlock);
                    }
                    this.index++;
                }
                return;
            }
            if (this.list instanceof TemplateSequenceModel) {
                TemplateSequenceModel tsm = (TemplateSequenceModel) this.list;
                int size = tsm.size();
                this.index = 0;
                while (this.index < size) {
                    this.loopVar = tsm.get(this.index);
                    this.hasNext = size > this.index + 1;
                    if (this.this$0.nestedBlock != null) {
                        env.visitByHiddingParent(this.this$0.nestedBlock);
                    }
                    this.index++;
                }
                return;
            }
            if (env.isClassicCompatible()) {
                this.loopVar = this.list;
                if (this.this$0.nestedBlock != null) {
                    env.visitByHiddingParent(this.this$0.nestedBlock);
                    return;
                }
                return;
            }
            throw new UnexpectedTypeException(this.this$0.listSource, this.list, "collection or sequence", env);
        }

        @Override // freemarker.core.LocalContext
        public TemplateModel getLocalVariable(String name) {
            if (name.startsWith(this.this$0.loopVariableName)) {
                switch (name.length() - this.this$0.loopVariableName.length()) {
                    case 0:
                        return this.loopVar;
                    case 6:
                        if (name.endsWith("_index")) {
                            return new SimpleNumber(this.index);
                        }
                        return null;
                    case FMParserConstants.ELSE_IF /* 9 */:
                        if (name.endsWith("_has_next")) {
                            return this.hasNext ? TemplateBooleanModel.TRUE : TemplateBooleanModel.FALSE;
                        }
                        return null;
                    default:
                        return null;
                }
            }
            return null;
        }

        @Override // freemarker.core.LocalContext
        public Collection getLocalVariableNames() {
            if (this.variableNames == null) {
                this.variableNames = new ArrayList(3);
                this.variableNames.add(this.this$0.loopVariableName);
                this.variableNames.add(new StringBuffer().append(this.this$0.loopVariableName).append("_index").toString());
                this.variableNames.add(new StringBuffer().append(this.this$0.loopVariableName).append("_has_next").toString());
            }
            return this.variableNames;
        }
    }
}
