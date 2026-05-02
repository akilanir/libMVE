package com.rey.material.widget;

import android.content.Context;
import android.util.AttributeSet;
import com.rey.material.drawable.RadioButtonDrawable;

/* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/RadioButton.class */
public class RadioButton extends CompoundButton {
    public RadioButton(Context context) {
        super(context);
    }

    public RadioButton(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public RadioButton(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    public RadioButton(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
    }

    @Override // com.rey.material.widget.CompoundButton
    protected void applyStyle(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super.applyStyle(context, attrs, defStyleAttr, defStyleRes);
        RadioButtonDrawable drawable = new RadioButtonDrawable.Builder(context, attrs, defStyleAttr, defStyleRes).build();
        drawable.setInEditMode(isInEditMode());
        drawable.setAnimEnable(false);
        setButtonDrawable(drawable);
        drawable.setAnimEnable(true);
    }

    @Override // android.widget.CompoundButton, android.widget.Checkable
    public void toggle() {
        if (!isChecked()) {
            super.toggle();
        }
    }

    public void setCheckedImmediately(boolean checked) {
        if (getButtonDrawable() instanceof RadioButtonDrawable) {
            RadioButtonDrawable drawable = (RadioButtonDrawable) getButtonDrawable();
            drawable.setAnimEnable(false);
            setChecked(checked);
            drawable.setAnimEnable(true);
            return;
        }
        setChecked(checked);
    }
}
