package org.ligi.axt.adapters;

import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

/* loaded from: org.ligi.AXT.0.33.jar:org/ligi/axt/adapters/SimpleStringAdapter.class */
public abstract class SimpleStringAdapter extends BaseAdapter {
    public abstract String getString(int i);

    @Override // android.widget.Adapter
    public View getView(int position, View convertView, ViewGroup parent) {
        TextView tv = new TextView(parent.getContext());
        tv.setText(getString(position));
        return tv;
    }

    @Override // android.widget.Adapter
    public int getCount() {
        return 0;
    }

    @Override // android.widget.Adapter
    public Object getItem(int position) {
        return null;
    }

    @Override // android.widget.Adapter
    public long getItemId(int position) {
        return 0L;
    }

    @Override // android.widget.BaseAdapter, android.widget.SpinnerAdapter
    public View getDropDownView(int position, View convertView, ViewGroup parent) {
        TextView tv = new TextView(parent.getContext());
        tv.setText(getString(position));
        tv.setTextSize(24.0f);
        return tv;
    }
}
