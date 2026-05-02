package retrofit;

import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import java.lang.invoke.MethodHandles;
import java.lang.reflect.Method;
import java.util.concurrent.Executor;
import org.codehaus.mojo.animal_sniffer.IgnoreJRERequirement;
import retrofit.CallAdapter;

/* loaded from: retrofit-2.0.0-beta2.jar:retrofit/Platform.class */
class Platform {
    private static final Platform PLATFORM = findPlatform();

    Platform() {
    }

    static Platform get() {
        return PLATFORM;
    }

    private static Platform findPlatform() {
        try {
            Class.forName("android.os.Build");
            if (Build.VERSION.SDK_INT != 0) {
                return new Android();
            }
        } catch (ClassNotFoundException e) {
        }
        try {
            Class.forName("java.util.Optional");
            return new Java8();
        } catch (ClassNotFoundException e2) {
            return new Platform();
        }
    }

    CallAdapter.Factory defaultCallAdapterFactory(Executor callbackExecutor) {
        if (callbackExecutor != null) {
            return new ExecutorCallAdapterFactory(callbackExecutor);
        }
        return DefaultCallAdapter.FACTORY;
    }

    boolean isDefaultMethod(Method method) {
        return false;
    }

    Object invokeDefaultMethod(Method method, Class<?> declaringClass, Object object, Object... args) throws Throwable {
        throw new UnsupportedOperationException();
    }

    @IgnoreJRERequirement
    /* loaded from: retrofit-2.0.0-beta2.jar:retrofit/Platform$Java8.class */
    static class Java8 extends Platform {
        Java8() {
        }

        @Override // retrofit.Platform
        boolean isDefaultMethod(Method method) {
            return method.isDefault();
        }

        @Override // retrofit.Platform
        Object invokeDefaultMethod(Method method, Class<?> declaringClass, Object object, Object... args) throws Throwable {
            return MethodHandles.lookup().in(declaringClass).unreflectSpecial(method, declaringClass).bindTo(object).invokeWithArguments(args);
        }
    }

    /* loaded from: retrofit-2.0.0-beta2.jar:retrofit/Platform$Android.class */
    static class Android extends Platform {
        Android() {
        }

        @Override // retrofit.Platform
        CallAdapter.Factory defaultCallAdapterFactory(Executor callbackExecutor) {
            if (callbackExecutor == null) {
                callbackExecutor = new MainThreadExecutor();
            }
            return new ExecutorCallAdapterFactory(callbackExecutor);
        }

        /* loaded from: retrofit-2.0.0-beta2.jar:retrofit/Platform$Android$MainThreadExecutor.class */
        static class MainThreadExecutor implements Executor {
            private final Handler handler = new Handler(Looper.getMainLooper());

            MainThreadExecutor() {
            }

            @Override // java.util.concurrent.Executor
            public void execute(Runnable r) {
                this.handler.post(r);
            }
        }
    }
}
