package org.dmfs.android.colorpicker;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import org.dmfs.android.colorpicker.ColorPickerDialogFragment;
import org.dmfs.android.colorpicker.palettes.AbstractPalette;
import org.dmfs.android.colorpicker.palettes.ArrayPalette;
import org.dmfs.android.colorpicker.palettes.ColorFactory;
import org.dmfs.android.colorpicker.palettes.FactoryPalette;
import org.dmfs.android.retentionmagic.FragmentActivity;
import org.dmfs.android.retentionmagic.annotations.Retain;

/* loaded from: com.github.dmfs.color-picker.c3b3b52033dc0b33bd831e731ec6f74fb1e8a69a.jar:org/dmfs/android/colorpicker/ColorPickerActivity.class */
public class ColorPickerActivity extends FragmentActivity implements ColorPickerDialogFragment.ColorDialogResultListener {
    public static final String ACTION_PICK_COLOR = "org.openintents.action.PICK_COLOR";
    public static final String EXTRA_COLOR = "org.openintents.extra.COLOR";

    @Retain(classNS = "ColorPickerActivity", key = "palette", permanent = true)
    private String mPaletteId = null;
    private static final int[] MATERIAL_COLORS_PRIMARY = {-1499549, -769226, -43230, -26624, -16121, -5317, -3285959, -7617718, -11751600, -16738680, -16728876, -16537100, -14575885, -12627531, -10011977, -6543440};
    private static final int[] MATERIAL_COLORS_DARK = {-5434281, -3790808, -2604267, -1086464, -28928, -415707, -6382300, -11171025, -13730510, -16750244, -16743537, -16615491, -15374912, -14142061, -12245088, -9823334};
    private static final AbstractPalette[] PALETTES = {new ArrayPalette("material_primary", "Material Colors", MATERIAL_COLORS_PRIMARY), new ArrayPalette("material_secondary", "Dark Material Colors", MATERIAL_COLORS_DARK), new FactoryPalette("red", "Red", new ColorFactory.CombinedColorFactory(new ColorFactory.ColorShadeFactory(340.0f), ColorFactory.RED), 16), new FactoryPalette("orange", "Orange", new ColorFactory.CombinedColorFactory(new ColorFactory.ColorShadeFactory(18.0f), ColorFactory.ORANGE), 16), new FactoryPalette("yellow", "Yellow", new ColorFactory.CombinedColorFactory(new ColorFactory.ColorShadeFactory(53.0f), ColorFactory.YELLOW), 16), new FactoryPalette("green", "Green", new ColorFactory.CombinedColorFactory(new ColorFactory.ColorShadeFactory(80.0f), ColorFactory.GREEN), 16), new FactoryPalette("cyan", "Cyan", new ColorFactory.CombinedColorFactory(new ColorFactory.ColorShadeFactory(150.0f), ColorFactory.CYAN), 16), new FactoryPalette("blue", "Blue", new ColorFactory.CombinedColorFactory(new ColorFactory.ColorShadeFactory(210.0f), ColorFactory.BLUE), 16), new FactoryPalette("purple", "Purple", new ColorFactory.CombinedColorFactory(new ColorFactory.ColorShadeFactory(265.0f), ColorFactory.PURPLE), 16), new FactoryPalette("pink", "Pink", new ColorFactory.CombinedColorFactory(new ColorFactory.ColorShadeFactory(300.0f), ColorFactory.PINK), 16), new FactoryPalette("grey", "Grey", ColorFactory.GREY, 16), new FactoryPalette("pastel", "Pastel", ColorFactory.PASTEL, 16), new FactoryPalette("rainbow", "Rainbow", ColorFactory.RAINBOW, 16), new FactoryPalette("dark_rainbow", "Dark Rainbow", new ColorFactory.RainbowColorFactory(0.5f, 0.5f), 16)};

    public static void start(Activity context, int requestCode) {
        Intent intent = new Intent(ACTION_PICK_COLOR);
        context.startActivityForResult(intent, requestCode);
    }

    public static Integer getColor(Intent result) {
        if (result == null || !result.hasExtra(EXTRA_COLOR)) {
            return null;
        }
        return Integer.valueOf(result.getIntExtra(EXTRA_COLOR, 0));
    }

    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        showColorPickerDialog();
    }

    private void showColorPickerDialog() {
        ColorPickerDialogFragment d = new ColorPickerDialogFragment();
        d.setPalettes(PALETTES);
        d.setTitle(R.string.org_dmfs_colorpicker_pick_a_color);
        d.selectPaletteId(this.mPaletteId);
        d.show(getSupportFragmentManager(), "");
    }

    @Override // org.dmfs.android.colorpicker.ColorPickerDialogFragment.ColorDialogResultListener
    public void onColorChanged(int color, String paletteId, String colorName, String paletteName) {
        this.mPaletteId = paletteId;
        Intent intent = getIntent();
        intent.putExtra(EXTRA_COLOR, color);
        setResult(-1, intent);
        finish();
    }

    @Override // org.dmfs.android.colorpicker.ColorPickerDialogFragment.ColorDialogResultListener
    public void onColorDialogCancelled() {
        setResult(0);
        finish();
    }
}
