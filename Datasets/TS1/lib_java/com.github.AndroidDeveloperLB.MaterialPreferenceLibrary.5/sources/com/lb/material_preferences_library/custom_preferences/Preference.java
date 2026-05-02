package com.lb.material_preferences_library.custom_preferences;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.support.annotation.DrawableRes;
import android.support.v4.content.ContextCompat;
import android.util.AttributeSet;
import android.view.View;
import android.widget.ImageView;
import com.lb.material_preferences_library.R;

/* loaded from: com.github.AndroidDeveloperLB.MaterialPreferenceLibrary.5.jar:com/lb/material_preferences_library/custom_preferences/Preference.class */
public class Preference extends android.preference.Preference {
    private boolean _isInitialized;
    private int _iconResId;
    private Drawable _icon;

    protected void init(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        setLayoutResource(R.layout.mpl__preference);
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.Preference, defStyleAttr, defStyleRes);
        this._iconResId = a.getResourceId(R.styleable.Preference_icon, 0);
        a.recycle();
    }

    @TargetApi(21)
    public Preference(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        this._isInitialized = false;
        if (!this._isInitialized) {
            this._isInitialized = true;
            init(context, attrs, defStyleAttr, defStyleRes);
        }
    }

    @Override // android.preference.Preference
    public void setIcon(Drawable icon) {
        if ((icon == null && this._icon != null) || (icon != null && this._icon != icon)) {
            this._icon = icon;
            notifyChanged();
        }
    }

    public void setIconCompat(@DrawableRes int iconResId) {
        if (this._iconResId != iconResId) {
            this._iconResId = iconResId;
            setIcon(ContextCompat.getDrawable(getContext(), iconResId));
        }
    }

    public Drawable getIconCompat() {
        return this._icon;
    }

    public Preference(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this._isInitialized = false;
        if (!this._isInitialized) {
            this._isInitialized = true;
            init(context, attrs, defStyleAttr, 0);
        }
    }

    public Preference(Context context, AttributeSet attrs) {
        super(context, attrs);
        this._isInitialized = false;
        if (!this._isInitialized) {
            this._isInitialized = true;
            init(context, attrs, 0, 0);
        }
    }

    public Preference(Context context) {
        super(context);
        this._isInitialized = false;
        if (!this._isInitialized) {
            this._isInitialized = true;
            init(context, null, 0, 0);
        }
    }

    @Override // android.preference.Preference
    protected void onBindView(View view) {
        super.onBindView(view);
        ImageView imageView = (ImageView) view.findViewById(R.id.icon);
        if (imageView != null) {
            if (this._iconResId != 0 || this._icon != null) {
                if (this._icon == null) {
                    this._icon = ContextCompat.getDrawable(getContext(), this._iconResId);
                }
                if (this._icon != null) {
                    imageView.setImageDrawable(this._icon);
                }
            }
            imageView.setVisibility(this._icon != null ? 0 : 8);
        }
        View imageFrame = view.findViewById(R.id.icon_frame);
        if (imageFrame != null) {
            imageFrame.setVisibility(this._icon != null ? 0 : 8);
        }
    }
}
