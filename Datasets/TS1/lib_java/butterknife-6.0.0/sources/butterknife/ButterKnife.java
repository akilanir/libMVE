package butterknife;

import android.annotation.TargetApi;
import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.util.Log;
import android.util.Property;
import android.view.View;
import butterknife.internal.ButterKnifeProcessor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/* loaded from: butterknife-6.0.0.jar:butterknife/ButterKnife.class */
public final class ButterKnife {
    private static final String TAG = "ButterKnife";
    private static boolean debug = false;
    static final Map<Class<?>, Method> INJECTORS = new LinkedHashMap();
    static final Map<Class<?>, Method> RESETTERS = new LinkedHashMap();
    static final Method NO_OP = null;

    /* loaded from: butterknife-6.0.0.jar:butterknife/ButterKnife$Action.class */
    public interface Action<T extends View> {
        void apply(T t, int i);
    }

    /* loaded from: butterknife-6.0.0.jar:butterknife/ButterKnife$Setter.class */
    public interface Setter<T extends View, V> {
        void set(T t, V v, int i);
    }

    private ButterKnife() {
        throw new AssertionError("No instances.");
    }

    /* loaded from: butterknife-6.0.0.jar:butterknife/ButterKnife$Finder.class */
    public enum Finder {
        VIEW { // from class: butterknife.ButterKnife.Finder.1
            @Override // butterknife.ButterKnife.Finder
            public View findOptionalView(Object source, int id) {
                return ((View) source).findViewById(id);
            }

            @Override // butterknife.ButterKnife.Finder
            protected Context getContext(Object source) {
                return ((View) source).getContext();
            }
        },
        ACTIVITY { // from class: butterknife.ButterKnife.Finder.2
            @Override // butterknife.ButterKnife.Finder
            public View findOptionalView(Object source, int id) {
                return ((Activity) source).findViewById(id);
            }

            @Override // butterknife.ButterKnife.Finder
            protected Context getContext(Object source) {
                return (Activity) source;
            }
        },
        DIALOG { // from class: butterknife.ButterKnife.Finder.3
            @Override // butterknife.ButterKnife.Finder
            public View findOptionalView(Object source, int id) {
                return ((Dialog) source).findViewById(id);
            }

            @Override // butterknife.ButterKnife.Finder
            protected Context getContext(Object source) {
                return ((Dialog) source).getContext();
            }
        };

        public abstract View findOptionalView(Object obj, int i);

        protected abstract Context getContext(Object obj);

        public static <T extends View> T[] arrayOf(T... views) {
            return views;
        }

        public static <T extends View> List<T> listOf(T... views) {
            return new ImmutableViewList(views);
        }

        public View findRequiredView(Object source, int id, String who) {
            View view = findOptionalView(source, id);
            if (view == null) {
                String name = getContext(source).getResources().getResourceEntryName(id);
                throw new IllegalStateException("Required view '" + name + "' with ID " + id + " for " + who + " was not found. If this view is optional add '@Optional' annotation.");
            }
            return view;
        }
    }

    public static void setDebug(boolean debug2) {
        debug = debug2;
    }

    public static void inject(Activity target) {
        inject(target, target, Finder.ACTIVITY);
    }

    public static void inject(View target) {
        inject(target, target, Finder.VIEW);
    }

    public static void inject(Dialog target) {
        inject(target, target, Finder.DIALOG);
    }

    public static void inject(Object target, Activity source) {
        inject(target, source, Finder.ACTIVITY);
    }

    public static void inject(Object target, View source) {
        inject(target, source, Finder.VIEW);
    }

    public static void inject(Object target, Dialog source) {
        inject(target, source, Finder.DIALOG);
    }

    public static void reset(Object target) {
        Class<?> targetClass = target.getClass();
        try {
            if (debug) {
                Log.d(TAG, "Looking up view injector for " + targetClass.getName());
            }
            Method reset = findResettersForClass(targetClass);
            if (reset != null) {
                reset.invoke(null, target);
            }
        } catch (RuntimeException e) {
            throw e;
        } catch (Exception e2) {
            Throwable t = e2;
            if (t instanceof InvocationTargetException) {
                t = t.getCause();
            }
            throw new RuntimeException("Unable to reset views for " + target, t);
        }
    }

