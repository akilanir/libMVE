package com.rey.material.app;

import android.content.Context;
import android.content.res.TypedArray;
import android.os.Build;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.v4.view.ViewCompat;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.CompoundButton;
import android.widget.ScrollView;
import com.rey.material.R;
import com.rey.material.app.Dialog;
import com.rey.material.drawable.BlankDrawable;
import com.rey.material.widget.CheckBox;
import com.rey.material.widget.ListView;
import com.rey.material.widget.RadioButton;
import com.rey.material.widget.TextView;

/* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/app/SimpleDialog.class */
public class SimpleDialog extends Dialog {
    private TextView mMessage;
    private InternalScrollView mScrollView;
    private InternalListView mListView;
    private InternalAdapter mAdapter;
    private int mMessageTextAppearanceId;
    private int mMessageTextColor;
    private int mRadioButtonStyle;
    private int mCheckBoxStyle;
    private int mItemHeight;
    private int mItemTextAppearance;
    private int mMode;
    protected static final int MODE_NONE = 0;
    protected static final int MODE_MESSAGE = 1;
    protected static final int MODE_ITEMS = 2;
    protected static final int MODE_MULTI_ITEMS = 3;
    protected static final int MODE_CUSTOM = 4;
    private OnSelectionChangedListener mOnSelectionChangedListener;

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/app/SimpleDialog$OnSelectionChangedListener.class */
    public interface OnSelectionChangedListener {
        void onSelectionChanged(int i, boolean z);
    }

    public SimpleDialog(Context context) {
        super(context, R.style.Material_App_Dialog_Simple_Light);
    }

    public SimpleDialog(Context context, int style) {
        super(context, style);
    }

    @Override // com.rey.material.app.Dialog
    protected void onCreate() {
        messageTextAppearance(R.style.TextAppearance_AppCompat_Body1);
        itemHeight(-2);
        itemTextAppearance(R.style.TextAppearance_AppCompat_Body1);
    }

    @Override // com.rey.material.app.Dialog
    public Dialog applyStyle(int resId) {
        super.applyStyle(resId);
        if (resId == 0) {
            return this;
        }
        TypedArray a = getContext().obtainStyledAttributes(resId, R.styleable.SimpleDialog);
        int textAppearance = 0;
        int textColor = 0;
        boolean textColorDefined = false;
        int count = a.getIndexCount();
        for (int i = 0; i < count; i++) {
            int attr = a.getIndex(i);
            if (attr == R.styleable.SimpleDialog_di_messageTextAppearance) {
                textAppearance = a.getResourceId(attr, 0);
            } else if (attr == R.styleable.SimpleDialog_di_messageTextColor) {
                textColor = a.getColor(attr, 0);
                textColorDefined = true;
            } else if (attr == R.styleable.SimpleDialog_di_radioButtonStyle) {
                radioButtonStyle(a.getResourceId(attr, 0));
            } else if (attr == R.styleable.SimpleDialog_di_checkBoxStyle) {
                checkBoxStyle(a.getResourceId(attr, 0));
            } else if (attr == R.styleable.SimpleDialog_di_itemHeight) {
                itemHeight(a.getDimensionPixelSize(attr, 0));
            } else if (attr == R.styleable.SimpleDialog_di_itemTextAppearance) {
                itemTextAppearance(a.getResourceId(attr, 0));
            }
        }
        a.recycle();
        if (textAppearance != 0) {
            messageTextAppearance(textAppearance);
        }
        if (textColorDefined) {
            messageTextColor(textColor);
        }
        return this;
    }

    @Override // com.rey.material.app.Dialog
    public Dialog clearContent() {
        super.clearContent();
        this.mMode = 0;
        return this;
    }

    @Override // com.rey.material.app.Dialog
    public Dialog title(CharSequence title) {
        boolean titleVisible = !TextUtils.isEmpty(title);
        contentMargin(this.mContentPadding, titleVisible ? 0 : this.mContentPadding, this.mContentPadding, 0);
        return super.title(title);
    }

    @Override // com.rey.material.app.Dialog
    public Dialog contentView(View v) {
        if (this.mScrollView == null) {
            initScrollView();
        }
        if (this.mScrollView.getChildAt(0) != v && v != null) {
            this.mScrollView.removeAllViews();
            this.mScrollView.addView(v);
            this.mMode = MODE_CUSTOM;
            super.contentView(this.mScrollView);
        }
        return this;
    }

    private void initScrollView() {
        this.mScrollView = new InternalScrollView(getContext());
        this.mScrollView.setPadding(0, 0, 0, this.mContentPadding - this.mActionPadding);
        this.mScrollView.setClipToPadding(false);
        this.mScrollView.setFillViewport(true);
        this.mScrollView.setScrollBarStyle(33554432);
        ViewCompat.setLayoutDirection(this.mScrollView, 2);
    }

