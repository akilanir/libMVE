package com.octo.android.robospice.retrofit;

import android.app.Application;
import com.google.gson.Gson;
import com.octo.android.robospice.persistence.CacheManager;
import com.octo.android.robospice.persistence.exception.CacheCreationException;
import com.octo.android.robospice.persistence.retrofit.GsonRetrofitObjectPersisterFactory;
import java.io.File;
import retrofit.converter.Converter;
import retrofit.converter.GsonConverter;

/* loaded from: robospice-retrofit-1.4.14.jar:com/octo/android/robospice/retrofit/RetrofitGsonSpiceService.class */
public abstract class RetrofitGsonSpiceService extends RetrofitSpiceService {
    public CacheManager createCacheManager(Application application) throws CacheCreationException {
        CacheManager cacheManager = new CacheManager();
        cacheManager.addPersister(new GsonRetrofitObjectPersisterFactory(application, getConverter(), getCacheFolder()));
        return cacheManager;
    }

    @Override // com.octo.android.robospice.retrofit.RetrofitSpiceService
    protected Converter createConverter() {
        return new GsonConverter(new Gson());
    }

    public File getCacheFolder() {
        return null;
    }
}
