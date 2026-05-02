package com.larvalabs.svgandroid;

import android.content.res.AssetManager;
import android.content.res.Resources;
import android.graphics.ColorFilter;
import android.util.Log;
import com.larvalabs.svgandroid.SVGParser;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import org.xml.sax.InputSource;

/* loaded from: svg-android-2.0.0.jar:com/larvalabs/svgandroid/SVGBuilder.class */
public class SVGBuilder {
    private InputStream data;
    private Integer searchColor = null;
    private Integer replaceColor = null;
    private ColorFilter strokeColorFilter = null;
    private ColorFilter fillColorFilter = null;
    private boolean whiteMode = false;
    private boolean closeInputStream = true;

    public SVGBuilder readFromInputStream(InputStream svgData) {
        this.data = svgData;
        return this;
    }

    public SVGBuilder readFromString(String svgData) {
        this.data = new ByteArrayInputStream(svgData.getBytes());
        return this;
    }

    public SVGBuilder readFromResource(Resources resources, int resId) {
        this.data = resources.openRawResource(resId);
        return this;
    }

    public SVGBuilder readFromAsset(AssetManager assetMngr, String svgPath) throws IOException {
        this.data = assetMngr.open(svgPath);
        return this;
    }

    public SVGBuilder clearColorSwap() {
        this.replaceColor = null;
        this.searchColor = null;
        return this;
    }

    public SVGBuilder setColorSwap(int searchColor, int replaceColor) {
        this.searchColor = Integer.valueOf(searchColor);
        this.replaceColor = Integer.valueOf(replaceColor);
        return this;
    }

    public SVGBuilder setWhiteMode(boolean whiteMode) {
        this.whiteMode = whiteMode;
        return this;
    }

    public SVGBuilder setColorFilter(ColorFilter colorFilter) {
        this.fillColorFilter = colorFilter;
        this.strokeColorFilter = colorFilter;
        return this;
    }

    public SVGBuilder setStrokeColorFilter(ColorFilter colorFilter) {
        this.strokeColorFilter = colorFilter;
        return this;
    }

    public SVGBuilder setFillColorFilter(ColorFilter colorFilter) {
        this.fillColorFilter = colorFilter;
        return this;
    }

    public SVGBuilder setCloseInputStreamWhenDone(boolean closeInputStream) {
        this.closeInputStream = closeInputStream;
        return this;
    }

    public SVG build() throws SVGParseException {
        if (this.data == null) {
            throw new IllegalStateException("SVG input not specified. Call one of the readFrom...() methods first.");
        }
        try {
            SVGParser.SVGHandler handler = new SVGParser.SVGHandler();
            handler.setColorSwap(this.searchColor, this.replaceColor);
            handler.setWhiteMode(this.whiteMode);
            if (this.strokeColorFilter != null) {
                handler.strokePaint.setColorFilter(this.strokeColorFilter);
            }
            if (this.fillColorFilter != null) {
                handler.fillPaint.setColorFilter(this.fillColorFilter);
            }
            SVG svg = SVGParser.parse(new InputSource(this.data), handler);
            if (this.closeInputStream) {
                try {
                    this.data.close();
                } catch (IOException e) {
                    Log.e("SVGAndroid", "Error closing SVG input stream.", e);
                }
            }
            return svg;
        } catch (Throwable th) {
            if (this.closeInputStream) {
                try {
                    this.data.close();
                } catch (IOException e2) {
                    Log.e("SVGAndroid", "Error closing SVG input stream.", e2);
                }
            }
            throw th;
        }
    }
}
