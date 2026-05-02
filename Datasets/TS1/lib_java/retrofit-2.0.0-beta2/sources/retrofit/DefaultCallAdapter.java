package retrofit;

import java.lang.annotation.Annotation;
import java.lang.reflect.Type;
import retrofit.CallAdapter;

/* loaded from: retrofit-2.0.0-beta2.jar:retrofit/DefaultCallAdapter.class */
final class DefaultCallAdapter implements CallAdapter<Call<?>> {
    static final CallAdapter.Factory FACTORY = new CallAdapter.Factory() { // from class: retrofit.DefaultCallAdapter.1
        @Override // retrofit.CallAdapter.Factory
        public CallAdapter<?> get(Type returnType, Annotation[] annotations, Retrofit retrofit2) {
            if (Utils.getRawType(returnType) != Call.class) {
                return null;
            }
            Type responseType = Utils.getCallResponseType(returnType);
            return new DefaultCallAdapter(responseType);
        }
    };
    private final Type responseType;

    DefaultCallAdapter(Type responseType) {
        this.responseType = responseType;
    }

    @Override // retrofit.CallAdapter
    public Type responseType() {
        return this.responseType;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // retrofit.CallAdapter
    /* renamed from: adapt, reason: merged with bridge method [inline-methods] */
    public <R> Call<?> adapt2(Call<R> call) {
        return call;
    }
}
