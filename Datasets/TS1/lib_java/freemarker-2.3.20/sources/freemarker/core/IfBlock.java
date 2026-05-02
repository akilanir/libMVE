package freemarker.core;

import freemarker.template.TemplateException;
import java.io.IOException;
import java.util.ArrayList;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/IfBlock.class */
final class IfBlock extends TemplateElement {
    IfBlock(ConditionalBlock block) {
        this.nestedElements = new ArrayList();
        addBlock(block);
    }

    void addBlock(ConditionalBlock block) {
        this.nestedElements.add(block);
    }

    @Override // freemarker.core.TemplateElement
    void accept(Environment env) throws TemplateException, IOException {
        for (int i = 0; i < this.nestedElements.size(); i++) {
            ConditionalBlock cblock = (ConditionalBlock) this.nestedElements.get(i);
            Expression condition = cblock.condition;
            env.replaceElemetStackTop(cblock);
            if (condition == null || condition.evalToBoolean(env)) {
                if (cblock.nestedBlock != null) {
                    env.visit(cblock.nestedBlock);
                    return;
                }
                return;
            }
        }
    }

    @Override // freemarker.core.TemplateElement
    TemplateElement postParseCleanup(boolean stripWhitespace) throws ParseException {
        if (this.nestedElements.size() == 1) {
            ConditionalBlock conditionalBlock = (ConditionalBlock) this.nestedElements.get(0);
            conditionalBlock.isLonelyIf = true;
            conditionalBlock.setLocation(getTemplate(), conditionalBlock, this);
            return conditionalBlock.postParseCleanup(stripWhitespace);
        }
        return super.postParseCleanup(stripWhitespace);
    }

    @Override // freemarker.core.TemplateElement
    protected String dump(boolean canonical) {
        if (canonical) {
            StringBuffer buf = new StringBuffer();
            for (int i = 0; i < this.nestedElements.size(); i++) {
                ConditionalBlock cblock = (ConditionalBlock) this.nestedElements.get(i);
                buf.append(cblock.dump(canonical));
            }
            buf.append("</#if>");
            return buf.toString();
        }
        return getNodeTypeSymbol();
    }

    @Override // freemarker.core.TemplateObject
    String getNodeTypeSymbol() {
        return "#if-#elseif-#else-container";
    }

    @Override // freemarker.core.TemplateObject
    int getParameterCount() {
        return 0;
    }

    @Override // freemarker.core.TemplateObject
    Object getParameterValue(int idx) {
        throw new IndexOutOfBoundsException();
    }

    @Override // freemarker.core.TemplateObject
    ParameterRole getParameterRole(int idx) {
        throw new IndexOutOfBoundsException();
    }

    @Override // freemarker.core.TemplateElement
    boolean isShownInStackTrace() {
        return false;
    }
}
