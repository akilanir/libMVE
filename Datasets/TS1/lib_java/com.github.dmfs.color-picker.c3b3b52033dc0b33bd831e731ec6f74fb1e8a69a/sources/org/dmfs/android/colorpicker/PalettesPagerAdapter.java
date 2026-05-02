package org.dmfs.android.colorpicker;

import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentStatePagerAdapter;
import android.support.v4.util.LruCache;
import org.dmfs.android.colorpicker.palettes.AbstractPalette;
import org.dmfs.android.view.IDrawableTitlePagerAdapter;

/* loaded from: com.github.dmfs.color-picker.c3b3b52033dc0b33bd831e731ec6f74fb1e8a69a.jar:org/dmfs/android/colorpicker/PalettesPagerAdapter.class */
public class PalettesPagerAdapter extends FragmentStatePagerAdapter implements IDrawableTitlePagerAdapter {
    private static final int PREVIEW_SIZE = 32;
    private static final int FACTOR = 100;
    private AbstractPalette[] mPalettes;
    private final Resources mResources;
    private final float mDensity;
    private final PreviewCache mCache;

    public PalettesPagerAdapter(Resources res, FragmentManager fm, AbstractPalette... palettes) {
        super(fm);
        this.mCache = new PreviewCache(15);
        this.mPalettes = palettes;
        this.mResources = res;
        this.mDensity = res.getDisplayMetrics().density;
    }

    public Fragment getItem(int position) {
        PaletteFragment fragment = new PaletteFragment();
        fragment.setPalette(this.mPalettes[mapPosition(position)]);
        return fragment;
    }

    public int getCount() {
        if (this.mPalettes.length > 1) {
            return this.mPalettes.length * FACTOR;
        }
        return 1;
    }

    public CharSequence getPageTitle(int position) {
        return this.mPalettes[mapPosition(position)].getName();
    }

    private int mapPosition(int position) {
        return position % this.mPalettes.length;
    }

    public Drawable getDrawableTitle(int position) {
        return (Drawable) this.mCache.get(Integer.valueOf(mapPosition(position)));
    }

    /* loaded from: com.github.dmfs.color-picker.c3b3b52033dc0b33bd831e731ec6f74fb1e8a69a.jar:org/dmfs/android/colorpicker/PalettesPagerAdapter$PreviewCache.class */
    class PreviewCache extends LruCache<Integer, Drawable> {
        public PreviewCache(int maxSize) {
            super(maxSize);
        }

        /* JADX INFO: Access modifiers changed from: protected */
        public Drawable create(Integer key) {
            AbstractPalette palette = PalettesPagerAdapter.this.mPalettes[key.intValue()];
            int size = (int) (32.0f * PalettesPagerAdapter.this.mDensity);
            int cols = palette.getNumberOfColumns();
            Bitmap preview = Bitmap.createBitmap(size, size, Bitmap.Config.ARGB_8888);
            Canvas canvas = new Canvas(preview);
            float spacing = 1.2f * PalettesPagerAdapter.this.mDensity;
            float halfSpacing = spacing / 2.0f;
            float grid = (size + spacing) / cols;
            float radius = (grid - spacing) / 2.0f;
            Paint paint = new Paint();
            paint.setFlags(1);
            int k = palette.getNumberOfColors() / cols;
            for (int j = 0; j < k; j++) {
                for (int i = 0; i < cols; i++) {
                    paint.setColor(palette.getColor((j * cols) + i) | (-16777216));
                    canvas.drawCircle(((i + 0.5f) * grid) - halfSpacing, ((j + 0.5f) * grid) - halfSpacing, radius, paint);
                }
            }
            return new BitmapDrawable(PalettesPagerAdapter.this.mResources, preview);
        }
    }
}