    private void initMessageView() {
        this.mMessage = new TextView(getContext());
        this.mMessage.setTextAppearance(getContext(), this.mMessageTextAppearanceId);
        this.mMessage.setTextColor(this.mMessageTextColor);
        this.mMessage.setGravity(8388627);
    }

    public SimpleDialog message(CharSequence message) {
        if (this.mScrollView == null) {
            initScrollView();
        }
        if (this.mMessage == null) {
            initMessageView();
        }
        if (this.mScrollView.getChildAt(0) != this.mMessage) {
            this.mScrollView.removeAllViews();
            this.mScrollView.addView(this.mMessage);
        }
        this.mMessage.setText(message);
        if (!TextUtils.isEmpty(message)) {
            this.mMode = 1;
            super.contentView(this.mScrollView);
        }
        return this;
    }

    public SimpleDialog message(int id) {
        return message(id == 0 ? null : getContext().getResources().getString(id));
    }

    public SimpleDialog messageTextAppearance(int resId) {
        if (this.mMessageTextAppearanceId != resId) {
            this.mMessageTextAppearanceId = resId;
            if (this.mMessage != null) {
                this.mMessage.setTextAppearance(getContext(), this.mMessageTextAppearanceId);
            }
        }
        return this;
    }

    public SimpleDialog messageTextColor(int color) {
        if (this.mMessageTextColor != color) {
            this.mMessageTextColor = color;
            if (this.mMessage != null) {
                this.mMessage.setTextColor(color);
            }
        }
        return this;
    }

    public SimpleDialog radioButtonStyle(int resId) {
        if (this.mRadioButtonStyle != resId) {
            this.mRadioButtonStyle = resId;
            if (this.mAdapter != null && this.mMode == 2) {
                this.mAdapter.notifyDataSetChanged();
            }
        }
        return this;
    }

    public SimpleDialog checkBoxStyle(int resId) {
        if (this.mCheckBoxStyle != resId) {
            this.mCheckBoxStyle = resId;
            if (this.mAdapter != null && this.mMode == 3) {
                this.mAdapter.notifyDataSetChanged();
            }
        }
        return this;
    }

    public SimpleDialog itemHeight(int height) {
        if (this.mItemHeight != height) {
            this.mItemHeight = height;
            if (this.mAdapter != null) {
                this.mAdapter.notifyDataSetChanged();
            }
        }
        return this;
    }

    public SimpleDialog itemTextAppearance(int resId) {
        if (this.mItemTextAppearance != resId) {
            this.mItemTextAppearance = resId;
            if (this.mAdapter != null) {
                this.mAdapter.notifyDataSetChanged();
            }
        }
        return this;
    }

    private void initListView() {
        this.mListView = new InternalListView(getContext());
        this.mListView.setDividerHeight(0);
        this.mListView.setCacheColorHint(0);
        this.mListView.setScrollBarStyle(33554432);
        this.mListView.setClipToPadding(false);
        this.mListView.setSelector(BlankDrawable.getInstance());
        this.mListView.setPadding(0, 0, 0, this.mContentPadding - this.mActionPadding);
        this.mListView.setVerticalFadingEdgeEnabled(false);
        this.mListView.setOverScrollMode(2);
        ViewCompat.setLayoutDirection(this.mListView, 2);
        this.mAdapter = new InternalAdapter();
        this.mListView.setAdapter(this.mAdapter);
    }

    public SimpleDialog items(CharSequence[] items, int selectedIndex) {
        if (this.mListView == null) {
            initListView();
        }
        this.mMode = 2;
        this.mAdapter.setItems(items, selectedIndex);
        super.contentView((View) this.mListView);
        return this;
    }

    public SimpleDialog multiChoiceItems(CharSequence[] items, int... selectedIndexes) {
        if (this.mListView == null) {
            initListView();
        }
        this.mMode = 3;
        this.mAdapter.setItems(items, selectedIndexes);
        super.contentView((View) this.mListView);
        return this;
    }

    public SimpleDialog onSelectionChangedListener(OnSelectionChangedListener listener) {
        this.mOnSelectionChangedListener = listener;
        return this;
    }

    public int[] getSelectedIndexes() {
        if (this.mAdapter == null) {
            return null;
        }
        return this.mAdapter.getSelectedIndexes();
    }

    public CharSequence[] getSelectedValues() {
        return this.mAdapter.getSelectedValues();
    }

