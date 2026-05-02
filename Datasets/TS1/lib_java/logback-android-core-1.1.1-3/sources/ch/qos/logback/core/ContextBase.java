package ch.qos.logback.core;

import ch.qos.logback.core.spi.LifeCycle;
import ch.qos.logback.core.spi.LogbackLock;
import ch.qos.logback.core.status.StatusManager;
import ch.qos.logback.core.util.ExecutorServiceUtil;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ExecutorService;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/ContextBase.class */
public class ContextBase implements Context, LifeCycle {
    private String name;
    private volatile ExecutorService executorService;
    private LifeCycleManager lifeCycleManager;
    private boolean started;
    private long birthTime = System.currentTimeMillis();
    private StatusManager sm = new BasicStatusManager();
    Map<String, String> propertyMap = new HashMap();
    Map<String, Object> objectMap = new HashMap();
    LogbackLock configurationLock = new LogbackLock();

    @Override // ch.qos.logback.core.Context
    public StatusManager getStatusManager() {
        return this.sm;
    }

    public void setStatusManager(StatusManager statusManager) {
        if (statusManager == null) {
            throw new IllegalArgumentException("null StatusManager not allowed");
        }
        this.sm = statusManager;
    }

    @Override // ch.qos.logback.core.Context, ch.qos.logback.core.spi.PropertyContainer
    public Map<String, String> getCopyOfPropertyMap() {
        return new HashMap(this.propertyMap);
    }

    @Override // ch.qos.logback.core.Context
    public void putProperty(String str, String str2) {
        this.propertyMap.put(str, str2);
    }

    @Override // ch.qos.logback.core.Context, ch.qos.logback.core.spi.PropertyContainer
    public String getProperty(String str) {
        return CoreConstants.CONTEXT_NAME_KEY.equals(str) ? getName() : this.propertyMap.get(str);
    }

    @Override // ch.qos.logback.core.Context
    public Object getObject(String str) {
        return this.objectMap.get(str);
    }

    @Override // ch.qos.logback.core.Context
    public void putObject(String str, Object obj) {
        this.objectMap.put(str, obj);
    }

    @Override // ch.qos.logback.core.Context
    public String getName() {
        return this.name;
    }

    @Override // ch.qos.logback.core.spi.LifeCycle
    public void start() {
        this.started = true;
    }

    @Override // ch.qos.logback.core.spi.LifeCycle
    public void stop() {
        stopExecutorService();
        this.started = false;
    }

    @Override // ch.qos.logback.core.spi.LifeCycle
    public boolean isStarted() {
        return this.started;
    }

    public void reset() {
        getLifeCycleManager().reset();
        this.propertyMap.clear();
        this.objectMap.clear();
    }

    @Override // ch.qos.logback.core.Context
    public void setName(String str) throws IllegalStateException {
        if (str == null || !str.equals(this.name)) {
            if (this.name != null && !"default".equals(this.name)) {
                throw new IllegalStateException("Context has been already given a name");
            }
            this.name = str;
        }
    }

    @Override // ch.qos.logback.core.Context
    public long getBirthTime() {
        return this.birthTime;
    }

    @Override // ch.qos.logback.core.Context
    public Object getConfigurationLock() {
        return this.configurationLock;
    }

    @Override // ch.qos.logback.core.Context
    public ExecutorService getExecutorService() {
        if (this.executorService == null) {
            synchronized (this) {
                if (this.executorService == null) {
                    this.executorService = ExecutorServiceUtil.newExecutorService();
                }
            }
        }
        return this.executorService;
    }

    private synchronized void stopExecutorService() {
        if (this.executorService != null) {
            ExecutorServiceUtil.shutdown(this.executorService);
            this.executorService = null;
        }
    }

    @Override // ch.qos.logback.core.Context
    public void register(LifeCycle lifeCycle) {
        getLifeCycleManager().register(lifeCycle);
    }

    synchronized LifeCycleManager getLifeCycleManager() {
        if (this.lifeCycleManager == null) {
            this.lifeCycleManager = new LifeCycleManager();
        }
        return this.lifeCycleManager;
    }

    public String toString() {
        return this.name;
    }
}
