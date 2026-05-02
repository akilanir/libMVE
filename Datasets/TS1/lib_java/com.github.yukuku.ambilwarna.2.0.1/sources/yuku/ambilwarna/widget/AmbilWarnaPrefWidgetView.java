package yuku.ambilwarna.widget;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.util.AttributeSet;
import android.view.View;

/* loaded from: com.github.yukuku.ambilwarna.2.0.1.jar:yuku/ambilwarna/widget/AmbilWarnaPrefWidgetView.class */
public class AmbilWarnaPrefWidgetView extends View {
    Paint paint;
    float rectSize;
    float strokeWidth;

    public AmbilWarnaPrefWidgetView(Context context, AttributeSet attrs) {
        super(context, attrs);
        float density = context.getResources().getDisplayMetrics().density;
        this.rectSize = (float) Math.floor((24.0f * density) + 0.5f);
        this.strokeWidth = (float) Math.floor((1.0f * density) + 0.5f);
        this.paint = new Paint();
        this.paint.setColor(-1);
        this.paint.setStyle(Paint.Style.STROKE);
        this.paint.setStrokeWidth(this.strokeWidth);
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        canvas.drawRect(this.strokeWidth, this.strokeWidth, this.rectSize - this.strokeWidth, this.rectSize - this.strokeWidth, this.paint);
    }
}
