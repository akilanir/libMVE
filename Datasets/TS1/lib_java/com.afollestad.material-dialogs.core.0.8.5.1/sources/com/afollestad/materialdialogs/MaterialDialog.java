package com.afollestad.materialdialogs;

import android.R;
import android.annotation.SuppressLint;
import android.content.Context;
import android.content.DialogInterface;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Handler;
import android.support.annotation.ArrayRes;
import android.support.annotation.AttrRes;
import android.support.annotation.ColorInt;
import android.support.annotation.ColorRes;
import android.support.annotation.DimenRes;
import android.support.annotation.DrawableRes;
import android.support.annotation.IntRange;
import android.support.annotation.LayoutRes;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.StringRes;
import android.support.annotation.UiThread;
import android.support.v4.content.res.ResourcesCompat;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.WindowManager;
import android.widget.AdapterView;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.RadioButton;
import android.widget.TextView;
import com.afollestad.materialdialogs.internal.MDButton;
import com.afollestad.materialdialogs.internal.MDRootLayout;
import com.afollestad.materialdialogs.internal.MDTintHelper;
import com.afollestad.materialdialogs.internal.ThemeSingleton;
import com.afollestad.materialdialogs.util.DialogUtils;
import com.afollestad.materialdialogs.util.RippleHelper;
import com.afollestad.materialdialogs.util.TypefaceHelper;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

/* loaded from: com.afollestad.material-dialogs.core.0.8.5.1.jar:com/afollestad/materialdialogs/MaterialDialog.class */
public class MaterialDialog extends DialogBase implements View.OnClickListener, AdapterView.OnItemClickListener {
    protected final Builder mBuilder;
    protected ListView listView;
    protected ImageView icon;
    protected TextView title;
    protected View titleFrame;
    protected FrameLayout customViewFrame;
    protected ProgressBar mProgress;
    protected TextView mProgressLabel;
    protected TextView mProgressMinMax;
    protected TextView content;
    protected EditText input;
    protected TextView inputMinMax;
    protected MDButton positiveButton;
    protected MDButton neutralButton;
    protected MDButton negativeButton;
    protected ListType listType;
    protected List<Integer> selectedIndicesList;
    private final Handler mHandler;

    /* loaded from: com.afollestad.material-dialogs.core.0.8.5.1.jar:com/afollestad/materialdialogs/MaterialDialog$InputCallback.class */
    public interface InputCallback {
        void onInput(@NonNull MaterialDialog materialDialog, CharSequence charSequence);
    }

    /* loaded from: com.afollestad.material-dialogs.core.0.8.5.1.jar:com/afollestad/materialdialogs/MaterialDialog$ListCallback.class */
    public interface ListCallback {
        void onSelection(MaterialDialog materialDialog, View view, int i, CharSequence charSequence);
    }

    /* loaded from: com.afollestad.material-dialogs.core.0.8.5.1.jar:com/afollestad/materialdialogs/MaterialDialog$ListCallbackMultiChoice.class */
    public interface ListCallbackMultiChoice {
        boolean onSelection(MaterialDialog materialDialog, Integer[] numArr, CharSequence[] charSequenceArr);
    }

    /* loaded from: com.afollestad.material-dialogs.core.0.8.5.1.jar:com/afollestad/materialdialogs/MaterialDialog$ListCallbackSingleChoice.class */
    public interface ListCallbackSingleChoice {
        boolean onSelection(MaterialDialog materialDialog, View view, int i, CharSequence charSequence);
    }

    /* loaded from: com.afollestad.material-dialogs.core.0.8.5.1.jar:com/afollestad/materialdialogs/MaterialDialog$SingleButtonCallback.class */
    public interface SingleButtonCallback {
        void onClick(@NonNull MaterialDialog materialDialog, @NonNull DialogAction dialogAction);
    }

    @Override // com.afollestad.materialdialogs.DialogBase, android.app.Dialog
    public /* bridge */ /* synthetic */ void setContentView(View x0, ViewGroup.LayoutParams x1) throws IllegalAccessError {
        super.setContentView(x0, x1);
    }

    @Override // com.afollestad.materialdialogs.DialogBase, android.app.Dialog
    public /* bridge */ /* synthetic */ void setContentView(View x0) throws IllegalAccessError {
        super.setContentView(x0);
    }

    @Override // com.afollestad.materialdialogs.DialogBase, android.app.Dialog
    public /* bridge */ /* synthetic */ void setContentView(int x0) throws IllegalAccessError {
        super.setContentView(x0);
    }

    @Override // com.afollestad.materialdialogs.DialogBase, android.app.Dialog
    public /* bridge */ /* synthetic */ View findViewById(int x0) {
        return super.findViewById(x0);
    }

    public final Builder getBuilder() {
        return this.mBuilder;
    }

    @SuppressLint({"InflateParams"})
    protected MaterialDialog(Builder builder) {
        super(builder.context, DialogInit.getTheme(builder));
        this.mHandler = new Handler();
        this.mBuilder = builder;
        LayoutInflater inflater = LayoutInflater.from(builder.context);
        this.view = (MDRootLayout) inflater.inflate(DialogInit.getInflateLayout(builder), (ViewGroup) null);
        DialogInit.init(this);
    }

    public final void setTypeface(TextView target, Typeface t) {
        if (t == null) {
            return;
        }
        int flags = target.getPaintFlags() | 128;
        target.setPaintFlags(flags);
        target.setTypeface(t);
    }

