package com.mikepenz.materialdrawer.util;

import android.support.annotation.NonNull;
import com.mikepenz.materialdrawer.model.interfaces.Identifyable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.concurrent.atomic.AtomicInteger;

/* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/util/IdDistributor.class */
public class IdDistributor {
    private static AtomicInteger idDistributor = new AtomicInteger(2000000000);

    public static <T extends Identifyable> ArrayList<T> checkIds(@NonNull ArrayList<T> items) {
        Iterator<T> it = items.iterator();
        while (it.hasNext()) {
            T item = it.next();
            checkId(item);
        }
        return items;
    }

    public static <T extends Identifyable> T[] checkIds(@NonNull T... items) {
        for (T item : items) {
            checkId(item);
        }
        return items;
    }

    public static <T extends Identifyable> T checkId(@NonNull T item) {
        if (item.getIdentifier() == -1) {
            item.withIdentifier(idDistributor.incrementAndGet());
        }
        return item;
    }
}
