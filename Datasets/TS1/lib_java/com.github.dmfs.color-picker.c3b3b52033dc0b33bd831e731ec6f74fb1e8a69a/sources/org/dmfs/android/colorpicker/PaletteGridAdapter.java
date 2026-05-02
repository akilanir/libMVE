package org.dmfs.android.colorpicker;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.drawable.ShapeDrawable;
import android.graphics.drawable.shapes.ArcShape;
import android.graphics.drawable.shapes.Shape;
import android.os.Build;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import org.dmfs.android.colorpicker.palettes.AbstractPalette;

/* loaded from: com.github.dmfs.color-picker.c3b3b52033dc0b33bd831e731ec6f74fb1e8a69a.jar:org/dmfs/android/colorpicker/PaletteGridAdapter.class */
public class PaletteGridAdapter extends BaseAdapter {
    private final AbstractPalette mPalette;
    private final LayoutInflater mLayoutInflater;

    public PaletteGridAdapter(Context context, AbstractPalette palette) {
        this.mPalette = palette;
        this.mLayoutInflater = (LayoutInflater) context.getSystemService("layout_inflater");
    }

    @Override // android.widget.Adapter
    public int getCount() {
        return this.mPalette.getNumberOfColors();
    }

    @Override // android.widget.Adapter
    public Object getItem(int position) {
        return Integer.valueOf(this.mPalette.getColor(position));
    }

    @Override // android.widget.Adapter
    public long getItemId(int position) {
        return position;
    }

    @Override // android.widget.Adapter
    @SuppressLint({"NewApi"})
    public View getView(int position, View convertView, ViewGroup parent) {
        View view = convertView;
        if (view == null) {
            view = this.mLayoutInflater.inflate(R.layout.org_dmfs_colorpickerdialog_palette_field, (ViewGroup) null);
        }
        Shape shape = new ArcShape(0.0f, 360.0f);
        ShapeDrawable bg = new ShapeDrawable(shape);
        bg.getPaint().setColor(this.mPalette.getColor(position));
        if (Build.VERSION.SDK_INT < 16) {
            view.setBackgroundDrawable(bg);
        } else {
            view.setBackground(bg);
        }
        return view;
    }

    public int getNumColumns() {
        return this.mPalette.getNumberOfColumns();
    }
}
