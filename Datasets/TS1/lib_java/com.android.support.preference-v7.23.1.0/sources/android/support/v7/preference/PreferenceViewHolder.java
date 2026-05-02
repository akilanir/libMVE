package android.support.v7.preference;

import android.R;
import android.support.annotation.IdRes;
import android.support.v7.widget.RecyclerView;
import android.util.SparseArray;
import android.view.View;

/* loaded from: com.android.support.preference-v7.23.1.0.jar:android/support/v7/preference/PreferenceViewHolder.class */
public class PreferenceViewHolder extends RecyclerView.ViewHolder {
    private final SparseArray<View> mCachedViews;

    PreferenceViewHolder(View itemView) {
        super(itemView);
        this.mCachedViews = new SparseArray<>(4);
        this.mCachedViews.put(R.id.title, itemView.findViewById(R.id.title));
        this.mCachedViews.put(R.id.summary, itemView.findViewById(R.id.summary));
        this.mCachedViews.put(R.id.icon, itemView.findViewById(R.id.icon));
        this.mCachedViews.put(R.id.icon_frame, itemView.findViewById(R.id.icon_frame));
    }

    public View findViewById(@IdRes int id) {
        View cachedView = this.mCachedViews.get(id);
        if (cachedView != null) {
            return cachedView;
        }
        View v = this.itemView.findViewById(id);
        if (v != null) {
            this.mCachedViews.put(id, v);
        }
        return v;
    }
}
