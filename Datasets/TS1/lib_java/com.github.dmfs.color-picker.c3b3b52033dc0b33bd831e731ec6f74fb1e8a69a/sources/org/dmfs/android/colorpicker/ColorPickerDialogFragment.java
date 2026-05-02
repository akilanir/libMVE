package org.dmfs.android.colorpicker;

import android.R;
import android.app.Dialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import org.dmfs.android.colorpicker.PaletteFragment;
import org.dmfs.android.colorpicker.palettes.AbstractPalette;
import org.dmfs.android.retentionmagic.SupportDialogFragment;
import org.dmfs.android.retentionmagic.annotations.Retain;
import org.dmfs.android.view.ViewPager;

/* loaded from: com.github.dmfs.color-picker.c3b3b52033dc0b33bd831e731ec6f74fb1e8a69a.jar:org/dmfs/android/colorpicker/ColorPickerDialogFragment.class */
public class ColorPickerDialogFragment extends SupportDialogFragment implements PaletteFragment.OnColorSelectedListener {
    private ViewPager mPager;
    private TextView mTitleView;
    private PalettesPagerAdapter mPagerAdapter;

    @Retain
    private AbstractPalette[] mPalettes;

    @Retain
    private CharSequence mTitle = null;

    @Retain
    private int mTitleId = 0;
    private int mSelected = 0;

    /* loaded from: com.github.dmfs.color-picker.c3b3b52033dc0b33bd831e731ec6f74fb1e8a69a.jar:org/dmfs/android/colorpicker/ColorPickerDialogFragment$ColorDialogResultListener.class */
    public interface ColorDialogResultListener {
        void onColorChanged(int i, String str, String str2, String str3);

        void onColorDialogCancelled();
    }

    public void setPalettes(AbstractPalette... palettes) {
        this.mPalettes = palettes;
    }

    public void selectPaletteId(String id) {
        if (this.mPalettes == null || id == null) {
            return;
        }
        int index = 0;
        AbstractPalette[] arr$ = this.mPalettes;
        for (AbstractPalette palette : arr$) {
            if (TextUtils.equals(id, palette.getId())) {
                this.mSelected = index;
                if (this.mPager != null && this.mPagerAdapter != null) {
                    this.mPager.setCurrentItem((this.mPagerAdapter.getCount() / 2) + this.mSelected);
                    return;
                }
                return;
            }
            index++;
        }
    }

    public void setTitle(CharSequence title) {
        this.mTitle = title;
        if (this.mTitleView != null) {
            this.mTitleView.setText(title);
        }
    }

    public void setTitle(int title) {
        this.mTitleId = title;
        if (this.mTitleView != null) {
            this.mTitleView.setText(title);
        }
    }

    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.org_dmfs_colorpickerdialog_fragment, container);
        this.mPager = view.findViewById(R.id.pager);
        this.mPagerAdapter = new PalettesPagerAdapter(getResources(), getChildFragmentManager(), this.mPalettes);
        this.mPagerAdapter.notifyDataSetChanged();
        this.mPager.setAdapter(this.mPagerAdapter);
        this.mPager.setCurrentItem((this.mPagerAdapter.getCount() / 2) + this.mSelected);
        this.mTitleView = (TextView) view.findViewById(R.id.title);
        if (this.mTitleId != 0) {
            this.mTitleView.setText(this.mTitleId);
        } else if (this.mTitle != null) {
            this.mTitleView.setText(this.mTitle);
        }
        return view;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public Dialog onCreateDialog(Bundle savedInstanceState) {
        Dialog result = super.onCreateDialog(savedInstanceState);
        result.requestWindowFeature(1);
        result.setOnCancelListener(this);
        return result;
    }

    @Override // org.dmfs.android.colorpicker.PaletteFragment.OnColorSelectedListener
    public void onColorSelected(int color, String paletteId, String colorName, String paletteName) {
        ColorDialogResultListener listener = getListener();
        if (listener != null) {
            listener.onColorChanged(color, paletteId, colorName, paletteName);
        }
        dismiss();
    }

    public void onCancel(DialogInterface dialog) {
        ColorDialogResultListener listener = getListener();
        if (listener != null) {
            listener.onColorDialogCancelled();
        }
    }

    private ColorDialogResultListener getListener() {
        ColorDialogResultListener listener = null;
        ColorDialogResultListener parentFragment = getParentFragment();
        ColorDialogResultListener activity = getActivity();
        if (parentFragment instanceof ColorDialogResultListener) {
            listener = parentFragment;
        } else if (activity instanceof ColorDialogResultListener) {
            listener = activity;
        }
        return listener;
    }
}
