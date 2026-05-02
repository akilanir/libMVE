.class public Lcom/afollestad/materialdialogs/internal/MDTintHelper;
.super Ljava/lang/Object;
.source "MDTintHelper.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static createEditTextColorStateList(Landroid/content/Context;I)Landroid/content/res/ColorStateList;
    .registers 8
    .param p0, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    const/4 v3, 0x3

    const/4 v5, 0x0

    .line 98
    new-array v2, v3, [[I

    .line 99
    .local v2, "states":[[I
    new-array v0, v3, [I

    .line 100
    .local v0, "colors":[I
    const/4 v1, 0x0

    .line 101
    .local v1, "i":I
    const/4 v3, 0x1

    new-array v3, v3, [I

    const v4, -0x101009e

    aput v4, v3, v5

    aput-object v3, v2, v1

    .line 102
    sget v3, Lcom/afollestad/materialdialogs/R$attr;->colorControlNormal:I

    invoke-static {p0, v3}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveColor(Landroid/content/Context;I)I

    move-result v3

    aput v3, v0, v1

    .line 103
    add-int/lit8 v1, v1, 0x1

    .line 104
    const/4 v3, 0x2

    new-array v3, v3, [I

    fill-array-data v3, :array_3a

    aput-object v3, v2, v1

    .line 105
    sget v3, Lcom/afollestad/materialdialogs/R$attr;->colorControlNormal:I

    invoke-static {p0, v3}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveColor(Landroid/content/Context;I)I

    move-result v3

    aput v3, v0, v1

    .line 106
    add-int/lit8 v1, v1, 0x1

    .line 107
    new-array v3, v5, [I

    aput-object v3, v2, v1

    .line 108
    aput p1, v0, v1

    .line 109
    new-instance v3, Landroid/content/res/ColorStateList;

    invoke-direct {v3, v2, v0}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    return-object v3

    .line 104
    nop

    :array_3a
    .array-data 4
        -0x10100a7
        -0x101009c
    .end array-data
.end method

.method private static setCursorTint(Landroid/widget/EditText;I)V
    .registers 12
    .param p0, "editText"    # Landroid/widget/EditText;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 142
    :try_start_0
    const-class v8, Landroid/widget/TextView;

    const-string v9, "mCursorDrawableRes"

    invoke-virtual {v8, v9}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v5

    .line 143
    .local v5, "fCursorDrawableRes":Ljava/lang/reflect/Field;
    const/4 v8, 0x1

    invoke-virtual {v5, v8}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 144
    invoke-virtual {v5, p0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v7

    .line 145
    .local v7, "mCursorDrawableRes":I
    const-class v8, Landroid/widget/TextView;

    const-string v9, "mEditor"

    invoke-virtual {v8, v9}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v6

    .line 146
    .local v6, "fEditor":Ljava/lang/reflect/Field;
    const/4 v8, 0x1

    invoke-virtual {v6, v8}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 147
    invoke-virtual {v6, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 148
    .local v3, "editor":Ljava/lang/Object;
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 149
    .local v0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v8, "mCursorDrawable"

    invoke-virtual {v0, v8}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    .line 150
    .local v4, "fCursorDrawable":Ljava/lang/reflect/Field;
    const/4 v8, 0x1

    invoke-virtual {v4, v8}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 151
    const/4 v8, 0x2

    new-array v1, v8, [Landroid/graphics/drawable/Drawable;

    .line 152
    .local v1, "drawables":[Landroid/graphics/drawable/Drawable;
    const/4 v8, 0x0

    invoke-virtual {p0}, Landroid/widget/EditText;->getContext()Landroid/content/Context;

    move-result-object v9

    invoke-static {v9, v7}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v9

    aput-object v9, v1, v8

    .line 153
    const/4 v8, 0x1

    invoke-virtual {p0}, Landroid/widget/EditText;->getContext()Landroid/content/Context;

    move-result-object v9

    invoke-static {v9, v7}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v9

    aput-object v9, v1, v8

    .line 154
    const/4 v8, 0x0

    aget-object v8, v1, v8

    sget-object v9, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v8, p1, v9}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 155
    const/4 v8, 0x1

    aget-object v8, v1, v8

    sget-object v9, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v8, p1, v9}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 156
    invoke-virtual {v4, v3, v1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_5a
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_5a} :catch_5b

    .line 160
    .end local v0    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "drawables":[Landroid/graphics/drawable/Drawable;
    .end local v3    # "editor":Ljava/lang/Object;
    .end local v4    # "fCursorDrawable":Ljava/lang/reflect/Field;
    .end local v5    # "fCursorDrawableRes":Ljava/lang/reflect/Field;
    .end local v6    # "fEditor":Ljava/lang/reflect/Field;
    .end local v7    # "mCursorDrawableRes":I
    :goto_5a
    return-void

    .line 157
    :catch_5b
    move-exception v2

    .line 158
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_5a
.end method

.method public static setTint(Landroid/widget/CheckBox;I)V
    .registers 11
    .param p0, "box"    # Landroid/widget/CheckBox;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    const/4 v6, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 123
    new-instance v2, Landroid/content/res/ColorStateList;

    new-array v3, v6, [[I

    new-array v4, v8, [I

    const v5, -0x10100a0

    aput v5, v4, v7

    aput-object v4, v3, v7

    new-array v4, v8, [I

    const v5, 0x10100a0

    aput v5, v4, v7

    aput-object v4, v3, v8

    new-array v4, v6, [I

    invoke-virtual {p0}, Landroid/widget/CheckBox;->getContext()Landroid/content/Context;

    move-result-object v5

    sget v6, Lcom/afollestad/materialdialogs/R$attr;->colorControlNormal:I

    invoke-static {v5, v6}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveColor(Landroid/content/Context;I)I

    move-result v5

    aput v5, v4, v7

    aput p1, v4, v8

    invoke-direct {v2, v3, v4}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    .line 130
    .local v2, "sl":Landroid/content/res/ColorStateList;
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x15

    if-lt v3, v4, :cond_36

    .line 131
    invoke-virtual {p0, v2}, Landroid/widget/CheckBox;->setButtonTintList(Landroid/content/res/ColorStateList;)V

    .line 138
    :goto_35
    return-void

    .line 133
    :cond_36
    invoke-virtual {p0}, Landroid/widget/CheckBox;->getContext()Landroid/content/Context;

    move-result-object v3

    sget v4, Lcom/afollestad/materialdialogs/R$drawable;->abc_btn_check_material:I

    invoke-static {v3, v4}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 134
    .local v0, "checkDrawable":Landroid/graphics/drawable/Drawable;
    invoke-static {v0}, Landroid/support/v4/graphics/drawable/DrawableCompat;->wrap(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 135
    .local v1, "drawable":Landroid/graphics/drawable/Drawable;
    invoke-static {v1, v2}, Landroid/support/v4/graphics/drawable/DrawableCompat;->setTintList(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    .line 136
    invoke-virtual {p0, v1}, Landroid/widget/CheckBox;->setButtonDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_35
.end method

.method public static setTint(Landroid/widget/EditText;I)V
    .registers 5
    .param p0, "editText"    # Landroid/widget/EditText;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 113
    invoke-virtual {p0}, Landroid/widget/EditText;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, p1}, Lcom/afollestad/materialdialogs/internal/MDTintHelper;->createEditTextColorStateList(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v0

    .line 114
    .local v0, "editTextColorStateList":Landroid/content/res/ColorStateList;
    instance-of v1, p0, Landroid/support/v7/widget/AppCompatEditText;

    if-eqz v1, :cond_16

    move-object v1, p0

    .line 115
    check-cast v1, Landroid/support/v7/widget/AppCompatEditText;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/AppCompatEditText;->setSupportBackgroundTintList(Landroid/content/res/ColorStateList;)V

    .line 119
    :cond_12
    :goto_12
    invoke-static {p0, p1}, Lcom/afollestad/materialdialogs/internal/MDTintHelper;->setCursorTint(Landroid/widget/EditText;I)V

    .line 120
    return-void

    .line 116
    :cond_16
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v1, v2, :cond_12

    .line 117
    invoke-virtual {p0, v0}, Landroid/widget/EditText;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    goto :goto_12
.end method

.method public static setTint(Landroid/widget/ProgressBar;I)V
    .registers 3
    .param p0, "progressBar"    # Landroid/widget/ProgressBar;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 75
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/afollestad/materialdialogs/internal/MDTintHelper;->setTint(Landroid/widget/ProgressBar;IZ)V

    .line 76
    return-void
.end method

.method public static setTint(Landroid/widget/ProgressBar;IZ)V
    .registers 7
    .param p0, "progressBar"    # Landroid/widget/ProgressBar;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param
    .param p2, "skipIndeterminate"    # Z

    .prologue
    .line 79
    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    .line 80
    .local v1, "sl":Landroid/content/res/ColorStateList;
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x15

    if-lt v2, v3, :cond_16

    .line 81
    invoke-virtual {p0, v1}, Landroid/widget/ProgressBar;->setProgressTintList(Landroid/content/res/ColorStateList;)V

    .line 82
    invoke-virtual {p0, v1}, Landroid/widget/ProgressBar;->setSecondaryProgressTintList(Landroid/content/res/ColorStateList;)V

    .line 83
    if-nez p2, :cond_15

    .line 84
    invoke-virtual {p0, v1}, Landroid/widget/ProgressBar;->setIndeterminateTintList(Landroid/content/res/ColorStateList;)V

    .line 95
    :cond_15
    :goto_15
    return-void

    .line 86
    :cond_16
    sget-object v0, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    .line 87
    .local v0, "mode":Landroid/graphics/PorterDuff$Mode;
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xa

    if-gt v2, v3, :cond_20

    .line 88
    sget-object v0, Landroid/graphics/PorterDuff$Mode;->MULTIPLY:Landroid/graphics/PorterDuff$Mode;

    .line 90
    :cond_20
    if-nez p2, :cond_2f

    invoke-virtual {p0}, Landroid/widget/ProgressBar;->getIndeterminateDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    if-eqz v2, :cond_2f

    .line 91
    invoke-virtual {p0}, Landroid/widget/ProgressBar;->getIndeterminateDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v2, p1, v0}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 92
    :cond_2f
    invoke-virtual {p0}, Landroid/widget/ProgressBar;->getProgressDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    if-eqz v2, :cond_15

    .line 93
    invoke-virtual {p0}, Landroid/widget/ProgressBar;->getProgressDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v2, p1, v0}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    goto :goto_15
.end method

.method public static setTint(Landroid/widget/RadioButton;I)V
    .registers 11
    .param p0, "radioButton"    # Landroid/widget/RadioButton;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    const/4 v6, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 31
    new-instance v2, Landroid/content/res/ColorStateList;

    new-array v3, v6, [[I

    new-array v4, v8, [I

    const v5, -0x10100a0

    aput v5, v4, v7

    aput-object v4, v3, v7

    new-array v4, v8, [I

    const v5, 0x10100a0

    aput v5, v4, v7

    aput-object v4, v3, v8

    new-array v4, v6, [I

    invoke-virtual {p0}, Landroid/widget/RadioButton;->getContext()Landroid/content/Context;

    move-result-object v5

    sget v6, Lcom/afollestad/materialdialogs/R$attr;->colorControlNormal:I

    invoke-static {v5, v6}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveColor(Landroid/content/Context;I)I

    move-result v5

    aput v5, v4, v7

    aput p1, v4, v8

    invoke-direct {v2, v3, v4}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    .line 38
    .local v2, "sl":Landroid/content/res/ColorStateList;
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x15

    if-lt v3, v4, :cond_36

    .line 39
    invoke-virtual {p0, v2}, Landroid/widget/RadioButton;->setButtonTintList(Landroid/content/res/ColorStateList;)V

    .line 46
    :goto_35
    return-void

    .line 41
    :cond_36
    invoke-virtual {p0}, Landroid/widget/RadioButton;->getContext()Landroid/content/Context;

    move-result-object v3

    sget v4, Lcom/afollestad/materialdialogs/R$drawable;->abc_btn_radio_material:I

    invoke-static {v3, v4}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 42
    .local v1, "radioDrawable":Landroid/graphics/drawable/Drawable;
    invoke-static {v1}, Landroid/support/v4/graphics/drawable/DrawableCompat;->wrap(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 43
    .local v0, "d":Landroid/graphics/drawable/Drawable;
    invoke-static {v0, v2}, Landroid/support/v4/graphics/drawable/DrawableCompat;->setTintList(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    .line 44
    invoke-virtual {p0, v0}, Landroid/widget/RadioButton;->setButtonDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_35
.end method

.method public static setTint(Landroid/widget/SeekBar;I)V
    .registers 9
    .param p0, "seekBar"    # Landroid/widget/SeekBar;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    const/16 v6, 0xa

    .line 49
    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v2

    .line 50
    .local v2, "s1":Landroid/content/res/ColorStateList;
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x15

    if-lt v4, v5, :cond_13

    .line 51
    invoke-virtual {p0, v2}, Landroid/widget/SeekBar;->setThumbTintList(Landroid/content/res/ColorStateList;)V

    .line 52
    invoke-virtual {p0, v2}, Landroid/widget/SeekBar;->setProgressTintList(Landroid/content/res/ColorStateList;)V

    .line 72
    :cond_12
    :goto_12
    return-void

    .line 53
    :cond_13
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    if-le v4, v6, :cond_3a

    .line 54
    invoke-virtual {p0}, Landroid/widget/SeekBar;->getProgressDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-static {v4}, Landroid/support/v4/graphics/drawable/DrawableCompat;->wrap(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 55
    .local v1, "progressDrawable":Landroid/graphics/drawable/Drawable;
    invoke-virtual {p0, v1}, Landroid/widget/SeekBar;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 56
    invoke-static {v1, v2}, Landroid/support/v4/graphics/drawable/DrawableCompat;->setTintList(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    .line 57
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x10

    if-lt v4, v5, :cond_12

    .line 58
    invoke-virtual {p0}, Landroid/widget/SeekBar;->getThumb()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-static {v4}, Landroid/support/v4/graphics/drawable/DrawableCompat;->wrap(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 59
    .local v3, "thumbDrawable":Landroid/graphics/drawable/Drawable;
    invoke-static {v3, v2}, Landroid/support/v4/graphics/drawable/DrawableCompat;->setTintList(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    .line 60
    invoke-virtual {p0, v3}, Landroid/widget/SeekBar;->setThumb(Landroid/graphics/drawable/Drawable;)V

    goto :goto_12

    .line 63
    .end local v1    # "progressDrawable":Landroid/graphics/drawable/Drawable;
    .end local v3    # "thumbDrawable":Landroid/graphics/drawable/Drawable;
    :cond_3a
    sget-object v0, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    .line 64
    .local v0, "mode":Landroid/graphics/PorterDuff$Mode;
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    if-gt v4, v6, :cond_42

    .line 65
    sget-object v0, Landroid/graphics/PorterDuff$Mode;->MULTIPLY:Landroid/graphics/PorterDuff$Mode;

    .line 67
    :cond_42
    invoke-virtual {p0}, Landroid/widget/SeekBar;->getIndeterminateDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    if-eqz v4, :cond_4f

    .line 68
    invoke-virtual {p0}, Landroid/widget/SeekBar;->getIndeterminateDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v4, p1, v0}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 69
    :cond_4f
    invoke-virtual {p0}, Landroid/widget/SeekBar;->getProgressDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    if-eqz v4, :cond_12

    .line 70
    invoke-virtual {p0}, Landroid/widget/SeekBar;->getProgressDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v4, p1, v0}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    goto :goto_12
.end method