    static void inject(Object target, Object source, Finder finder) {
        Class<?> targetClass = target.getClass();
        try {
            if (debug) {
                Log.d(TAG, "Looking up view injector for " + targetClass.getName());
            }
            Method inject = findInjectorForClass(targetClass);
            if (inject != null) {
                inject.invoke(null, finder, target, source);
            }
        } catch (RuntimeException e) {
            throw e;
        } catch (Exception e2) {
            Throwable t = e2;
            if (t instanceof InvocationTargetException) {
                t = t.getCause();
            }
            throw new RuntimeException("Unable to inject views for " + target, t);
        }
    }

    private static Method findInjectorForClass(Class<?> cls) throws NoSuchMethodException {
        Method inject;
        Method inject2 = INJECTORS.get(cls);
        if (inject2 != null) {
            if (debug) {
                Log.d(TAG, "HIT: Cached in injector map.");
            }
            return inject2;
        }
        String clsName = cls.getName();
        if (clsName.startsWith(ButterKnifeProcessor.ANDROID_PREFIX) || clsName.startsWith(ButterKnifeProcessor.JAVA_PREFIX)) {
            if (debug) {
                Log.d(TAG, "MISS: Reached framework class. Abandoning search.");
            }
            return NO_OP;
        }
        try {
            Class<?> injector = Class.forName(clsName + ButterKnifeProcessor.SUFFIX);
            inject = injector.getMethod("inject", Finder.class, cls, Object.class);
            if (debug) {
                Log.d(TAG, "HIT: Class loaded injection class.");
            }
        } catch (ClassNotFoundException e) {
            if (debug) {
                Log.d(TAG, "Not found. Trying superclass " + cls.getSuperclass().getName());
            }
            inject = findInjectorForClass(cls.getSuperclass());
        }
        INJECTORS.put(cls, inject);
        return inject;
    }

    private static Method findResettersForClass(Class<?> cls) throws NoSuchMethodException {
        Method inject;
        Method inject2 = RESETTERS.get(cls);
        if (inject2 != null) {
            if (debug) {
                Log.d(TAG, "HIT: Cached in injector map.");
            }
            return inject2;
        }
        String clsName = cls.getName();
        if (clsName.startsWith(ButterKnifeProcessor.ANDROID_PREFIX) || clsName.startsWith(ButterKnifeProcessor.JAVA_PREFIX)) {
            if (debug) {
                Log.d(TAG, "MISS: Reached framework class. Abandoning search.");
            }
            return NO_OP;
        }
        try {
            Class<?> injector = Class.forName(clsName + ButterKnifeProcessor.SUFFIX);
            inject = injector.getMethod("reset", cls);
            if (debug) {
                Log.d(TAG, "HIT: Class loaded injection class.");
            }
        } catch (ClassNotFoundException e) {
            if (debug) {
                Log.d(TAG, "Not found. Trying superclass " + cls.getSuperclass().getName());
            }
            inject = findResettersForClass(cls.getSuperclass());
        }
        RESETTERS.put(cls, inject);
        return inject;
    }

    public static <T extends View> void apply(List<T> list, Action<? super T> action) {
        int count = list.size();
        for (int i = 0; i < count; i++) {
            action.apply(list.get(i), i);
        }
    }

    public static <T extends View, V> void apply(List<T> list, Setter<? super T, V> setter, V value) {
        int count = list.size();
        for (int i = 0; i < count; i++) {
            setter.set(list.get(i), value, i);
        }
    }

    @TargetApi(14)
    public static <T extends View, V> void apply(List<T> list, Property<? super T, V> setter, V value) {
        int count = list.size();
        for (int i = 0; i < count; i++) {
            setter.set(list.get(i), value);
        }
    }

    public static <T extends View> T findById(View view, int i) {
        return (T) view.findViewById(i);
    }

    public static <T extends View> T findById(Activity activity, int i) {
        return (T) activity.findViewById(i);
    }

    public static <T extends View> T findById(Dialog dialog, int i) {
        return (T) dialog.findViewById(i);
    }
}
