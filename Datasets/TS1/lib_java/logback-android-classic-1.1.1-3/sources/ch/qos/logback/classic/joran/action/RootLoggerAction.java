package ch.qos.logback.classic.joran.action;

import ch.qos.logback.classic.Level;
import ch.qos.logback.classic.Logger;
import ch.qos.logback.core.joran.action.Action;
import ch.qos.logback.core.joran.spi.InterpretationContext;
import ch.qos.logback.core.util.OptionHelper;
import org.xml.sax.Attributes;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/joran/action/RootLoggerAction.class */
public class RootLoggerAction extends Action {
    Logger root;
    boolean inError = false;

    public void begin(InterpretationContext interpretationContext, String str, Attributes attributes) {
        this.inError = false;
        this.root = this.context.m4getLogger("ROOT");
        String subst = interpretationContext.subst(attributes.getValue(LoggerAction.LEVEL_ATTRIBUTE));
        if (!OptionHelper.isEmpty(subst)) {
            Level level = Level.toLevel(subst);
            addInfo("Setting level of ROOT logger to " + level);
            this.root.setLevel(level);
        }
        interpretationContext.pushObject(this.root);
    }

    public void end(InterpretationContext interpretationContext, String str) {
        if (this.inError) {
            return;
        }
        Object peekObject = interpretationContext.peekObject();
        if (peekObject == this.root) {
            interpretationContext.popObject();
        } else {
            addWarn("The object on the top the of the stack is not the root logger");
            addWarn("It is: " + peekObject);
        }
    }

    public void finish(InterpretationContext interpretationContext) {
    }
}
