package android.support.v7.preference;

import android.R;
import android.os.Handler;
import android.support.v7.preference.Preference;
import android.support.v7.widget.RecyclerView;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import java.util.ArrayList;
import java.util.List;

/* loaded from: com.android.support.preference-v7.23.1.0.jar:android/support/v7/preference/PreferenceGroupAdapter.class */
public class PreferenceGroupAdapter extends RecyclerView.Adapter<PreferenceViewHolder> implements Preference.OnPreferenceChangeInternalListener {
    private static final String TAG = "PreferenceGroupAdapter";
    private PreferenceGroup mPreferenceGroup;
    private List<Preference> mPreferenceList;
    private List<Preference> mPreferenceListInternal;
    private List<PreferenceLayout> mPreferenceLayouts;
    private PreferenceLayout mTempPreferenceLayout = new PreferenceLayout();
    private volatile boolean mIsSyncing = false;
    private Handler mHandler = new Handler();
    private Runnable mSyncRunnable = new Runnable() { // from class: android.support.v7.preference.PreferenceGroupAdapter.1
        @Override // java.lang.Runnable
        public void run() {
            PreferenceGroupAdapter.this.syncMyPreferences();
        }
    };

    /* loaded from: com.android.support.preference-v7.23.1.0.jar:android/support/v7/preference/PreferenceGroupAdapter$PreferenceLayout.class */
    private static class PreferenceLayout {
        private int resId;
        private int widgetResId;
        private String name;

        private PreferenceLayout() {
        }

        public boolean equals(Object o) {
            if (!(o instanceof PreferenceLayout)) {
                return false;
            }
            PreferenceLayout other = (PreferenceLayout) o;
            return this.resId == other.resId && this.widgetResId == other.widgetResId && TextUtils.equals(this.name, other.name);
        }

        public int hashCode() {
            int result = (31 * 17) + this.resId;
            return (31 * ((31 * result) + this.widgetResId)) + this.name.hashCode();
        }
    }

    public PreferenceGroupAdapter(PreferenceGroup preferenceGroup) {
        this.mPreferenceGroup = preferenceGroup;
        this.mPreferenceGroup.setOnPreferenceChangeInternalListener(this);
        this.mPreferenceList = new ArrayList();
        this.mPreferenceListInternal = new ArrayList();
        this.mPreferenceLayouts = new ArrayList();
        setHasStableIds(true);
        syncMyPreferences();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void syncMyPreferences() {
        synchronized (this) {
            if (this.mIsSyncing) {
                return;
            }
            this.mIsSyncing = true;
            List<Preference> newPreferenceList = new ArrayList<>(this.mPreferenceListInternal.size());
            flattenPreferenceGroup(newPreferenceList, this.mPreferenceGroup);
            this.mPreferenceListInternal = newPreferenceList;
            this.mPreferenceList = new ArrayList(this.mPreferenceListInternal.size());
            for (Preference preference : this.mPreferenceListInternal) {
                if (preference.isVisible()) {
                    this.mPreferenceList.add(preference);
                }
            }
            notifyDataSetChanged();
            synchronized (this) {
                this.mIsSyncing = false;
                notifyAll();
            }
        }
    }

    private void flattenPreferenceGroup(List<Preference> preferences, PreferenceGroup group) {
        group.sortPreferences();
        int groupSize = group.getPreferenceCount();
        for (int i = 0; i < groupSize; i++) {
            Preference preference = group.getPreference(i);
            preferences.add(preference);
            addPreferenceClassName(preference);
            if (preference instanceof PreferenceGroup) {
                PreferenceGroup preferenceAsGroup = (PreferenceGroup) preference;
                if (preferenceAsGroup.isOnSameScreenAsChildren()) {
                    flattenPreferenceGroup(preferences, preferenceAsGroup);
                }
            }
            preference.setOnPreferenceChangeInternalListener(this);
        }
    }

    private PreferenceLayout createPreferenceLayout(Preference preference, PreferenceLayout in) {
        PreferenceLayout pl = in != null ? in : new PreferenceLayout();
        pl.name = preference.getClass().getName();
        pl.resId = preference.getLayoutResource();
        pl.widgetResId = preference.getWidgetLayoutResource();
        return pl;
    }

    private void addPreferenceClassName(Preference preference) {
        PreferenceLayout pl = createPreferenceLayout(preference, null);
        if (!this.mPreferenceLayouts.contains(pl)) {
            this.mPreferenceLayouts.add(pl);
        }
    }

    public int getItemCount() {
        return this.mPreferenceList.size();
    }

    public Preference getItem(int position) {
        if (position < 0 || position >= getItemCount()) {
            return null;
        }
        return this.mPreferenceList.get(position);
    }

    public long getItemId(int position) {
        if (position < 0 || position >= getItemCount()) {
            return Long.MIN_VALUE;
        }
        return getItem(position).getId();
    }

    @Override // android.support.v7.preference.Preference.OnPreferenceChangeInternalListener
    public void onPreferenceChange(Preference preference) {
        notifyDataSetChanged();
    }

    @Override // android.support.v7.preference.Preference.OnPreferenceChangeInternalListener
    public void onPreferenceHierarchyChange(Preference preference) {
        this.mHandler.removeCallbacks(this.mSyncRunnable);
        this.mHandler.post(this.mSyncRunnable);
    }

    @Override // android.support.v7.preference.Preference.OnPreferenceChangeInternalListener
    public void onPreferenceVisibilityChange(Preference preference) {
        if (preference.isVisible()) {
            int previousVisibleIndex = -1;
            for (Preference pref : this.mPreferenceListInternal) {
                if (preference.equals(pref)) {
                    break;
                } else if (pref.isVisible()) {
                    previousVisibleIndex++;
                }
            }
            this.mPreferenceList.add(previousVisibleIndex + 1, preference);
            notifyItemInserted(previousVisibleIndex + 1);
            return;
        }
        int listSize = this.mPreferenceList.size();
        int removalIndex = 0;
        while (removalIndex < listSize && !preference.equals(this.mPreferenceList.get(removalIndex))) {
            removalIndex++;
        }
        this.mPreferenceList.remove(removalIndex);
        notifyItemRemoved(removalIndex);
    }

    public int getItemViewType(int position) {
        Preference preference = getItem(position);
        this.mTempPreferenceLayout = createPreferenceLayout(preference, this.mTempPreferenceLayout);
        return this.mPreferenceLayouts.indexOf(this.mTempPreferenceLayout);
    }

    /* renamed from: onCreateViewHolder, reason: merged with bridge method [inline-methods] */
    public PreferenceViewHolder m3onCreateViewHolder(ViewGroup parent, int viewType) {
        PreferenceLayout pl = this.mPreferenceLayouts.get(viewType);
        LayoutInflater inflater = LayoutInflater.from(parent.getContext());
        View view = inflater.inflate(pl.resId, parent, false);
        ViewGroup widgetFrame = (ViewGroup) view.findViewById(R.id.widget_frame);
        if (widgetFrame != null) {
            if (pl.widgetResId != 0) {
                inflater.inflate(pl.widgetResId, widgetFrame);
            } else {
                widgetFrame.setVisibility(8);
            }
        }
        return new PreferenceViewHolder(view);
    }

    public void onBindViewHolder(PreferenceViewHolder holder, int position) {
        Preference preference = getItem(position);
        preference.onBindViewHolder(holder);
    }
}
