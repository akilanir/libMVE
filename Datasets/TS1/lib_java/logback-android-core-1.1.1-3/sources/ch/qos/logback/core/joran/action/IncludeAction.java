package ch.qos.logback.core.joran.action;

import ch.qos.logback.core.joran.event.SaxEvent;
import ch.qos.logback.core.joran.event.SaxEventRecorder;
import ch.qos.logback.core.joran.spi.InterpretationContext;
import ch.qos.logback.core.joran.spi.JoranException;
import ch.qos.logback.core.joran.util.ConfigurationWatchListUtil;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.List;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/joran/action/IncludeAction.class */
public class IncludeAction extends AbstractIncludeAction {
    private static final String INCLUDED_TAG = "included";
    private static final String CONFIG_TAG = "configuration";
    private int eventOffset = 2;

    protected void setEventOffset(int i) {
        this.eventOffset = i;
    }

    protected SaxEventRecorder createRecorder(InputStream inputStream, URL url) {
        return new SaxEventRecorder(getContext());
    }

    @Override // ch.qos.logback.core.joran.action.AbstractIncludeAction
    protected void processInclude(InterpretationContext interpretationContext, URL url) throws JoranException {
        InputStream openURL = openURL(url);
        try {
            if (openURL != null) {
                try {
                    ConfigurationWatchListUtil.addToWatchList(getContext(), url);
                    SaxEventRecorder createRecorder = createRecorder(openURL, url);
                    createRecorder.setContext(getContext());
                    createRecorder.recordEvents(openURL);
                    trimHeadAndTail(createRecorder);
                    interpretationContext.getJoranInterpreter().getEventPlayer().addEventsDynamically(createRecorder.getSaxEventList(), this.eventOffset);
                } catch (JoranException e) {
                    addError("Failed processing [" + url.toString() + "]", e);
                    close(openURL);
                    return;
                }
            }
            close(openURL);
        } catch (Throwable th) {
            close(openURL);
            throw th;
        }
    }

    private InputStream openURL(URL url) {
        try {
            return url.openStream();
        } catch (IOException e) {
            if (isOptional()) {
                return null;
            }
            addError("Failed to open [" + url.toString() + "]", e);
            return null;
        }
    }

    private void trimHeadAndTail(SaxEventRecorder saxEventRecorder) {
        int i;
        SaxEvent saxEvent;
        List<SaxEvent> saxEventList = saxEventRecorder.getSaxEventList();
        if (saxEventList.size() == 0) {
            return;
        }
        boolean z = false;
        boolean z2 = false;
        SaxEvent saxEvent2 = saxEventList.get(0);
        if (saxEvent2 != null) {
            String eventName = getEventName(saxEvent2);
            z = INCLUDED_TAG.equalsIgnoreCase(eventName);
            z2 = CONFIG_TAG.equalsIgnoreCase(eventName);
        }
        if (z || z2) {
            saxEventList.remove(0);
            int size = saxEventList.size();
            if (size == 0 || (saxEvent = saxEventList.get((i = size - 1))) == null) {
                return;
            }
            String eventName2 = getEventName(saxEvent);
            if ((z && INCLUDED_TAG.equalsIgnoreCase(eventName2)) || (z2 && CONFIG_TAG.equalsIgnoreCase(eventName2))) {
                saxEventList.remove(i);
            }
        }
    }

    private String getEventName(SaxEvent saxEvent) {
        return saxEvent.qName.length() > 0 ? saxEvent.qName : saxEvent.localName;
    }
}