    public int getSelectedIndex() {
        if (this.mAdapter == null) {
            return -1;
        }
        return this.mAdapter.getLastSelectedIndex();
    }

    public CharSequence getSelectedValue() {
        return this.mAdapter.getLastSelectedValue();
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/app/SimpleDialog$InternalScrollView.class */
    private class InternalScrollView extends ScrollView {
        private boolean mIsRtl;

        public InternalScrollView(Context context) {
            super(context);
            this.mIsRtl = false;
        }

        @Override // android.view.View
        public void onRtlPropertiesChanged(int layoutDirection) {
            View v;
            boolean rtl = layoutDirection == 1;
            if (this.mIsRtl != rtl) {
                this.mIsRtl = rtl;
                if (Build.VERSION.SDK_INT >= 17 && (v = getChildAt(0)) != null && v == SimpleDialog.this.mMessage) {
                    SimpleDialog.this.mMessage.setTextDirection(this.mIsRtl ? SimpleDialog.MODE_CUSTOM : 3);
                }
                requestLayout();
            }
        }

        public boolean isLayoutRtl() {
            return this.mIsRtl;
        }

        @Override // android.widget.ScrollView, android.widget.FrameLayout, android.view.ViewGroup, android.view.View
        protected void onLayout(boolean changed, int l, int t, int r, int b) {
            super.onLayout(changed, l, t, r, b);
            View child = getChildAt(0);
            SimpleDialog.this.showDivider(child != null && child.getMeasuredHeight() > (getMeasuredHeight() - getPaddingTop()) - getPaddingBottom());
        }
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/app/SimpleDialog$InternalListView.class */
    private class InternalListView extends ListView {
        private boolean mIsRtl;

        public InternalListView(Context context) {
            super(context);
            this.mIsRtl = false;
        }

        public void onRtlPropertiesChanged(int layoutDirection) {
            boolean rtl = layoutDirection == 1;
            if (this.mIsRtl != rtl) {
                this.mIsRtl = rtl;
                requestLayout();
            }
        }

        public boolean isLayoutRtl() {
            return this.mIsRtl;
        }

        protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
            int heightMode = View.MeasureSpec.getMode(heightMeasureSpec);
            if (heightMode == 0 && SimpleDialog.this.mItemHeight != -2) {
                heightMeasureSpec = View.MeasureSpec.makeMeasureSpec((SimpleDialog.this.mItemHeight * getAdapter().getCount()) + getPaddingTop() + getPaddingBottom(), 1073741824);
            }
            super.onMeasure(widthMeasureSpec, heightMeasureSpec);
        }

        protected void onLayout(boolean changed, int l, int t, int r, int b) {
            super.onLayout(changed, l, t, r, b);
            int totalHeight = 0;
            int childCount = getChildCount();
            for (int i = 0; i < childCount; i++) {
                totalHeight += getChildAt(i).getMeasuredHeight();
            }
            SimpleDialog.this.showDivider(totalHeight > getMeasuredHeight() || (totalHeight == getMeasuredHeight() && getAdapter().getCount() > childCount));
        }
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/app/SimpleDialog$InternalAdapter.class */
    private class InternalAdapter extends BaseAdapter implements CompoundButton.OnCheckedChangeListener {
        private CharSequence[] mItems;
        private boolean[] mSelected;
        private int mLastSelectedIndex;

        private InternalAdapter() {
        }

        public void setItems(CharSequence[] items, int... selectedIndexes) {
            this.mItems = items;
            if (this.mSelected == null || this.mSelected.length != items.length) {
                this.mSelected = new boolean[items.length];
            }
            for (int i = 0; i < this.mSelected.length; i++) {
                this.mSelected[i] = false;
            }
            if (selectedIndexes != null) {
                for (int index : selectedIndexes) {
                    if (index >= 0 && index < this.mSelected.length) {
                        this.mSelected[index] = true;
                        this.mLastSelectedIndex = index;
                    }
                }
            }
            notifyDataSetChanged();
        }

        public int getLastSelectedIndex() {
            return this.mLastSelectedIndex;
        }

        public CharSequence getLastSelectedValue() {
            return this.mItems[this.mLastSelectedIndex];
        }

        public int[] getSelectedIndexes() {
            int count = 0;
            for (int i = 0; i < this.mSelected.length; i++) {
                if (this.mSelected[i]) {
                    count++;
                }
            }
            if (count == 0) {
                return null;
            }
            int[] result = new int[count];
            int count2 = 0;
            for (int i2 = 0; i2 < this.mSelected.length; i2++) {
                if (this.mSelected[i2]) {
                    result[count2] = i2;
                    count2++;
                }
            }
            return result;
        }

        public CharSequence[] getSelectedValues() {
            int count = 0;
            for (int i = 0; i < this.mSelected.length; i++) {
                if (this.mSelected[i]) {
                    count++;
                }
            }
            if (count == 0) {
                return null;
            }
            CharSequence[] result = new CharSequence[count];
            int count2 = 0;
            for (int i2 = 0; i2 < this.mSelected.length; i2++) {
                if (this.mSelected[i2]) {
                    result[count2] = this.mItems[i2];
                    count2++;
                }
            }
            return result;
        }

        @Override // android.widget.Adapter
        public int getCount() {
            if (this.mItems == null) {
                return 0;
            }
            return this.mItems.length;
        }

        @Override // android.widget.Adapter
        public Object getItem(int position) {
            if (this.mItems == null) {
                return 0;
            }
            return this.mItems[position];
        }

        @Override // android.widget.Adapter
        public long getItemId(int position) {
            return 0L;
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // android.widget.Adapter
        public View getView(int position, View convertView, ViewGroup viewGroup) {
            com.rey.material.widget.CompoundButton v = (com.rey.material.widget.CompoundButton) convertView;
            if (v == null) {
                if (SimpleDialog.this.mMode == 3) {
                    v = new CheckBox(viewGroup.getContext());
                    v.applyStyle(SimpleDialog.this.mCheckBoxStyle);
                } else {
                    v = new RadioButton(viewGroup.getContext());
                    v.applyStyle(SimpleDialog.this.mRadioButtonStyle);
                }
                if (SimpleDialog.this.mItemHeight != -2) {
                    v.setMinHeight(SimpleDialog.this.mItemHeight);
                }
                v.setGravity(8388627);
                if (Build.VERSION.SDK_INT >= 17) {
                    v.setTextDirection(((InternalListView) viewGroup).isLayoutRtl() ? SimpleDialog.MODE_CUSTOM : 3);
                }
                v.setTextAppearance(v.getContext(), SimpleDialog.this.mItemTextAppearance);
                v.setCompoundDrawablePadding(SimpleDialog.this.mContentPadding);
            }
            v.setTag(Integer.valueOf(position));
            v.setText(this.mItems[position]);
            if (v instanceof CheckBox) {
                ((CheckBox) v).setCheckedImmediately(this.mSelected[position]);
            } else {
                ((RadioButton) v).setCheckedImmediately(this.mSelected[position]);
            }
            v.setOnCheckedChangeListener(this);
            return v;
        }

        @Override // android.widget.CompoundButton.OnCheckedChangeListener
        public void onCheckedChanged(CompoundButton v, boolean isChecked) {
            int position = ((Integer) v.getTag()).intValue();
            if (this.mSelected[position] != isChecked) {
                this.mSelected[position] = isChecked;
                if (SimpleDialog.this.mOnSelectionChangedListener != null) {
                    SimpleDialog.this.mOnSelectionChangedListener.onSelectionChanged(position, this.mSelected[position]);
                }
            }
            if (SimpleDialog.this.mMode == 2 && isChecked && this.mLastSelectedIndex != position) {
                this.mSelected[this.mLastSelectedIndex] = false;
                if (SimpleDialog.this.mOnSelectionChangedListener != null) {
                    SimpleDialog.this.mOnSelectionChangedListener.onSelectionChanged(this.mLastSelectedIndex, false);
                }
                com.rey.material.widget.CompoundButton child = (com.rey.material.widget.CompoundButton) SimpleDialog.this.mListView.getChildAt(this.mLastSelectedIndex - SimpleDialog.this.mListView.getFirstVisiblePosition());
                if (child != null) {
                    child.setChecked(false);
                }
                this.mLastSelectedIndex = position;
            }
        }
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/app/SimpleDialog$Builder.class */
    public static class Builder extends Dialog.Builder implements OnSelectionChangedListener {
        protected int mMode;
        protected CharSequence mMessage;
        protected CharSequence[] mItems;
        protected int[] mSelectedIndexes;
        public static final Parcelable.Creator<Builder> CREATOR = new Parcelable.Creator<Builder>() { // from class: com.rey.material.app.SimpleDialog.Builder.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public Builder createFromParcel(Parcel in) {
                return new Builder(in);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public Builder[] newArray(int size) {
                return new Builder[size];
            }
        };

        public Builder() {
            super(R.style.Material_App_Dialog_Simple_Light);
        }

        public Builder(int styleId) {
            super(styleId);
        }

        public Builder message(CharSequence message) {
            this.mMode = 1;
            this.mMessage = message;
            return this;
        }

        public Builder items(CharSequence[] items, int selectedIndex) {
            this.mMode = 2;
            this.mItems = items;
            this.mSelectedIndexes = new int[]{selectedIndex};
            return this;
        }

        public Builder multiChoiceItems(CharSequence[] items, int... selectedIndexes) {
            this.mMode = 3;
            this.mItems = items;
            this.mSelectedIndexes = selectedIndexes;
            return this;
        }

        public int getSelectedIndex() {
            if (this.mMode == 2 || this.mMode == 3) {
                return this.mSelectedIndexes[0];
            }
            return -1;
        }

        public CharSequence getSelectedValue() {
            int index = getSelectedIndex();
            if (index >= 0) {
                return this.mItems[index];
            }
            return null;
        }

        public int[] getSelectedIndexes() {
            if (this.mMode == 2 || this.mMode == 3) {
                return this.mSelectedIndexes;
            }
            return null;
        }

        public CharSequence[] getSelectedValues() {
            int[] indexes = getSelectedIndexes();
            if (indexes == null || indexes.length == 0) {
                return null;
            }
            CharSequence[] result = new CharSequence[indexes.length];
            for (int i = 0; i < indexes.length; i++) {
                result[i] = this.mItems[indexes[i]];
            }
            return result;
        }

        @Override // com.rey.material.app.Dialog.Builder
        protected Dialog onBuild(Context context, int styleId) {
            SimpleDialog dialog = new SimpleDialog(context, styleId);
            switch (this.mMode) {
                case 1:
                    dialog.message(this.mMessage);
                    break;
                case 2:
                    dialog.items(this.mItems, this.mSelectedIndexes == null ? 0 : this.mSelectedIndexes[0]);
                    dialog.onSelectionChangedListener(this);
                    break;
                case 3:
                    dialog.multiChoiceItems(this.mItems, this.mSelectedIndexes);
                    dialog.onSelectionChangedListener(this);
                    break;
            }
            return dialog;
        }

        @Override // com.rey.material.app.SimpleDialog.OnSelectionChangedListener
        public void onSelectionChanged(int index, boolean selected) {
            switch (this.mMode) {
                case 2:
                    if (selected) {
                        if (this.mSelectedIndexes == null) {
                            this.mSelectedIndexes = new int[]{index};
                            break;
                        } else {
                            this.mSelectedIndexes[0] = index;
                            break;
                        }
                    }
                    break;
                case 3:
                    this.mSelectedIndexes = ((SimpleDialog) this.mDialog).getSelectedIndexes();
                    break;
            }
        }

        protected Builder(Parcel in) {
            super(in);
        }

        @Override // com.rey.material.app.Dialog.Builder
        protected void onReadFromParcel(Parcel in) {
            this.mMode = in.readInt();
            switch (this.mMode) {
                case 1:
                    this.mMessage = (CharSequence) in.readParcelable(null);
                    break;
                case 2:
                    Parcelable[] values = in.readParcelableArray(null);
                    if (values != null && values.length > 0) {
                        this.mItems = new CharSequence[values.length];
                        for (int i = 0; i < this.mItems.length; i++) {
                            this.mItems[i] = (CharSequence) values[i];
                        }
                    } else {
                        this.mItems = null;
                    }
                    this.mSelectedIndexes = new int[]{in.readInt()};
                    break;
                case 3:
                    Parcelable[] values2 = in.readParcelableArray(null);
                    if (values2 != null && values2.length > 0) {
                        this.mItems = new CharSequence[values2.length];
                        for (int i2 = 0; i2 < this.mItems.length; i2++) {
                            this.mItems[i2] = (CharSequence) values2[i2];
                        }
                    } else {
                        this.mItems = null;
                    }
                    int length = in.readInt();
                    if (length > 0) {
                        this.mSelectedIndexes = new int[length];
                        in.readIntArray(this.mSelectedIndexes);
                        break;
                    }
                    break;
            }
        }

        @Override // com.rey.material.app.Dialog.Builder
        protected void onWriteToParcel(Parcel dest, int flags) {
            dest.writeInt(this.mMode);
            switch (this.mMode) {
                case 1:
                    dest.writeValue(this.mMessage);
                    break;
                case 2:
                    dest.writeArray(this.mItems);
                    dest.writeInt(this.mSelectedIndexes == null ? 0 : this.mSelectedIndexes[0]);
                    break;
                case 3:
                    dest.writeArray(this.mItems);
                    int length = this.mSelectedIndexes == null ? 0 : this.mSelectedIndexes.length;
                    dest.writeInt(length);
                    if (length > 0) {
                        dest.writeIntArray(this.mSelectedIndexes);
                        break;
                    }
                    break;
            }
        }
    }
}
