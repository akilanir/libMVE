package com.afollestad.materialdialogs.color;

import android.R;
import android.app.Activity;
import android.app.Dialog;
import android.content.DialogInterface;
import android.content.res.Resources;
import android.graphics.Color;
import android.os.Build;
import android.os.Bundle;
import android.support.annotation.ArrayRes;
import android.support.annotation.ColorInt;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.StringRes;
import android.support.v4.app.DialogFragment;
import android.support.v4.content.res.ResourcesCompat;
import android.support.v7.app.AppCompatActivity;
import android.text.Editable;
import android.text.InputFilter;
import android.text.TextWatcher;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AbsListView;
import android.widget.BaseAdapter;
import android.widget.EditText;
import android.widget.GridView;
import android.widget.ListAdapter;
import android.widget.SeekBar;
import android.widget.TextView;
import com.afollestad.materialdialogs.DialogAction;
import com.afollestad.materialdialogs.MaterialDialog;
import com.afollestad.materialdialogs.internal.MDTintHelper;
import com.afollestad.materialdialogs.util.DialogUtils;
import java.io.Serializable;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

/* loaded from: com.github.afollestad.material-dialogs.commons.0.8.5.4.jar:com/afollestad/materialdialogs/color/ColorChooserDialog.class */
public class ColorChooserDialog extends DialogFragment implements View.OnClickListener, View.OnLongClickListener {
    public static final String TAG_PRIMARY = "[MD_COLOR_CHOOSER]";
    public static final String TAG_ACCENT = "[MD_COLOR_CHOOSER]";
    public static final String TAG_CUSTOM = "[MD_COLOR_CHOOSER]";

    @NonNull
    private int[] mColorsTop;

    @Nullable
    private int[][] mColorsSub;
    private int mCircleSize;
    private ColorCallback mCallback;
    private GridView mGrid;
    private View mColorChooserCustomFrame;
    private EditText mCustomColorHex;
    private View mCustomColorIndicator;
    private TextWatcher mCustomColorTextWatcher;
    private SeekBar mCustomSeekA;
    private TextView mCustomSeekAValue;
    private SeekBar mCustomSeekR;
    private TextView mCustomSeekRValue;
    private SeekBar mCustomSeekG;
    private TextView mCustomSeekGValue;
    private SeekBar mCustomSeekB;
    private TextView mCustomSeekBValue;
    private SeekBar.OnSeekBarChangeListener mCustomColorRgbListener;
    private int mSelectedCustomColor;

    /* loaded from: com.github.afollestad.material-dialogs.commons.0.8.5.4.jar:com/afollestad/materialdialogs/color/ColorChooserDialog$ColorCallback.class */
    public interface ColorCallback {
        void onColorSelection(@NonNull ColorChooserDialog colorChooserDialog, @ColorInt int i);
    }

    @Retention(RetentionPolicy.SOURCE)
    /* loaded from: com.github.afollestad.material-dialogs.commons.0.8.5.4.jar:com/afollestad/materialdialogs/color/ColorChooserDialog$ColorChooserTag.class */
    public @interface ColorChooserTag {
    }

    private void generateColors() {
        Builder builder = getBuilder();
        if (builder.mColorsTop != null) {
            this.mColorsTop = builder.mColorsTop;
            this.mColorsSub = builder.mColorsSub;
        } else if (builder.mAccentMode) {
            this.mColorsTop = ColorPalette.ACCENT_COLORS;
            this.mColorsSub = ColorPalette.ACCENT_COLORS_SUB;
        } else {
            this.mColorsTop = ColorPalette.PRIMARY_COLORS;
            this.mColorsSub = ColorPalette.PRIMARY_COLORS_SUB;
        }
    }

