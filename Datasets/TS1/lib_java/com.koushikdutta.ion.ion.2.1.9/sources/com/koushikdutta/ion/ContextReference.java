package com.koushikdutta.ion;

import android.annotation.TargetApi;
import android.app.Activity;
import android.app.ActivityManager;
import android.app.Fragment;
import android.app.Service;
import android.content.Context;
import android.widget.ImageView;
import com.koushikdutta.ion.loader.MediaFile;
import java.lang.ref.WeakReference;
import java.util.List;

/* loaded from: com.koushikdutta.ion.ion.2.1.9.jar:com/koushikdutta/ion/ContextReference.class */
abstract class ContextReference<T> extends WeakReference<T> {
    public abstract String isAlive();

    public abstract Context getContext();

    ContextReference(T t) {
        super(t);
    }

    /* loaded from: com.koushikdutta.ion.ion.2.1.9.jar:com/koushikdutta/ion/ContextReference$NormalContextReference.class */
    static abstract class NormalContextReference<T extends Context> extends ContextReference<T> {
        NormalContextReference(T context) {
            super(context);
        }

        static String isAlive(Context context) {
            if (context instanceof Service) {
                return ServiceContextReference.isAlive((Service) context);
            }
            if (context instanceof Activity) {
                return ActivityContextReference.isAlive((Activity) context);
            }
            return null;
        }

        @Override // com.koushikdutta.ion.ContextReference
        public Context getContext() {
            return (Context) get();
        }
    }

    /* loaded from: com.koushikdutta.ion.ion.2.1.9.jar:com/koushikdutta/ion/ContextReference$ServiceContextReference.class */
    static class ServiceContextReference extends NormalContextReference<Service> {
        public ServiceContextReference(Service service) {
            super(service);
        }

        static String isAlive(Service candidate) {
            if (candidate == null) {
                return "Service reference null";
            }
            ActivityManager manager = (ActivityManager) candidate.getSystemService("activity");
            List<ActivityManager.RunningServiceInfo> services = manager.getRunningServices(Integer.MAX_VALUE);
            if (services == null) {
                return "Could not retrieve services from service manager";
            }
            for (ActivityManager.RunningServiceInfo service : services) {
                if (candidate.getClass().getName().equals(service.service.getClassName())) {
                    return null;
                }
            }
            return "Service stopped";
        }

        @Override // com.koushikdutta.ion.ContextReference
        public String isAlive() {
            return isAlive((Service) get());
        }
    }

    /* loaded from: com.koushikdutta.ion.ion.2.1.9.jar:com/koushikdutta/ion/ContextReference$ActivityContextReference.class */
    static class ActivityContextReference extends NormalContextReference<Activity> {
        public ActivityContextReference(Activity activity) {
            super(activity);
        }

        static String isAlive(Activity a) {
            if (a == null) {
                return "Activity reference null";
            }
            if (a.isFinishing()) {
                return "Activity finished";
            }
            return null;
        }

        @Override // com.koushikdutta.ion.ContextReference
        public String isAlive() {
            return isAlive((Activity) get());
        }
    }

    @TargetApi(MediaFile.FILE_TYPE_QCP)
    /* loaded from: com.koushikdutta.ion.ion.2.1.9.jar:com/koushikdutta/ion/ContextReference$FragmentContextReference.class */
    static class FragmentContextReference extends ContextReference<Fragment> {
        public FragmentContextReference(Fragment fragment) {
            super(fragment);
        }

        @Override // com.koushikdutta.ion.ContextReference
        public Context getContext() {
            Fragment fragment = (Fragment) get();
            if (fragment == null) {
                return null;
            }
            return fragment.getActivity();
        }

        @Override // com.koushikdutta.ion.ContextReference
        public String isAlive() {
            Fragment fragment = (Fragment) get();
            if (fragment == null) {
                return "Fragment reference null";
            }
            String ret = ActivityContextReference.isAlive(fragment.getActivity());
            if (ret != null) {
                return ret;
            }
            if (fragment.isDetached()) {
                return "Fragment detached";
            }
            return null;
        }
    }

    /* loaded from: com.koushikdutta.ion.ion.2.1.9.jar:com/koushikdutta/ion/ContextReference$SupportFragmentContextReference.class */
    static class SupportFragmentContextReference extends ContextReference<android.support.v4.app.Fragment> {
        public SupportFragmentContextReference(android.support.v4.app.Fragment fragment) {
            super(fragment);
        }

        @Override // com.koushikdutta.ion.ContextReference
        public Context getContext() {
            android.support.v4.app.Fragment fragment = (android.support.v4.app.Fragment) get();
            if (fragment == null) {
                return null;
            }
            return fragment.getActivity();
        }

        @Override // com.koushikdutta.ion.ContextReference
        public String isAlive() {
            android.support.v4.app.Fragment fragment = (android.support.v4.app.Fragment) get();
            if (fragment == null) {
                return "Fragment reference null";
            }
            String ret = ActivityContextReference.isAlive((Activity) fragment.getActivity());
            if (ret != null) {
                return ret;
            }
            if (fragment.isDetached()) {
                return "Fragment detached";
            }
            return null;
        }
    }

    /* loaded from: com.koushikdutta.ion.ion.2.1.9.jar:com/koushikdutta/ion/ContextReference$ImageViewContextReference.class */
    static class ImageViewContextReference extends ContextReference<ImageView> {
        public ImageViewContextReference(ImageView imageView) {
            super(imageView);
        }

        @Override // com.koushikdutta.ion.ContextReference
        public String isAlive() {
            ImageView iv = (ImageView) get();
            if (iv == null) {
                return "ImageView reference null";
            }
            return NormalContextReference.isAlive(iv.getContext());
        }

        @Override // com.koushikdutta.ion.ContextReference
        public Context getContext() {
            ImageView iv = (ImageView) get();
            if (iv == null) {
                return null;
            }
            return iv.getContext();
        }
    }

    public static ContextReference fromContext(Context context) {
        if (context instanceof Service) {
            return new ServiceContextReference((Service) context);
        }
        if (context instanceof Activity) {
            return new ActivityContextReference((Activity) context);
        }
        return new NormalContextReference<Context>(context) { // from class: com.koushikdutta.ion.ContextReference.1
            @Override // com.koushikdutta.ion.ContextReference
            public String isAlive() {
                Context context2 = (Context) get();
                if (context2 == null) {
                    return "Context reference null";
                }
                return null;
            }
        };
    }
}
