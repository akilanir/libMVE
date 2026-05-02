package org.ligi.axt.extensions;

import android.content.SharedPreferences;
import android.widget.CheckBox;
import android.widget.CompoundButton;

/* loaded from: org.ligi.AXT.0.35.jar:org/ligi/axt/extensions/CheckBoxAXT.class */
public class CheckBoxAXT extends ViewAXT {
    private final CheckBox checkBox;

    public CheckBoxAXT(CheckBox checkBox) {
        super(checkBox);
        this.checkBox = checkBox;
    }

    public void careForCheckedStatePersistence(final String tag) {
        final SharedPreferences mSharedPrefs = this.checkBox.getContext().getSharedPreferences("ui_state", 1);
        this.checkBox.setChecked(mSharedPrefs.getBoolean(tag, this.checkBox.isChecked()));
        this.checkBox.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() { // from class: org.ligi.axt.extensions.CheckBoxAXT.1
            @Override // android.widget.CompoundButton.OnCheckedChangeListener
            public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                mSharedPrefs.edit().putBoolean(tag, isChecked).commit();
            }
        });
    }
}
