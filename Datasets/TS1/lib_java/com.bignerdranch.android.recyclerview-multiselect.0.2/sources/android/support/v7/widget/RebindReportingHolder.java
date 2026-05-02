package android.support.v7.widget;

import android.support.v7.widget.RecyclerView;
import android.view.View;

/* loaded from: com.bignerdranch.android.recyclerview-multiselect.0.2.jar:android/support/v7/widget/RebindReportingHolder.class */
public abstract class RebindReportingHolder extends RecyclerView.ViewHolder {
    protected abstract void onRebind();

    public RebindReportingHolder(View itemView) {
        super(itemView);
    }

    void setFlags(int flags, int mask) {
        super.setFlags(flags, mask);
        int setFlags = mask & flags;
        checkFlags(setFlags);
    }

    void addFlags(int flags) {
        super.addFlags(flags);
        checkFlags(flags);
    }

    private void checkFlags(int setFlags) {
        if (isRelevantFlagSet(setFlags)) {
            onRebind();
        }
    }

    private static boolean isRelevantFlagSet(int flag) {
        for (int i : new int[]{1, 64, 2, 32}) {
            Integer value = Integer.valueOf(i);
            if ((flag & value.intValue()) == value.intValue()) {
                return true;
            }
        }
        return false;
    }

    void offsetPosition(int offset, boolean applyToPreLayout) {
        super.offsetPosition(offset, applyToPreLayout);
        onRebind();
    }
}
