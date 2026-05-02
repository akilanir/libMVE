package retrofit;

import java.io.IOException;
import java.lang.annotation.Annotation;
import java.lang.reflect.Type;
import java.util.concurrent.Executor;
import retrofit.CallAdapter;

/* loaded from: retrofit-2.0.0-beta2.jar:retrofit/ExecutorCallAdapterFactory.class */
final class ExecutorCallAdapterFactory implements CallAdapter.Factory {
    private final Executor callbackExecutor;

    ExecutorCallAdapterFactory(Executor callbackExecutor) {
        this.callbackExecutor = callbackExecutor;
    }

    @Override // retrofit.CallAdapter.Factory
    public CallAdapter<Call<?>> get(Type returnType, Annotation[] annotations, Retrofit retrofit2) {
        if (Utils.getRawType(returnType) != Call.class) {
            return null;
        }
        final Type responseType = Utils.getCallResponseType(returnType);
        return new CallAdapter<Call<?>>() { // from class: retrofit.ExecutorCallAdapterFactory.1
            @Override // retrofit.CallAdapter
            public Type responseType() {
                return responseType;
            }

            @Override // retrofit.CallAdapter
            /* renamed from: adapt */
            public <R> Call<?> adapt2(Call<R> call) {
                return new ExecutorCallbackCall(ExecutorCallAdapterFactory.this.callbackExecutor, call);
            }
        };
    }

    /* loaded from: retrofit-2.0.0-beta2.jar:retrofit/ExecutorCallAdapterFactory$ExecutorCallbackCall.class */
    static final class ExecutorCallbackCall<T> implements Call<T> {
        private final Executor callbackExecutor;
        private final Call<T> delegate;

        ExecutorCallbackCall(Executor callbackExecutor, Call<T> delegate) {
            this.callbackExecutor = callbackExecutor;
            this.delegate = delegate;
        }

        @Override // retrofit.Call
        public void enqueue(Callback<T> callback) {
            this.delegate.enqueue(new ExecutorCallback(this.callbackExecutor, callback));
        }

        @Override // retrofit.Call
        public Response<T> execute() throws IOException {
            return this.delegate.execute();
        }

        @Override // retrofit.Call
        public void cancel() {
            this.delegate.cancel();
        }

        @Override // retrofit.Call
        /* renamed from: clone, reason: merged with bridge method [inline-methods] */
        public Call<T> m1clone() {
            return new ExecutorCallbackCall(this.callbackExecutor, this.delegate.m1clone());
        }
    }

    /* loaded from: retrofit-2.0.0-beta2.jar:retrofit/ExecutorCallAdapterFactory$ExecutorCallback.class */
    static final class ExecutorCallback<T> implements Callback<T> {
        private final Executor callbackExecutor;
        private final Callback<T> delegate;

        ExecutorCallback(Executor callbackExecutor, Callback<T> delegate) {
            this.callbackExecutor = callbackExecutor;
            this.delegate = delegate;
        }

        @Override // retrofit.Callback
        public void onResponse(final Response<T> response, final Retrofit retrofit2) {
            this.callbackExecutor.execute(new Runnable() { // from class: retrofit.ExecutorCallAdapterFactory.ExecutorCallback.1
                @Override // java.lang.Runnable
                public void run() {
                    ExecutorCallback.this.delegate.onResponse(response, retrofit2);
                }
            });
        }

        @Override // retrofit.Callback
        public void onFailure(final Throwable t) {
            this.callbackExecutor.execute(new Runnable() { // from class: retrofit.ExecutorCallAdapterFactory.ExecutorCallback.2
                @Override // java.lang.Runnable
                public void run() {
                    ExecutorCallback.this.delegate.onFailure(t);
                }
            });
        }
    }
}
