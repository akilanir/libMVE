package retrofit;

import java.lang.annotation.Annotation;
import java.lang.reflect.Type;

/* loaded from: retrofit-2.0.0-beta2.jar:retrofit/CallAdapter.class */
public interface CallAdapter<T> {

    /* loaded from: retrofit-2.0.0-beta2.jar:retrofit/CallAdapter$Factory.class */
    public interface Factory {
        CallAdapter<?> get(Type type, Annotation[] annotationArr, Retrofit retrofit2);
    }

    Type responseType();

    /* renamed from: adapt */
    <R> T adapt2(Call<R> call);
}
