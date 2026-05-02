package com.octo.android.robospice.request.retrofit;

import com.octo.android.robospice.request.SpiceRequest;

/* loaded from: robospice-retrofit-1.4.14.jar:com/octo/android/robospice/request/retrofit/RetrofitSpiceRequest.class */
public abstract class RetrofitSpiceRequest<T, R> extends SpiceRequest<T> {
    private Class<R> retrofitedInterfaceClass;
    private R service;

    public RetrofitSpiceRequest(Class<T> clazz, Class<R> retrofitedInterfaceClass) {
        super(clazz);
        this.retrofitedInterfaceClass = retrofitedInterfaceClass;
    }

    public Class<R> getRetrofitedInterfaceClass() {
        return this.retrofitedInterfaceClass;
    }

    public void setService(R service) {
        this.service = service;
    }

    public R getService() {
        return this.service;
    }
}
