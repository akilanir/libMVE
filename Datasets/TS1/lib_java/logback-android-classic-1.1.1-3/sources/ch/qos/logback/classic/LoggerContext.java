package ch.qos.logback.classic;

import ch.qos.logback.classic.android.AndroidManifestPropertiesUtil;
import ch.qos.logback.classic.spi.LoggerComparator;
import ch.qos.logback.classic.spi.LoggerContextListener;
import ch.qos.logback.classic.spi.LoggerContextVO;
import ch.qos.logback.classic.spi.TurboFilterList;
import ch.qos.logback.classic.turbo.TurboFilter;
import ch.qos.logback.classic.util.LoggerNameUtil;
import ch.qos.logback.core.ContextBase;
import ch.qos.logback.core.joran.spi.JoranException;
import ch.qos.logback.core.spi.FilterReply;
import ch.qos.logback.core.spi.LifeCycle;
import ch.qos.logback.core.status.StatusListener;
import ch.qos.logback.core.status.StatusManager;
import ch.qos.logback.core.status.WarnStatus;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import org.slf4j.ILoggerFactory;
import org.slf4j.Marker;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/LoggerContext.class */
public class LoggerContext extends ContextBase implements ILoggerFactory, LifeCycle {
    private int size;
    private List<String> frameworkPackages;
    private int noAppenderWarning = 0;
    private final List<LoggerContextListener> loggerContextListenerList = new ArrayList();
    private final TurboFilterList turboFilterList = new TurboFilterList();
    private boolean packagingDataEnabled = true;
    private boolean androidPropsInitialized = false;
    private int maxCallerDataDepth = 8;
    int resetCount = 0;
    private Map<String, Logger> loggerCache = new ConcurrentHashMap();
    private LoggerContextVO loggerContextRemoteView = new LoggerContextVO(this);
    final Logger root = new Logger("ROOT", null, this);

    public LoggerContext() {
        this.root.setLevel(Level.DEBUG);
        this.loggerCache.put("ROOT", this.root);
        initEvaluatorMap();
        this.size = 1;
        this.frameworkPackages = new ArrayList();
    }

    void initEvaluatorMap() {
        putObject("EVALUATOR_MAP", new HashMap());
    }

    private void updateLoggerContextVO() {
        this.loggerContextRemoteView = new LoggerContextVO(this);
    }

    private boolean isSpecialKey(String str) {
        return str.equals("PACKAGE_NAME") || str.equals("VERSION_NAME") || str.equals("VERSION_CODE") || str.equals("EXT_DIR") || str.equals("DATA_DIR");
    }

    public String getProperty(String str) {
        if (isSpecialKey(str)) {
            try {
                if (!this.androidPropsInitialized) {
                    this.androidPropsInitialized = true;
                    AndroidManifestPropertiesUtil.setAndroidProperties(this);
                }
            } catch (JoranException e) {
                getStatusManager().add(new WarnStatus("Can't set manifest properties", e));
                this.androidPropsInitialized = false;
            }
        }
        return super.getProperty(str);
    }

    public void putProperty(String str, String str2) {
        super.putProperty(str, str2);
        updateLoggerContextVO();
    }

    public void setName(String str) {
        super.setName(str);
        updateLoggerContextVO();
    }

    public final Logger getLogger(Class cls) {
        return m4getLogger(cls.getName());
    }

    /* renamed from: getLogger, reason: merged with bridge method [inline-methods] */
    public final Logger m4getLogger(String str) {
        int separatorIndexOf;
        Logger childByName;
        if (str == null) {
            throw new IllegalArgumentException("name argument cannot be null");
        }
        if ("ROOT".equalsIgnoreCase(str)) {
            return this.root;
        }
        int i = 0;
        Logger logger = this.root;
        Logger logger2 = this.loggerCache.get(str);
        if (logger2 != null) {
            return logger2;
        }
        do {
            separatorIndexOf = LoggerNameUtil.getSeparatorIndexOf(str, i);
            String substring = separatorIndexOf == -1 ? str : str.substring(0, separatorIndexOf);
            i = separatorIndexOf + 1;
            synchronized (logger) {
                childByName = logger.getChildByName(substring);
                if (childByName == null) {
                    childByName = logger.createChildByName(substring);
                    this.loggerCache.put(substring, childByName);
                    incSize();
                }
            }
            logger = childByName;
        } while (separatorIndexOf != -1);
        return childByName;
    }

    private void incSize() {
        this.size++;
    }

    int size() {
        return this.size;
    }

    public Logger exists(String str) {
        return this.loggerCache.get(str);
    }

    final void noAppenderDefinedWarning(Logger logger) {
        int i = this.noAppenderWarning;
        this.noAppenderWarning = i + 1;
        if (i == 0) {
            getStatusManager().add(new WarnStatus("No appenders present in context [" + getName() + "] for logger [" + logger.getName() + "].", logger));
        }
    }

