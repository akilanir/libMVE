package org.ligi.axt.preferences;

import android.app.AlertDialog;
import android.content.Context;
import android.preference.DialogPreference;
import android.util.AttributeSet;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.SeekBar;

/* loaded from: org.ligi.AXT.0.35.jar:org/ligi/axt/preferences/SeekBarPreference.class */
public class SeekBarPreference extends DialogPreference implements SeekBar.OnSeekBarChangeListener {
    private final Context context;
    private SeekBar seek_bar;
    private int max;
    private EditText edit_text;

    public SeekBarPreference(Context context) {
        super(context, null);
        this.max = Integer.MAX_VALUE;
        this.context = context;
    }

    public SeekBarPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.max = Integer.MAX_VALUE;
        this.context = context;
    }

    @Override // android.preference.DialogPreference
    protected void onPrepareDialogBuilder(AlertDialog.Builder builder) {
        LinearLayout layout = new LinearLayout(this.context);
        layout.setOrientation(1);
        layout.setLayoutParams(new LinearLayout.LayoutParams(-1, -2));
        layout.setMinimumWidth(400);
        layout.setPadding(20, 20, 20, 20);
        this.edit_text = new EditText(this.context);
        this.edit_text.setInputType(2);
        this.edit_text.setText(String.valueOf(getPersistedInt(0)));
        layout.addView(this.edit_text);
        this.seek_bar = new SeekBar(this.context);
        this.seek_bar.setMax(this.max);
        this.seek_bar.setLayoutParams(new ViewGroup.LayoutParams(-1, -2));
        this.seek_bar.setOnSeekBarChangeListener(this);
        this.seek_bar.setProgress(getPersistedInt(0));
        layout.addView(this.seek_bar);
        builder.setView(layout);
        super.onPrepareDialogBuilder(builder);
    }

    @Override // android.preference.DialogPreference
    protected void onDialogClosed(boolean positiveResult) {
        if (positiveResult) {
            persistInt(this.seek_bar.getProgress());
            getOnPreferenceChangeListener().onPreferenceChange(this, Integer.valueOf(this.seek_bar.getProgress()));
        }
    }

    public void setMax(int max) {
        this.max = max;
    }

    public int getMax() {
        return this.max;
    }

    @Override // android.widget.SeekBar.OnSeekBarChangeListener
    public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
        this.edit_text.setText(String.valueOf(progress));
    }

    @Override // android.widget.SeekBar.OnSeekBarChangeListener
    public void onStartTrackingTouch(SeekBar seekBar) {
    }

    @Override // android.widget.SeekBar.OnSeekBarChangeListener
    public void onStopTrackingTouch(SeekBar seekBar) {
    }
}
