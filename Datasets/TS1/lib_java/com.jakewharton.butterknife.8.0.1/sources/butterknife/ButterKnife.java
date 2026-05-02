package butterknife;

import android.annotation.TargetApi;
import android.app.Activity;
import android.app.Dialog;
import android.support.annotation.CheckResult;
import android.support.annotation.IdRes;
import android.support.annotation.NonNull;
import android.util.Log;
import android.util.Property;
import android.view.View;
import butterknife.internal.Finder;
import butterknife.internal.ViewBinder;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/* loaded from: com.jakewharton.butterknife.8.0.1.jar:butterknife/ButterKnife.class */
public final class ButterKnife {
    private static final String TAG = "ButterKnife";
    private static boolean debug = false;
    static final Map<Class<?>, ViewBinder<Object>> BINDERS = new LinkedHashMap();
    static final ViewBinder<Object> NOP_VIEW_BINDER = new ViewBinder<Object>() { // from class: butterknife.ButterKnife.1
        @Override // butterknife.internal.ViewBinder
        public Unbinder bind(Finder finder, Object target, Object source) {
            return Unbinder.EMPTY;
        }
    };

    /* loaded from: com.jakewharton.butterknife.8.0.1.jar:butterknife/ButterKnife$Action.class */
    public interface Action<T extends View> {
        void apply(@NonNull T t, int i);
    }

    /* loaded from: com.jakewharton.butterknife.8.0.1.jar:butterknife/ButterKnife$Setter.class */
    public interface Setter<T extends View, V> {
        void set(@NonNull T t, V v, int i);
    }

    private ButterKnife() {
        throw new AssertionError("No instances.");
    }

    public static void setDebug(boolean debug2) {
        debug = debug2;
    }

    public static Unbinder bind(@NonNull Activity target) {
        return bind(target, target, Finder.ACTIVITY);
    }

    @NonNull
    public static Unbinder bind(@NonNull View target) {
        return bind(target, target, Finder.VIEW);
    }

    public static Unbinder bind(@NonNull Dialog target) {
        return bind(target, target, Finder.DIALOG);
    }

    public static Unbinder bind(@NonNull Object target, @NonNull Activity source) {
        return bind(target, source, Finder.ACTIVITY);
    }

    @NonNull
    public static Unbinder bind(@NonNull Object target, @NonNull View source) {
        return bind(target, source, Finder.VIEW);
    }

    public static Unbinder bind(@NonNull Object target, @NonNull Dialog source) {
        return bind(target, source, Finder.DIALOG);
    }

    static Unbinder bind(@NonNull Object target, @NonNull Object source, @NonNull Finder finder) {
        Class<?> targetClass = target.getClass();
        try {
            if (debug) {
                Log.d(TAG, "Looking up view binder for " + targetClass.getName());
            }
            ViewBinder<Object> viewBinder = findViewBinderForClass(targetClass);
            return viewBinder.bind(finder, target, source);
        } catch (Exception e) {
            throw new RuntimeException("Unable to bind views for " + targetClass.getName(), e);
        }
    }

    @NonNull
    private static ViewBinder<Object> findViewBinderForClass(Class<?> cls) throws IllegalAccessException, InstantiationException {
        ViewBinder<Object> viewBinder;
        ViewBinder<Object> viewBinder2 = BINDERS.get(cls);
        if (viewBinder2 != null) {
            if (debug) {
                Log.d(TAG, "HIT: Cached in view binder map.");
            }
            return viewBinder2;
        }
        String clsName = cls.getName();
        if (clsName.startsWith("android.") || clsName.startsWith("java.")) {
            if (debug) {
                Log.d(TAG, "MISS: Reached framework class. Abandoning search.");
            }
            return NOP_VIEW_BINDER;
        }
        try {
            Class<?> viewBindingClass = Class.forName(clsName + "$$ViewBinder");
            viewBinder = (ViewBinder) viewBindingClass.newInstance();
            if (debug) {
                Log.d(TAG, "HIT: Loaded view binder class.");
            }
        } catch (ClassNotFoundException e) {
            if (debug) {
                Log.d(TAG, "Not found. Trying superclass " + cls.getSuperclass().getName());
            }
            viewBinder = findViewBinderForClass(cls.getSuperclass());
        }
        BINDERS.put(cls, viewBinder);
        return viewBinder;
    }

    @SafeVarargs
    public static <T extends View> void apply(@NonNull List<T> list, @NonNull Action<? super T>... actions) {
        int count = list.size();
        for (int i = 0; i < count; i++) {
            for (Action<? super T> action : actions) {
                action.apply(list.get(i), i);
            }
        }
    }

    @SafeVarargs
    public static <T extends View> void apply(@NonNull T[] array, @NonNull Action<? super T>... actions) {
        int count = array.length;
        for (int i = 0; i < count; i++) {
            for (Action<? super T> action : actions) {
                action.apply(array[i], i);
            }
        }
    }

    public static <T extends View> void apply(@NonNull List<T> list, @NonNull Action<? super T> action) {
        int count = list.size();
        for (int i = 0; i < count; i++) {
            action.apply(list.get(i), i);
        }
    }

    public static <T extends View> void apply(@NonNull T[] array, @NonNull Action<? super T> action) {
        int count = array.length;
        for (int i = 0; i < count; i++) {
            action.apply(array[i], i);
        }
    }

    @SafeVarargs
    public static <T extends View> void apply(@NonNull T view, @NonNull Action<? super T>... actions) {
        for (Action<? super T> action : actions) {
            action.apply(view, 0);
        }
    }

    public static <T extends View> void apply(@NonNull T view, @NonNull Action<? super T> action) {
        action.apply(view, 0);
    }

    public static <T extends View, V> void apply(@NonNull List<T> list, @NonNull Setter<? super T, V> setter, V value) {
        int count = list.size();
        for (int i = 0; i < count; i++) {
            setter.set(list.get(i), value, i);
        }
    }

    public static <T extends View, V> void apply(@NonNull T[] array, @NonNull Setter<? super T, V> setter, V value) {
        int count = array.length;
        for (int i = 0; i < count; i++) {
            setter.set(array[i], value, i);
        }
    }

    public static <T extends View, V> void apply(@NonNull T view, @NonNull Setter<? super T, V> setter, V value) {
        setter.set(view, value, 0);
    }

    @TargetApi(14)
    public static <T extends View, V> void apply(@NonNull List<T> list, @NonNull Property<? super T, V> setter, V value) {
        int count = list.size();
        for (int i = 0; i < count; i++) {
            setter.set(list.get(i), value);
        }
    }

    @TargetApi(14)
    public static <T extends View, V> void apply(@NonNull T[] array, @NonNull Property<? super T, V> setter, V value) {
        for (T t : array) {
            setter.set(t, value);
        }
    }

    @TargetApi(14)
    public static <T extends View, V> void apply(@NonNull T view, @NonNull Property<? super T, V> setter, V value) {
        setter.set(view, value);
    }

    @CheckResult
    public static <T extends View> T findById(@NonNull View view, @IdRes int i) {
        return (T) view.findViewById(i);
    }

    @CheckResult
    public static <T extends View> T findById(@NonNull Activity activity, @IdRes int i) {
        return (T) activity.findViewById(i);
    }

    @CheckResult
    public static <T extends View> T findById(@NonNull Dialog dialog, @IdRes int i) {
        return (T) dialog.findViewById(i);
    }
}