    public List<Logger> getLoggerList() {
        ArrayList arrayList = new ArrayList(this.loggerCache.values());
        Collections.sort(arrayList, new LoggerComparator());
        return arrayList;
    }

    public LoggerContextVO getLoggerContextRemoteView() {
        return this.loggerContextRemoteView;
    }

    public void setPackagingDataEnabled(boolean z) {
        this.packagingDataEnabled = z;
    }

    public boolean isPackagingDataEnabled() {
        return this.packagingDataEnabled;
    }

    public void reset() {
        this.resetCount++;
        super.reset();
        initEvaluatorMap();
        this.root.recursiveReset();
        resetTurboFilterList();
        fireOnReset();
        resetListenersExceptResetResistant();
        resetStatusListeners();
    }

    private void resetStatusListeners() {
        StatusManager statusManager = getStatusManager();
        Iterator it = statusManager.getCopyOfStatusListenerList().iterator();
        while (it.hasNext()) {
            statusManager.remove((StatusListener) it.next());
        }
    }

    public TurboFilterList getTurboFilterList() {
        return this.turboFilterList;
    }

    public void addTurboFilter(TurboFilter turboFilter) {
        this.turboFilterList.add(turboFilter);
    }

    public void resetTurboFilterList() {
        Iterator<TurboFilter> it = this.turboFilterList.iterator();
        while (it.hasNext()) {
            it.next().stop();
        }
        this.turboFilterList.clear();
    }

    final FilterReply getTurboFilterChainDecision_0_3OrMore(Marker marker, Logger logger, Level level, String str, Object[] objArr, Throwable th) {
        return this.turboFilterList.size() == 0 ? FilterReply.NEUTRAL : this.turboFilterList.getTurboFilterChainDecision(marker, logger, level, str, objArr, th);
    }

    final FilterReply getTurboFilterChainDecision_1(Marker marker, Logger logger, Level level, String str, Object obj, Throwable th) {
        return this.turboFilterList.size() == 0 ? FilterReply.NEUTRAL : this.turboFilterList.getTurboFilterChainDecision(marker, logger, level, str, new Object[]{obj}, th);
    }

    final FilterReply getTurboFilterChainDecision_2(Marker marker, Logger logger, Level level, String str, Object obj, Object obj2, Throwable th) {
        return this.turboFilterList.size() == 0 ? FilterReply.NEUTRAL : this.turboFilterList.getTurboFilterChainDecision(marker, logger, level, str, new Object[]{obj, obj2}, th);
    }

    public void addListener(LoggerContextListener loggerContextListener) {
        this.loggerContextListenerList.add(loggerContextListener);
    }

    public void removeListener(LoggerContextListener loggerContextListener) {
        this.loggerContextListenerList.remove(loggerContextListener);
    }

    private void resetListenersExceptResetResistant() {
        ArrayList arrayList = new ArrayList();
        for (LoggerContextListener loggerContextListener : this.loggerContextListenerList) {
            if (loggerContextListener.isResetResistant()) {
                arrayList.add(loggerContextListener);
            }
        }
        this.loggerContextListenerList.retainAll(arrayList);
    }

    private void resetAllListeners() {
        this.loggerContextListenerList.clear();
    }

    public List<LoggerContextListener> getCopyOfListenerList() {
        return new ArrayList(this.loggerContextListenerList);
    }

    void fireOnLevelChange(Logger logger, Level level) {
        Iterator<LoggerContextListener> it = this.loggerContextListenerList.iterator();
        while (it.hasNext()) {
            it.next().onLevelChange(logger, level);
        }
    }

    private void fireOnReset() {
        Iterator<LoggerContextListener> it = this.loggerContextListenerList.iterator();
        while (it.hasNext()) {
            it.next().onReset(this);
        }
    }

    private void fireOnStart() {
        Iterator<LoggerContextListener> it = this.loggerContextListenerList.iterator();
        while (it.hasNext()) {
            it.next().onStart(this);
        }
    }

    private void fireOnStop() {
        Iterator<LoggerContextListener> it = this.loggerContextListenerList.iterator();
        while (it.hasNext()) {
            it.next().onStop(this);
        }
    }

    public void start() {
        super.start();
        fireOnStart();
    }

    public void stop() {
        reset();
        fireOnStop();
        resetAllListeners();
        super.stop();
    }

    public String toString() {
        return getClass().getName() + "[" + getName() + "]";
    }

    public int getMaxCallerDataDepth() {
        return this.maxCallerDataDepth;
    }

    public void setMaxCallerDataDepth(int i) {
        this.maxCallerDataDepth = i;
    }

    public List<String> getFrameworkPackages() {
        return this.frameworkPackages;
    }
}
