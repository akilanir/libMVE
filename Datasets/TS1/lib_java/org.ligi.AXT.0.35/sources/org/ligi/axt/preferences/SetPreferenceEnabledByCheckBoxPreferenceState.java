package org.ligi.axt.preferences;

import android.preference.CheckBoxPreference;
import android.preference.Preference;
import java.util.Iterator;
import java.util.Vector;

/* loaded from: org.ligi.AXT.0.35.jar:org/ligi/axt/preferences/SetPreferenceEnabledByCheckBoxPreferenceState.class */
public class SetPreferenceEnabledByCheckBoxPreferenceState implements Preference.OnPreferenceChangeListener {
    private Vector<Preference> preference_vector;
    private CheckBoxPreference pref;

    public SetPreferenceEnabledByCheckBoxPreferenceState(CheckBoxPreference pref) {
        this.pref = pref;
        pref.setOnPreferenceChangeListener(this);
        this.preference_vector = new Vector<>();
    }

    public SetPreferenceEnabledByCheckBoxPreferenceState addPreference2SetEnable(Preference new_p) {
        this.preference_vector.add(new_p);
        new_p.setEnabled(this.pref.isChecked());
        return this;
    }

    @Override // android.preference.Preference.OnPreferenceChangeListener
    public boolean onPreferenceChange(Preference preference, Object newValue) {
        Iterator<Preference> it = this.preference_vector.iterator();
        while (it.hasNext()) {
            Preference p = it.next();
            p.setEnabled(((Boolean) newValue).booleanValue());
        }
        return true;
    }
}
