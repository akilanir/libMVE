package ch.qos.logback.classic.joran.action;

import ch.qos.logback.classic.Level;
import ch.qos.logback.classic.Logger;
import ch.qos.logback.classic.LoggerContext;
import ch.qos.logback.core.joran.action.Action;
import ch.qos.logback.core.joran.spi.InterpretationContext;
import ch.qos.logback.core.util.OptionHelper;
import org.xml.sax.Attributes;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/joran/action/LoggerAction.class */
public class LoggerAction extends Action {
    public static final String LEVEL_ATTRIBUTE = "level";
    boolean inError = false;
    Logger logger;

    public void begin(InterpretationContext interpretationContext, String str, Attributes attributes) {
        this.inError = false;
        this.logger = null;
        LoggerContext loggerContext = this.context;
        String subst = interpretationContext.subst(attributes.getValue("name"));
        if (OptionHelper.isEmpty(subst)) {
            this.inError = true;
            addError("No 'name' attribute in element " + str + ", around " + getLineColStr(interpretationContext));
            return;
        }
        this.logger = loggerContext.m4getLogger(subst);
        String subst2 = interpretationContext.subst(attributes.getValue(LEVEL_ATTRIBUTE));
        if (!OptionHelper.isEmpty(subst2)) {
            if ("INHERITED".equalsIgnoreCase(subst2) || "NULL".equalsIgnoreCase(subst2)) {
                addInfo("Setting level of logger [" + subst + "] to null, i.e. INHERITED");
                this.logger.setLevel(null);
            } else {
                Level level = Level.toLevel(subst2);
                addInfo("Setting level of logger [" + subst + "] to " + level);
                this.logger.setLevel(level);
            }
        }
        String subst3 = interpretationContext.subst(attributes.getValue("additivity"));
        if (!OptionHelper.isEmpty(subst3)) {
            boolean booleanValue = Boolean.valueOf(subst3).booleanValue();
            addInfo("Setting additivity of logger [" + subst + "] to " + booleanValue);
            this.logger.setAdditive(booleanValue);
        }
        interpretationContext.pushObject(this.logger);
    }

    public void end(InterpretationContext interpretationContext, String str) {
        if (this.inError) {
            return;
        }
        Object peekObject = interpretationContext.peekObject();
        if (peekObject == this.logger) {
            interpretationContext.popObject();
        } else {
            addWarn("The object on the top the of the stack is not " + this.logger + " pushed earlier");
            addWarn("It is: " + peekObject);
        }
    }

    public void finish(InterpretationContext interpretationContext) {
    }
}
