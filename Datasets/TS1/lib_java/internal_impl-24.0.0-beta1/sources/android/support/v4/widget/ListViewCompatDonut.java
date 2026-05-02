package android.support.v4.widget;

import android.view.View;
import android.widget.ListView;

/* loaded from: internal_impl-24.0.0-beta1.jar:android/support/v4/widget/ListViewCompatDonut.class */
class ListViewCompatDonut {
    ListViewCompatDonut() {
    }

    static void scrollListBy(ListView listView, int y) {
        View firstView;
        int firstPosition = listView.getFirstVisiblePosition();
        if (firstPosition == -1 || (firstView = listView.getChildAt(0)) == null) {
            return;
        }
        int newTop = firstView.getTop() - y;
        listView.setSelectionFromTop(firstPosition, newTop);
    }
}
