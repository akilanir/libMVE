package com.afollestad.materialdialogs;

import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.content.res.Configuration;
import android.os.Build;
import android.support.annotation.LayoutRes;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.TextView;
import com.afollestad.materialdialogs.MaterialDialog;
import com.afollestad.materialdialogs.internal.MDTintHelper;

/* loaded from: com.afollestad.material-dialogs.v0.7.7.0.jar:com/afollestad/materialdialogs/MaterialDialogAdapter.class */
class MaterialDialogAdapter extends BaseAdapter {
    private final MaterialDialog dialog;

    @LayoutRes
    private final int layout;
    private final GravityEnum itemGravity;
    public RadioButton mRadioButton;
    public boolean mInitRadio;

    public MaterialDialogAdapter(MaterialDialog dialog, @LayoutRes int layout) {
        this.dialog = dialog;
        this.layout = layout;
        this.itemGravity = dialog.mBuilder.itemsGravity;
    }

    @Override // android.widget.BaseAdapter, android.widget.Adapter
    public boolean hasStableIds() {
        return true;
    }

    @Override // android.widget.Adapter
    public int getCount() {
        if (this.dialog.mBuilder.items != null) {
            return this.dialog.mBuilder.items.length;
        }
        return 0;
    }

    @Override // android.widget.Adapter
    public Object getItem(int position) {
        return this.dialog.mBuilder.items[position];
    }

    @Override // android.widget.Adapter
    public long getItemId(int position) {
        return position;
    }

    @Override // android.widget.Adapter
    @SuppressLint({"WrongViewCast"})
    public View getView(int index, View view, ViewGroup parent) {
        if (view == null) {
            view = LayoutInflater.from(this.dialog.getContext()).inflate(this.layout, parent, false);
        }
        TextView tv = (TextView) view.findViewById(R.id.title);
        switch (AnonymousClass1.$SwitchMap$com$afollestad$materialdialogs$MaterialDialog$ListType[this.dialog.listType.ordinal()]) {
            case BuildConfig.VERSION_CODE /* 1 */:
                RadioButton radio = (RadioButton) view.findViewById(R.id.control);
                boolean selected = this.dialog.mBuilder.selectedIndex == index;
                MDTintHelper.setTint(radio, this.dialog.mBuilder.widgetColor);
                radio.setChecked(selected);
                if (selected && this.mInitRadio) {
                    this.mRadioButton = radio;
                    break;
                }
                break;
            case 2:
                CheckBox checkbox = (CheckBox) view.findViewById(R.id.control);
                boolean selected2 = this.dialog.selectedIndicesList.contains(Integer.valueOf(index));
                MDTintHelper.setTint(checkbox, this.dialog.mBuilder.widgetColor);
                checkbox.setChecked(selected2);
                break;
        }
        tv.setText(this.dialog.mBuilder.items[index]);
        tv.setTextColor(this.dialog.mBuilder.itemColor);
        this.dialog.setTypeface(tv, this.dialog.mBuilder.regularFont);
        view.setTag(index + ":" + ((Object) this.dialog.mBuilder.items[index]));
        setupGravity((ViewGroup) view);
        if (Build.VERSION.SDK_INT >= 21) {
            ViewGroup group = (ViewGroup) view;
            if (group.getChildCount() == 2) {
                if (group.getChildAt(0) instanceof CompoundButton) {
                    group.getChildAt(0).setBackground(null);
                } else if (group.getChildAt(1) instanceof CompoundButton) {
                    group.getChildAt(1).setBackground(null);
                }
            }
        }
        return view;
    }

    /* renamed from: com.afollestad.materialdialogs.MaterialDialogAdapter$1, reason: invalid class name */
    /* loaded from: com.afollestad.material-dialogs.v0.7.7.0.jar:com/afollestad/materialdialogs/MaterialDialogAdapter$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$afollestad$materialdialogs$MaterialDialog$ListType = new int[MaterialDialog.ListType.values().length];

        static {
            try {
                $SwitchMap$com$afollestad$materialdialogs$MaterialDialog$ListType[MaterialDialog.ListType.SINGLE.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$com$afollestad$materialdialogs$MaterialDialog$ListType[MaterialDialog.ListType.MULTI.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
        }
    }

    @TargetApi(17)
    private void setupGravity(ViewGroup view) {
        LinearLayout itemRoot = (LinearLayout) view;
        int gravityInt = this.itemGravity.getGravityInt();
        itemRoot.setGravity(gravityInt | 16);
        if (view.getChildCount() == 2) {
            if (this.itemGravity == GravityEnum.END && !isRTL() && (view.getChildAt(0) instanceof CompoundButton)) {
                CompoundButton first = (CompoundButton) view.getChildAt(0);
                view.removeView(first);
                TextView second = (TextView) view.getChildAt(0);
                view.removeView(second);
                second.setPadding(second.getPaddingRight(), second.getPaddingTop(), second.getPaddingLeft(), second.getPaddingBottom());
                view.addView(second);
                view.addView(first);
                return;
            }
            if (this.itemGravity == GravityEnum.START && isRTL() && (view.getChildAt(1) instanceof CompoundButton)) {
                CompoundButton first2 = (CompoundButton) view.getChildAt(1);
                view.removeView(first2);
                TextView second2 = (TextView) view.getChildAt(0);
                view.removeView(second2);
                second2.setPadding(second2.getPaddingRight(), second2.getPaddingTop(), second2.getPaddingRight(), second2.getPaddingBottom());
                view.addView(first2);
                view.addView(second2);
            }
        }
    }

    @TargetApi(17)
    private boolean isRTL() {
        if (Build.VERSION.SDK_INT < 17) {
            return false;
        }
        Configuration config = this.dialog.getBuilder().getContext().getResources().getConfiguration();
        return config.getLayoutDirection() == 1;
    }
}
