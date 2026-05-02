package com.octo.android.robospice.retrofit;

import android.app.Application;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.octo.android.robospice.persistence.CacheManager;
import com.octo.android.robospice.persistence.exception.CacheCreationException;
import com.octo.android.robospice.persistence.retrofit.RetrofitObjectPersisterFactory;
import java.io.File;
import retrofit.converter.Converter;
import retrofit.converter.JacksonConverter;

/* loaded from: robospice-retrofit-1.4.14.jar:com/octo/android/robospice/retrofit/RetrofitJackson2SpiceService.class */
public abstract class RetrofitJackson2SpiceService extends RetrofitSpiceService {
    public CacheManager createCacheManager(Application application) throws CacheCreationException {
        CacheManager cacheManager = new CacheManager();
        cacheManager.addPersister(new RetrofitObjectPersisterFactory(application, getConverter(), getCacheFolder()));
        return cacheManager;
    }

    @Override // com.octo.android.robospice.retrofit.RetrofitSpiceService
    protected Converter createConverter() {
        return new JacksonConverter(new ObjectMapper());
    }

    public File getCacheFolder() {
        return null;
    }
}
