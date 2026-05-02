package ch.qos.logback.core.joran.action;

import ch.qos.logback.core.Appender;
import ch.qos.logback.core.joran.spi.InterpretationContext;
import ch.qos.logback.core.spi.AppenderAttachable;
import ch.qos.logback.core.util.OptionHelper;
import java.util.HashMap;
import org.xml.sax.Attributes;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/joran/action/AppenderRefAction.class */
public class AppenderRefAction<E> extends Action {
    boolean inError = false;

    @Override // ch.qos.logback.core.joran.action.Action
    public void begin(InterpretationContext interpretationContext, String str, Attributes attributes) {
        this.inError = false;
        Object peekObject = interpretationContext.peekObject();
        if (!(peekObject instanceof AppenderAttachable)) {
            String str2 = "Could not find an AppenderAttachable at the top of execution stack. Near [" + str + "] line " + getLineNumber(interpretationContext);
            this.inError = true;
            addError(str2);
            return;
        }
        AppenderAttachable appenderAttachable = (AppenderAttachable) peekObject;
        String subst = interpretationContext.subst(attributes.getValue(ActionConst.REF_ATTRIBUTE));
        if (OptionHelper.isEmpty(subst)) {
            this.inError = true;
            addError("Missing appender ref attribute in <appender-ref> tag.");
            return;
        }
        Appender<E> appender = (Appender) ((HashMap) interpretationContext.getObjectMap().get(ActionConst.APPENDER_BAG)).get(subst);
        if (appender != null) {
            addInfo("Attaching appender named [" + subst + "] to " + appenderAttachable);
            appenderAttachable.addAppender(appender);
        } else {
            this.inError = true;
            addError("Could not find an appender named [" + subst + "]. Did you define it below instead of above in the configuration file?");
            addError("See http://logback.qos.ch/codes.html#appender_order for more details.");
        }
    }

    @Override // ch.qos.logback.core.joran.action.Action
    public void end(InterpretationContext interpretationContext, String str) {
    }
}
