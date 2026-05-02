package com.mikepenz.materialdrawer.util;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.LinearLayout;
import com.mikepenz.materialdrawer.R;
import com.mikepenz.materialdrawer.model.interfaces.IDrawerItem;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;

/* loaded from: com.mikepenz.materialdrawer.3.1.2.jar:com/mikepenz/materialdrawer/util/DrawerItemViewHelper.class */
public class DrawerItemViewHelper {
    private Context mContext;
    private ArrayList<IDrawerItem> mDrawerItems = new ArrayList<>();
    private boolean mDivider = true;
    private OnDrawerItemClickListener mOnDrawerItemClickListener = null;

    /* loaded from: com.mikepenz.materialdrawer.3.1.2.jar:com/mikepenz/materialdrawer/util/DrawerItemViewHelper$OnDrawerItemClickListener.class */
    public interface OnDrawerItemClickListener {
        void onItemClick(View view, IDrawerItem iDrawerItem);
    }

    public DrawerItemViewHelper(Context context) {
        this.mContext = context;
    }

    public DrawerItemViewHelper withDrawerItems(ArrayList<IDrawerItem> drawerItems) {
        this.mDrawerItems = drawerItems;
        return this;
    }

    public DrawerItemViewHelper withDrawerItems(IDrawerItem... drawerItems) {
        Collections.addAll(this.mDrawerItems, drawerItems);
        return this;
    }

    public DrawerItemViewHelper withDivider(boolean divider) {
        this.mDivider = divider;
        return this;
    }

    public DrawerItemViewHelper withOnDrawerItemClickListener(OnDrawerItemClickListener onDrawerItemClickListener) {
        this.mOnDrawerItemClickListener = onDrawerItemClickListener;
        return this;
    }

    public View build() {
        LinearLayout linearLayout = new LinearLayout(this.mContext);
        linearLayout.setLayoutParams(new LinearLayout.LayoutParams(-1, -2));
        linearLayout.setOrientation(1);
        if (this.mDivider) {
            LinearLayout divider = new LinearLayout(this.mContext);
            divider.setLayoutParams(new LinearLayout.LayoutParams(-1, -2));
            divider.setMinimumHeight((int) UIUtils.convertDpToPixel(1.0f, this.mContext));
            divider.setOrientation(1);
            divider.setBackgroundColor(UIUtils.getThemeColorFromAttrOrRes(this.mContext, R.attr.material_drawer_divider, R.color.material_drawer_divider));
            linearLayout.addView(divider);
        }
        LayoutInflater layoutInflater = LayoutInflater.from(this.mContext);
        Iterator<IDrawerItem> it = this.mDrawerItems.iterator();
        while (it.hasNext()) {
            IDrawerItem next = it.next();
            View convertView = next.convertView(layoutInflater, null, linearLayout);
            convertView.setTag(next);
            if (next.isEnabled()) {
                convertView.setBackgroundResource(UIUtils.getSelectableBackground(this.mContext));
                convertView.setOnClickListener(new View.OnClickListener() { // from class: com.mikepenz.materialdrawer.util.DrawerItemViewHelper.1
                    @Override // android.view.View.OnClickListener
                    public void onClick(View v) {
                        if (DrawerItemViewHelper.this.mOnDrawerItemClickListener != null) {
                            DrawerItemViewHelper.this.mOnDrawerItemClickListener.onItemClick(v, (IDrawerItem) v.getTag());
                        }
                    }
                });
            }
            linearLayout.addView(convertView);
        }
        return linearLayout;
    }
}
