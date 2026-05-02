package android.support.v7.preference;

import android.content.Context;
import android.content.res.TypedArray;
import android.os.Bundle;
import android.support.v4.content.res.TypedArrayUtils;
import android.text.TextUtils;
import android.util.AttributeSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* loaded from: com.android.support.preference-v7.23.1.1.jar:android/support/v7/preference/PreferenceGroup.class */
public abstract class PreferenceGroup extends Preference {
    private List<Preference> mPreferenceList;
    private boolean mOrderingAsAdded;
    private int mCurrentPreferenceOrder;
    private boolean mAttachedToHierarchy;

    public PreferenceGroup(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        this.mOrderingAsAdded = true;
        this.mCurrentPreferenceOrder = 0;
        this.mAttachedToHierarchy = false;
        this.mPreferenceList = new ArrayList();
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.PreferenceGroup, defStyleAttr, defStyleRes);
        this.mOrderingAsAdded = TypedArrayUtils.getBoolean(a, R.styleable.PreferenceGroup_orderingFromXml, R.styleable.PreferenceGroup_orderingFromXml, true);
        a.recycle();
    }

    public PreferenceGroup(Context context, AttributeSet attrs, int defStyleAttr) {
        this(context, attrs, defStyleAttr, 0);
    }

    public PreferenceGroup(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public void setOrderingAsAdded(boolean orderingAsAdded) {
        this.mOrderingAsAdded = orderingAsAdded;
    }

    public boolean isOrderingAsAdded() {
        return this.mOrderingAsAdded;
    }

    public void addItemFromInflater(Preference preference) {
        addPreference(preference);
    }

    public int getPreferenceCount() {
        return this.mPreferenceList.size();
    }

    public Preference getPreference(int index) {
        return this.mPreferenceList.get(index);
    }

    public boolean addPreference(Preference preference) {
        if (this.mPreferenceList.contains(preference)) {
            return true;
        }
        if (preference.getOrder() == Integer.MAX_VALUE) {
            if (this.mOrderingAsAdded) {
                int i = this.mCurrentPreferenceOrder;
                this.mCurrentPreferenceOrder = i + 1;
                preference.setOrder(i);
            }
            if (preference instanceof PreferenceGroup) {
                ((PreferenceGroup) preference).setOrderingAsAdded(this.mOrderingAsAdded);
            }
        }
        int insertionIndex = Collections.binarySearch(this.mPreferenceList, preference);
        if (insertionIndex < 0) {
            insertionIndex = (insertionIndex * (-1)) - 1;
        }
        if (!onPrepareAddPreference(preference)) {
            return false;
        }
        synchronized (this) {
            this.mPreferenceList.add(insertionIndex, preference);
        }
        preference.onAttachedToHierarchy(getPreferenceManager());
        if (this.mAttachedToHierarchy) {
            preference.onAttached();
        }
        notifyHierarchyChanged();
        return true;
    }

    public boolean removePreference(Preference preference) {
        boolean returnValue = removePreferenceInt(preference);
        notifyHierarchyChanged();
        return returnValue;
    }

    private boolean removePreferenceInt(Preference preference) {
        boolean remove;
        synchronized (this) {
            preference.onPrepareForRemoval();
            remove = this.mPreferenceList.remove(preference);
        }
        return remove;
    }

    public void removeAll() {
        synchronized (this) {
            List<Preference> preferenceList = this.mPreferenceList;
            for (int i = preferenceList.size() - 1; i >= 0; i--) {
                removePreferenceInt(preferenceList.get(0));
            }
        }
        notifyHierarchyChanged();
    }

    protected boolean onPrepareAddPreference(Preference preference) {
        preference.onParentChanged(this, shouldDisableDependents());
        return true;
    }

    public Preference findPreference(CharSequence key) {
        Preference returnedPreference;
        if (TextUtils.equals(getKey(), key)) {
            return this;
        }
        int preferenceCount = getPreferenceCount();
        for (int i = 0; i < preferenceCount; i++) {
            Preference preference = getPreference(i);
            String curKey = preference.getKey();
            if (curKey != null && curKey.equals(key)) {
                return preference;
            }
            if ((preference instanceof PreferenceGroup) && (returnedPreference = ((PreferenceGroup) preference).findPreference(key)) != null) {
                return returnedPreference;
            }
        }
        return null;
    }

    protected boolean isOnSameScreenAsChildren() {
        return true;
    }

    @Override // android.support.v7.preference.Preference
    public void onAttached() {
        super.onAttached();
        this.mAttachedToHierarchy = true;
        int preferenceCount = getPreferenceCount();
        for (int i = 0; i < preferenceCount; i++) {
            getPreference(i).onAttached();
        }
    }

    @Override // android.support.v7.preference.Preference
    protected void onPrepareForRemoval() {
        super.onPrepareForRemoval();
        this.mAttachedToHierarchy = false;
    }

    @Override // android.support.v7.preference.Preference
    public void notifyDependencyChange(boolean disableDependents) {
        super.notifyDependencyChange(disableDependents);
        int preferenceCount = getPreferenceCount();
        for (int i = 0; i < preferenceCount; i++) {
            getPreference(i).onParentChanged(this, disableDependents);
        }
    }

    void sortPreferences() {
        synchronized (this) {
            Collections.sort(this.mPreferenceList);
        }
    }

    @Override // android.support.v7.preference.Preference
    protected void dispatchSaveInstanceState(Bundle container) {
        super.dispatchSaveInstanceState(container);
        int preferenceCount = getPreferenceCount();
        for (int i = 0; i < preferenceCount; i++) {
            getPreference(i).dispatchSaveInstanceState(container);
        }
    }

    @Override // android.support.v7.preference.Preference
    protected void dispatchRestoreInstanceState(Bundle container) {
        super.dispatchRestoreInstanceState(container);
        int preferenceCount = getPreferenceCount();
        for (int i = 0; i < preferenceCount; i++) {
            getPreference(i).dispatchRestoreInstanceState(container);
        }
    }
}
