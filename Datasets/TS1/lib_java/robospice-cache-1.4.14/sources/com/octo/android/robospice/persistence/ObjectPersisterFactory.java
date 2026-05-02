package com.octo.android.robospice.persistence;

import android.app.Application;
import com.octo.android.robospice.persistence.exception.CacheCreationException;
import java.util.List;

/* loaded from: robospice-cache-1.4.14.jar:com/octo/android/robospice/persistence/ObjectPersisterFactory.class */
public abstract class ObjectPersisterFactory implements Persister {
    private Application mApplication;
    private boolean isAsyncSaveEnabled;
    private List<Class<?>> listHandledClasses;

    public abstract <DATA> ObjectPersister<DATA> createObjectPersister(Class<DATA> cls) throws CacheCreationException;

    public ObjectPersisterFactory(Application application) {
        this(application, null);
    }

    public ObjectPersisterFactory(Application application, List<Class<?>> listHandledClasses) {
        this.mApplication = application;
        this.listHandledClasses = listHandledClasses;
    }

    protected final Application getApplication() {
        return this.mApplication;
    }

    @Override // com.octo.android.robospice.persistence.Persister
    public boolean canHandleClass(Class<?> clazz) {
        if (this.listHandledClasses == null) {
            return true;
        }
        return this.listHandledClasses.contains(clazz);
    }

    public void setAsyncSaveEnabled(boolean isAsyncSaveEnabled) {
        this.isAsyncSaveEnabled = isAsyncSaveEnabled;
    }

    public boolean isAsyncSaveEnabled() {
        return this.isAsyncSaveEnabled;
    }

    protected List<Class<?>> getListHandledClasses() {
        return this.listHandledClasses;
    }
}
