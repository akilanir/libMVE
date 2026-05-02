package com.jenzz.materialpreference;

import android.R;
import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

/* loaded from: com.jenzz.materialpreference.1.3.jar:com/jenzz/materialpreference/Preference.class */
public class Preference extends android.preference.Preference {
    TextView titleView;
    TextView summaryView;
    ImageView imageView;
    View imageFrame;
    private int iconResId;
    private Drawable icon;

    public Preference(Context context) {
        super(context);
        init(context, null, 0, 0);
    }

    public Preference(Context context, AttributeSet attrs) {
        super(context, attrs);
        init(context, attrs, 0, 0);
    }

    public Preference(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init(context, attrs, defStyleAttr, 0);
    }

    @TargetApi(21)
    public Preference(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        init(context, attrs, defStyleAttr, defStyleRes);
    }

    private void init(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        TypedArray typedArray = context.obtainStyledAttributes(attrs, new int[]{R.attr.icon}, defStyleAttr, defStyleRes);
        this.iconResId = typedArray.getResourceId(0, 0);
        typedArray.recycle();
    }

    @Override // android.preference.Preference
    protected View onCreateView(ViewGroup parent) {
        LayoutInflater layoutInflater = (LayoutInflater) getContext().getSystemService("layout_inflater");
        View layout = layoutInflater.inflate(R.layout.mp_preference, parent, false);
        ViewGroup widgetFrame = (ViewGroup) layout.findViewById(R.id.widget_frame);
        int widgetLayoutResId = getWidgetLayoutResource();
        if (widgetLayoutResId != 0) {
            layoutInflater.inflate(widgetLayoutResId, widgetFrame);
        }
        widgetFrame.setVisibility(widgetLayoutResId != 0 ? 0 : 8);
        return layout;
    }

    @Override // android.preference.Preference
    protected void onBindView(View view) {
        super.onBindView(view);
        CharSequence title = getTitle();
        this.titleView = (TextView) view.findViewById(R.id.title);
        this.titleView.setText(title);
        this.titleView.setVisibility(!TextUtils.isEmpty(title) ? 0 : 8);
        this.titleView.setTypeface(Typefaces.getRobotoRegular(getContext()));
        CharSequence summary = getSummary();
        this.summaryView = (TextView) view.findViewById(R.id.summary);
        this.summaryView.setText(summary);
        this.summaryView.setVisibility(!TextUtils.isEmpty(summary) ? 0 : 8);
        this.summaryView.setTypeface(Typefaces.getRobotoRegular(getContext()));
        if (this.icon == null && this.iconResId > 0) {
            this.icon = getContext().getResources().getDrawable(this.iconResId);
        }
        this.imageView = (ImageView) view.findViewById(R.id.icon);
        this.imageView.setImageDrawable(this.icon);
        this.imageView.setVisibility(this.icon != null ? 0 : 8);
        this.imageFrame = view.findViewById(R.id.icon_frame);
        this.imageFrame.setVisibility(this.icon != null ? 0 : 8);
    }

    @Override // android.preference.Preference
    public void setIcon(int iconResId) {
        super.setIcon(iconResId);
        this.iconResId = iconResId;
    }

    @Override // android.preference.Preference
    public void setIcon(Drawable icon) {
        super.setIcon(icon);
        this.icon = icon;
    }
}
