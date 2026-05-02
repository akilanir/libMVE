package org.dmfs.android.colorpicker;

import android.R;
import android.annotation.SuppressLint;
import android.os.Build;
import android.os.Bundle;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.AdapterView;
import android.widget.GridView;
import android.widget.LinearLayout;
import android.widget.ListAdapter;
import org.dmfs.android.colorpicker.palettes.AbstractPalette;
import org.dmfs.android.retentionmagic.SupportFragment;
import org.dmfs.android.retentionmagic.annotations.Retain;

/* loaded from: com.github.dmfs.color-picker.c3b3b52033dc0b33bd831e731ec6f74fb1e8a69a.jar:org/dmfs/android/colorpicker/PaletteFragment.class */
public class PaletteFragment extends SupportFragment implements AdapterView.OnItemClickListener {

    @Retain
    private AbstractPalette mPalette;
    private PaletteGridAdapter mAdapter;

    /* loaded from: com.github.dmfs.color-picker.c3b3b52033dc0b33bd831e731ec6f74fb1e8a69a.jar:org/dmfs/android/colorpicker/PaletteFragment$OnColorSelectedListener.class */
    public interface OnColorSelectedListener {
        void onColorSelected(int i, String str, String str2, String str3);
    }

    public void setPalette(AbstractPalette palette) {
        this.mPalette = palette;
    }

    public View onCreateView(final LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        super.onCreateView(inflater, container, savedInstanceState);
        final ViewGroup rootView = (ViewGroup) inflater.inflate(R.layout.org_dmfs_colorpickerdialog_palette_grid, container, false);
        final GridView gridview = (GridView) rootView.findViewById(R.id.content);
        this.mAdapter = new PaletteGridAdapter(getActivity(), this.mPalette);
        gridview.setAdapter((ListAdapter) this.mAdapter);
        gridview.setOnItemClickListener(this);
        gridview.setNumColumns(this.mAdapter.getNumColumns());
        gridview.getViewTreeObserver().addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener() { // from class: org.dmfs.android.colorpicker.PaletteFragment.1
            @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
            @SuppressLint({"NewApi"})
            public void onGlobalLayout() {
                int columnSpacing;
                int parentHeight = (rootView.getHeight() - rootView.getPaddingTop()) - rootView.getPaddingBottom();
                int parentWidth = (rootView.getWidth() - rootView.getPaddingLeft()) - rootView.getPaddingRight();
                int gridWidth = Math.min(parentWidth, parentHeight);
                if (Build.VERSION.SDK_INT >= 16) {
                    columnSpacing = gridview.getHorizontalSpacing() * (PaletteFragment.this.mAdapter.getNumColumns() - 1);
                } else {
                    DisplayMetrics metrics = inflater.getContext().getResources().getDisplayMetrics();
                    columnSpacing = Build.VERSION.SDK_INT > 10 ? ((int) TypedValue.applyDimension(1, 8.0f, metrics)) * (PaletteFragment.this.mAdapter.getNumColumns() - 1) : ((int) TypedValue.applyDimension(1, 8.0f, metrics)) * PaletteFragment.this.mAdapter.getNumColumns();
                }
                int columnWidth = (gridWidth - columnSpacing) / PaletteFragment.this.mAdapter.getNumColumns();
                int actualGridWidth = (PaletteFragment.this.mAdapter.getNumColumns() * columnWidth) + columnSpacing;
                if (actualGridWidth < gridWidth - 1) {
                    int padding = (gridWidth - actualGridWidth) / 2;
                    if (padding > 0) {
                        gridview.setPadding(padding, padding, padding, padding);
                    }
                } else {
                    gridview.setPadding(0, 0, 0, 0);
                }
                gridview.setColumnWidth(columnWidth);
                ViewGroup.LayoutParams params = gridview.getLayoutParams();
                if (params == null || params.height != gridWidth) {
                    LinearLayout.LayoutParams lparams = new LinearLayout.LayoutParams(gridWidth, gridWidth);
                    gridview.setLayoutParams(lparams);
                }
            }
        });
        return rootView;
    }

    @Override // android.widget.AdapterView.OnItemClickListener
    public void onItemClick(AdapterView<?> gridView, View View, int position, long id) {
        OnColorSelectedListener parentFragment = getParentFragment();
        if (parentFragment instanceof OnColorSelectedListener) {
            OnColorSelectedListener listener = parentFragment;
            listener.onColorSelected(this.mPalette.getColor(position), this.mPalette.getId(), this.mPalette.getColorName(position), this.mPalette.getName());
        }
    }
}
