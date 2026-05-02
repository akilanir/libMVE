package android.support.v4.media;

import android.media.browse.MediaBrowser;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

/* loaded from: internal_impl-23.3.0.jar:android/support/v4/media/ParceledListSliceAdapterApi21.class */
class ParceledListSliceAdapterApi21 {
    private static Constructor sConstructor;

    ParceledListSliceAdapterApi21() {
    }

    static {
        try {
            Class theClass = Class.forName("android.content.pm.ParceledListSlice");
            sConstructor = theClass.getConstructor(List.class);
        } catch (ClassNotFoundException | NoSuchMethodException e) {
            e.printStackTrace();
        }
    }

    static Object newInstance(List<MediaBrowser.MediaItem> itemList) {
        Object result = null;
        try {
            result = sConstructor.newInstance(itemList);
        } catch (IllegalAccessException | InstantiationException | InvocationTargetException e) {
            e.printStackTrace();
        }
        return result;
    }
}
