package org.androidannotations.api.view;

import java.util.LinkedHashSet;
import java.util.Set;

/* loaded from: androidannotations-api-3.3.2.jar:org/androidannotations/api/view/OnViewChangedNotifier.class */
public class OnViewChangedNotifier {
    private static OnViewChangedNotifier currentNotifier;
    private final Set<OnViewChangedListener> listeners = new LinkedHashSet();

    public static OnViewChangedNotifier replaceNotifier(OnViewChangedNotifier notifier) {
        OnViewChangedNotifier previousNotifier = currentNotifier;
        currentNotifier = notifier;
        return previousNotifier;
    }

    public static void registerOnViewChangedListener(OnViewChangedListener listener) {
        if (currentNotifier != null) {
            currentNotifier.listeners.add(listener);
        }
    }

    public void notifyViewChanged(HasViews hasViews) {
        for (OnViewChangedListener listener : this.listeners) {
            listener.onViewChanged(hasViews);
        }
    }
}