    protected final void checkIfListInitScroll() {
        if (this.listView == null) {
            return;
        }
        this.listView.getViewTreeObserver().addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener() { // from class: com.afollestad.materialdialogs.MaterialDialog.1
            @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
            public void onGlobalLayout() {
                int selectedIndex;
                if (Build.VERSION.SDK_INT < 16) {
                    MaterialDialog.this.listView.getViewTreeObserver().removeGlobalOnLayoutListener(this);
                } else {
                    MaterialDialog.this.listView.getViewTreeObserver().removeOnGlobalLayoutListener(this);
                }
                if (MaterialDialog.this.listType == ListType.SINGLE || MaterialDialog.this.listType == ListType.MULTI) {
                    if (MaterialDialog.this.listType == ListType.SINGLE) {
                        if (MaterialDialog.this.mBuilder.selectedIndex < 0) {
                            return;
                        } else {
                            selectedIndex = MaterialDialog.this.mBuilder.selectedIndex;
                        }
                    } else {
                        if (MaterialDialog.this.selectedIndicesList == null || MaterialDialog.this.selectedIndicesList.size() == 0) {
                            return;
                        }
                        Collections.sort(MaterialDialog.this.selectedIndicesList);
                        selectedIndex = MaterialDialog.this.selectedIndicesList.get(0).intValue();
                    }
                    if (MaterialDialog.this.listView.getLastVisiblePosition() < selectedIndex) {
                        int totalVisible = MaterialDialog.this.listView.getLastVisiblePosition() - MaterialDialog.this.listView.getFirstVisiblePosition();
                        int scrollIndex = selectedIndex - (totalVisible / 2);
                        if (scrollIndex < 0) {
                            scrollIndex = 0;
                        }
                        final int fScrollIndex = scrollIndex;
                        MaterialDialog.this.listView.post(new Runnable() { // from class: com.afollestad.materialdialogs.MaterialDialog.1.1
                            @Override // java.lang.Runnable
                            public void run() {
                                MaterialDialog.this.listView.requestFocus();
                                MaterialDialog.this.listView.setSelection(fScrollIndex);
                            }
                        });
                    }
                }
            }
        });
    }

    protected final void invalidateList() {
        if (this.listView == null) {
            return;
        }
        if ((this.mBuilder.items == null || this.mBuilder.items.length == 0) && this.mBuilder.adapter == null) {
            return;
        }
        this.listView.setAdapter(this.mBuilder.adapter);
        if (this.listType != null || this.mBuilder.listCallbackCustom != null) {
            this.listView.setOnItemClickListener(this);
        }
    }

    @Override // android.widget.AdapterView.OnItemClickListener
    public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
        if (this.mBuilder.listCallbackCustom != null) {
            CharSequence text = null;
            if (view instanceof TextView) {
                text = ((TextView) view).getText();
            }
            this.mBuilder.listCallbackCustom.onSelection(this, view, position, text);
            return;
        }
        if (this.listType == null || this.listType == ListType.REGULAR) {
            if (this.mBuilder.autoDismiss) {
                dismiss();
            }
            if (this.mBuilder.listCallback != null) {
                this.mBuilder.listCallback.onSelection(this, view, position, this.mBuilder.items[position]);
                return;
            }
            return;
        }
        if (this.listType == ListType.MULTI) {
            boolean shouldBeChecked = !this.selectedIndicesList.contains(Integer.valueOf(position));
            CheckBox cb = (CheckBox) view.findViewById(R.id.control);
            if (shouldBeChecked) {
                this.selectedIndicesList.add(Integer.valueOf(position));
                if (this.mBuilder.alwaysCallMultiChoiceCallback) {
                    if (sendMultichoiceCallback()) {
                        cb.setChecked(true);
                        return;
                    } else {
                        this.selectedIndicesList.remove(Integer.valueOf(position));
                        return;
                    }
                }
                cb.setChecked(true);
                return;
            }
            this.selectedIndicesList.remove(Integer.valueOf(position));
            cb.setChecked(false);
            if (this.mBuilder.alwaysCallMultiChoiceCallback) {
                sendMultichoiceCallback();
                return;
            }
            return;
        }
        if (this.listType == ListType.SINGLE) {
            boolean allowSelection = true;
            DefaultAdapter adapter = (DefaultAdapter) this.mBuilder.adapter;
            RadioButton radio = (RadioButton) view.findViewById(R.id.control);
            if (this.mBuilder.autoDismiss && this.mBuilder.positiveText == null) {
                dismiss();
                allowSelection = false;
                this.mBuilder.selectedIndex = position;
                sendSingleChoiceCallback(view);
            } else if (this.mBuilder.alwaysCallSingleChoiceCallback) {
                int oldSelected = this.mBuilder.selectedIndex;
                this.mBuilder.selectedIndex = position;
                allowSelection = sendSingleChoiceCallback(view);
                this.mBuilder.selectedIndex = oldSelected;
            }
            if (allowSelection) {
                this.mBuilder.selectedIndex = position;
                radio.setChecked(true);
                adapter.notifyDataSetChanged();
            }
        }
    }

    /* loaded from: com.afollestad.material-dialogs.core.0.8.5.1.jar:com/afollestad/materialdialogs/MaterialDialog$NotImplementedException.class */
    public static class NotImplementedException extends Error {
        public NotImplementedException(String message) {
            super(message);
        }
    }

    /* loaded from: com.afollestad.material-dialogs.core.0.8.5.1.jar:com/afollestad/materialdialogs/MaterialDialog$DialogException.class */
    public static class DialogException extends WindowManager.BadTokenException {
        public DialogException(String message) {
            super(message);
        }
    }

    protected final Drawable getListSelector() {
        if (this.mBuilder.listSelector != 0) {
            return ResourcesCompat.getDrawable(this.mBuilder.context.getResources(), this.mBuilder.listSelector, (Resources.Theme) null);
        }
        Drawable d = DialogUtils.resolveDrawable(this.mBuilder.context, R.attr.md_list_selector);
        return d != null ? d : DialogUtils.resolveDrawable(getContext(), R.attr.md_list_selector);
    }

    Drawable getButtonSelector(DialogAction which, boolean isStacked) {
        if (isStacked) {
            if (this.mBuilder.btnSelectorStacked != 0) {
                return ResourcesCompat.getDrawable(this.mBuilder.context.getResources(), this.mBuilder.btnSelectorStacked, (Resources.Theme) null);
            }
            Drawable d = DialogUtils.resolveDrawable(this.mBuilder.context, R.attr.md_btn_stacked_selector);
            return d != null ? d : DialogUtils.resolveDrawable(getContext(), R.attr.md_btn_stacked_selector);
        }
        switch (AnonymousClass4.$SwitchMap$com$afollestad$materialdialogs$DialogAction[which.ordinal()]) {
            case BuildConfig.VERSION_CODE /* 1 */:
                if (this.mBuilder.btnSelectorNeutral != 0) {
                    return ResourcesCompat.getDrawable(this.mBuilder.context.getResources(), this.mBuilder.btnSelectorNeutral, (Resources.Theme) null);
                }
                Drawable d2 = DialogUtils.resolveDrawable(this.mBuilder.context, R.attr.md_btn_neutral_selector);
                if (d2 != null) {
                    return d2;
                }
                Drawable d3 = DialogUtils.resolveDrawable(getContext(), R.attr.md_btn_neutral_selector);
                if (Build.VERSION.SDK_INT >= 21) {
                    RippleHelper.applyColor(d3, this.mBuilder.buttonRippleColor);
                }
                return d3;
            case 2:
                if (this.mBuilder.btnSelectorNegative != 0) {
                    return ResourcesCompat.getDrawable(this.mBuilder.context.getResources(), this.mBuilder.btnSelectorNegative, (Resources.Theme) null);
                }
                Drawable d4 = DialogUtils.resolveDrawable(this.mBuilder.context, R.attr.md_btn_negative_selector);
                if (d4 != null) {
                    return d4;
                }
                Drawable d5 = DialogUtils.resolveDrawable(getContext(), R.attr.md_btn_negative_selector);
                if (Build.VERSION.SDK_INT >= 21) {
                    RippleHelper.applyColor(d5, this.mBuilder.buttonRippleColor);
                }
                return d5;
            default:
                if (this.mBuilder.btnSelectorPositive != 0) {
                    return ResourcesCompat.getDrawable(this.mBuilder.context.getResources(), this.mBuilder.btnSelectorPositive, (Resources.Theme) null);
                }
                Drawable d6 = DialogUtils.resolveDrawable(this.mBuilder.context, R.attr.md_btn_positive_selector);
                if (d6 != null) {
                    return d6;
                }
                Drawable d7 = DialogUtils.resolveDrawable(getContext(), R.attr.md_btn_positive_selector);
                if (Build.VERSION.SDK_INT >= 21) {
                    RippleHelper.applyColor(d7, this.mBuilder.buttonRippleColor);
                }
                return d7;
        }
    }

    private boolean sendSingleChoiceCallback(View v) {
        if (this.mBuilder.listCallbackSingleChoice == null) {
            return false;
        }
        CharSequence text = null;
        if (this.mBuilder.selectedIndex >= 0 && this.mBuilder.selectedIndex < this.mBuilder.items.length) {
            text = this.mBuilder.items[this.mBuilder.selectedIndex];
        }
        return this.mBuilder.listCallbackSingleChoice.onSelection(this, v, this.mBuilder.selectedIndex, text);
    }

    private boolean sendMultichoiceCallback() {
        if (this.mBuilder.listCallbackMultiChoice == null) {
            return false;
        }
        Collections.sort(this.selectedIndicesList);
        List<CharSequence> selectedTitles = new ArrayList<>();
        for (Integer i : this.selectedIndicesList) {
            if (i.intValue() >= 0 && i.intValue() <= this.mBuilder.items.length - 1) {
                selectedTitles.add(this.mBuilder.items[i.intValue()]);
            }
        }
        return this.mBuilder.listCallbackMultiChoice.onSelection(this, (Integer[]) this.selectedIndicesList.toArray(new Integer[this.selectedIndicesList.size()]), (CharSequence[]) selectedTitles.toArray(new CharSequence[selectedTitles.size()]));
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View v) {
        DialogAction tag = (DialogAction) v.getTag();
        switch (AnonymousClass4.$SwitchMap$com$afollestad$materialdialogs$DialogAction[tag.ordinal()]) {
            case BuildConfig.VERSION_CODE /* 1 */:
                if (this.mBuilder.callback != null) {
                    this.mBuilder.callback.onAny(this);
                    this.mBuilder.callback.onNeutral(this);
                }
                if (this.mBuilder.onNeutralCallback != null) {
                    this.mBuilder.onNeutralCallback.onClick(this, tag);
                }
                if (this.mBuilder.autoDismiss) {
                    dismiss();
                    break;
                }
                break;
            case 2:
                if (this.mBuilder.callback != null) {
                    this.mBuilder.callback.onAny(this);
                    this.mBuilder.callback.onNegative(this);
                }
                if (this.mBuilder.onNegativeCallback != null) {
                    this.mBuilder.onNegativeCallback.onClick(this, tag);
                }
                if (this.mBuilder.autoDismiss) {
                    dismiss();
                    break;
                }
                break;
            case 3:
                if (this.mBuilder.callback != null) {
                    this.mBuilder.callback.onAny(this);
                    this.mBuilder.callback.onPositive(this);
                }
                if (this.mBuilder.onPositiveCallback != null) {
                    this.mBuilder.onPositiveCallback.onClick(this, tag);
                }
                if (!this.mBuilder.alwaysCallSingleChoiceCallback) {
                    sendSingleChoiceCallback(v);
                }
                if (!this.mBuilder.alwaysCallMultiChoiceCallback) {
                    sendMultichoiceCallback();
                }
                if (this.mBuilder.inputCallback != null && this.input != null && !this.mBuilder.alwaysCallInputCallback) {
                    this.mBuilder.inputCallback.onInput(this, this.input.getText());
                }
                if (this.mBuilder.autoDismiss) {
                    dismiss();
                    break;
                }
                break;
        }
        if (this.mBuilder.onAnyCallback != null) {
            this.mBuilder.onAnyCallback.onClick(this, tag);
        }
    }

    /* loaded from: com.afollestad.material-dialogs.core.0.8.5.1.jar:com/afollestad/materialdialogs/MaterialDialog$Builder.class */
    public static class Builder {
        protected final Context context;
        protected CharSequence title;
        protected GravityEnum titleGravity;
        protected GravityEnum contentGravity;
        protected GravityEnum btnStackedGravity;
        protected GravityEnum itemsGravity;
        protected GravityEnum buttonsGravity;
        protected int buttonRippleColor;
        protected CharSequence content;
        protected CharSequence[] items;
        protected CharSequence positiveText;
        protected CharSequence neutralText;
        protected CharSequence negativeText;
        protected View customView;
        protected int widgetColor;
        protected ColorStateList positiveColor;
        protected ColorStateList negativeColor;
        protected ColorStateList neutralColor;
        protected ColorStateList linkColor;
        protected ButtonCallback callback;
        protected SingleButtonCallback onPositiveCallback;
        protected SingleButtonCallback onNegativeCallback;
        protected SingleButtonCallback onNeutralCallback;
        protected SingleButtonCallback onAnyCallback;
        protected ListCallback listCallback;
        protected ListCallbackSingleChoice listCallbackSingleChoice;
        protected ListCallbackMultiChoice listCallbackMultiChoice;
        protected ListCallback listCallbackCustom;
        protected Theme theme;
        protected Typeface regularFont;
        protected Typeface mediumFont;
        protected Drawable icon;
        protected boolean limitIconToDefaultSize;
        protected ListAdapter adapter;
        protected DialogInterface.OnDismissListener dismissListener;
        protected DialogInterface.OnCancelListener cancelListener;
        protected DialogInterface.OnKeyListener keyListener;
        protected DialogInterface.OnShowListener showListener;
        protected boolean forceStacking;
        protected boolean wrapCustomViewInScroll;
        protected int dividerColor;
        protected int backgroundColor;
        protected int itemColor;
        protected boolean indeterminateProgress;
        protected boolean showMinMax;
        protected CharSequence inputPrefill;
        protected CharSequence inputHint;
        protected InputCallback inputCallback;
        protected boolean inputAllowEmpty;
        protected boolean alwaysCallInputCallback;
        protected int[] itemIds;
        protected String progressNumberFormat;
        protected NumberFormat progressPercentFormat;
        protected boolean indeterminateIsHorizontalProgress;

        @DrawableRes
        protected int listSelector;

        @DrawableRes
        protected int btnSelectorStacked;

        @DrawableRes
        protected int btnSelectorPositive;

        @DrawableRes
        protected int btnSelectorNeutral;

        @DrawableRes
        protected int btnSelectorNegative;
        protected int titleColor = -1;
        protected int contentColor = -1;
        protected boolean alwaysCallMultiChoiceCallback = false;
        protected boolean alwaysCallSingleChoiceCallback = false;
        protected boolean cancelable = true;
        protected boolean canceledOnTouchOutside = true;
        protected float contentLineSpacingMultiplier = 1.2f;
        protected int selectedIndex = -1;
        protected Integer[] selectedIndices = null;
        protected boolean autoDismiss = true;
        protected int maxIconSize = -1;
        protected int progress = -2;
        protected int progressMax = 0;
        protected int inputType = -1;
        protected int inputMinLength = -1;
        protected int inputMaxLength = -1;
        protected int inputRangeErrorColor = 0;
        protected boolean titleColorSet = false;
        protected boolean contentColorSet = false;
        protected boolean itemColorSet = false;
        protected boolean positiveColorSet = false;
        protected boolean neutralColorSet = false;
        protected boolean negativeColorSet = false;
        protected boolean widgetColorSet = false;
        protected boolean dividerColorSet = false;

        public final Context getContext() {
            return this.context;
        }

        public final int getItemColor() {
            return this.itemColor;
        }

        public final Typeface getRegularFont() {
            return this.regularFont;
        }

        public Builder(@NonNull Context context) {
            this.titleGravity = GravityEnum.START;
            this.contentGravity = GravityEnum.START;
            this.btnStackedGravity = GravityEnum.END;
            this.itemsGravity = GravityEnum.START;
            this.buttonsGravity = GravityEnum.START;
            this.buttonRippleColor = 0;
            this.theme = Theme.LIGHT;
            this.context = context;
            int materialBlue = DialogUtils.getColor(context, R.color.md_material_blue_600);
            this.widgetColor = DialogUtils.resolveColor(context, R.attr.colorAccent, materialBlue);
            if (Build.VERSION.SDK_INT >= 21) {
                this.widgetColor = DialogUtils.resolveColor(context, R.attr.colorAccent, this.widgetColor);
            }
            this.positiveColor = DialogUtils.getActionTextStateList(context, this.widgetColor);
            this.negativeColor = DialogUtils.getActionTextStateList(context, this.widgetColor);
            this.neutralColor = DialogUtils.getActionTextStateList(context, this.widgetColor);
            this.linkColor = DialogUtils.getActionTextStateList(context, DialogUtils.resolveColor(context, R.attr.md_link_color, this.widgetColor));
            int fallback = 0;
            this.buttonRippleColor = DialogUtils.resolveColor(context, R.attr.md_btn_ripple_color, DialogUtils.resolveColor(context, R.attr.colorControlHighlight, Build.VERSION.SDK_INT >= 21 ? DialogUtils.resolveColor(context, R.attr.colorControlHighlight) : fallback));
            this.progressPercentFormat = NumberFormat.getPercentInstance();
            this.progressNumberFormat = "%1d/%2d";
            int primaryTextColor = DialogUtils.resolveColor(context, R.attr.textColorPrimary);
            this.theme = DialogUtils.isColorDark(primaryTextColor) ? Theme.LIGHT : Theme.DARK;
            checkSingleton();
            this.titleGravity = DialogUtils.resolveGravityEnum(context, R.attr.md_title_gravity, this.titleGravity);
            this.contentGravity = DialogUtils.resolveGravityEnum(context, R.attr.md_content_gravity, this.contentGravity);
            this.btnStackedGravity = DialogUtils.resolveGravityEnum(context, R.attr.md_btnstacked_gravity, this.btnStackedGravity);
            this.itemsGravity = DialogUtils.resolveGravityEnum(context, R.attr.md_items_gravity, this.itemsGravity);
            this.buttonsGravity = DialogUtils.resolveGravityEnum(context, R.attr.md_buttons_gravity, this.buttonsGravity);
            String mediumFont = DialogUtils.resolveString(context, R.attr.md_medium_font);
            String regularFont = DialogUtils.resolveString(context, R.attr.md_regular_font);
            typeface(mediumFont, regularFont);
            if (this.mediumFont == null) {
                try {
                    if (Build.VERSION.SDK_INT >= 21) {
                        this.mediumFont = Typeface.create("sans-serif-medium", 0);
                    } else {
                        this.mediumFont = Typeface.create("sans-serif", 1);
                    }
                } catch (Exception e) {
                }
            }
            if (this.regularFont == null) {
                try {
                    this.regularFont = Typeface.create("sans-serif", 0);
                } catch (Exception e2) {
                }
            }
        }

        private void checkSingleton() {
            if (ThemeSingleton.get(false) == null) {
                return;
            }
            ThemeSingleton s = ThemeSingleton.get();
            if (s.darkTheme) {
                this.theme = Theme.DARK;
            }
            if (s.titleColor != 0) {
                this.titleColor = s.titleColor;
            }
            if (s.contentColor != 0) {
                this.contentColor = s.contentColor;
            }
            if (s.positiveColor != null) {
                this.positiveColor = s.positiveColor;
            }
            if (s.neutralColor != null) {
                this.neutralColor = s.neutralColor;
            }
            if (s.negativeColor != null) {
                this.negativeColor = s.negativeColor;
            }
            if (s.itemColor != 0) {
                this.itemColor = s.itemColor;
            }
            if (s.icon != null) {
                this.icon = s.icon;
            }
            if (s.backgroundColor != 0) {
                this.backgroundColor = s.backgroundColor;
            }
            if (s.dividerColor != 0) {
                this.dividerColor = s.dividerColor;
            }
            if (s.btnSelectorStacked != 0) {
                this.btnSelectorStacked = s.btnSelectorStacked;
            }
            if (s.listSelector != 0) {
                this.listSelector = s.listSelector;
            }
            if (s.btnSelectorPositive != 0) {
                this.btnSelectorPositive = s.btnSelectorPositive;
            }
            if (s.btnSelectorNeutral != 0) {
                this.btnSelectorNeutral = s.btnSelectorNeutral;
            }
            if (s.btnSelectorNegative != 0) {
                this.btnSelectorNegative = s.btnSelectorNegative;
            }
            if (s.widgetColor != 0) {
                this.widgetColor = s.widgetColor;
            }
            if (s.linkColor != null) {
                this.linkColor = s.linkColor;
            }
            this.titleGravity = s.titleGravity;
            this.contentGravity = s.contentGravity;
            this.btnStackedGravity = s.btnStackedGravity;
            this.itemsGravity = s.itemsGravity;
            this.buttonsGravity = s.buttonsGravity;
        }

        public Builder title(@StringRes int titleRes) {
            title(this.context.getText(titleRes));
            return this;
        }

        public Builder title(@NonNull CharSequence title) {
            this.title = title;
            return this;
        }

        public Builder titleGravity(@NonNull GravityEnum gravity) {
            this.titleGravity = gravity;
            return this;
        }

        public Builder buttonRippleColor(@ColorInt int color) {
            this.buttonRippleColor = color;
            return this;
        }

        public Builder buttonRippleColorRes(@ColorRes int colorRes) {
            return buttonRippleColor(DialogUtils.getColor(this.context, colorRes));
        }

        public Builder buttonRippleColorAttr(@AttrRes int colorAttr) {
            return buttonRippleColor(DialogUtils.resolveColor(this.context, colorAttr));
        }

        public Builder titleColor(@ColorInt int color) {
            this.titleColor = color;
            this.titleColorSet = true;
            return this;
        }

        public Builder titleColorRes(@ColorRes int colorRes) {
            return titleColor(DialogUtils.getColor(this.context, colorRes));
        }

        public Builder titleColorAttr(@AttrRes int colorAttr) {
            return titleColor(DialogUtils.resolveColor(this.context, colorAttr));
        }

        public Builder typeface(@Nullable Typeface medium, @Nullable Typeface regular) {
            this.mediumFont = medium;
            this.regularFont = regular;
            return this;
        }

        public Builder typeface(@Nullable String medium, @Nullable String regular) {
            if (medium != null) {
                this.mediumFont = TypefaceHelper.get(this.context, medium);
                if (this.mediumFont == null) {
                    throw new IllegalArgumentException("No font asset found for " + medium);
                }
            }
            if (regular != null) {
                this.regularFont = TypefaceHelper.get(this.context, regular);
                if (this.regularFont == null) {
                    throw new IllegalArgumentException("No font asset found for " + regular);
                }
            }
            return this;
        }

        public Builder icon(@NonNull Drawable icon) {
            this.icon = icon;
            return this;
        }

        public Builder iconRes(@DrawableRes int icon) {
            this.icon = ResourcesCompat.getDrawable(this.context.getResources(), icon, (Resources.Theme) null);
            return this;
        }

        public Builder iconAttr(@AttrRes int iconAttr) {
            this.icon = DialogUtils.resolveDrawable(this.context, iconAttr);
            return this;
        }

        public Builder content(@StringRes int contentRes) {
            content(this.context.getText(contentRes));
            return this;
        }

        public Builder content(@NonNull CharSequence content) {
            if (this.customView != null) {
                throw new IllegalStateException("You cannot set content() when you're using a custom view.");
            }
            this.content = content;
            return this;
        }

        public Builder content(@StringRes int contentRes, Object... formatArgs) {
            content(this.context.getString(contentRes, formatArgs));
            return this;
        }

        public Builder contentColor(@ColorInt int color) {
            this.contentColor = color;
            this.contentColorSet = true;
            return this;
        }

        public Builder contentColorRes(@ColorRes int colorRes) {
            contentColor(DialogUtils.getColor(this.context, colorRes));
            return this;
        }

        public Builder contentColorAttr(@AttrRes int colorAttr) {
            contentColor(DialogUtils.resolveColor(this.context, colorAttr));
            return this;
        }

        public Builder contentGravity(@NonNull GravityEnum gravity) {
            this.contentGravity = gravity;
            return this;
        }

        public Builder contentLineSpacing(float multiplier) {
            this.contentLineSpacingMultiplier = multiplier;
            return this;
        }

        public Builder items(@NonNull Collection collection) {
            if (collection.size() > 0) {
                String[] array = new String[collection.size()];
                int i = 0;
                for (Object obj : collection) {
                    array[i] = obj.toString();
                    i++;
                }
                items(array);
            }
            return this;
        }

        public Builder items(@ArrayRes int itemsRes) {
            items(this.context.getResources().getTextArray(itemsRes));
            return this;
        }

        public Builder items(@NonNull CharSequence... items) {
            if (this.customView != null) {
                throw new IllegalStateException("You cannot set items() when you're using a custom view.");
            }
            this.items = items;
            return this;
        }

        public Builder itemsCallback(@NonNull ListCallback callback) {
            this.listCallback = callback;
            this.listCallbackSingleChoice = null;
            this.listCallbackMultiChoice = null;
            return this;
        }

        public Builder itemsColor(@ColorInt int color) {
            this.itemColor = color;
            this.itemColorSet = true;
            return this;
        }

        @Deprecated
        public Builder itemColor(@ColorInt int color) {
            return itemsColor(color);
        }

        public Builder itemsColorRes(@ColorRes int colorRes) {
            return itemsColor(DialogUtils.getColor(this.context, colorRes));
        }

        @Deprecated
        public Builder itemColorRes(@ColorRes int colorRes) {
            return itemsColorRes(colorRes);
        }

        public Builder itemsColorAttr(@AttrRes int colorAttr) {
            return itemsColor(DialogUtils.resolveColor(this.context, colorAttr));
        }

        @Deprecated
        public Builder itemColorAttr(@AttrRes int colorAttr) {
            return itemsColorAttr(colorAttr);
        }

        public Builder itemsGravity(@NonNull GravityEnum gravity) {
            this.itemsGravity = gravity;
            return this;
        }

        public Builder itemsIds(@NonNull int[] idsArray) {
            this.itemIds = idsArray;
            return this;
        }

        public Builder itemsIds(@ArrayRes int idsArrayRes) {
            return itemsIds(this.context.getResources().getIntArray(idsArrayRes));
        }

        public Builder buttonsGravity(@NonNull GravityEnum gravity) {
            this.buttonsGravity = gravity;
            return this;
        }

        public Builder itemsCallbackSingleChoice(int selectedIndex, @NonNull ListCallbackSingleChoice callback) {
            this.selectedIndex = selectedIndex;
            this.listCallback = null;
            this.listCallbackSingleChoice = callback;
            this.listCallbackMultiChoice = null;
            return this;
        }

        public Builder alwaysCallSingleChoiceCallback() {
            this.alwaysCallSingleChoiceCallback = true;
            return this;
        }

        public Builder itemsCallbackMultiChoice(@Nullable Integer[] selectedIndices, @NonNull ListCallbackMultiChoice callback) {
            this.selectedIndices = selectedIndices;
            this.listCallback = null;
            this.listCallbackSingleChoice = null;
            this.listCallbackMultiChoice = callback;
            return this;
        }

        public Builder alwaysCallMultiChoiceCallback() {
            this.alwaysCallMultiChoiceCallback = true;
            return this;
        }

        public Builder positiveText(@StringRes int postiveRes) {
            if (postiveRes == 0) {
                return this;
            }
            positiveText(this.context.getText(postiveRes));
            return this;
        }

        public Builder positiveText(@NonNull CharSequence message) {
            this.positiveText = message;
            return this;
        }

        public Builder positiveColor(@ColorInt int color) {
            return positiveColor(DialogUtils.getActionTextStateList(this.context, color));
        }

        public Builder positiveColorRes(@ColorRes int colorRes) {
            return positiveColor(DialogUtils.getActionTextColorStateList(this.context, colorRes));
        }

        public Builder positiveColorAttr(@AttrRes int colorAttr) {
            return positiveColor(DialogUtils.resolveActionTextColorStateList(this.context, colorAttr, null));
        }

        public Builder positiveColor(@NonNull ColorStateList colorStateList) {
            this.positiveColor = colorStateList;
            this.positiveColorSet = true;
            return this;
        }

        public Builder neutralText(@StringRes int neutralRes) {
            return neutralRes == 0 ? this : neutralText(this.context.getText(neutralRes));
        }

        public Builder neutralText(@NonNull CharSequence message) {
            this.neutralText = message;
            return this;
        }

        public Builder negativeColor(@ColorInt int color) {
            return negativeColor(DialogUtils.getActionTextStateList(this.context, color));
        }

        public Builder negativeColorRes(@ColorRes int colorRes) {
            return negativeColor(DialogUtils.getActionTextColorStateList(this.context, colorRes));
        }

        public Builder negativeColorAttr(@AttrRes int colorAttr) {
            return negativeColor(DialogUtils.resolveActionTextColorStateList(this.context, colorAttr, null));
        }

        public Builder negativeColor(@NonNull ColorStateList colorStateList) {
            this.negativeColor = colorStateList;
            this.negativeColorSet = true;
            return this;
        }

        public Builder negativeText(@StringRes int negativeRes) {
            return negativeRes == 0 ? this : negativeText(this.context.getText(negativeRes));
        }

        public Builder negativeText(@NonNull CharSequence message) {
            this.negativeText = message;
            return this;
        }

        public Builder neutralColor(@ColorInt int color) {
            return neutralColor(DialogUtils.getActionTextStateList(this.context, color));
        }

        public Builder neutralColorRes(@ColorRes int colorRes) {
            return neutralColor(DialogUtils.getActionTextColorStateList(this.context, colorRes));
        }

        public Builder neutralColorAttr(@AttrRes int colorAttr) {
            return neutralColor(DialogUtils.resolveActionTextColorStateList(this.context, colorAttr, null));
        }

        public Builder neutralColor(@NonNull ColorStateList colorStateList) {
            this.neutralColor = colorStateList;
            this.neutralColorSet = true;
            return this;
        }

        public Builder linkColor(@ColorInt int color) {
            return linkColor(DialogUtils.getActionTextStateList(this.context, color));
        }

        public Builder linkColorRes(@ColorRes int colorRes) {
            return linkColor(DialogUtils.getActionTextColorStateList(this.context, colorRes));
        }

        public Builder linkColorAttr(@AttrRes int colorAttr) {
            return linkColor(DialogUtils.resolveActionTextColorStateList(this.context, colorAttr, null));
        }

        public Builder linkColor(@NonNull ColorStateList colorStateList) {
            this.linkColor = colorStateList;
            return this;
        }

        public Builder listSelector(@DrawableRes int selectorRes) {
            this.listSelector = selectorRes;
            return this;
        }

        public Builder btnSelectorStacked(@DrawableRes int selectorRes) {
            this.btnSelectorStacked = selectorRes;
            return this;
        }

        public Builder btnSelector(@DrawableRes int selectorRes) {
            this.btnSelectorPositive = selectorRes;
            this.btnSelectorNeutral = selectorRes;
            this.btnSelectorNegative = selectorRes;
            return this;
        }

        public Builder btnSelector(@DrawableRes int selectorRes, @NonNull DialogAction which) {
            switch (AnonymousClass4.$SwitchMap$com$afollestad$materialdialogs$DialogAction[which.ordinal()]) {
                case BuildConfig.VERSION_CODE /* 1 */:
                    this.btnSelectorNeutral = selectorRes;
                    break;
                case 2:
                    this.btnSelectorNegative = selectorRes;
                    break;
                default:
                    this.btnSelectorPositive = selectorRes;
                    break;
            }
            return this;
        }

        public Builder btnStackedGravity(@NonNull GravityEnum gravity) {
            this.btnStackedGravity = gravity;
            return this;
        }

        public Builder customView(@LayoutRes int layoutRes, boolean wrapInScrollView) {
            LayoutInflater li = LayoutInflater.from(this.context);
            return customView(li.inflate(layoutRes, (ViewGroup) null), wrapInScrollView);
        }

        public Builder customView(@NonNull View view, boolean wrapInScrollView) {
            if (this.content != null) {
                throw new IllegalStateException("You cannot use customView() when you have content set.");
            }
            if (this.items != null) {
                throw new IllegalStateException("You cannot use customView() when you have items set.");
            }
            if (this.inputCallback != null) {
                throw new IllegalStateException("You cannot use customView() with an input dialog");
            }
            if (this.progress > -2 || this.indeterminateProgress) {
                throw new IllegalStateException("You cannot use customView() with a progress dialog");
            }
            if (view.getParent() != null && (view.getParent() instanceof ViewGroup)) {
                ((ViewGroup) view.getParent()).removeView(view);
            }
            this.customView = view;
            this.wrapCustomViewInScroll = wrapInScrollView;
            return this;
        }

        public Builder progress(boolean indeterminate, int max) {
            if (this.customView != null) {
                throw new IllegalStateException("You cannot set progress() when you're using a custom view.");
            }
            if (indeterminate) {
                this.indeterminateProgress = true;
                this.progress = -2;
            } else {
                this.indeterminateProgress = false;
                this.progress = -1;
                this.progressMax = max;
            }
            return this;
        }

        public Builder progress(boolean indeterminate, int max, boolean showMinMax) {
            this.showMinMax = showMinMax;
            return progress(indeterminate, max);
        }

        public Builder progressNumberFormat(@NonNull String format) {
            this.progressNumberFormat = format;
            return this;
        }

        public Builder progressPercentFormat(@NonNull NumberFormat format) {
            this.progressPercentFormat = format;
            return this;
        }

        public Builder progressIndeterminateStyle(boolean horizontal) {
            this.indeterminateIsHorizontalProgress = horizontal;
            return this;
        }

        public Builder widgetColor(@ColorInt int color) {
            this.widgetColor = color;
            this.widgetColorSet = true;
            return this;
        }

        public Builder widgetColorRes(@ColorRes int colorRes) {
            return widgetColor(DialogUtils.getColor(this.context, colorRes));
        }

        public Builder widgetColorAttr(@AttrRes int colorAttr) {
            return widgetColorRes(DialogUtils.resolveColor(this.context, colorAttr));
        }

        public Builder dividerColor(@ColorInt int color) {
            this.dividerColor = color;
            this.dividerColorSet = true;
            return this;
        }

        public Builder dividerColorRes(@ColorRes int colorRes) {
            return dividerColor(DialogUtils.getColor(this.context, colorRes));
        }

        public Builder dividerColorAttr(@AttrRes int colorAttr) {
            return dividerColor(DialogUtils.resolveColor(this.context, colorAttr));
        }

        public Builder backgroundColor(@ColorInt int color) {
            this.backgroundColor = color;
            return this;
        }

        public Builder backgroundColorRes(@ColorRes int colorRes) {
            return backgroundColor(DialogUtils.getColor(this.context, colorRes));
        }

        public Builder backgroundColorAttr(@AttrRes int colorAttr) {
            return backgroundColor(DialogUtils.resolveColor(this.context, colorAttr));
        }

        public Builder callback(@NonNull ButtonCallback callback) {
            this.callback = callback;
            return this;
        }

        public Builder onPositive(@NonNull SingleButtonCallback callback) {
            this.onPositiveCallback = callback;
            return this;
        }

        public Builder onNegative(@NonNull SingleButtonCallback callback) {
            this.onNegativeCallback = callback;
            return this;
        }

        public Builder onNeutral(@NonNull SingleButtonCallback callback) {
            this.onNeutralCallback = callback;
            return this;
        }

        public Builder onAny(@NonNull SingleButtonCallback callback) {
            this.onAnyCallback = callback;
            return this;
        }

        public Builder theme(@NonNull Theme theme) {
            this.theme = theme;
            return this;
        }

        public Builder cancelable(boolean cancelable) {
            this.cancelable = cancelable;
            return this;
        }

        public Builder canceledOnTouchOutside(boolean canceledOnTouchOutside) {
            this.canceledOnTouchOutside = canceledOnTouchOutside;
            return this;
        }

        public Builder autoDismiss(boolean dismiss) {
            this.autoDismiss = dismiss;
            return this;
        }

        public Builder adapter(@NonNull ListAdapter adapter, @Nullable ListCallback callback) {
            if (this.customView != null) {
                throw new IllegalStateException("You cannot set adapter() when you're using a custom view.");
            }
            this.adapter = adapter;
            this.listCallbackCustom = callback;
            return this;
        }

        public Builder limitIconToDefaultSize() {
            this.limitIconToDefaultSize = true;
            return this;
        }

        public Builder maxIconSize(int maxIconSize) {
            this.maxIconSize = maxIconSize;
            return this;
        }

        public Builder maxIconSizeRes(@DimenRes int maxIconSizeRes) {
            return maxIconSize((int) this.context.getResources().getDimension(maxIconSizeRes));
        }

        public Builder showListener(@NonNull DialogInterface.OnShowListener listener) {
            this.showListener = listener;
            return this;
        }

        public Builder dismissListener(@NonNull DialogInterface.OnDismissListener listener) {
            this.dismissListener = listener;
            return this;
        }

        public Builder cancelListener(@NonNull DialogInterface.OnCancelListener listener) {
            this.cancelListener = listener;
            return this;
        }

        public Builder keyListener(@NonNull DialogInterface.OnKeyListener listener) {
            this.keyListener = listener;
            return this;
        }

        public Builder forceStacking(boolean stacked) {
            this.forceStacking = stacked;
            return this;
        }

        public Builder input(@Nullable CharSequence hint, @Nullable CharSequence prefill, boolean allowEmptyInput, @NonNull InputCallback callback) {
            if (this.customView != null) {
                throw new IllegalStateException("You cannot set content() when you're using a custom view.");
            }
            this.inputCallback = callback;
            this.inputHint = hint;
            this.inputPrefill = prefill;
            this.inputAllowEmpty = allowEmptyInput;
            return this;
        }

        public Builder input(@Nullable CharSequence hint, @Nullable CharSequence prefill, @NonNull InputCallback callback) {
            return input(hint, prefill, true, callback);
        }

        public Builder input(@StringRes int hint, @StringRes int prefill, boolean allowEmptyInput, @NonNull InputCallback callback) {
            return input(hint == 0 ? null : this.context.getText(hint), prefill == 0 ? null : this.context.getText(prefill), allowEmptyInput, callback);
        }

        public Builder input(@StringRes int hint, @StringRes int prefill, @NonNull InputCallback callback) {
            return input(hint, prefill, true, callback);
        }

        public Builder inputType(int type) {
            this.inputType = type;
            return this;
        }

        @Deprecated
        public Builder inputMaxLength(@IntRange(from = 1, to = 2147483647L) int maxLength) {
            return inputRange(0, maxLength, 0);
        }

        @Deprecated
        public Builder inputMaxLength(@IntRange(from = 1, to = 2147483647L) int maxLength, @ColorInt int errorColor) {
            return inputRange(0, maxLength, errorColor);
        }

        @Deprecated
        public Builder inputMaxLengthRes(@IntRange(from = 1, to = 2147483647L) int maxLength, @ColorRes int errorColor) {
            return inputRangeRes(0, maxLength, errorColor);
        }

        public Builder inputRange(@IntRange(from = 0, to = 2147483647L) int minLength, @IntRange(from = -1, to = 2147483647L) int maxLength) {
            return inputRange(minLength, maxLength, 0);
        }

        public Builder inputRange(@IntRange(from = 0, to = 2147483647L) int minLength, @IntRange(from = -1, to = 2147483647L) int maxLength, @ColorInt int errorColor) {
            if (minLength < 0) {
                throw new IllegalArgumentException("Min length for input dialogs cannot be less than 0.");
            }
            this.inputMinLength = minLength;
            this.inputMaxLength = maxLength;
            if (errorColor == 0) {
                this.inputRangeErrorColor = DialogUtils.getColor(this.context, R.color.md_edittext_error);
            } else {
                this.inputRangeErrorColor = errorColor;
            }
            return this;
        }

        public Builder inputRangeRes(@IntRange(from = 0, to = 2147483647L) int minLength, @IntRange(from = 1, to = 2147483647L) int maxLength, @ColorRes int errorColor) {
            return inputRange(minLength, maxLength, DialogUtils.getColor(this.context, errorColor));
        }

        public Builder alwaysCallInputCallback() {
            this.alwaysCallInputCallback = true;
            return this;
        }

        @UiThread
        public MaterialDialog build() {
            return new MaterialDialog(this);
        }

        @UiThread
        public MaterialDialog show() {
            MaterialDialog dialog = build();
            dialog.show();
            return dialog;
        }
    }

    @Override // android.app.Dialog
    @UiThread
    public void show() {
        try {
            super.show();
        } catch (WindowManager.BadTokenException e) {
            throw new DialogException("Bad window token, you cannot show a dialog before an Activity is created or after it's hidden.");
        }
    }

    public final MDButton getActionButton(@NonNull DialogAction which) {
        switch (AnonymousClass4.$SwitchMap$com$afollestad$materialdialogs$DialogAction[which.ordinal()]) {
            case BuildConfig.VERSION_CODE /* 1 */:
                return this.neutralButton;
            case 2:
                return this.negativeButton;
            default:
                return this.positiveButton;
        }
    }

    public final View getView() {
        return this.view;
    }

    @Nullable
    public final ListView getListView() {
        return this.listView;
    }

    @Nullable
    public final EditText getInputEditText() {
        return this.input;
    }

    public final TextView getTitleView() {
        return this.title;
    }

    public ImageView getIconView() {
        return this.icon;
    }

    @Nullable
    public final TextView getContentView() {
        return this.content;
    }

    @Nullable
    public final View getCustomView() {
        return this.mBuilder.customView;
    }

    @UiThread
    public final void setActionButton(@NonNull DialogAction which, CharSequence title) {
        switch (AnonymousClass4.$SwitchMap$com$afollestad$materialdialogs$DialogAction[which.ordinal()]) {
            case BuildConfig.VERSION_CODE /* 1 */:
                this.mBuilder.neutralText = title;
                this.neutralButton.setText(title);
                this.neutralButton.setVisibility(title == null ? 8 : 0);
                break;
            case 2:
                this.mBuilder.negativeText = title;
                this.negativeButton.setText(title);
                this.negativeButton.setVisibility(title == null ? 8 : 0);
                break;
            default:
                this.mBuilder.positiveText = title;
                this.positiveButton.setText(title);
                this.positiveButton.setVisibility(title == null ? 8 : 0);
                break;
        }
    }

    public final void setActionButton(DialogAction which, @StringRes int titleRes) {
        setActionButton(which, getContext().getText(titleRes));
    }

    public final boolean hasActionButtons() {
        return numberOfActionButtons() > 0;
    }

    public final int numberOfActionButtons() {
        int number = 0;
        if (this.mBuilder.positiveText != null && this.positiveButton.getVisibility() == 0) {
            number = 0 + 1;
        }
        if (this.mBuilder.neutralText != null && this.neutralButton.getVisibility() == 0) {
            number++;
        }
        if (this.mBuilder.negativeText != null && this.negativeButton.getVisibility() == 0) {
            number++;
        }
        return number;
    }

    @Override // android.app.Dialog
    @UiThread
    public final void setTitle(@NonNull CharSequence newTitle) {
        this.title.setText(newTitle);
    }

    @Override // android.app.Dialog
    @UiThread
    public final void setTitle(@StringRes int newTitleRes) {
        setTitle(this.mBuilder.context.getString(newTitleRes));
    }

    @UiThread
    public final void setTitle(@StringRes int newTitleRes, @Nullable Object... formatArgs) {
        setTitle(this.mBuilder.context.getString(newTitleRes, formatArgs));
    }

    @UiThread
    public void setIcon(@DrawableRes int resId) {
        this.icon.setImageResource(resId);
        this.icon.setVisibility(resId != 0 ? 0 : 8);
    }

    @UiThread
    public void setIcon(Drawable d) {
        this.icon.setImageDrawable(d);
        this.icon.setVisibility(d != null ? 0 : 8);
    }

    @UiThread
    public void setIconAttribute(@AttrRes int attrId) {
        Drawable d = DialogUtils.resolveDrawable(this.mBuilder.context, attrId);
        setIcon(d);
    }

    @UiThread
    public final void setContent(CharSequence newContent) {
        this.content.setText(newContent);
        this.content.setVisibility(TextUtils.isEmpty(newContent) ? 8 : 0);
    }

    @UiThread
    public final void setContent(@StringRes int newContentRes) {
        setContent(this.mBuilder.context.getString(newContentRes));
    }

    @UiThread
    public final void setContent(@StringRes int newContentRes, @Nullable Object... formatArgs) {
        setContent(this.mBuilder.context.getString(newContentRes, formatArgs));
    }

    @Deprecated
    public void setMessage(CharSequence message) {
        setContent(message);
    }

    @UiThread
    public final void setItems(CharSequence... items) {
        if (this.mBuilder.adapter == null) {
            throw new IllegalStateException("This MaterialDialog instance does not yet have an adapter set to it. You cannot use setItems().");
        }
        this.mBuilder.items = items;
        if (this.mBuilder.adapter instanceof DefaultAdapter) {
            this.mBuilder.adapter = new DefaultAdapter(this, ListType.getLayoutForType(this.listType));
            this.listView.setAdapter(this.mBuilder.adapter);
            return;
        }
        throw new IllegalStateException("When using a custom adapter, setItems() cannot be used. Set items through the adapter instead.");
    }

    public final int getCurrentProgress() {
        if (this.mProgress == null) {
            return -1;
        }
        return this.mProgress.getProgress();
    }

    public ProgressBar getProgressBar() {
        return this.mProgress;
    }

    public final void incrementProgress(int by) {
        setProgress(getCurrentProgress() + by);
    }

    public final void setProgress(int progress) {
        if (this.mBuilder.progress <= -2) {
            throw new IllegalStateException("Cannot use setProgress() on this dialog.");
        }
        this.mProgress.setProgress(progress);
        this.mHandler.post(new Runnable() { // from class: com.afollestad.materialdialogs.MaterialDialog.2
            @Override // java.lang.Runnable
            public void run() {
                if (MaterialDialog.this.mProgressLabel != null) {
                    MaterialDialog.this.mProgressLabel.setText(MaterialDialog.this.mBuilder.progressPercentFormat.format(MaterialDialog.this.getCurrentProgress() / MaterialDialog.this.getMaxProgress()));
                }
                if (MaterialDialog.this.mProgressMinMax != null) {
                    MaterialDialog.this.mProgressMinMax.setText(String.format(MaterialDialog.this.mBuilder.progressNumberFormat, Integer.valueOf(MaterialDialog.this.getCurrentProgress()), Integer.valueOf(MaterialDialog.this.getMaxProgress())));
                }
            }
        });
    }

    public final void setMaxProgress(int max) {
        if (this.mBuilder.progress <= -2) {
            throw new IllegalStateException("Cannot use setMaxProgress() on this dialog.");
        }
        this.mProgress.setMax(max);
    }

    public final boolean isIndeterminateProgress() {
        return this.mBuilder.indeterminateProgress;
    }

    public final int getMaxProgress() {
        if (this.mProgress == null) {
            return -1;
        }
        return this.mProgress.getMax();
    }

    public final void setProgressPercentFormat(NumberFormat format) {
        this.mBuilder.progressPercentFormat = format;
        setProgress(getCurrentProgress());
    }

    public final void setProgressNumberFormat(String format) {
        this.mBuilder.progressNumberFormat = format;
        setProgress(getCurrentProgress());
    }

    public final boolean isCancelled() {
        return !isShowing();
    }

    public int getSelectedIndex() {
        if (this.mBuilder.listCallbackSingleChoice != null) {
            return this.mBuilder.selectedIndex;
        }
        return -1;
    }

    @Nullable
    public Integer[] getSelectedIndices() {
        if (this.mBuilder.listCallbackMultiChoice != null) {
            return (Integer[]) this.selectedIndicesList.toArray(new Integer[this.selectedIndicesList.size()]);
        }
        return null;
    }

    @UiThread
    public void setSelectedIndex(int index) {
        this.mBuilder.selectedIndex = index;
        if (this.mBuilder.adapter != null && (this.mBuilder.adapter instanceof DefaultAdapter)) {
            ((DefaultAdapter) this.mBuilder.adapter).notifyDataSetChanged();
            return;
        }
        throw new IllegalStateException("You can only use setSelectedIndex() with the default adapter implementation.");
    }

    @UiThread
    public void setSelectedIndices(@NonNull Integer[] indices) {
        this.selectedIndicesList = new ArrayList(Arrays.asList(indices));
        if (this.mBuilder.adapter != null && (this.mBuilder.adapter instanceof DefaultAdapter)) {
            ((DefaultAdapter) this.mBuilder.adapter).notifyDataSetChanged();
            return;
        }
        throw new IllegalStateException("You can only use setSelectedIndices() with the default adapter implementation.");
    }

    public void clearSelectedIndices() {
        clearSelectedIndices(true);
    }

    public void clearSelectedIndices(boolean sendCallback) {
        if (this.listType == null || this.listType != ListType.MULTI) {
            throw new IllegalStateException("You can only use clearSelectedIndices() with multi choice list dialogs.");
        }
        if (this.mBuilder.adapter != null && (this.mBuilder.adapter instanceof DefaultAdapter)) {
            if (this.selectedIndicesList != null) {
                this.selectedIndicesList.clear();
            }
            ((DefaultAdapter) this.mBuilder.adapter).notifyDataSetChanged();
            if (sendCallback && this.mBuilder.listCallbackMultiChoice != null) {
                sendMultichoiceCallback();
                return;
            }
            return;
        }
        throw new IllegalStateException("You can only use clearSelectedIndices() with the default adapter implementation.");
    }

    public void selectAllIndicies() {
        selectAllIndicies(true);
    }

    public void selectAllIndicies(boolean sendCallback) {
        if (this.listType == null || this.listType != ListType.MULTI) {
            throw new IllegalStateException("You can only use selectAllIndicies() with multi choice list dialogs.");
        }
        if (this.mBuilder.adapter != null && (this.mBuilder.adapter instanceof DefaultAdapter)) {
            if (this.selectedIndicesList == null) {
                this.selectedIndicesList = new ArrayList();
            }
            for (int i = 0; i < this.mBuilder.adapter.getCount(); i++) {
                if (!this.selectedIndicesList.contains(Integer.valueOf(i))) {
                    this.selectedIndicesList.add(Integer.valueOf(i));
                }
            }
            ((DefaultAdapter) this.mBuilder.adapter).notifyDataSetChanged();
            if (sendCallback && this.mBuilder.listCallbackMultiChoice != null) {
                sendMultichoiceCallback();
                return;
            }
            return;
        }
        throw new IllegalStateException("You can only use selectAllIndicies() with the default adapter implementation.");
    }

    @Override // com.afollestad.materialdialogs.DialogBase, android.content.DialogInterface.OnShowListener
    public final void onShow(DialogInterface dialog) {
        if (this.input != null) {
            DialogUtils.showKeyboard(this, this.mBuilder);
            if (this.input.getText().length() > 0) {
                this.input.setSelection(this.input.getText().length());
            }
        }
        super.onShow(dialog);
    }

    protected void setInternalInputCallback() {
        if (this.input == null) {
            return;
        }
        this.input.addTextChangedListener(new TextWatcher() { // from class: com.afollestad.materialdialogs.MaterialDialog.3
            @Override // android.text.TextWatcher
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            }

            @Override // android.text.TextWatcher
            public void onTextChanged(CharSequence s, int start, int before, int count) {
                int length = s.toString().length();
                boolean emptyDisabled = false;
                if (!MaterialDialog.this.mBuilder.inputAllowEmpty) {
                    emptyDisabled = length == 0;
                    View positiveAb = MaterialDialog.this.getActionButton(DialogAction.POSITIVE);
                    positiveAb.setEnabled(!emptyDisabled);
                }
                MaterialDialog.this.invalidateInputMinMaxIndicator(length, emptyDisabled);
                if (MaterialDialog.this.mBuilder.alwaysCallInputCallback) {
                    MaterialDialog.this.mBuilder.inputCallback.onInput(MaterialDialog.this, s);
                }
            }

            @Override // android.text.TextWatcher
            public void afterTextChanged(Editable s) {
            }
        });
    }

    protected void invalidateInputMinMaxIndicator(int currentLength, boolean emptyDisabled) {
        if (this.inputMinMax != null) {
            if (this.mBuilder.inputMaxLength > 0) {
                this.inputMinMax.setText(String.format("%d/%d", Integer.valueOf(currentLength), Integer.valueOf(this.mBuilder.inputMaxLength)));
                this.inputMinMax.setVisibility(0);
            } else {
                this.inputMinMax.setVisibility(8);
            }
            boolean isDisabled = (emptyDisabled && currentLength == 0) || (this.mBuilder.inputMaxLength > 0 && currentLength > this.mBuilder.inputMaxLength) || currentLength < this.mBuilder.inputMinLength;
            int colorText = isDisabled ? this.mBuilder.inputRangeErrorColor : this.mBuilder.contentColor;
            int colorWidget = isDisabled ? this.mBuilder.inputRangeErrorColor : this.mBuilder.widgetColor;
            if (this.mBuilder.inputMaxLength > 0) {
                this.inputMinMax.setTextColor(colorText);
            }
            MDTintHelper.setTint(this.input, colorWidget);
            View positiveAb = getActionButton(DialogAction.POSITIVE);
            positiveAb.setEnabled(!isDisabled);
        }
    }

    @Override // android.app.Dialog
    protected void onStop() {
        super.onStop();
        if (this.input != null) {
            DialogUtils.hideKeyboard(this, this.mBuilder);
        }
    }

    /* renamed from: com.afollestad.materialdialogs.MaterialDialog$4, reason: invalid class name */
    /* loaded from: com.afollestad.material-dialogs.core.0.8.5.1.jar:com/afollestad/materialdialogs/MaterialDialog$4.class */
    static /* synthetic */ class AnonymousClass4 {
        static final /* synthetic */ int[] $SwitchMap$com$afollestad$materialdialogs$DialogAction;
        static final /* synthetic */ int[] $SwitchMap$com$afollestad$materialdialogs$MaterialDialog$ListType = new int[ListType.values().length];

        static {
            try {
                $SwitchMap$com$afollestad$materialdialogs$MaterialDialog$ListType[ListType.REGULAR.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$com$afollestad$materialdialogs$MaterialDialog$ListType[ListType.SINGLE.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$com$afollestad$materialdialogs$MaterialDialog$ListType[ListType.MULTI.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            $SwitchMap$com$afollestad$materialdialogs$DialogAction = new int[DialogAction.values().length];
            try {
                $SwitchMap$com$afollestad$materialdialogs$DialogAction[DialogAction.NEUTRAL.ordinal()] = 1;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$com$afollestad$materialdialogs$DialogAction[DialogAction.NEGATIVE.ordinal()] = 2;
            } catch (NoSuchFieldError e5) {
            }
            try {
                $SwitchMap$com$afollestad$materialdialogs$DialogAction[DialogAction.POSITIVE.ordinal()] = 3;
            } catch (NoSuchFieldError e6) {
            }
        }
    }

    /* loaded from: com.afollestad.material-dialogs.core.0.8.5.1.jar:com/afollestad/materialdialogs/MaterialDialog$ListType.class */
    protected enum ListType {
        REGULAR,
        SINGLE,
        MULTI;

        public static int getLayoutForType(ListType type) {
            switch (AnonymousClass4.$SwitchMap$com$afollestad$materialdialogs$MaterialDialog$ListType[type.ordinal()]) {
                case BuildConfig.VERSION_CODE /* 1 */:
                    return R.layout.md_listitem;
                case 2:
                    return R.layout.md_listitem_singlechoice;
                case 3:
                    return R.layout.md_listitem_multichoice;
                default:
                    throw new IllegalArgumentException("Not a valid list type");
            }
        }
    }

    @Deprecated
    /* loaded from: com.afollestad.material-dialogs.core.0.8.5.1.jar:com/afollestad/materialdialogs/MaterialDialog$ButtonCallback.class */
    public static abstract class ButtonCallback {
        @Deprecated
        public void onAny(MaterialDialog dialog) {
        }

        @Deprecated
        public void onPositive(MaterialDialog dialog) {
        }

        @Deprecated
        public void onNegative(MaterialDialog dialog) {
        }

        @Deprecated
        public void onNeutral(MaterialDialog dialog) {
        }

        protected final Object clone() throws CloneNotSupportedException {
            return super.clone();
        }

        public final boolean equals(Object o) {
            return super.equals(o);
        }

        protected final void finalize() throws Throwable {
            super.finalize();
        }

        public final int hashCode() {
            return super.hashCode();
        }

        public final String toString() {
            return super.toString();
        }
    }
}
