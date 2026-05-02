package uz.shift.colorpicker;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;

/* loaded from: com.github.DASAR.ShiftColorPicker.v0.5.jar:uz/shift/colorpicker/LineColorPicker.class */
public class LineColorPicker extends View {
    public static final int HORIZONTAL = 0;
    public static final int VERTICAL = 1;
    int[] colors;
    private Paint paint;
    private Rect rect;
    boolean isColorSelected;
    private int selectedColor;
    private OnColorChangedListener onColorChanged;
    private int cellSize;
    private int mOrientation;
    private boolean isClick;
    private int screenW;
    private int screenH;

    public LineColorPicker(Context context, AttributeSet attrs) {
        int colorsArrayResId;
        super(context, attrs);
        if (isInEditMode()) {
            this.colors = Palette.DEFAULT;
        } else {
            this.colors = new int[1];
        }
        this.rect = new Rect();
        this.isColorSelected = false;
        this.selectedColor = this.colors[0];
        this.mOrientation = 0;
        this.isClick = false;
        this.paint = new Paint();
        this.paint.setStyle(Paint.Style.FILL);
        TypedArray a = context.getTheme().obtainStyledAttributes(attrs, R.styleable.LineColorPicker, 0, 0);
        try {
            this.mOrientation = a.getInteger(R.styleable.LineColorPicker_orientation, 0);
            if (!isInEditMode() && (colorsArrayResId = a.getResourceId(R.styleable.LineColorPicker_colors, -1)) > 0) {
                int[] colors = context.getResources().getIntArray(colorsArrayResId);
                setColors(colors);
            }
            int selected = a.getInteger(R.styleable.LineColorPicker_selectedColorIndex, -1);
            if (selected != -1) {
                int[] currentColors = getColors();
                int currentColorsLength = currentColors != null ? currentColors.length : 0;
                if (selected < currentColorsLength) {
                    setSelectedColorPosition(selected);
                }
            }
        } finally {
            a.recycle();
        }
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (this.mOrientation == 0) {
            drawHorizontalPicker(canvas);
        } else {
            drawVerticalPicker(canvas);
        }
    }

    private void drawVerticalPicker(Canvas canvas) {
        this.rect.left = 0;
        this.rect.top = 0;
        this.rect.right = canvas.getWidth();
        this.rect.bottom = 0;
        int margin = Math.round(canvas.getWidth() * 0.08f);
        for (int i = 0; i < this.colors.length; i++) {
            this.paint.setColor(this.colors[i]);
            this.rect.top = this.rect.bottom;
            this.rect.bottom += this.cellSize;
            if (this.isColorSelected && this.colors[i] == this.selectedColor) {
                this.rect.left = 0;
                this.rect.right = canvas.getWidth();
            } else {
                this.rect.left = margin;
                this.rect.right = canvas.getWidth() - margin;
            }
            canvas.drawRect(this.rect, this.paint);
        }
    }

    private void drawHorizontalPicker(Canvas canvas) {
        this.rect.left = 0;
        this.rect.top = 0;
        this.rect.right = 0;
        this.rect.bottom = canvas.getHeight();
        int margin = Math.round(canvas.getHeight() * 0.08f);
        for (int i = 0; i < this.colors.length; i++) {
            this.paint.setColor(this.colors[i]);
            this.rect.left = this.rect.right;
            this.rect.right += this.cellSize;
            if (this.isColorSelected && this.colors[i] == this.selectedColor) {
                this.rect.top = 0;
                this.rect.bottom = canvas.getHeight();
            } else {
                this.rect.top = margin;
                this.rect.bottom = canvas.getHeight() - margin;
            }
            canvas.drawRect(this.rect, this.paint);
        }
    }

    private void onColorChanged(int color) {
        if (this.onColorChanged != null) {
            this.onColorChanged.onColorChanged(color);
        }
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent event) {
        int actionId = event.getAction();
        switch (actionId) {
            case 0:
                this.isClick = true;
                break;
            case 1:
                int newColor = getColorAtXY(event.getX(), event.getY());
                setSelectedColor(newColor);
                if (this.isClick) {
                    performClick();
                    break;
                }
                break;
            case 2:
                int newColor2 = getColorAtXY(event.getX(), event.getY());
                setSelectedColor(newColor2);
                break;
            case 3:
                this.isClick = false;
                break;
            case 4:
                this.isClick = false;
                break;
        }
        return true;
    }

