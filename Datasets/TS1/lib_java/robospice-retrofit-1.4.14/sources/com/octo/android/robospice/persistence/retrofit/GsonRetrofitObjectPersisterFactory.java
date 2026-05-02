package com.octo.android.robospice.persistence.retrofit;

import android.app.Application;
import com.google.gson.Gson;
import com.octo.android.robospice.persistence.exception.CacheCreationException;
import java.io.File;
import java.util.List;
import retrofit.converter.Converter;
import retrofit.converter.GsonConverter;

/* loaded from: robospice-retrofit-1.4.14.jar:com/octo/android/robospice/persistence/retrofit/GsonRetrofitObjectPersisterFactory.class */
public class GsonRetrofitObjectPersisterFactory extends RetrofitObjectPersisterFactory {
    public GsonRetrofitObjectPersisterFactory(Application application, Converter converter, File cacheFolder) throws CacheCreationException {
        super(application, converter, cacheFolder);
    }

    public GsonRetrofitObjectPersisterFactory(Application application, File cacheFolder) throws CacheCreationException {
        super(application, (Converter) new GsonConverter(new Gson()), cacheFolder);
    }

    public GsonRetrofitObjectPersisterFactory(Application application, List<Class<?>> listHandledClasses, File cacheFolder) throws CacheCreationException {
        super(application, new GsonConverter(new Gson()), listHandledClasses, cacheFolder);
    }

    public GsonRetrofitObjectPersisterFactory(Application application, List<Class<?>> listHandledClasses) throws CacheCreationException {
        super(application, (Converter) new GsonConverter(new Gson()), listHandledClasses);
    }

    public GsonRetrofitObjectPersisterFactory(Application application) throws CacheCreationException {
        super(application, new GsonConverter(new Gson()));
    }
}
