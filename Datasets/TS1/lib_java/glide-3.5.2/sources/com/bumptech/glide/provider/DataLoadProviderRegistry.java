package com.bumptech.glide.provider;

import com.bumptech.glide.util.MultiClassKey;
import java.util.HashMap;
import java.util.Map;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/provider/DataLoadProviderRegistry.class */
public class DataLoadProviderRegistry {
    private static final MultiClassKey GET_KEY = new MultiClassKey();
    private final Map<MultiClassKey, DataLoadProvider<?, ?>> providers = new HashMap();

    public <T, Z> void register(Class<T> dataClass, Class<Z> resourceClass, DataLoadProvider<T, Z> provider) {
        this.providers.put(new MultiClassKey(dataClass, resourceClass), provider);
    }

    public <T, Z> DataLoadProvider<T, Z> get(Class<T> cls, Class<Z> cls2) {
        DataLoadProvider<?, ?> dataLoadProvider;
        synchronized (GET_KEY) {
            GET_KEY.set(cls, cls2);
            dataLoadProvider = this.providers.get(GET_KEY);
        }
        if (dataLoadProvider == null) {
            dataLoadProvider = EmptyDataLoadProvider.get();
        }
        return (DataLoadProvider<T, Z>) dataLoadProvider;
    }
}
