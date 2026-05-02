package com.octo.android.robospice.persistence.retrofit;

import android.app.Application;
import com.octo.android.robospice.persistence.exception.CacheCreationException;
import com.octo.android.robospice.persistence.file.InFileObjectPersister;
import com.octo.android.robospice.persistence.file.InFileObjectPersisterFactory;
import java.io.File;
import java.util.List;
import retrofit.converter.Converter;

/* loaded from: robospice-retrofit-1.4.14.jar:com/octo/android/robospice/persistence/retrofit/RetrofitObjectPersisterFactory.class */
public class RetrofitObjectPersisterFactory extends InFileObjectPersisterFactory {
    private Converter converter;

    public RetrofitObjectPersisterFactory(Application application, Converter converter, File cacheFolder) throws CacheCreationException {
        this(application, converter, null, cacheFolder);
    }

    public RetrofitObjectPersisterFactory(Application application, Converter converter, List<Class<?>> listHandledClasses, File cacheFolder) throws CacheCreationException {
        super(application, listHandledClasses, cacheFolder);
        this.converter = converter;
    }

    public RetrofitObjectPersisterFactory(Application application, Converter converter) throws CacheCreationException {
        this(application, converter, null, null);
    }

    public RetrofitObjectPersisterFactory(Application application, Converter converter, List<Class<?>> listHandledClasses) throws CacheCreationException {
        this(application, converter, listHandledClasses, null);
    }

    public <DATA> InFileObjectPersister<DATA> createInFileObjectPersister(Class<DATA> clazz, File cacheFolder) throws CacheCreationException {
        return new RetrofitObjectPersister(getApplication(), this.converter, clazz, cacheFolder);
    }
}
