package com.rey.material.widget;

import android.content.Context;
import android.util.AttributeSet;
import com.rey.material.drawable.CheckBoxDrawable;

/* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/CheckBox.class */
public class CheckBox extends CompoundButton {
    public CheckBox(Context context) {
        super(context);
    }

    public CheckBox(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public CheckBox(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    public CheckBox(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
    }

    @Override // com.rey.material.widget.CompoundButton
    protected void applyStyle(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super.applyStyle(context, attrs, defStyleAttr, defStyleRes);
        CheckBoxDrawable drawable = new CheckBoxDrawable.Builder(context, attrs, defStyleAttr, defStyleRes).build();
        drawable.setInEditMode(isInEditMode());
        drawable.setAnimEnable(false);
        setButtonDrawable(drawable);
        drawable.setAnimEnable(true);
    }

    public void setCheckedImmediately(boolean checked) {
        if (getButtonDrawable() instanceof CheckBoxDrawable) {
            CheckBoxDrawable drawable = (CheckBoxDrawable) getButtonDrawable();
            drawable.setAnimEnable(false);
            setChecked(checked);
            drawable.setAnimEnable(true);
            return;
        }
        setChecked(checked);
    }
}
