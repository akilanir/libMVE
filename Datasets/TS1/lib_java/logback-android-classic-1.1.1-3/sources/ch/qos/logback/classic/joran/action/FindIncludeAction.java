package ch.qos.logback.classic.joran.action;

import ch.qos.logback.classic.android.ASaxEventRecorder;
import ch.qos.logback.classic.joran.action.ConditionalIncludeAction;
import ch.qos.logback.core.joran.action.IncludeAction;
import ch.qos.logback.core.joran.event.SaxEventRecorder;
import ch.qos.logback.core.joran.spi.ActionException;
import ch.qos.logback.core.joran.spi.InterpretationContext;
import ch.qos.logback.core.joran.spi.JoranException;
import java.io.InputStream;
import java.net.URL;
import org.xml.sax.Attributes;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/joran/action/FindIncludeAction.class */
public class FindIncludeAction extends IncludeAction {
    private static final int EVENT_OFFSET = 1;

    public FindIncludeAction() {
        setEventOffset(1);
    }

    public void begin(InterpretationContext interpretationContext, String str, Attributes attributes) throws ActionException {
    }

    public void end(InterpretationContext interpretationContext, String str) throws ActionException {
        if (interpretationContext.isEmpty() || !(interpretationContext.peekObject() instanceof ConditionalIncludeAction.State)) {
            return;
        }
        URL url = ((ConditionalIncludeAction.State) interpretationContext.popObject()).getUrl();
        if (url == null) {
            addInfo("No paths found from includes");
            return;
        }
        addInfo("Path found [" + url.toString() + "]");
        try {
            processInclude(interpretationContext, url);
        } catch (JoranException e) {
            addError("Failed to process include [" + url.toString() + "]", e);
        }
    }

    protected SaxEventRecorder createRecorder(InputStream inputStream, URL url) {
        SaxEventRecorder saxEventRecorder;
        if (url.toString().endsWith("AndroidManifest.xml")) {
            ASaxEventRecorder aSaxEventRecorder = new ASaxEventRecorder();
            aSaxEventRecorder.setFilter("logback");
            saxEventRecorder = aSaxEventRecorder;
        } else {
            saxEventRecorder = new SaxEventRecorder(getContext());
        }
        return saxEventRecorder;
    }
}
