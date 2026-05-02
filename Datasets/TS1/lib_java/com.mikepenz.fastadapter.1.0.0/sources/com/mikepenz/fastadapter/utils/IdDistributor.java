package com.mikepenz.fastadapter.utils;

import android.support.annotation.NonNull;
import com.mikepenz.fastadapter.IIdentifyable;
import java.util.List;
import java.util.concurrent.atomic.AtomicLong;

/* loaded from: com.mikepenz.fastadapter.1.0.0.jar:com/mikepenz/fastadapter/utils/IdDistributor.class */
public class IdDistributor {
    private static AtomicLong idDistributor = new AtomicLong(9000000000000000000L);

    public static <T extends IIdentifyable> List<T> checkIds(@NonNull List<T> items) {
        for (T item : items) {
            checkId(item);
        }
        return items;
    }

    public static <T extends IIdentifyable> T[] checkIds(@NonNull T... items) {
        for (T item : items) {
            checkId(item);
        }
        return items;
    }

    public static <T extends IIdentifyable> T checkId(@NonNull T item) {
        if (item.getIdentifier() == -1) {
            item.withIdentifier(idDistributor.incrementAndGet());
        }
        return item;
    }
}
