package ch.qos.logback.classic.joran.action;

import ch.qos.logback.classic.Level;
import ch.qos.logback.classic.Logger;
import ch.qos.logback.core.joran.action.Action;
import ch.qos.logback.core.joran.spi.InterpretationContext;
import org.xml.sax.Attributes;

@Deprecated
/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/joran/action/LevelAction.class */
public class LevelAction extends Action {
    boolean inError = false;

    public void begin(InterpretationContext interpretationContext, String str, Attributes attributes) {
        Object peekObject = interpretationContext.peekObject();
        if (!(peekObject instanceof Logger)) {
            this.inError = true;
            addError("For element <level>, could not find a logger at the top of execution stack.");
            return;
        }
        Logger logger = (Logger) peekObject;
        String name = logger.getName();
        String subst = interpretationContext.subst(attributes.getValue("value"));
        if ("INHERITED".equalsIgnoreCase(subst) || "NULL".equalsIgnoreCase(subst)) {
            logger.setLevel(null);
        } else {
            logger.setLevel(Level.toLevel(subst, Level.DEBUG));
        }
        addInfo(name + " level set to " + logger.getLevel());
    }

    public void finish(InterpretationContext interpretationContext) {
    }

    public void end(InterpretationContext interpretationContext, String str) {
    }
}
