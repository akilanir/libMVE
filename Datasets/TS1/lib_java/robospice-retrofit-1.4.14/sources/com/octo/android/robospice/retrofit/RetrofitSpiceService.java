package com.octo.android.robospice.retrofit;

import com.octo.android.robospice.SpiceService;
import com.octo.android.robospice.request.CachedSpiceRequest;
import com.octo.android.robospice.request.listener.RequestListener;
import com.octo.android.robospice.request.retrofit.RetrofitSpiceRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import retrofit.RestAdapter;
import retrofit.converter.Converter;

/* loaded from: robospice-retrofit-1.4.14.jar:com/octo/android/robospice/retrofit/RetrofitSpiceService.class */
public abstract class RetrofitSpiceService extends SpiceService {
    private RestAdapter.Builder builder;
    private RestAdapter restAdapter;
    private Converter mConverter;
    private Map<Class<?>, Object> retrofitInterfaceToServiceMap = new HashMap();
    protected List<Class<?>> retrofitInterfaceList = new ArrayList();

    protected abstract String getServerUrl();

    protected abstract Converter createConverter();

    public void onCreate() {
        super.onCreate();
        this.builder = createRestAdapterBuilder();
        this.restAdapter = this.builder.build();
    }

    protected RestAdapter.Builder createRestAdapterBuilder() {
        return new RestAdapter.Builder().setEndpoint(getServerUrl()).setConverter(getConverter());
    }

    protected final Converter getConverter() {
        if (this.mConverter == null) {
            this.mConverter = createConverter();
        }
        return this.mConverter;
    }

    protected <T> T getRetrofitService(Class<T> cls) {
        Object obj = this.retrofitInterfaceToServiceMap.get(cls);
        if (obj == null) {
            obj = this.restAdapter.create(cls);
            this.retrofitInterfaceToServiceMap.put(cls, obj);
        }
        return (T) obj;
    }

    public void addRequest(CachedSpiceRequest<?> request, Set<RequestListener<?>> listRequestListener) {
        if (request.getSpiceRequest() instanceof RetrofitSpiceRequest) {
            RetrofitSpiceRequest retrofitSpiceRequest = (RetrofitSpiceRequest) request.getSpiceRequest();
            retrofitSpiceRequest.setService(getRetrofitService(retrofitSpiceRequest.getRetrofitedInterfaceClass()));
        }
        super.addRequest(request, listRequestListener);
    }

    public final List<Class<?>> getRetrofitInterfaceList() {
        return this.retrofitInterfaceList;
    }

    protected void addRetrofitInterface(Class<?> serviceClass) {
        this.retrofitInterfaceList.add(serviceClass);
    }
}
