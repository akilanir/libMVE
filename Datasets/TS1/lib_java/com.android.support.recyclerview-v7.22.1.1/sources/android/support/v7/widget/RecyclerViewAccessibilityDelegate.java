package android.support.v7.widget;

import android.os.Bundle;
import android.support.v4.view.AccessibilityDelegateCompat;
import android.support.v4.view.accessibility.AccessibilityNodeInfoCompat;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;

/* loaded from: com.android.support.recyclerview-v7.22.1.1.jar:android/support/v7/widget/RecyclerViewAccessibilityDelegate.class */
public class RecyclerViewAccessibilityDelegate extends AccessibilityDelegateCompat {
    final RecyclerView mRecyclerView;
    final AccessibilityDelegateCompat mItemDelegate = new AccessibilityDelegateCompat() { // from class: android.support.v7.widget.RecyclerViewAccessibilityDelegate.1
        public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfoCompat info) {
            super.onInitializeAccessibilityNodeInfo(host, info);
            if (!RecyclerViewAccessibilityDelegate.this.shouldIgnore() && RecyclerViewAccessibilityDelegate.this.mRecyclerView.getLayoutManager() != null) {
                RecyclerViewAccessibilityDelegate.this.mRecyclerView.getLayoutManager().onInitializeAccessibilityNodeInfoForItem(host, info);
            }
        }

        public boolean performAccessibilityAction(View host, int action, Bundle args) {
            if (!super.performAccessibilityAction(host, action, args)) {
                if (!RecyclerViewAccessibilityDelegate.this.shouldIgnore() && RecyclerViewAccessibilityDelegate.this.mRecyclerView.getLayoutManager() != null) {
                    return RecyclerViewAccessibilityDelegate.this.mRecyclerView.getLayoutManager().performAccessibilityActionForItem(host, action, args);
                }
                return false;
            }
            return true;
        }
    };

    public RecyclerViewAccessibilityDelegate(RecyclerView recyclerView) {
        this.mRecyclerView = recyclerView;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean shouldIgnore() {
        return this.mRecyclerView.hasPendingAdapterUpdates();
    }

    public boolean performAccessibilityAction(View host, int action, Bundle args) {
        if (super.performAccessibilityAction(host, action, args)) {
            return true;
        }
        if (!shouldIgnore() && this.mRecyclerView.getLayoutManager() != null) {
            return this.mRecyclerView.getLayoutManager().performAccessibilityAction(action, args);
        }
        return false;
    }

    public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfoCompat info) {
        super.onInitializeAccessibilityNodeInfo(host, info);
        info.setClassName(RecyclerView.class.getName());
        if (!shouldIgnore() && this.mRecyclerView.getLayoutManager() != null) {
            this.mRecyclerView.getLayoutManager().onInitializeAccessibilityNodeInfo(info);
        }
    }

    public void onInitializeAccessibilityEvent(View host, AccessibilityEvent event) {
        super.onInitializeAccessibilityEvent(host, event);
        event.setClassName(RecyclerView.class.getName());
        if ((host instanceof RecyclerView) && !shouldIgnore()) {
            RecyclerView rv = (RecyclerView) host;
            if (rv.getLayoutManager() != null) {
                rv.getLayoutManager().onInitializeAccessibilityEvent(event);
            }
        }
    }

    AccessibilityDelegateCompat getItemDelegate() {
        return this.mItemDelegate;
    }
}
