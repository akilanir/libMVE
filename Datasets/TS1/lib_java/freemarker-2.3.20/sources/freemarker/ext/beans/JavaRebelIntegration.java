package freemarker.ext.beans;

import java.lang.ref.WeakReference;
import org.zeroturnaround.javarebel.ClassEventListener;
import org.zeroturnaround.javarebel.ReloaderFactory;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/beans/JavaRebelIntegration.class */
class JavaRebelIntegration {
    JavaRebelIntegration() {
    }

    static void testAvailability() {
        ReloaderFactory.getInstance();
    }

    static void registerWrapper(BeansWrapper w) {
        ReloaderFactory.getInstance().addClassReloadListener(new BeansWrapperCacheInvalidator(w));
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/beans/JavaRebelIntegration$BeansWrapperCacheInvalidator.class */
    private static class BeansWrapperCacheInvalidator implements ClassEventListener {
        private final WeakReference ref;

        BeansWrapperCacheInvalidator(BeansWrapper w) {
            this.ref = new WeakReference(w);
        }

        public void onClassEvent(int eventType, Class klass) {
            BeansWrapper wrapper = (BeansWrapper) this.ref.get();
            if (wrapper == null) {
                ReloaderFactory.getInstance().removeClassReloadListener(this);
            } else if (eventType == 1) {
                wrapper.removeFromClassIntrospectionCache(klass);
            }
        }
    }
}
