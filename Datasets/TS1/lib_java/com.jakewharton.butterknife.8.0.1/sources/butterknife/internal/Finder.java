package butterknife.internal;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.view.View;

/* loaded from: com.jakewharton.butterknife.8.0.1.jar:butterknife/internal/Finder.class */
public enum Finder {
    VIEW { // from class: butterknife.internal.Finder.1
        @Override // butterknife.internal.Finder
        protected View findView(Object source, int id) {
            return ((View) source).findViewById(id);
        }

        @Override // butterknife.internal.Finder
        public Context getContext(Object source) {
            return ((View) source).getContext();
        }

        @Override // butterknife.internal.Finder
        protected String getResourceEntryName(Object source, int id) {
            View view = (View) source;
            if (view.isInEditMode()) {
                return "<unavailable while editing>";
            }
            return super.getResourceEntryName(source, id);
        }
    },
    ACTIVITY { // from class: butterknife.internal.Finder.2
        @Override // butterknife.internal.Finder
        protected View findView(Object source, int id) {
            return ((Activity) source).findViewById(id);
        }

        @Override // butterknife.internal.Finder
        public Context getContext(Object source) {
            return (Activity) source;
        }
    },
    DIALOG { // from class: butterknife.internal.Finder.3
        @Override // butterknife.internal.Finder
        protected View findView(Object source, int id) {
            return ((Dialog) source).findViewById(id);
        }

        @Override // butterknife.internal.Finder
        public Context getContext(Object source) {
            return ((Dialog) source).getContext();
        }
    };

    protected abstract View findView(Object obj, int i);

    public abstract Context getContext(Object obj);

    public <T> T findRequiredView(Object obj, int i, String str) {
        T t = (T) findOptionalView(obj, i, str);
        if (t == null) {
            throw new IllegalStateException("Required view '" + getResourceEntryName(obj, i) + "' with ID " + i + " for " + str + " was not found. If this view is optional add '@Nullable' (fields) or '@Optional' (methods) annotation.");
        }
        return t;
    }

    public <T> T findOptionalView(Object obj, int i, String str) {
        return (T) castView(findView(obj, i), i, str);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public <T> T castView(View view, int id, String who) {
        return view;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public <T> T castParam(Object obj, String from, int fromPosition, String to, int toPosition) {
        return obj;
    }

    protected String getResourceEntryName(Object source, int id) {
        return getContext(source).getResources().getResourceEntryName(id);
    }
}
