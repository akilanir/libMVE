package yuku.ambilwarna;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ComposeShader;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.Shader;
import android.util.AttributeSet;
import android.view.View;

/* loaded from: com.github.yukuku.ambilwarna.2.0.1.jar:yuku/ambilwarna/AmbilWarnaSquare.class */
public class AmbilWarnaSquare extends View {
    Paint paint;
    Shader luar;
    final float[] color;

    public AmbilWarnaSquare(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.color = new float[]{1.0f, 1.0f, 1.0f};
    }

    public AmbilWarnaSquare(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.color = new float[]{1.0f, 1.0f, 1.0f};
    }

    @Override // android.view.View
    @SuppressLint({"DrawAllocation"})
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (this.paint == null) {
            this.paint = new Paint();
            this.luar = new LinearGradient(0.0f, 0.0f, 0.0f, getMeasuredHeight(), -1, -16777216, Shader.TileMode.CLAMP);
        }
        int rgb = Color.HSVToColor(this.color);
        Shader dalam = new LinearGradient(0.0f, 0.0f, getMeasuredWidth(), 0.0f, -1, rgb, Shader.TileMode.CLAMP);
        ComposeShader shader = new ComposeShader(this.luar, dalam, PorterDuff.Mode.MULTIPLY);
        this.paint.setShader(shader);
        canvas.drawRect(0.0f, 0.0f, getMeasuredWidth(), getMeasuredHeight(), this.paint);
    }

    void setHue(float hue) {
        this.color[0] = hue;
        invalidate();
    }
}
