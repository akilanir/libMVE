package com.afollestad.materialdialogs.simplelist;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.Configuration;
import android.os.Build;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.CompoundButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.afollestad.materialdialogs.GravityEnum;
import com.afollestad.materialdialogs.MaterialDialog;
import com.afollestad.materialdialogs.R;

/* loaded from: com.afollestad.material-dialogs.v0.7.7.0.jar:com/afollestad/materialdialogs/simplelist/MaterialSimpleListAdapter.class */
public class MaterialSimpleListAdapter extends ArrayAdapter<MaterialSimpleListItem> {
    private MaterialDialog dialog;

    public void setDialog(MaterialDialog dialog) {
        setDialog(dialog, true);
    }

    public void setDialog(MaterialDialog dialog, boolean notifyDataSetChanged) {
        this.dialog = dialog;
        if (notifyDataSetChanged) {
            notifyDataSetChanged();
        }
    }

    public MaterialSimpleListAdapter(Context context) {
        super(context, R.layout.md_simplelist_item, android.R.id.title);
    }

    @Override // android.widget.BaseAdapter, android.widget.Adapter
    public boolean hasStableIds() {
        return true;
    }

    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    public long getItemId(int position) {
        return position;
    }

    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    public View getView(int index, View convertView, ViewGroup parent) {
        View view = super.getView(index, convertView, parent);
        if (this.dialog != null) {
            MaterialSimpleListItem item = getItem(index);
            ImageView ic = (ImageView) view.findViewById(android.R.id.icon);
            if (item.getIcon() != null) {
                ic.setImageDrawable(item.getIcon());
            } else {
                ic.setVisibility(8);
            }
            TextView tv = (TextView) view.findViewById(android.R.id.title);
            tv.setTextColor(this.dialog.getBuilder().getItemColor());
            tv.setText(item.getContent());
            this.dialog.setTypeface(tv, this.dialog.getBuilder().getRegularFont());
            setupGravity((ViewGroup) view);
        }
        return view;
    }

    @TargetApi(17)
    private void setupGravity(ViewGroup view) {
        LinearLayout itemRoot = (LinearLayout) view;
        GravityEnum gravity = this.dialog.getBuilder().getItemsGravity();
        int gravityInt = gravity.getGravityInt();
        itemRoot.setGravity(gravityInt | 16);
        if (view.getChildCount() == 2) {
            if (this.dialog.getBuilder().getItemsGravity() == GravityEnum.END && !isRTL() && (view.getChildAt(0) instanceof ImageView)) {
                CompoundButton first = (CompoundButton) view.getChildAt(0);
                view.removeView(first);
                TextView second = (TextView) view.getChildAt(0);
                view.removeView(second);
                second.setPadding(second.getPaddingRight(), second.getPaddingTop(), second.getPaddingLeft(), second.getPaddingBottom());
                view.addView(second);
                view.addView(first);
                return;
            }
            if (gravity == GravityEnum.START && isRTL() && (view.getChildAt(1) instanceof ImageView)) {
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
        Configuration config = getContext().getResources().getConfiguration();
        return config.getLayoutDirection() == 1;
    }
}
