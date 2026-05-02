package ch.qos.logback.core.status;

import java.util.List;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/status/StatusManager.class */
public interface StatusManager {
    void add(Status status);

    List<Status> getCopyOfStatusList();

    int getCount();

    void add(StatusListener statusListener);

    boolean addUniquely(StatusListener statusListener, Object obj);

    void remove(StatusListener statusListener);

    void clear();

    List<StatusListener> getCopyOfStatusListenerList();
}