    public void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        outState.putInt("top_index", topIndex());
        outState.putBoolean("in_sub", isInSub());
        outState.putInt("sub_index", subIndex());
        outState.putBoolean("in_custom", this.mColorChooserCustomFrame != null && this.mColorChooserCustomFrame.getVisibility() == 0);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public void onAttach(Activity activity) {
        super.onAttach(activity);
        if (!(activity instanceof ColorCallback)) {
            throw new IllegalStateException("ColorChooserDialog needs to be shown from an Activity implementing ColorCallback.");
        }
        this.mCallback = (ColorCallback) activity;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean isInSub() {
        return getArguments().getBoolean("in_sub", false);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void isInSub(boolean value) {
        getArguments().putBoolean("in_sub", value);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public int topIndex() {
        return getArguments().getInt("top_index", -1);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void topIndex(int value) {
        if (topIndex() != value && value > -1) {
            findSubIndexForColor(value, this.mColorsTop[value]);
        }
        getArguments().putInt("top_index", value);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public int subIndex() {
        if (this.mColorsSub == null) {
            return -1;
        }
        return getArguments().getInt("sub_index", -1);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void subIndex(int value) {
        if (this.mColorsSub == null) {
            return;
        }
        getArguments().putInt("sub_index", value);
    }

    @StringRes
    public int getTitle() {
        Builder builder = getBuilder();
        int title = isInSub() ? builder.mTitleSub : builder.mTitle;
        if (title == 0) {
            title = builder.mTitle;
        }
        return title;
    }

    public boolean isAccentMode() {
        return getBuilder().mAccentMode;
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        if (v.getTag() != null) {
            String[] tag = ((String) v.getTag()).split(":");
            int index = Integer.parseInt(tag[0]);
            MaterialDialog dialog = getDialog();
            Builder builder = getBuilder();
            if (isInSub()) {
                subIndex(index);
            } else {
                topIndex(index);
                if (this.mColorsSub != null && index < this.mColorsSub.length) {
                    dialog.setActionButton(DialogAction.NEGATIVE, builder.mBackBtn);
                    isInSub(true);
                }
            }
            if (builder.mAllowUserCustom) {
                this.mSelectedCustomColor = getSelectedColor();
            }
            invalidateDynamicButtonColors();
            invalidate();
        }
    }

    @Override // android.view.View.OnLongClickListener
    public boolean onLongClick(View v) {
        if (v.getTag() != null) {
            String[] tag = ((String) v.getTag()).split(":");
            int color = Integer.parseInt(tag[1]);
            ((CircleView) v).showHint(color);
            return true;
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void invalidateDynamicButtonColors() {
        MaterialDialog dialog = getDialog();
        if (dialog == null) {
            return;
        }
        Builder builder = getBuilder();
        if (builder.mDynamicButtonColor) {
            int selectedColor = getSelectedColor();
            if (Color.alpha(selectedColor) < 64 || (Color.red(selectedColor) > 247 && Color.green(selectedColor) > 247 && Color.blue(selectedColor) > 247)) {
                selectedColor = Color.parseColor("#DEDEDE");
            }
            if (getBuilder().mDynamicButtonColor) {
                dialog.getActionButton(DialogAction.POSITIVE).setTextColor(selectedColor);
                dialog.getActionButton(DialogAction.NEGATIVE).setTextColor(selectedColor);
                dialog.getActionButton(DialogAction.NEUTRAL).setTextColor(selectedColor);
            }
            if (this.mCustomSeekR != null) {
                if (this.mCustomSeekA.getVisibility() == 0) {
                    MDTintHelper.setTint(this.mCustomSeekA, selectedColor);
                }
                MDTintHelper.setTint(this.mCustomSeekR, selectedColor);
                MDTintHelper.setTint(this.mCustomSeekG, selectedColor);
                MDTintHelper.setTint(this.mCustomSeekB, selectedColor);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    @ColorInt
    public int getSelectedColor() {
        if (this.mColorChooserCustomFrame != null && this.mColorChooserCustomFrame.getVisibility() == 0) {
            return this.mSelectedCustomColor;
        }
        int color = 0;
        if (subIndex() > -1) {
            color = this.mColorsSub[topIndex()][subIndex()];
        } else if (topIndex() > -1) {
            color = this.mColorsTop[topIndex()];
        }
        if (color == 0) {
            int fallback = 0;
            if (Build.VERSION.SDK_INT >= 21) {
                fallback = DialogUtils.resolveColor(getActivity(), R.attr.colorAccent);
            }
            color = DialogUtils.resolveColor(getActivity(), com.afollestad.materialdialogs.commons.R.attr.colorAccent, fallback);
        }
        return color;
    }

    private void findSubIndexForColor(int topIndex, int color) {
        if (this.mColorsSub == null || this.mColorsSub.length - 1 < topIndex) {
            return;
        }
        int[] subColors = this.mColorsSub[topIndex];
        for (int subIndex = 0; subIndex < subColors.length; subIndex++) {
            if (subColors[subIndex] == color) {
                subIndex(subIndex);
                return;
            }
        }
    }

    @NonNull
    public Dialog onCreateDialog(Bundle savedInstanceState) {
        int preselectColor;
        if (getArguments() == null || !getArguments().containsKey("builder")) {
            throw new IllegalStateException("ColorChooserDialog should be created using its Builder interface.");
        }
        generateColors();
        boolean foundPreselectColor = false;
        if (savedInstanceState != null) {
            foundPreselectColor = !savedInstanceState.getBoolean("in_custom", false);
            preselectColor = getSelectedColor();
        } else if (getBuilder().mSetPreselectionColor) {
            preselectColor = getBuilder().mPreselect;
            if (preselectColor != 0) {
                int topIndex = 0;
                while (true) {
                    if (topIndex >= this.mColorsTop.length) {
                        break;
                    }
                    if (this.mColorsTop[topIndex] == preselectColor) {
                        foundPreselectColor = true;
                        topIndex(topIndex);
                        if (getBuilder().mAccentMode) {
                            subIndex(2);
                        } else if (this.mColorsSub != null) {
                            findSubIndexForColor(topIndex, preselectColor);
                        } else {
                            subIndex(5);
                        }
                    } else {
                        if (this.mColorsSub != null) {
                            int subIndex = 0;
                            while (true) {
                                if (subIndex >= this.mColorsSub[topIndex].length) {
                                    break;
                                }
                                if (this.mColorsSub[topIndex][subIndex] != preselectColor) {
                                    subIndex++;
                                } else {
                                    foundPreselectColor = true;
                                    topIndex(topIndex);
                                    subIndex(subIndex);
                                    break;
                                }
                            }
                            if (foundPreselectColor) {
                                break;
                            }
                        }
                        topIndex++;
                    }
                }
            }
        } else {
            preselectColor = -16777216;
            foundPreselectColor = true;
        }
        this.mCircleSize = getResources().getDimensionPixelSize(com.afollestad.materialdialogs.commons.R.dimen.md_colorchooser_circlesize);
        Builder builder = getBuilder();
        MaterialDialog dialog = new MaterialDialog.Builder(getActivity()).title(getTitle()).autoDismiss(false).customView(com.afollestad.materialdialogs.commons.R.layout.md_dialog_colorchooser, false).negativeText(builder.mCancelBtn).positiveText(builder.mDoneBtn).neutralText(builder.mAllowUserCustom ? builder.mCustomBtn : 0).onPositive(new MaterialDialog.SingleButtonCallback() { // from class: com.afollestad.materialdialogs.color.ColorChooserDialog.4
            public void onClick(@NonNull MaterialDialog dialog2, @NonNull DialogAction which) {
                ColorChooserDialog.this.mCallback.onColorSelection(ColorChooserDialog.this, ColorChooserDialog.this.getSelectedColor());
                ColorChooserDialog.this.dismiss();
            }
        }).onNegative(new MaterialDialog.SingleButtonCallback() { // from class: com.afollestad.materialdialogs.color.ColorChooserDialog.3
            public void onClick(@NonNull MaterialDialog dialog2, @NonNull DialogAction which) {
                if (ColorChooserDialog.this.isInSub()) {
                    dialog2.setActionButton(DialogAction.NEGATIVE, ColorChooserDialog.this.getBuilder().mCancelBtn);
                    ColorChooserDialog.this.isInSub(false);
                    ColorChooserDialog.this.invalidate();
                    return;
                }
                dialog2.cancel();
            }
        }).onNeutral(new MaterialDialog.SingleButtonCallback() { // from class: com.afollestad.materialdialogs.color.ColorChooserDialog.2
            public void onClick(@NonNull MaterialDialog dialog2, @NonNull DialogAction which) {
                ColorChooserDialog.this.toggleCustom(dialog2);
            }
        }).showListener(new DialogInterface.OnShowListener() { // from class: com.afollestad.materialdialogs.color.ColorChooserDialog.1
            @Override // android.content.DialogInterface.OnShowListener
            public void onShow(DialogInterface dialog2) {
                ColorChooserDialog.this.invalidateDynamicButtonColors();
            }
        }).build();
        View v = dialog.getCustomView();
        this.mGrid = (GridView) v.findViewById(com.afollestad.materialdialogs.commons.R.id.grid);
        if (builder.mAllowUserCustom) {
            this.mSelectedCustomColor = preselectColor;
            this.mColorChooserCustomFrame = v.findViewById(com.afollestad.materialdialogs.commons.R.id.colorChooserCustomFrame);
            this.mCustomColorHex = (EditText) v.findViewById(com.afollestad.materialdialogs.commons.R.id.hexInput);
            this.mCustomColorIndicator = v.findViewById(com.afollestad.materialdialogs.commons.R.id.colorIndicator);
            this.mCustomSeekA = (SeekBar) v.findViewById(com.afollestad.materialdialogs.commons.R.id.colorA);
            this.mCustomSeekAValue = (TextView) v.findViewById(com.afollestad.materialdialogs.commons.R.id.colorAValue);
            this.mCustomSeekR = (SeekBar) v.findViewById(com.afollestad.materialdialogs.commons.R.id.colorR);
            this.mCustomSeekRValue = (TextView) v.findViewById(com.afollestad.materialdialogs.commons.R.id.colorRValue);
            this.mCustomSeekG = (SeekBar) v.findViewById(com.afollestad.materialdialogs.commons.R.id.colorG);
            this.mCustomSeekGValue = (TextView) v.findViewById(com.afollestad.materialdialogs.commons.R.id.colorGValue);
            this.mCustomSeekB = (SeekBar) v.findViewById(com.afollestad.materialdialogs.commons.R.id.colorB);
            this.mCustomSeekBValue = (TextView) v.findViewById(com.afollestad.materialdialogs.commons.R.id.colorBValue);
            if (!builder.mAllowUserCustomAlpha) {
                v.findViewById(com.afollestad.materialdialogs.commons.R.id.colorALabel).setVisibility(8);
                this.mCustomSeekA.setVisibility(8);
                this.mCustomSeekAValue.setVisibility(8);
                this.mCustomColorHex.setHint("2196F3");
                this.mCustomColorHex.setFilters(new InputFilter[]{new InputFilter.LengthFilter(6)});
            } else {
                this.mCustomColorHex.setHint("FF2196F3");
                this.mCustomColorHex.setFilters(new InputFilter[]{new InputFilter.LengthFilter(8)});
            }
            if (!foundPreselectColor) {
                toggleCustom(dialog);
            }
        }
        invalidate();
        return dialog;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void toggleCustom(MaterialDialog dialog) {
        if (dialog == null) {
            dialog = (MaterialDialog) getDialog();
        }
        if (this.mGrid.getVisibility() == 0) {
            dialog.setTitle(getBuilder().mCustomBtn);
            dialog.setActionButton(DialogAction.NEUTRAL, getBuilder().mPresetsBtn);
            dialog.setActionButton(DialogAction.NEGATIVE, getBuilder().mCancelBtn);
            this.mGrid.setVisibility(4);
            this.mColorChooserCustomFrame.setVisibility(0);
            this.mCustomColorTextWatcher = new TextWatcher() { // from class: com.afollestad.materialdialogs.color.ColorChooserDialog.5
                @Override // android.text.TextWatcher
                public void beforeTextChanged(CharSequence s, int start, int count, int after) {
                }

                @Override // android.text.TextWatcher
                public void onTextChanged(CharSequence s, int start, int before, int count) {
                    try {
                        ColorChooserDialog.this.mSelectedCustomColor = Color.parseColor("#" + s.toString());
                    } catch (IllegalArgumentException e) {
                        ColorChooserDialog.this.mSelectedCustomColor = -16777216;
                    }
                    ColorChooserDialog.this.mCustomColorIndicator.setBackgroundColor(ColorChooserDialog.this.mSelectedCustomColor);
                    if (ColorChooserDialog.this.mCustomSeekA.getVisibility() == 0) {
                        int alpha = Color.alpha(ColorChooserDialog.this.mSelectedCustomColor);
                        ColorChooserDialog.this.mCustomSeekA.setProgress(alpha);
                        ColorChooserDialog.this.mCustomSeekAValue.setText(String.format("%d", Integer.valueOf(alpha)));
                    }
                    if (ColorChooserDialog.this.mCustomSeekA.getVisibility() == 0) {
                        ColorChooserDialog.this.mCustomSeekA.setProgress(Color.alpha(ColorChooserDialog.this.mSelectedCustomColor));
                    }
                    int red = Color.red(ColorChooserDialog.this.mSelectedCustomColor);
                    ColorChooserDialog.this.mCustomSeekR.setProgress(red);
                    int green = Color.green(ColorChooserDialog.this.mSelectedCustomColor);
                    ColorChooserDialog.this.mCustomSeekG.setProgress(green);
                    int blue = Color.blue(ColorChooserDialog.this.mSelectedCustomColor);
                    ColorChooserDialog.this.mCustomSeekB.setProgress(blue);
                    ColorChooserDialog.this.isInSub(false);
                    ColorChooserDialog.this.topIndex(-1);
                    ColorChooserDialog.this.subIndex(-1);
                    ColorChooserDialog.this.invalidateDynamicButtonColors();
                }

                @Override // android.text.TextWatcher
                public void afterTextChanged(Editable s) {
                }
            };
            this.mCustomColorHex.addTextChangedListener(this.mCustomColorTextWatcher);
            this.mCustomColorRgbListener = new SeekBar.OnSeekBarChangeListener() { // from class: com.afollestad.materialdialogs.color.ColorChooserDialog.6
                @Override // android.widget.SeekBar.OnSeekBarChangeListener
                public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                    if (fromUser) {
                        if (ColorChooserDialog.this.getBuilder().mAllowUserCustomAlpha) {
                            int color = Color.argb(ColorChooserDialog.this.mCustomSeekA.getProgress(), ColorChooserDialog.this.mCustomSeekR.getProgress(), ColorChooserDialog.this.mCustomSeekG.getProgress(), ColorChooserDialog.this.mCustomSeekB.getProgress());
                            ColorChooserDialog.this.mCustomColorHex.setText(String.format("%08X", Integer.valueOf(color)));
                        } else {
                            int color2 = Color.rgb(ColorChooserDialog.this.mCustomSeekR.getProgress(), ColorChooserDialog.this.mCustomSeekG.getProgress(), ColorChooserDialog.this.mCustomSeekB.getProgress());
                            ColorChooserDialog.this.mCustomColorHex.setText(String.format("%06X", Integer.valueOf(16777215 & color2)));
                        }
                    }
                    ColorChooserDialog.this.mCustomSeekAValue.setText(String.format("%d", Integer.valueOf(ColorChooserDialog.this.mCustomSeekA.getProgress())));
                    ColorChooserDialog.this.mCustomSeekRValue.setText(String.format("%d", Integer.valueOf(ColorChooserDialog.this.mCustomSeekR.getProgress())));
                    ColorChooserDialog.this.mCustomSeekGValue.setText(String.format("%d", Integer.valueOf(ColorChooserDialog.this.mCustomSeekG.getProgress())));
                    ColorChooserDialog.this.mCustomSeekBValue.setText(String.format("%d", Integer.valueOf(ColorChooserDialog.this.mCustomSeekB.getProgress())));
                }

                @Override // android.widget.SeekBar.OnSeekBarChangeListener
                public void onStartTrackingTouch(SeekBar seekBar) {
                }

                @Override // android.widget.SeekBar.OnSeekBarChangeListener
                public void onStopTrackingTouch(SeekBar seekBar) {
                }
            };
            this.mCustomSeekR.setOnSeekBarChangeListener(this.mCustomColorRgbListener);
            this.mCustomSeekG.setOnSeekBarChangeListener(this.mCustomColorRgbListener);
            this.mCustomSeekB.setOnSeekBarChangeListener(this.mCustomColorRgbListener);
            if (this.mCustomSeekA.getVisibility() == 0) {
                this.mCustomSeekA.setOnSeekBarChangeListener(this.mCustomColorRgbListener);
                this.mCustomColorHex.setText(String.format("%08X", Integer.valueOf(this.mSelectedCustomColor)));
                return;
            } else {
                this.mCustomColorHex.setText(String.format("%06X", Integer.valueOf(16777215 & this.mSelectedCustomColor)));
                return;
            }
        }
        dialog.setTitle(getBuilder().mTitle);
        dialog.setActionButton(DialogAction.NEUTRAL, getBuilder().mCustomBtn);
        if (isInSub()) {
            dialog.setActionButton(DialogAction.NEGATIVE, getBuilder().mBackBtn);
        } else {
            dialog.setActionButton(DialogAction.NEGATIVE, getBuilder().mCancelBtn);
        }
        this.mGrid.setVisibility(0);
        this.mColorChooserCustomFrame.setVisibility(8);
        this.mCustomColorHex.removeTextChangedListener(this.mCustomColorTextWatcher);
        this.mCustomColorTextWatcher = null;
        this.mCustomSeekR.setOnSeekBarChangeListener(null);
        this.mCustomSeekG.setOnSeekBarChangeListener(null);
        this.mCustomSeekB.setOnSeekBarChangeListener(null);
        this.mCustomColorRgbListener = null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void invalidate() {
        if (this.mGrid.getAdapter() == null) {
            this.mGrid.setAdapter((ListAdapter) new ColorGridAdapter());
            this.mGrid.setSelector(ResourcesCompat.getDrawable(getResources(), com.afollestad.materialdialogs.commons.R.drawable.md_transparent, (Resources.Theme) null));
        } else {
            ((BaseAdapter) this.mGrid.getAdapter()).notifyDataSetChanged();
        }
        if (getDialog() != null) {
            getDialog().setTitle(getTitle());
        }
    }

    /* loaded from: com.github.afollestad.material-dialogs.commons.0.8.5.4.jar:com/afollestad/materialdialogs/color/ColorChooserDialog$ColorGridAdapter.class */
    private class ColorGridAdapter extends BaseAdapter {
        public ColorGridAdapter() {
        }

        @Override // android.widget.Adapter
        public int getCount() {
            return ColorChooserDialog.this.isInSub() ? ColorChooserDialog.this.mColorsSub[ColorChooserDialog.this.topIndex()].length : ColorChooserDialog.this.mColorsTop.length;
        }

        @Override // android.widget.Adapter
        public Object getItem(int position) {
            return ColorChooserDialog.this.isInSub() ? Integer.valueOf(ColorChooserDialog.this.mColorsSub[ColorChooserDialog.this.topIndex()][position]) : Integer.valueOf(ColorChooserDialog.this.mColorsTop[position]);
        }

        @Override // android.widget.Adapter
        public long getItemId(int position) {
            return position;
        }

        @Override // android.widget.Adapter
        public View getView(int position, View convertView, ViewGroup parent) {
            if (convertView == null) {
                convertView = new CircleView(ColorChooserDialog.this.getContext());
                convertView.setLayoutParams(new AbsListView.LayoutParams(ColorChooserDialog.this.mCircleSize, ColorChooserDialog.this.mCircleSize));
            }
            CircleView child = (CircleView) convertView;
            int color = ColorChooserDialog.this.isInSub() ? ColorChooserDialog.this.mColorsSub[ColorChooserDialog.this.topIndex()][position] : ColorChooserDialog.this.mColorsTop[position];
            child.setBackgroundColor(color);
            if (ColorChooserDialog.this.isInSub()) {
                child.setSelected(ColorChooserDialog.this.subIndex() == position);
            } else {
                child.setSelected(ColorChooserDialog.this.topIndex() == position);
            }
            child.setTag(String.format("%d:%d", Integer.valueOf(position), Integer.valueOf(color)));
            child.setOnClickListener(ColorChooserDialog.this);
            child.setOnLongClickListener(ColorChooserDialog.this);
            return convertView;
        }
    }

    /* loaded from: com.github.afollestad.material-dialogs.commons.0.8.5.4.jar:com/afollestad/materialdialogs/color/ColorChooserDialog$Builder.class */
    public static class Builder implements Serializable {

        @NonNull
        protected final transient AppCompatActivity mContext;

        @StringRes
        protected final int mTitle;

        @StringRes
        protected int mTitleSub;

        @ColorInt
        protected int mPreselect;

        @Nullable
        protected int[] mColorsTop;

        @Nullable
        protected int[][] mColorsSub;

        @StringRes
        protected int mDoneBtn = com.afollestad.materialdialogs.commons.R.string.md_done_label;

        @StringRes
        protected int mBackBtn = com.afollestad.materialdialogs.commons.R.string.md_back_label;

        @StringRes
        protected int mCancelBtn = com.afollestad.materialdialogs.commons.R.string.md_cancel_label;

        @StringRes
        protected int mCustomBtn = com.afollestad.materialdialogs.commons.R.string.md_custom_label;

        @StringRes
        protected int mPresetsBtn = com.afollestad.materialdialogs.commons.R.string.md_presets_label;
        protected boolean mAccentMode = false;
        protected boolean mDynamicButtonColor = true;
        protected boolean mAllowUserCustom = true;
        protected boolean mAllowUserCustomAlpha = true;
        protected boolean mSetPreselectionColor = false;

        public <ActivityType extends AppCompatActivity & ColorCallback> Builder(@NonNull ActivityType context, @StringRes int title) {
            this.mContext = context;
            this.mTitle = title;
        }

        @NonNull
        public Builder titleSub(@StringRes int titleSub) {
            this.mTitleSub = titleSub;
            return this;
        }

        @NonNull
        public Builder preselect(@ColorInt int preselect) {
            this.mPreselect = preselect;
            this.mSetPreselectionColor = true;
            return this;
        }

        @NonNull
        public Builder accentMode(boolean accentMode) {
            this.mAccentMode = accentMode;
            return this;
        }

        @NonNull
        public Builder doneButton(@StringRes int text) {
            this.mDoneBtn = text;
            return this;
        }

        @NonNull
        public Builder backButton(@StringRes int text) {
            this.mBackBtn = text;
            return this;
        }

        @NonNull
        public Builder cancelButton(@StringRes int text) {
            this.mCancelBtn = text;
            return this;
        }

        @NonNull
        public Builder customButton(@StringRes int text) {
            this.mCustomBtn = text;
            return this;
        }

        @NonNull
        public Builder presetsButton(@StringRes int text) {
            this.mPresetsBtn = text;
            return this;
        }

        @NonNull
        public Builder dynamicButtonColor(boolean enabled) {
            this.mDynamicButtonColor = enabled;
            return this;
        }

        @NonNull
        public Builder customColors(@NonNull int[] topLevel, @Nullable int[][] subLevel) {
            this.mColorsTop = topLevel;
            this.mColorsSub = subLevel;
            return this;
        }

        @NonNull
        public Builder customColors(@ArrayRes int topLevel, @Nullable int[][] subLevel) {
            this.mColorsTop = DialogUtils.getColorArray(this.mContext, topLevel);
            this.mColorsSub = subLevel;
            return this;
        }

        @NonNull
        public Builder allowUserColorInput(boolean allow) {
            this.mAllowUserCustom = allow;
            return this;
        }

        @NonNull
        public Builder allowUserColorInputAlpha(boolean allow) {
            this.mAllowUserCustomAlpha = allow;
            return this;
        }

        @NonNull
        public ColorChooserDialog build() {
            ColorChooserDialog dialog = new ColorChooserDialog();
            Bundle args = new Bundle();
            args.putSerializable("builder", this);
            dialog.setArguments(args);
            return dialog;
        }

        @NonNull
        public ColorChooserDialog show() {
            ColorChooserDialog dialog = build();
            dialog.show(this.mContext);
            return dialog;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Builder getBuilder() {
        if (getArguments() == null || !getArguments().containsKey("builder")) {
            return null;
        }
        return (Builder) getArguments().getSerializable("builder");
    }

    private void dismissIfNecessary(AppCompatActivity context, String tag) {
        DialogFragment findFragmentByTag = context.getSupportFragmentManager().findFragmentByTag(tag);
        if (findFragmentByTag != null) {
            findFragmentByTag.dismiss();
            context.getSupportFragmentManager().beginTransaction().remove(findFragmentByTag).commit();
        }
    }

    @Nullable
    public static ColorChooserDialog findVisible(@NonNull AppCompatActivity context, String tag) {
        ColorChooserDialog findFragmentByTag = context.getSupportFragmentManager().findFragmentByTag(tag);
        if (findFragmentByTag != null && (findFragmentByTag instanceof ColorChooserDialog)) {
            return findFragmentByTag;
        }
        return null;
    }

    @NonNull
    public ColorChooserDialog show(AppCompatActivity context) {
        String tag;
        Builder builder = getBuilder();
        if (builder.mColorsTop == null && builder.mAccentMode) {
            tag = "[MD_COLOR_CHOOSER]";
        } else {
            tag = "[MD_COLOR_CHOOSER]";
        }
        dismissIfNecessary(context, tag);
        show(context.getSupportFragmentManager(), tag);
        return this;
    }
}
