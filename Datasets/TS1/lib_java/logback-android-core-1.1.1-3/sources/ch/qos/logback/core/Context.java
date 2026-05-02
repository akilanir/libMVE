package ch.qos.logback.core;

import ch.qos.logback.core.spi.LifeCycle;
import ch.qos.logback.core.spi.PropertyContainer;
import ch.qos.logback.core.status.StatusManager;
import java.util.Map;
import java.util.concurrent.ExecutorService;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/Context.class */
public interface Context extends PropertyContainer {
    StatusManager getStatusManager();

    Object getObject(String str);

    void putObject(String str, Object obj);

    @Override // ch.qos.logback.core.spi.PropertyContainer
    String getProperty(String str);

    void putProperty(String str, String str2);

    @Override // ch.qos.logback.core.spi.PropertyContainer
    Map<String, String> getCopyOfPropertyMap();

    String getName();

    void setName(String str);

    long getBirthTime();

    Object getConfigurationLock();

    ExecutorService getExecutorService();

    void register(LifeCycle lifeCycle);
}
