package org.ligi.axt.adapters;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.util.Vector;

/* loaded from: org.ligi.AXT.0.33.jar:org/ligi/axt/adapters/IconTextActionAdapter.class */
public class IconTextActionAdapter extends BaseAdapter {
    private Context mContext;
    private Vector<Integer> actions = new Vector<>();
    private Vector<Integer> images = new Vector<>();
    private Vector<Integer> labels = new Vector<>();
    private int containerResId = -1;
    private int textResId = -1;
    private int imageResId = -1;

    public void add(int actionid, int img_resid, Integer label_resid) {
        this.actions.add(Integer.valueOf(actionid));
        this.images.add(Integer.valueOf(img_resid));
        this.labels.add(label_resid);
    }

    public void style(int containerResId, int textResId, int imageResId) {
        this.containerResId = containerResId;
        this.textResId = textResId;
        this.imageResId = imageResId;
    }

    public IconTextActionAdapter(Context c) {
        this.mContext = c;
    }

    @Override // android.widget.Adapter
    public int getCount() {
        return this.images.size();
    }

    public int getAction(int pos) {
        return this.actions.get(pos).intValue();
    }

    @Override // android.widget.Adapter
    public Object getItem(int position) {
        return Integer.valueOf(position);
    }

    @Override // android.widget.Adapter
    public long getItemId(int position) {
        return position;
    }

    @Override // android.widget.Adapter
    public View getView(int position, View convertView, ViewGroup parent) {
        if (this.containerResId != -1) {
            LayoutInflater vi = (LayoutInflater) this.mContext.getSystemService("layout_inflater");
            View row = vi.inflate(this.containerResId, (ViewGroup) null);
            TextView label = (TextView) row.findViewById(this.textResId);
            label.setText(this.labels.get(position).intValue());
            ImageView img = (ImageView) row.findViewById(this.imageResId);
            img.setImageResource(this.images.get(position).intValue());
            return row;
        }
        LinearLayout lin = new LinearLayout(this.mContext);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(-2, -1);
        lin.setOrientation(0);
        ImageView i = new ImageView(this.mContext);
        i.setLayoutParams(lp);
        i.setImageResource(this.images.get(position).intValue());
        i.setScaleType(ImageView.ScaleType.FIT_CENTER);
        lin.addView(i);
        TextView tv = new TextView(this.mContext);
        tv.setText(this.labels.get(position).intValue());
        tv.setTextSize(5, 20.0f);
        lin.addView(tv);
        return lin;
    }
}
