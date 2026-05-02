package com.afollestad.materialdialogs.simplelist;

import android.content.Context;
import android.graphics.PorterDuff;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;
import com.afollestad.materialdialogs.MaterialDialog;
import com.afollestad.materialdialogs.commons.R;
import com.afollestad.materialdialogs.internal.MDAdapter;

/* loaded from: com.github.afollestad.material-dialogs.commons.0.8.5.4.jar:com/afollestad/materialdialogs/simplelist/MaterialSimpleListAdapter.class */
public class MaterialSimpleListAdapter extends ArrayAdapter<MaterialSimpleListItem> implements MDAdapter {
    private MaterialDialog dialog;

    public MaterialSimpleListAdapter(Context context) {
        super(context, R.layout.md_simplelist_item, android.R.id.title);
    }

    public void setDialog(MaterialDialog dialog) {
        this.dialog = dialog;
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
                ic.setPadding(item.getIconPadding(), item.getIconPadding(), item.getIconPadding(), item.getIconPadding());
                ic.getBackground().setColorFilter(item.getBackgroundColor(), PorterDuff.Mode.SRC_ATOP);
            } else {
                ic.setVisibility(8);
            }
            TextView tv = (TextView) view.findViewById(android.R.id.title);
            tv.setTextColor(this.dialog.getBuilder().getItemColor());
            tv.setText(item.getContent());
            this.dialog.setTypeface(tv, this.dialog.getBuilder().getRegularFont());
        }
        return view;
    }
}
