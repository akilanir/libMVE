package ch.qos.logback.core.sift;

import ch.qos.logback.core.Appender;
import ch.qos.logback.core.Context;
import ch.qos.logback.core.joran.event.SaxEvent;
import ch.qos.logback.core.joran.spi.JoranException;
import java.util.List;
import java.util.Map;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/sift/AbstractAppenderFactoryUsingJoran.class */
public abstract class AbstractAppenderFactoryUsingJoran<E> implements AppenderFactory<E> {
    final List<SaxEvent> eventList;
    protected String key;
    protected Map<String, String> parentPropertyMap;

    protected AbstractAppenderFactoryUsingJoran(List<SaxEvent> list, String str, Map<String, String> map) {
        this.eventList = removeSiftElement(list);
        this.key = str;
        this.parentPropertyMap = map;
    }

    List<SaxEvent> removeSiftElement(List<SaxEvent> list) {
        return list.subList(1, list.size() - 1);
    }

    public abstract SiftingJoranConfiguratorBase<E> getSiftingJoranConfigurator(String str);

    @Override // ch.qos.logback.core.sift.AppenderFactory
    public Appender<E> buildAppender(Context context, String str) throws JoranException {
        SiftingJoranConfiguratorBase<E> siftingJoranConfigurator = getSiftingJoranConfigurator(str);
        siftingJoranConfigurator.setContext(context);
        siftingJoranConfigurator.doConfigure(this.eventList);
        return siftingJoranConfigurator.getAppender();
    }

    public List<SaxEvent> getEventList() {
        return this.eventList;
    }
}
