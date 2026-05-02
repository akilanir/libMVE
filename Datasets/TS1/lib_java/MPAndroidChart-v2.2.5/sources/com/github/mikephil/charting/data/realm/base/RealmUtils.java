package com.github.mikephil.charting.data.realm.base;

import io.realm.DynamicRealmObject;
import io.realm.RealmObject;
import io.realm.RealmResults;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/data/realm/base/RealmUtils.class */
public final class RealmUtils {
    public static List<String> toXVals(RealmResults<? extends RealmObject> result, String xValuesField) {
        List<String> xVals = new ArrayList<>();
        Iterator i$ = result.iterator();
        while (i$.hasNext()) {
            RealmObject object = (RealmObject) i$.next();
            DynamicRealmObject dynamicObject = new DynamicRealmObject(object);
            xVals.add(dynamicObject.getString(xValuesField));
        }
        return xVals;
    }
}