    private int getColorAtXY(float x, float y) {
        if (this.mOrientation == 0) {
            int right = 0;
            for (int i = 0; i < this.colors.length; i++) {
                int left = right;
                right += this.cellSize;
                if (left <= x && right >= x) {
                    return this.colors[i];
                }
            }
        } else {
            int bottom = 0;
            for (int i2 = 0; i2 < this.colors.length; i2++) {
                int top = bottom;
                bottom += this.cellSize;
                if (y >= top && y <= bottom) {
                    return this.colors[i2];
                }
            }
        }
        return this.selectedColor;
    }

    @Override // android.view.View
    protected Parcelable onSaveInstanceState() {
        Parcelable superState = super.onSaveInstanceState();
        SavedState ss = new SavedState(superState);
        ss.selectedColor = this.selectedColor;
        ss.isColorSelected = this.isColorSelected;
        return ss;
    }

    @Override // android.view.View
    protected void onRestoreInstanceState(Parcelable state) {
        if (!(state instanceof SavedState)) {
            super.onRestoreInstanceState(state);
            return;
        }
        SavedState ss = (SavedState) state;
        super.onRestoreInstanceState(ss.getSuperState());
        this.selectedColor = ss.selectedColor;
        this.isColorSelected = ss.isColorSelected;
    }

    /* loaded from: com.github.DASAR.ShiftColorPicker.v0.5.jar:uz/shift/colorpicker/LineColorPicker$SavedState.class */
    static class SavedState extends View.BaseSavedState {
        int selectedColor;
        boolean isColorSelected;
        public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator<SavedState>() { // from class: uz.shift.colorpicker.LineColorPicker.SavedState.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public SavedState createFromParcel(Parcel in) {
                return new SavedState(in);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public SavedState[] newArray(int size) {
                return new SavedState[size];
            }
        };

        SavedState(Parcelable superState) {
            super(superState);
        }

        private SavedState(Parcel in) {
            super(in);
            this.selectedColor = in.readInt();
            this.isColorSelected = in.readInt() == 1;
        }

        @Override // android.view.View.BaseSavedState, android.view.AbsSavedState, android.os.Parcelable
        public void writeToParcel(Parcel out, int flags) {
            super.writeToParcel(out, flags);
            out.writeInt(this.selectedColor);
            out.writeInt(this.isColorSelected ? 1 : 0);
        }
    }

    @Override // android.view.View
    public boolean performClick() {
        return super.performClick();
    }

    @Override // android.view.View
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        this.screenW = w;
        this.screenH = h;
        recalcCellSize();
        super.onSizeChanged(w, h, oldw, oldh);
    }

    public int getColor() {
        return this.selectedColor;
    }

    public void setSelectedColor(int color) {
        if (!containsColor(this.colors, color)) {
            return;
        }
        if (!this.isColorSelected || this.selectedColor != color) {
            this.selectedColor = color;
            this.isColorSelected = true;
            invalidate();
            onColorChanged(color);
        }
    }

    public void setSelectedColorPosition(int position) {
        setSelectedColor(this.colors[position]);
    }

    public void setColors(int[] colors) {
        this.colors = colors;
        if (!containsColor(colors, this.selectedColor)) {
            this.selectedColor = colors[0];
        }
        recalcCellSize();
        invalidate();
    }

    private int recalcCellSize() {
        if (this.mOrientation == 0) {
            this.cellSize = Math.round(this.screenW / (this.colors.length * 1.0f));
        } else {
            this.cellSize = Math.round(this.screenH / (this.colors.length * 1.0f));
        }
        return this.cellSize;
    }

    public int[] getColors() {
        return this.colors;
    }

    private boolean containsColor(int[] colors, int c) {
        for (int i : colors) {
            if (i == c) {
                return true;
            }
        }
        return false;
    }

    public void setOnColorChangedListener(OnColorChangedListener l) {
        this.onColorChanged = l;
    }
}
