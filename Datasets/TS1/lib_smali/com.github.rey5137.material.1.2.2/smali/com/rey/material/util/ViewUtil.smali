.class public Lcom/rey/material/util/ViewUtil;
.super Ljava/lang/Object;
.source "ViewUtil.java"


# static fields
.field public static final FRAME_DURATION:J = 0x10L

.field private static final sNextGeneratedId:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 25
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    sput-object v0, Lcom/rey/material/util/ViewUtil;->sNextGeneratedId:Ljava/util/concurrent/atomic/AtomicInteger;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static applyFont(Landroid/widget/TextView;Landroid/util/AttributeSet;II)V
    .registers 11
    .param p0, "v"    # Landroid/widget/TextView;
    .param p1, "attrs"    # Landroid/util/AttributeSet;
    .param p2, "defStyleAttr"    # I
    .param p3, "defStyleRes"    # I

    .prologue
    const/4 v6, 0x0

    .line 331
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [I

    sget v5, Lcom/rey/material/R$attr;->tv_fontFamily:I

    aput v5, v4, v6

    invoke-virtual {v3, p1, v4, p2, p3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 332
    .local v0, "a":Landroid/content/res/TypedArray;
    invoke-virtual {v0, v6}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 334
    .local v1, "fontFamily":Ljava/lang/String;
    if-eqz v1, :cond_21

    .line 335
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3, v1, v6}, Lcom/rey/material/util/TypefaceUtil;->load(Landroid/content/Context;Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v2

    .line 336
    .local v2, "typeface":Landroid/graphics/Typeface;
    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 339
    .end local v2    # "typeface":Landroid/graphics/Typeface;
    :cond_21
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 340
    return-void
.end method

.method public static applyStyle(Landroid/view/View;I)V
    .registers 4
    .param p0, "v"    # Landroid/view/View;
    .param p1, "resId"    # I

    .prologue
    .line 68
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p0, v0, v1, p1}, Lcom/rey/material/util/ViewUtil;->applyStyle(Landroid/view/View;Landroid/util/AttributeSet;II)V

    .line 69
    return-void
.end method

.method public static applyStyle(Landroid/view/View;Landroid/util/AttributeSet;II)V
    .registers 31
    .param p0, "v"    # Landroid/view/View;
    .param p1, "attrs"    # Landroid/util/AttributeSet;
    .param p2, "defStyleAttr"    # I
    .param p3, "defStyleRes"    # I

    .prologue
    .line 79
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v23

    sget-object v24, Lcom/rey/material/R$styleable;->View:[I

    move-object/from16 v0, v23

    move-object/from16 v1, p1

    move-object/from16 v2, v24

    move/from16 v3, p2

    move/from16 v4, p3

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v5

    .line 81
    .local v5, "a":Landroid/content/res/TypedArray;
    const/4 v13, -0x1

    .line 82
    .local v13, "leftPadding":I
    const/16 v21, -0x1

    .line 83
    .local v21, "topPadding":I
    const/16 v17, -0x1

    .line 84
    .local v17, "rightPadding":I
    const/4 v8, -0x1

    .line 85
    .local v8, "bottomPadding":I
    const/high16 v19, -0x80000000

    .line 86
    .local v19, "startPadding":I
    const/high16 v10, -0x80000000

    .line 87
    .local v10, "endPadding":I
    const/4 v15, -0x1

    .line 89
    .local v15, "padding":I
    const/16 v20, 0x0

    .line 90
    .local v20, "startPaddingDefined":Z
    const/4 v11, 0x0

    .line 91
    .local v11, "endPaddingDefined":Z
    const/4 v14, 0x0

    .line 92
    .local v14, "leftPaddingDefined":Z
    const/16 v18, 0x0

    .line 94
    .local v18, "rightPaddingDefined":Z
    const/4 v12, 0x0

    .local v12, "i":I
    invoke-virtual {v5}, Landroid/content/res/TypedArray;->getIndexCount()I

    move-result v9

    .local v9, "count":I
    :goto_2a
    if-ge v12, v9, :cond_411

    .line 95
    invoke-virtual {v5, v12}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v6

    .line 96
    .local v6, "attr":I
    sget v23, Lcom/rey/material/R$styleable;->View_android_background:I

    move/from16 v0, v23

    if-ne v6, v0, :cond_42

    .line 97
    invoke-virtual {v5, v6}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    .line 98
    .local v7, "bg":Landroid/graphics/drawable/Drawable;
    move-object/from16 v0, p0

    invoke-static {v0, v7}, Lcom/rey/material/util/ViewUtil;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 94
    .end local v7    # "bg":Landroid/graphics/drawable/Drawable;
    :cond_3f
    :goto_3f
    add-int/lit8 v12, v12, 0x1

    goto :goto_2a

    .line 100
    :cond_42
    sget v23, Lcom/rey/material/R$styleable;->View_android_backgroundTint:I

    move/from16 v0, v23

    if-ne v6, v0, :cond_5e

    .line 101
    sget v23, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v24, 0x15

    move/from16 v0, v23

    move/from16 v1, v24

    if-lt v0, v1, :cond_3f

    .line 102
    invoke-virtual {v5, v6}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v23

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    goto :goto_3f

    .line 104
    :cond_5e
    sget v23, Lcom/rey/material/R$styleable;->View_android_backgroundTintMode:I

    move/from16 v0, v23

    if-ne v6, v0, :cond_b6

    .line 105
    sget v23, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v24, 0x15

    move/from16 v0, v23

    move/from16 v1, v24

    if-lt v0, v1, :cond_3f

    .line 106
    const/16 v23, 0x3

    move/from16 v0, v23

    invoke-virtual {v5, v6, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v22

    .line 107
    .local v22, "value":I
    packed-switch v22, :pswitch_data_4d0

    :pswitch_79
    goto :goto_3f

    .line 109
    :pswitch_7a
    sget-object v23, Landroid/graphics/PorterDuff$Mode;->SRC_OVER:Landroid/graphics/PorterDuff$Mode;

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundTintMode(Landroid/graphics/PorterDuff$Mode;)V

    goto :goto_3f

    .line 112
    :pswitch_84
    sget-object v23, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundTintMode(Landroid/graphics/PorterDuff$Mode;)V

    goto :goto_3f

    .line 115
    :pswitch_8e
    sget-object v23, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundTintMode(Landroid/graphics/PorterDuff$Mode;)V

    goto :goto_3f

    .line 118
    :pswitch_98
    sget-object v23, Landroid/graphics/PorterDuff$Mode;->MULTIPLY:Landroid/graphics/PorterDuff$Mode;

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundTintMode(Landroid/graphics/PorterDuff$Mode;)V

    goto :goto_3f

    .line 121
    :pswitch_a2
    sget-object v23, Landroid/graphics/PorterDuff$Mode;->SCREEN:Landroid/graphics/PorterDuff$Mode;

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundTintMode(Landroid/graphics/PorterDuff$Mode;)V

    goto :goto_3f

    .line 124
    :pswitch_ac
    sget-object v23, Landroid/graphics/PorterDuff$Mode;->ADD:Landroid/graphics/PorterDuff$Mode;

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundTintMode(Landroid/graphics/PorterDuff$Mode;)V

    goto :goto_3f

    .line 129
    .end local v22    # "value":I
    :cond_b6
    sget v23, Lcom/rey/material/R$styleable;->View_android_elevation:I

    move/from16 v0, v23

    if-ne v6, v0, :cond_dc

    .line 130
    sget v23, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v24, 0x15

    move/from16 v0, v23

    move/from16 v1, v24

    if-lt v0, v1, :cond_3f

    .line 131
    const/16 v23, 0x0

    move/from16 v0, v23

    invoke-virtual {v5, v6, v0}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v23

    move/from16 v0, v23

    int-to-float v0, v0

    move/from16 v23, v0

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/View;->setElevation(F)V

    goto/16 :goto_3f

    .line 133
    :cond_dc
    sget v23, Lcom/rey/material/R$styleable;->View_android_padding:I

    move/from16 v0, v23

    if-ne v6, v0, :cond_ef

    .line 134
    const/16 v23, -0x1

    move/from16 v0, v23

    invoke-virtual {v5, v6, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v15

    .line 135
    const/4 v14, 0x1

    .line 136
    const/16 v18, 0x1

    goto/16 :goto_3f

    .line 138
    :cond_ef
    sget v23, Lcom/rey/material/R$styleable;->View_android_paddingLeft:I

    move/from16 v0, v23

    if-ne v6, v0, :cond_100

    .line 139
    const/16 v23, -0x1

    move/from16 v0, v23

    invoke-virtual {v5, v6, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v13

    .line 140
    const/4 v14, 0x1

    goto/16 :goto_3f

    .line 142
    :cond_100
    sget v23, Lcom/rey/material/R$styleable;->View_android_paddingTop:I

    move/from16 v0, v23

    if-ne v6, v0, :cond_110

    .line 143
    const/16 v23, -0x1

    move/from16 v0, v23

    invoke-virtual {v5, v6, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v21

    goto/16 :goto_3f

    .line 144
    :cond_110
    sget v23, Lcom/rey/material/R$styleable;->View_android_paddingRight:I

    move/from16 v0, v23

    if-ne v6, v0, :cond_122

    .line 145
    const/16 v23, -0x1

    move/from16 v0, v23

    invoke-virtual {v5, v6, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v17

    .line 146
    const/16 v18, 0x1

    goto/16 :goto_3f

    .line 148
    :cond_122
    sget v23, Lcom/rey/material/R$styleable;->View_android_paddingBottom:I

    move/from16 v0, v23

    if-ne v6, v0, :cond_132

    .line 149
    const/16 v23, -0x1

    move/from16 v0, v23

    invoke-virtual {v5, v6, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v8

    goto/16 :goto_3f

    .line 150
    :cond_132
    sget v23, Lcom/rey/material/R$styleable;->View_android_paddingStart:I

    move/from16 v0, v23

    if-ne v6, v0, :cond_159

    .line 151
    sget v23, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v24, 0x11

    move/from16 v0, v23

    move/from16 v1, v24

    if-lt v0, v1, :cond_3f

    .line 152
    const/high16 v23, -0x80000000

    move/from16 v0, v23

    invoke-virtual {v5, v6, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v19

    .line 153
    const/high16 v23, -0x80000000

    move/from16 v0, v19

    move/from16 v1, v23

    if-eq v0, v1, :cond_156

    const/16 v20, 0x1

    :goto_154
    goto/16 :goto_3f

    :cond_156
    const/16 v20, 0x0

    goto :goto_154

    .line 156
    :cond_159
    sget v23, Lcom/rey/material/R$styleable;->View_android_paddingEnd:I

    move/from16 v0, v23

    if-ne v6, v0, :cond_17c

    .line 157
    sget v23, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v24, 0x11

    move/from16 v0, v23

    move/from16 v1, v24

    if-lt v0, v1, :cond_3f

    .line 158
    const/high16 v23, -0x80000000

    move/from16 v0, v23

    invoke-virtual {v5, v6, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v10

    .line 159
    const/high16 v23, -0x80000000

    move/from16 v0, v23

    if-eq v10, v0, :cond_17a

    const/4 v11, 0x1

    :goto_178
    goto/16 :goto_3f

    :cond_17a
    const/4 v11, 0x0

    goto :goto_178

    .line 162
    :cond_17c
    sget v23, Lcom/rey/material/R$styleable;->View_android_fadeScrollbars:I

    move/from16 v0, v23

    if-ne v6, v0, :cond_193

    .line 163
    const/16 v23, 0x1

    move/from16 v0, v23

    invoke-virtual {v5, v6, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v23

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/View;->setScrollbarFadingEnabled(Z)V

    goto/16 :goto_3f

    .line 164
    :cond_193
    sget v23, Lcom/rey/material/R$styleable;->View_android_fadingEdgeLength:I

    move/from16 v0, v23

    if-ne v6, v0, :cond_1aa

    .line 165
    const/16 v23, 0x0

    move/from16 v0, v23

    invoke-virtual {v5, v6, v0}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v23

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/View;->setFadingEdgeLength(I)V

    goto/16 :goto_3f

    .line 166
    :cond_1aa
    sget v23, Lcom/rey/material/R$styleable;->View_android_minHeight:I

    move/from16 v0, v23

    if-ne v6, v0, :cond_1c1

    .line 167
    const/16 v23, 0x0

    move/from16 v0, v23

    invoke-virtual {v5, v6, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v23

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/View;->setMinimumHeight(I)V

    goto/16 :goto_3f

    .line 168
    :cond_1c1
    sget v23, Lcom/rey/material/R$styleable;->View_android_minWidth:I

    move/from16 v0, v23

    if-ne v6, v0, :cond_1d8

    .line 169
    const/16 v23, 0x0

    move/from16 v0, v23

    invoke-virtual {v5, v6, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v23

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/View;->setMinimumWidth(I)V

    goto/16 :goto_3f

    .line 170
    :cond_1d8
    sget v23, Lcom/rey/material/R$styleable;->View_android_requiresFadingEdge:I

    move/from16 v0, v23

    if-ne v6, v0, :cond_1ef

    .line 171
    const/16 v23, 0x1

    move/from16 v0, v23

    invoke-virtual {v5, v6, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v23

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/View;->setVerticalFadingEdgeEnabled(Z)V

    goto/16 :goto_3f

    .line 172
    :cond_1ef
    sget v23, Lcom/rey/material/R$styleable;->View_android_scrollbarDefaultDelayBeforeFade:I

    move/from16 v0, v23

    if-ne v6, v0, :cond_210

    .line 173
    sget v23, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v24, 0x10

    move/from16 v0, v23

    move/from16 v1, v24

    if-lt v0, v1, :cond_3f

    .line 174
    const/16 v23, 0x0

    move/from16 v0, v23

    invoke-virtual {v5, v6, v0}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v23

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/View;->setScrollBarDefaultDelayBeforeFade(I)V

    goto/16 :goto_3f

    .line 176
    :cond_210
    sget v23, Lcom/rey/material/R$styleable;->View_android_scrollbarFadeDuration:I

    move/from16 v0, v23

    if-ne v6, v0, :cond_231

    .line 177
    sget v23, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v24, 0x10

    move/from16 v0, v23

    move/from16 v1, v24

    if-lt v0, v1, :cond_3f

    .line 178
    const/16 v23, 0x0

    move/from16 v0, v23

    invoke-virtual {v5, v6, v0}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v23

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/View;->setScrollBarFadeDuration(I)V

    goto/16 :goto_3f

    .line 180
    :cond_231
    sget v23, Lcom/rey/material/R$styleable;->View_android_scrollbarSize:I

    move/from16 v0, v23

    if-ne v6, v0, :cond_252

    .line 181
    sget v23, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v24, 0x10

    move/from16 v0, v23

    move/from16 v1, v24

    if-lt v0, v1, :cond_3f

    .line 182
    const/16 v23, 0x0

    move/from16 v0, v23

    invoke-virtual {v5, v6, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v23

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/View;->setScrollBarSize(I)V

    goto/16 :goto_3f

    .line 184
    :cond_252
    sget v23, Lcom/rey/material/R$styleable;->View_android_scrollbarStyle:I

    move/from16 v0, v23

    if-ne v6, v0, :cond_291

    .line 185
    const/16 v23, 0x0

    move/from16 v0, v23

    invoke-virtual {v5, v6, v0}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v22

    .line 186
    .restart local v22    # "value":I
    sparse-switch v22, :sswitch_data_4f0

    goto/16 :goto_3f

    .line 188
    :sswitch_265
    const/16 v23, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/View;->setScrollBarStyle(I)V

    goto/16 :goto_3f

    .line 191
    :sswitch_270
    const/high16 v23, 0x1000000

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/View;->setScrollBarStyle(I)V

    goto/16 :goto_3f

    .line 194
    :sswitch_27b
    const/high16 v23, 0x2000000

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/View;->setScrollBarStyle(I)V

    goto/16 :goto_3f

    .line 197
    :sswitch_286
    const/high16 v23, 0x3000000

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/View;->setScrollBarStyle(I)V

    goto/16 :goto_3f

    .line 201
    .end local v22    # "value":I
    :cond_291
    sget v23, Lcom/rey/material/R$styleable;->View_android_soundEffectsEnabled:I

    move/from16 v0, v23

    if-ne v6, v0, :cond_2a8

    .line 202
    const/16 v23, 0x1

    move/from16 v0, v23

    invoke-virtual {v5, v6, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v23

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/View;->setSoundEffectsEnabled(Z)V

    goto/16 :goto_3f

    .line 203
    :cond_2a8
    sget v23, Lcom/rey/material/R$styleable;->View_android_textAlignment:I

    move/from16 v0, v23

    if-ne v6, v0, :cond_312

    .line 204
    sget v23, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v24, 0x11

    move/from16 v0, v23

    move/from16 v1, v24

    if-lt v0, v1, :cond_3f

    .line 205
    const/16 v23, 0x0

    move/from16 v0, v23

    invoke-virtual {v5, v6, v0}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v22

    .line 206
    .restart local v22    # "value":I
    packed-switch v22, :pswitch_data_502

    goto/16 :goto_3f

    .line 208
    :pswitch_2c5
    const/16 v23, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/View;->setTextAlignment(I)V

    goto/16 :goto_3f

    .line 211
    :pswitch_2d0
    const/16 v23, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/View;->setTextAlignment(I)V

    goto/16 :goto_3f

    .line 214
    :pswitch_2db
    const/16 v23, 0x2

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/View;->setTextAlignment(I)V

    goto/16 :goto_3f

    .line 217
    :pswitch_2e6
    const/16 v23, 0x3

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/View;->setTextAlignment(I)V

    goto/16 :goto_3f

    .line 220
    :pswitch_2f1
    const/16 v23, 0x4

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/View;->setTextAlignment(I)V

    goto/16 :goto_3f

    .line 223
    :pswitch_2fc
    const/16 v23, 0x5

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/View;->setTextAlignment(I)V

    goto/16 :goto_3f

    .line 226
    :pswitch_307
    const/16 v23, 0x6

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/View;->setTextAlignment(I)V

    goto/16 :goto_3f

    .line 231
    .end local v22    # "value":I
    :cond_312
    sget v23, Lcom/rey/material/R$styleable;->View_android_textDirection:I

    move/from16 v0, v23

    if-ne v6, v0, :cond_371

    .line 232
    sget v23, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v24, 0x11

    move/from16 v0, v23

    move/from16 v1, v24

    if-lt v0, v1, :cond_3f

    .line 233
    const/16 v23, 0x0

    move/from16 v0, v23

    invoke-virtual {v5, v6, v0}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v22

    .line 234
    .restart local v22    # "value":I
    packed-switch v22, :pswitch_data_514

    goto/16 :goto_3f

    .line 236
    :pswitch_32f
    const/16 v23, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/View;->setTextDirection(I)V

    goto/16 :goto_3f

    .line 239
    :pswitch_33a
    const/16 v23, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/View;->setTextDirection(I)V

    goto/16 :goto_3f

    .line 242
    :pswitch_345
    const/16 v23, 0x2

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/View;->setTextDirection(I)V

    goto/16 :goto_3f

    .line 245
    :pswitch_350
    const/16 v23, 0x3

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/View;->setTextDirection(I)V

    goto/16 :goto_3f

    .line 248
    :pswitch_35b
    const/16 v23, 0x4

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/View;->setTextDirection(I)V

    goto/16 :goto_3f

    .line 251
    :pswitch_366
    const/16 v23, 0x5

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/View;->setTextDirection(I)V

    goto/16 :goto_3f

    .line 256
    .end local v22    # "value":I
    :cond_371
    sget v23, Lcom/rey/material/R$styleable;->View_android_visibility:I

    move/from16 v0, v23

    if-ne v6, v0, :cond_3a5

    .line 257
    const/16 v23, 0x0

    move/from16 v0, v23

    invoke-virtual {v5, v6, v0}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v22

    .line 258
    .restart local v22    # "value":I
    packed-switch v22, :pswitch_data_524

    goto/16 :goto_3f

    .line 260
    :pswitch_384
    const/16 v23, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_3f

    .line 263
    :pswitch_38f
    const/16 v23, 0x4

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_3f

    .line 266
    :pswitch_39a
    const/16 v23, 0x8

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_3f

    .line 270
    .end local v22    # "value":I
    :cond_3a5
    sget v23, Lcom/rey/material/R$styleable;->View_android_layoutDirection:I

    move/from16 v0, v23

    if-ne v6, v0, :cond_3ee

    .line 271
    sget v23, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v24, 0x11

    move/from16 v0, v23

    move/from16 v1, v24

    if-lt v0, v1, :cond_3f

    .line 272
    const/16 v23, 0x0

    move/from16 v0, v23

    invoke-virtual {v5, v6, v0}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v22

    .line 273
    .restart local v22    # "value":I
    packed-switch v22, :pswitch_data_52e

    goto/16 :goto_3f

    .line 275
    :pswitch_3c2
    const/16 v23, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutDirection(I)V

    goto/16 :goto_3f

    .line 278
    :pswitch_3cd
    const/16 v23, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutDirection(I)V

    goto/16 :goto_3f

    .line 281
    :pswitch_3d8
    const/16 v23, 0x2

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutDirection(I)V

    goto/16 :goto_3f

    .line 284
    :pswitch_3e3
    const/16 v23, 0x3

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutDirection(I)V

    goto/16 :goto_3f

    .line 289
    .end local v22    # "value":I
    :cond_3ee
    sget v23, Lcom/rey/material/R$styleable;->View_android_src:I

    move/from16 v0, v23

    if-ne v6, v0, :cond_3f

    .line 290
    move-object/from16 v0, p0

    instance-of v0, v0, Landroid/widget/ImageView;

    move/from16 v23, v0

    if-eqz v23, :cond_3f

    .line 291
    const/16 v23, 0x0

    move/from16 v0, v23

    invoke-virtual {v5, v6, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v16

    .local v16, "resId":I
    move-object/from16 v23, p0

    .line 292
    check-cast v23, Landroid/widget/ImageView;

    move-object/from16 v0, v23

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_3f

    .line 297
    .end local v6    # "attr":I
    .end local v16    # "resId":I
    :cond_411
    if-ltz v15, :cond_429

    .line 298
    move-object/from16 v0, p0

    invoke-virtual {v0, v15, v15, v15, v15}, Landroid/view/View;->setPadding(IIII)V

    .line 324
    .end local v8    # "bottomPadding":I
    .end local v10    # "endPadding":I
    .end local v19    # "startPadding":I
    .end local v21    # "topPadding":I
    :cond_418
    :goto_418
    invoke-virtual {v5}, Landroid/content/res/TypedArray;->recycle()V

    .line 326
    move-object/from16 v0, p0

    instance-of v0, v0, Landroid/widget/TextView;

    move/from16 v23, v0

    if-eqz v23, :cond_428

    .line 327
    check-cast p0, Landroid/widget/TextView;

    .end local p0    # "v":Landroid/view/View;
    invoke-static/range {p0 .. p3}, Lcom/rey/material/util/ViewUtil;->applyStyle(Landroid/widget/TextView;Landroid/util/AttributeSet;II)V

    .line 328
    :cond_428
    return-void

    .line 299
    .restart local v8    # "bottomPadding":I
    .restart local v10    # "endPadding":I
    .restart local v19    # "startPadding":I
    .restart local v21    # "topPadding":I
    .restart local p0    # "v":Landroid/view/View;
    :cond_429
    sget v23, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v24, 0x11

    move/from16 v0, v23

    move/from16 v1, v24

    if-ge v0, v1, :cond_469

    .line 300
    if-eqz v20, :cond_437

    .line 301
    move/from16 v13, v19

    .line 302
    :cond_437
    if-eqz v11, :cond_43b

    .line 303
    move/from16 v17, v10

    .line 305
    :cond_43b
    if-ltz v13, :cond_453

    move/from16 v24, v13

    :goto_43f
    if-ltz v21, :cond_45a

    .end local v21    # "topPadding":I
    :goto_441
    if-ltz v17, :cond_45f

    move/from16 v23, v17

    :goto_445
    if-ltz v8, :cond_464

    .end local v8    # "bottomPadding":I
    :goto_447
    move-object/from16 v0, p0

    move/from16 v1, v24

    move/from16 v2, v21

    move/from16 v3, v23

    invoke-virtual {v0, v1, v2, v3, v8}, Landroid/view/View;->setPadding(IIII)V

    goto :goto_418

    .restart local v8    # "bottomPadding":I
    .restart local v21    # "topPadding":I
    :cond_453
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v23

    move/from16 v24, v23

    goto :goto_43f

    :cond_45a
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getPaddingTop()I

    move-result v21

    goto :goto_441

    .end local v21    # "topPadding":I
    :cond_45f
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getPaddingRight()I

    move-result v23

    goto :goto_445

    :cond_464
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v8

    goto :goto_447

    .line 311
    .restart local v21    # "topPadding":I
    :cond_469
    if-nez v14, :cond_46d

    if-eqz v18, :cond_48a

    .line 312
    :cond_46d
    if-eqz v14, :cond_4a1

    move/from16 v26, v13

    :goto_471
    if-ltz v21, :cond_4a8

    move/from16 v25, v21

    :goto_475
    if-eqz v18, :cond_4af

    move/from16 v24, v17

    :goto_479
    if-ltz v8, :cond_4b6

    move/from16 v23, v8

    :goto_47d
    move-object/from16 v0, p0

    move/from16 v1, v26

    move/from16 v2, v25

    move/from16 v3, v24

    move/from16 v4, v23

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/View;->setPadding(IIII)V

    .line 317
    :cond_48a
    if-nez v20, :cond_48e

    if-eqz v11, :cond_418

    .line 318
    :cond_48e
    if-eqz v20, :cond_4bb

    .end local v19    # "startPadding":I
    :goto_490
    if-ltz v21, :cond_4c0

    .end local v21    # "topPadding":I
    :goto_492
    if-eqz v11, :cond_4c5

    .end local v10    # "endPadding":I
    :goto_494
    if-ltz v8, :cond_4ca

    .end local v8    # "bottomPadding":I
    :goto_496
    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v21

    invoke-virtual {v0, v1, v2, v10, v8}, Landroid/view/View;->setPaddingRelative(IIII)V

    goto/16 :goto_418

    .line 312
    .restart local v8    # "bottomPadding":I
    .restart local v10    # "endPadding":I
    .restart local v19    # "startPadding":I
    .restart local v21    # "topPadding":I
    :cond_4a1
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v23

    move/from16 v26, v23

    goto :goto_471

    :cond_4a8
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getPaddingTop()I

    move-result v23

    move/from16 v25, v23

    goto :goto_475

    :cond_4af
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getPaddingRight()I

    move-result v23

    move/from16 v24, v23

    goto :goto_479

    :cond_4b6
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v23

    goto :goto_47d

    .line 318
    :cond_4bb
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getPaddingStart()I

    move-result v19

    goto :goto_490

    .end local v19    # "startPadding":I
    :cond_4c0
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getPaddingTop()I

    move-result v21

    goto :goto_492

    .end local v21    # "topPadding":I
    :cond_4c5
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getPaddingEnd()I

    move-result v10

    goto :goto_494

    .end local v10    # "endPadding":I
    :cond_4ca
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v8

    goto :goto_496

    .line 107
    nop

    :pswitch_data_4d0
    .packed-switch 0x3
        :pswitch_7a
        :pswitch_79
        :pswitch_84
        :pswitch_79
        :pswitch_79
        :pswitch_79
        :pswitch_8e
        :pswitch_79
        :pswitch_79
        :pswitch_79
        :pswitch_79
        :pswitch_98
        :pswitch_a2
        :pswitch_ac
    .end packed-switch

    .line 186
    :sswitch_data_4f0
    .sparse-switch
        0x0 -> :sswitch_265
        0x1000000 -> :sswitch_270
        0x2000000 -> :sswitch_27b
        0x3000000 -> :sswitch_286
    .end sparse-switch

    .line 206
    :pswitch_data_502
    .packed-switch 0x0
        :pswitch_2c5
        :pswitch_2d0
        :pswitch_2db
        :pswitch_2e6
        :pswitch_2f1
        :pswitch_2fc
        :pswitch_307
    .end packed-switch

    .line 234
    :pswitch_data_514
    .packed-switch 0x0
        :pswitch_32f
        :pswitch_33a
        :pswitch_345
        :pswitch_350
        :pswitch_35b
        :pswitch_366
    .end packed-switch

    .line 258
    :pswitch_data_524
    .packed-switch 0x0
        :pswitch_384
        :pswitch_38f
        :pswitch_39a
    .end packed-switch

    .line 273
    :pswitch_data_52e
    .packed-switch 0x0
        :pswitch_3c2
        :pswitch_3cd
        :pswitch_3d8
        :pswitch_3e3
    .end packed-switch
.end method

.method private static applyStyle(Landroid/widget/AutoCompleteTextView;Landroid/util/AttributeSet;II)V
    .registers 12
    .param p0, "v"    # Landroid/widget/AutoCompleteTextView;
    .param p1, "attrs"    # Landroid/util/AttributeSet;
    .param p2, "defStyleAttr"    # I
    .param p3, "defStyleRes"    # I

    .prologue
    const/4 v7, -0x2

    const/4 v6, 0x0

    .line 748
    invoke-virtual {p0}, Landroid/widget/AutoCompleteTextView;->getContext()Landroid/content/Context;

    move-result-object v4

    sget-object v5, Lcom/rey/material/R$styleable;->AutoCompleteTextView:[I

    invoke-virtual {v4, p1, v5, p2, p3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 750
    .local v0, "a":Landroid/content/res/TypedArray;
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->getIndexCount()I

    move-result v3

    .line 751
    .local v3, "n":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_11
    if-ge v2, v3, :cond_79

    .line 752
    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v1

    .line 754
    .local v1, "attr":I
    sget v4, Lcom/rey/material/R$styleable;->AutoCompleteTextView_android_completionHint:I

    if-ne v1, v4, :cond_25

    .line 755
    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Landroid/widget/AutoCompleteTextView;->setCompletionHint(Ljava/lang/CharSequence;)V

    .line 751
    :cond_22
    :goto_22
    add-int/lit8 v2, v2, 0x1

    goto :goto_11

    .line 756
    :cond_25
    sget v4, Lcom/rey/material/R$styleable;->AutoCompleteTextView_android_completionThreshold:I

    if-ne v1, v4, :cond_31

    .line 757
    invoke-virtual {v0, v1, v6}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v4

    invoke-virtual {p0, v4}, Landroid/widget/AutoCompleteTextView;->setThreshold(I)V

    goto :goto_22

    .line 758
    :cond_31
    sget v4, Lcom/rey/material/R$styleable;->AutoCompleteTextView_android_dropDownAnchor:I

    if-ne v1, v4, :cond_3d

    .line 759
    invoke-virtual {v0, v1, v6}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v4

    invoke-virtual {p0, v4}, Landroid/widget/AutoCompleteTextView;->setDropDownAnchor(I)V

    goto :goto_22

    .line 760
    :cond_3d
    sget v4, Lcom/rey/material/R$styleable;->AutoCompleteTextView_android_dropDownHeight:I

    if-ne v1, v4, :cond_49

    .line 761
    invoke-virtual {v0, v1, v7}, Landroid/content/res/TypedArray;->getLayoutDimension(II)I

    move-result v4

    invoke-virtual {p0, v4}, Landroid/widget/AutoCompleteTextView;->setDropDownHeight(I)V

    goto :goto_22

    .line 762
    :cond_49
    sget v4, Lcom/rey/material/R$styleable;->AutoCompleteTextView_android_dropDownWidth:I

    if-ne v1, v4, :cond_55

    .line 763
    invoke-virtual {v0, v1, v7}, Landroid/content/res/TypedArray;->getLayoutDimension(II)I

    move-result v4

    invoke-virtual {p0, v4}, Landroid/widget/AutoCompleteTextView;->setDropDownWidth(I)V

    goto :goto_22

    .line 764
    :cond_55
    sget v4, Lcom/rey/material/R$styleable;->AutoCompleteTextView_android_dropDownHorizontalOffset:I

    if-ne v1, v4, :cond_61

    .line 765
    invoke-virtual {v0, v1, v6}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    invoke-virtual {p0, v4}, Landroid/widget/AutoCompleteTextView;->setDropDownHorizontalOffset(I)V

    goto :goto_22

    .line 766
    :cond_61
    sget v4, Lcom/rey/material/R$styleable;->AutoCompleteTextView_android_dropDownVerticalOffset:I

    if-ne v1, v4, :cond_6d

    .line 767
    invoke-virtual {v0, v1, v6}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    invoke-virtual {p0, v4}, Landroid/widget/AutoCompleteTextView;->setDropDownVerticalOffset(I)V

    goto :goto_22

    .line 768
    :cond_6d
    sget v4, Lcom/rey/material/R$styleable;->AutoCompleteTextView_android_popupBackground:I

    if-ne v1, v4, :cond_22

    .line 769
    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {p0, v4}, Landroid/widget/AutoCompleteTextView;->setDropDownBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_22

    .line 771
    .end local v1    # "attr":I
    :cond_79
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 772
    return-void
.end method

.method private static applyStyle(Landroid/widget/TextView;Landroid/util/AttributeSet;II)V
    .registers 36
    .param p0, "v"    # Landroid/widget/TextView;
    .param p1, "attrs"    # Landroid/util/AttributeSet;
    .param p2, "defStyleAttr"    # I
    .param p3, "defStyleRes"    # I

    .prologue
    .line 452
    const/16 v20, 0x0

    .line 453
    .local v20, "fontFamily":Ljava/lang/String;
    const/16 v27, -0x1

    .line 454
    .local v27, "typefaceIndex":I
    const/16 v25, -0x1

    .line 455
    .local v25, "styleIndex":I
    const/16 v24, 0x0

    .line 456
    .local v24, "shadowColor":I
    const/16 v18, 0x0

    .local v18, "dx":F
    const/16 v19, 0x0

    .local v19, "dy":F
    const/16 v23, 0x0

    .line 458
    .local v23, "r":F
    const/4 v12, 0x0

    .local v12, "drawableLeft":Landroid/graphics/drawable/Drawable;
    const/16 v16, 0x0

    .local v16, "drawableTop":Landroid/graphics/drawable/Drawable;
    const/4 v14, 0x0

    .line 459
    .local v14, "drawableRight":Landroid/graphics/drawable/Drawable;
    const/4 v9, 0x0

    .local v9, "drawableBottom":Landroid/graphics/drawable/Drawable;
    const/4 v15, 0x0

    .local v15, "drawableStart":Landroid/graphics/drawable/Drawable;
    const/4 v11, 0x0

    .line 460
    .local v11, "drawableEnd":Landroid/graphics/drawable/Drawable;
    const/4 v10, 0x0

    .line 461
    .local v10, "drawableDefined":Z
    const/4 v13, 0x0

    .line 469
    .local v13, "drawableRelativeDefined":Z
    invoke-virtual/range {p0 .. p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v28

    sget-object v29, Lcom/rey/material/R$styleable;->TextViewAppearance:[I

    move-object/from16 v0, v28

    move-object/from16 v1, p1

    move-object/from16 v2, v29

    move/from16 v3, p2

    move/from16 v4, p3

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v5

    .line 470
    .local v5, "a":Landroid/content/res/TypedArray;
    const/4 v7, 0x0

    .line 471
    .local v7, "appearance":Landroid/content/res/TypedArray;
    sget v28, Lcom/rey/material/R$styleable;->TextViewAppearance_android_textAppearance:I

    const/16 v29, 0x0

    move/from16 v0, v28

    move/from16 v1, v29

    invoke-virtual {v5, v0, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v6

    .line 472
    .local v6, "ap":I
    invoke-virtual {v5}, Landroid/content/res/TypedArray;->recycle()V

    .line 474
    if-eqz v6, :cond_4b

    .line 475
    invoke-virtual/range {p0 .. p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v28

    sget-object v29, Lcom/rey/material/R$styleable;->TextAppearance:[I

    move-object/from16 v0, v28

    move-object/from16 v1, v29

    invoke-virtual {v0, v6, v1}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v7

    .line 477
    :cond_4b
    if-eqz v7, :cond_1c4

    .line 478
    invoke-virtual {v7}, Landroid/content/res/TypedArray;->getIndexCount()I

    move-result v22

    .line 479
    .local v22, "n":I
    const/16 v21, 0x0

    .local v21, "i":I
    :goto_53
    move/from16 v0, v21

    move/from16 v1, v22

    if-ge v0, v1, :cond_1c1

    .line 480
    move/from16 v0, v21

    invoke-virtual {v7, v0}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v8

    .line 482
    .local v8, "attr":I
    sget v28, Lcom/rey/material/R$styleable;->TextAppearance_android_textColorHighlight:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_77

    .line 483
    const/16 v28, 0x0

    move/from16 v0, v28

    invoke-virtual {v7, v8, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v28

    move-object/from16 v0, p0

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setHighlightColor(I)V

    .line 479
    :cond_74
    :goto_74
    add-int/lit8 v21, v21, 0x1

    goto :goto_53

    .line 485
    :cond_77
    sget v28, Lcom/rey/material/R$styleable;->TextAppearance_android_textColor:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_89

    .line 486
    invoke-virtual {v7, v8}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v28

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    goto :goto_74

    .line 488
    :cond_89
    sget v28, Lcom/rey/material/R$styleable;->TextAppearance_android_textColorHint:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_9b

    .line 489
    invoke-virtual {v7, v8}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v28

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setHintTextColor(Landroid/content/res/ColorStateList;)V

    goto :goto_74

    .line 491
    :cond_9b
    sget v28, Lcom/rey/material/R$styleable;->TextAppearance_android_textColorLink:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_ad

    .line 492
    invoke-virtual {v7, v8}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v28

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setLinkTextColor(Landroid/content/res/ColorStateList;)V

    goto :goto_74

    .line 494
    :cond_ad
    sget v28, Lcom/rey/material/R$styleable;->TextAppearance_android_textSize:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_cc

    .line 495
    const/16 v28, 0x0

    const/16 v29, 0x0

    move/from16 v0, v29

    invoke-virtual {v7, v8, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v29

    move/from16 v0, v29

    int-to-float v0, v0

    move/from16 v29, v0

    move-object/from16 v0, p0

    move/from16 v1, v28

    move/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    goto :goto_74

    .line 497
    :cond_cc
    sget v28, Lcom/rey/material/R$styleable;->TextAppearance_android_typeface:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_db

    .line 498
    const/16 v28, -0x1

    move/from16 v0, v28

    invoke-virtual {v7, v8, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v27

    goto :goto_74

    .line 500
    :cond_db
    sget v28, Lcom/rey/material/R$styleable;->TextAppearance_android_fontFamily:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_e6

    .line 501
    invoke-virtual {v7, v8}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v20

    goto :goto_74

    .line 503
    :cond_e6
    sget v28, Lcom/rey/material/R$styleable;->TextAppearance_tv_fontFamily:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_f1

    .line 504
    invoke-virtual {v7, v8}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v20

    goto :goto_74

    .line 506
    :cond_f1
    sget v28, Lcom/rey/material/R$styleable;->TextAppearance_android_textStyle:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_101

    .line 507
    const/16 v28, -0x1

    move/from16 v0, v28

    invoke-virtual {v7, v8, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v25

    goto/16 :goto_74

    .line 509
    :cond_101
    sget v28, Lcom/rey/material/R$styleable;->TextAppearance_android_textAllCaps:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_122

    .line 510
    sget v28, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v29, 0xe

    move/from16 v0, v28

    move/from16 v1, v29

    if-lt v0, v1, :cond_74

    .line 511
    const/16 v28, 0x0

    move/from16 v0, v28

    invoke-virtual {v7, v8, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v28

    move-object/from16 v0, p0

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setAllCaps(Z)V

    goto/16 :goto_74

    .line 513
    :cond_122
    sget v28, Lcom/rey/material/R$styleable;->TextAppearance_android_shadowColor:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_132

    .line 514
    const/16 v28, 0x0

    move/from16 v0, v28

    invoke-virtual {v7, v8, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v24

    goto/16 :goto_74

    .line 516
    :cond_132
    sget v28, Lcom/rey/material/R$styleable;->TextAppearance_android_shadowDx:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_142

    .line 517
    const/16 v28, 0x0

    move/from16 v0, v28

    invoke-virtual {v7, v8, v0}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v18

    goto/16 :goto_74

    .line 519
    :cond_142
    sget v28, Lcom/rey/material/R$styleable;->TextAppearance_android_shadowDy:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_152

    .line 520
    const/16 v28, 0x0

    move/from16 v0, v28

    invoke-virtual {v7, v8, v0}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v19

    goto/16 :goto_74

    .line 522
    :cond_152
    sget v28, Lcom/rey/material/R$styleable;->TextAppearance_android_shadowRadius:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_162

    .line 523
    const/16 v28, 0x0

    move/from16 v0, v28

    invoke-virtual {v7, v8, v0}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v23

    goto/16 :goto_74

    .line 525
    :cond_162
    sget v28, Lcom/rey/material/R$styleable;->TextAppearance_android_elegantTextHeight:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_183

    .line 526
    sget v28, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v29, 0x15

    move/from16 v0, v28

    move/from16 v1, v29

    if-lt v0, v1, :cond_74

    .line 527
    const/16 v28, 0x0

    move/from16 v0, v28

    invoke-virtual {v7, v8, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v28

    move-object/from16 v0, p0

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setElegantTextHeight(Z)V

    goto/16 :goto_74

    .line 529
    :cond_183
    sget v28, Lcom/rey/material/R$styleable;->TextAppearance_android_letterSpacing:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_1a4

    .line 530
    sget v28, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v29, 0x15

    move/from16 v0, v28

    move/from16 v1, v29

    if-lt v0, v1, :cond_74

    .line 531
    const/16 v28, 0x0

    move/from16 v0, v28

    invoke-virtual {v7, v8, v0}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v28

    move-object/from16 v0, p0

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setLetterSpacing(F)V

    goto/16 :goto_74

    .line 533
    :cond_1a4
    sget v28, Lcom/rey/material/R$styleable;->TextAppearance_android_fontFeatureSettings:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_74

    .line 534
    sget v28, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v29, 0x15

    move/from16 v0, v28

    move/from16 v1, v29

    if-lt v0, v1, :cond_74

    .line 535
    invoke-virtual {v7, v8}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v28

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setFontFeatureSettings(Ljava/lang/String;)V

    goto/16 :goto_74

    .line 540
    .end local v8    # "attr":I
    :cond_1c1
    invoke-virtual {v7}, Landroid/content/res/TypedArray;->recycle()V

    .line 543
    .end local v21    # "i":I
    .end local v22    # "n":I
    :cond_1c4
    invoke-virtual/range {p0 .. p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v28

    sget-object v29, Lcom/rey/material/R$styleable;->TextView:[I

    move-object/from16 v0, v28

    move-object/from16 v1, p1

    move-object/from16 v2, v29

    move/from16 v3, p2

    move/from16 v4, p3

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v5

    .line 545
    invoke-virtual {v5}, Landroid/content/res/TypedArray;->getIndexCount()I

    move-result v22

    .line 546
    .restart local v22    # "n":I
    const/16 v21, 0x0

    .restart local v21    # "i":I
    :goto_1de
    move/from16 v0, v21

    move/from16 v1, v22

    if-ge v0, v1, :cond_537

    .line 547
    move/from16 v0, v21

    invoke-virtual {v5, v0}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v8

    .line 549
    .restart local v8    # "attr":I
    sget v28, Lcom/rey/material/R$styleable;->TextView_android_drawableLeft:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_1f8

    .line 550
    invoke-virtual {v5, v8}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v12

    .line 551
    const/4 v10, 0x1

    .line 546
    :cond_1f5
    :goto_1f5
    add-int/lit8 v21, v21, 0x1

    goto :goto_1de

    .line 553
    :cond_1f8
    sget v28, Lcom/rey/material/R$styleable;->TextView_android_drawableTop:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_204

    .line 554
    invoke-virtual {v5, v8}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v16

    .line 555
    const/4 v10, 0x1

    goto :goto_1f5

    .line 557
    :cond_204
    sget v28, Lcom/rey/material/R$styleable;->TextView_android_drawableRight:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_210

    .line 558
    invoke-virtual {v5, v8}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v14

    .line 559
    const/4 v10, 0x1

    goto :goto_1f5

    .line 561
    :cond_210
    sget v28, Lcom/rey/material/R$styleable;->TextView_android_drawableBottom:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_21c

    .line 562
    invoke-virtual {v5, v8}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v9

    .line 563
    const/4 v10, 0x1

    goto :goto_1f5

    .line 565
    :cond_21c
    sget v28, Lcom/rey/material/R$styleable;->TextView_android_drawableStart:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_228

    .line 566
    invoke-virtual {v5, v8}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v15

    .line 567
    const/4 v13, 0x1

    goto :goto_1f5

    .line 569
    :cond_228
    sget v28, Lcom/rey/material/R$styleable;->TextView_android_drawableEnd:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_234

    .line 570
    invoke-virtual {v5, v8}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v11

    .line 571
    const/4 v13, 0x1

    goto :goto_1f5

    .line 573
    :cond_234
    sget v28, Lcom/rey/material/R$styleable;->TextView_android_drawablePadding:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_24a

    .line 574
    const/16 v28, 0x0

    move/from16 v0, v28

    invoke-virtual {v5, v8, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v28

    move-object/from16 v0, p0

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    goto :goto_1f5

    .line 576
    :cond_24a
    sget v28, Lcom/rey/material/R$styleable;->TextView_android_maxLines:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_260

    .line 577
    const/16 v28, -0x1

    move/from16 v0, v28

    invoke-virtual {v5, v8, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v28

    move-object/from16 v0, p0

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    goto :goto_1f5

    .line 579
    :cond_260
    sget v28, Lcom/rey/material/R$styleable;->TextView_android_maxHeight:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_276

    .line 580
    const/16 v28, -0x1

    move/from16 v0, v28

    invoke-virtual {v5, v8, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v28

    move-object/from16 v0, p0

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMaxHeight(I)V

    goto :goto_1f5

    .line 582
    :cond_276
    sget v28, Lcom/rey/material/R$styleable;->TextView_android_lines:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_28d

    .line 583
    const/16 v28, -0x1

    move/from16 v0, v28

    invoke-virtual {v5, v8, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v28

    move-object/from16 v0, p0

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setLines(I)V

    goto/16 :goto_1f5

    .line 585
    :cond_28d
    sget v28, Lcom/rey/material/R$styleable;->TextView_android_height:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_2a4

    .line 586
    const/16 v28, -0x1

    move/from16 v0, v28

    invoke-virtual {v5, v8, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v28

    move-object/from16 v0, p0

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setHeight(I)V

    goto/16 :goto_1f5

    .line 588
    :cond_2a4
    sget v28, Lcom/rey/material/R$styleable;->TextView_android_minLines:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_2bb

    .line 589
    const/16 v28, -0x1

    move/from16 v0, v28

    invoke-virtual {v5, v8, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v28

    move-object/from16 v0, p0

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMinLines(I)V

    goto/16 :goto_1f5

    .line 591
    :cond_2bb
    sget v28, Lcom/rey/material/R$styleable;->TextView_android_minHeight:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_2d2

    .line 592
    const/16 v28, -0x1

    move/from16 v0, v28

    invoke-virtual {v5, v8, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v28

    move-object/from16 v0, p0

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMinHeight(I)V

    goto/16 :goto_1f5

    .line 594
    :cond_2d2
    sget v28, Lcom/rey/material/R$styleable;->TextView_android_maxEms:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_2e9

    .line 595
    const/16 v28, -0x1

    move/from16 v0, v28

    invoke-virtual {v5, v8, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v28

    move-object/from16 v0, p0

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMaxEms(I)V

    goto/16 :goto_1f5

    .line 597
    :cond_2e9
    sget v28, Lcom/rey/material/R$styleable;->TextView_android_maxWidth:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_300

    .line 598
    const/16 v28, -0x1

    move/from16 v0, v28

    invoke-virtual {v5, v8, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v28

    move-object/from16 v0, p0

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMaxWidth(I)V

    goto/16 :goto_1f5

    .line 600
    :cond_300
    sget v28, Lcom/rey/material/R$styleable;->TextView_android_ems:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_317

    .line 601
    const/16 v28, -0x1

    move/from16 v0, v28

    invoke-virtual {v5, v8, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v28

    move-object/from16 v0, p0

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEms(I)V

    goto/16 :goto_1f5

    .line 603
    :cond_317
    sget v28, Lcom/rey/material/R$styleable;->TextView_android_width:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_32e

    .line 604
    const/16 v28, -0x1

    move/from16 v0, v28

    invoke-virtual {v5, v8, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v28

    move-object/from16 v0, p0

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setWidth(I)V

    goto/16 :goto_1f5

    .line 606
    :cond_32e
    sget v28, Lcom/rey/material/R$styleable;->TextView_android_minEms:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_345

    .line 607
    const/16 v28, -0x1

    move/from16 v0, v28

    invoke-virtual {v5, v8, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v28

    move-object/from16 v0, p0

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMinEms(I)V

    goto/16 :goto_1f5

    .line 609
    :cond_345
    sget v28, Lcom/rey/material/R$styleable;->TextView_android_minWidth:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_35c

    .line 610
    const/16 v28, -0x1

    move/from16 v0, v28

    invoke-virtual {v5, v8, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v28

    move-object/from16 v0, p0

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMinWidth(I)V

    goto/16 :goto_1f5

    .line 612
    :cond_35c
    sget v28, Lcom/rey/material/R$styleable;->TextView_android_gravity:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_373

    .line 613
    const/16 v28, -0x1

    move/from16 v0, v28

    invoke-virtual {v5, v8, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v28

    move-object/from16 v0, p0

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    goto/16 :goto_1f5

    .line 615
    :cond_373
    sget v28, Lcom/rey/material/R$styleable;->TextView_android_scrollHorizontally:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_38a

    .line 616
    const/16 v28, 0x0

    move/from16 v0, v28

    invoke-virtual {v5, v8, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v28

    move-object/from16 v0, p0

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setHorizontallyScrolling(Z)V

    goto/16 :goto_1f5

    .line 618
    :cond_38a
    sget v28, Lcom/rey/material/R$styleable;->TextView_android_includeFontPadding:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_3a1

    .line 619
    const/16 v28, 0x1

    move/from16 v0, v28

    invoke-virtual {v5, v8, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v28

    move-object/from16 v0, p0

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setIncludeFontPadding(Z)V

    goto/16 :goto_1f5

    .line 621
    :cond_3a1
    sget v28, Lcom/rey/material/R$styleable;->TextView_android_cursorVisible:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_3b8

    .line 622
    const/16 v28, 0x1

    move/from16 v0, v28

    invoke-virtual {v5, v8, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v28

    move-object/from16 v0, p0

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setCursorVisible(Z)V

    goto/16 :goto_1f5

    .line 624
    :cond_3b8
    sget v28, Lcom/rey/material/R$styleable;->TextView_android_textScaleX:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_3cf

    .line 625
    const/high16 v28, 0x3f800000    # 1.0f

    move/from16 v0, v28

    invoke-virtual {v5, v8, v0}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v28

    move-object/from16 v0, p0

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextScaleX(F)V

    goto/16 :goto_1f5

    .line 627
    :cond_3cf
    sget v28, Lcom/rey/material/R$styleable;->TextView_android_shadowColor:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_3df

    .line 628
    const/16 v28, 0x0

    move/from16 v0, v28

    invoke-virtual {v5, v8, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v24

    goto/16 :goto_1f5

    .line 630
    :cond_3df
    sget v28, Lcom/rey/material/R$styleable;->TextView_android_shadowDx:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_3ef

    .line 631
    const/16 v28, 0x0

    move/from16 v0, v28

    invoke-virtual {v5, v8, v0}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v18

    goto/16 :goto_1f5

    .line 633
    :cond_3ef
    sget v28, Lcom/rey/material/R$styleable;->TextView_android_shadowDy:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_3ff

    .line 634
    const/16 v28, 0x0

    move/from16 v0, v28

    invoke-virtual {v5, v8, v0}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v19

    goto/16 :goto_1f5

    .line 636
    :cond_3ff
    sget v28, Lcom/rey/material/R$styleable;->TextView_android_shadowRadius:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_40f

    .line 637
    const/16 v28, 0x0

    move/from16 v0, v28

    invoke-virtual {v5, v8, v0}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v23

    goto/16 :goto_1f5

    .line 639
    :cond_40f
    sget v28, Lcom/rey/material/R$styleable;->TextView_android_textColorHighlight:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_426

    .line 640
    const/16 v28, 0x0

    move/from16 v0, v28

    invoke-virtual {v5, v8, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v28

    move-object/from16 v0, p0

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setHighlightColor(I)V

    goto/16 :goto_1f5

    .line 642
    :cond_426
    sget v28, Lcom/rey/material/R$styleable;->TextView_android_textColor:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_439

    .line 643
    invoke-virtual {v5, v8}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v28

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    goto/16 :goto_1f5

    .line 645
    :cond_439
    sget v28, Lcom/rey/material/R$styleable;->TextView_android_textColorHint:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_44c

    .line 646
    invoke-virtual {v5, v8}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v28

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setHintTextColor(Landroid/content/res/ColorStateList;)V

    goto/16 :goto_1f5

    .line 648
    :cond_44c
    sget v28, Lcom/rey/material/R$styleable;->TextView_android_textColorLink:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_45f

    .line 649
    invoke-virtual {v5, v8}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v28

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setLinkTextColor(Landroid/content/res/ColorStateList;)V

    goto/16 :goto_1f5

    .line 651
    :cond_45f
    sget v28, Lcom/rey/material/R$styleable;->TextView_android_textSize:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_47f

    .line 652
    const/16 v28, 0x0

    const/16 v29, 0x0

    move/from16 v0, v29

    invoke-virtual {v5, v8, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v29

    move/from16 v0, v29

    int-to-float v0, v0

    move/from16 v29, v0

    move-object/from16 v0, p0

    move/from16 v1, v28

    move/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    goto/16 :goto_1f5

    .line 654
    :cond_47f
    sget v28, Lcom/rey/material/R$styleable;->TextView_android_typeface:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_48f

    .line 655
    const/16 v28, -0x1

    move/from16 v0, v28

    invoke-virtual {v5, v8, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v27

    goto/16 :goto_1f5

    .line 657
    :cond_48f
    sget v28, Lcom/rey/material/R$styleable;->TextView_android_textStyle:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_49f

    .line 658
    const/16 v28, -0x1

    move/from16 v0, v28

    invoke-virtual {v5, v8, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v25

    goto/16 :goto_1f5

    .line 660
    :cond_49f
    sget v28, Lcom/rey/material/R$styleable;->TextView_android_fontFamily:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_4ab

    .line 661
    invoke-virtual {v5, v8}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v20

    goto/16 :goto_1f5

    .line 663
    :cond_4ab
    sget v28, Lcom/rey/material/R$styleable;->TextView_tv_fontFamily:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_4b7

    .line 664
    invoke-virtual {v5, v8}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v20

    goto/16 :goto_1f5

    .line 666
    :cond_4b7
    sget v28, Lcom/rey/material/R$styleable;->TextView_android_textAllCaps:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_4d8

    .line 667
    sget v28, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v29, 0xe

    move/from16 v0, v28

    move/from16 v1, v29

    if-lt v0, v1, :cond_1f5

    .line 668
    const/16 v28, 0x0

    move/from16 v0, v28

    invoke-virtual {v5, v8, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v28

    move-object/from16 v0, p0

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setAllCaps(Z)V

    goto/16 :goto_1f5

    .line 670
    :cond_4d8
    sget v28, Lcom/rey/material/R$styleable;->TextView_android_elegantTextHeight:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_4f9

    .line 671
    sget v28, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v29, 0x15

    move/from16 v0, v28

    move/from16 v1, v29

    if-lt v0, v1, :cond_1f5

    .line 672
    const/16 v28, 0x0

    move/from16 v0, v28

    invoke-virtual {v5, v8, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v28

    move-object/from16 v0, p0

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setElegantTextHeight(Z)V

    goto/16 :goto_1f5

    .line 674
    :cond_4f9
    sget v28, Lcom/rey/material/R$styleable;->TextView_android_letterSpacing:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_51a

    .line 675
    sget v28, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v29, 0x15

    move/from16 v0, v28

    move/from16 v1, v29

    if-lt v0, v1, :cond_1f5

    .line 676
    const/16 v28, 0x0

    move/from16 v0, v28

    invoke-virtual {v5, v8, v0}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v28

    move-object/from16 v0, p0

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setLetterSpacing(F)V

    goto/16 :goto_1f5

    .line 678
    :cond_51a
    sget v28, Lcom/rey/material/R$styleable;->TextView_android_fontFeatureSettings:I

    move/from16 v0, v28

    if-ne v8, v0, :cond_1f5

    .line 679
    sget v28, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v29, 0x15

    move/from16 v0, v28

    move/from16 v1, v29

    if-lt v0, v1, :cond_1f5

    .line 680
    invoke-virtual {v5, v8}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v28

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setFontFeatureSettings(Ljava/lang/String;)V

    goto/16 :goto_1f5

    .line 684
    .end local v8    # "attr":I
    :cond_537
    invoke-virtual {v5}, Landroid/content/res/TypedArray;->recycle()V

    .line 686
    if-eqz v24, :cond_549

    .line 687
    move-object/from16 v0, p0

    move/from16 v1, v23

    move/from16 v2, v18

    move/from16 v3, v19

    move/from16 v4, v24

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/TextView;->setShadowLayer(FFFI)V

    .line 689
    :cond_549
    if-eqz v10, :cond_584

    .line 690
    invoke-virtual/range {p0 .. p0}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v17

    .line 691
    .local v17, "drawables":[Landroid/graphics/drawable/Drawable;
    if-eqz v15, :cond_5f4

    .line 692
    const/16 v28, 0x0

    aput-object v15, v17, v28

    .line 695
    :cond_555
    :goto_555
    if-eqz v16, :cond_55b

    .line 696
    const/16 v28, 0x1

    aput-object v16, v17, v28

    .line 697
    :cond_55b
    if-eqz v11, :cond_5fc

    .line 698
    const/16 v28, 0x2

    aput-object v11, v17, v28

    .line 701
    :cond_561
    :goto_561
    if-eqz v9, :cond_567

    .line 702
    const/16 v28, 0x3

    aput-object v9, v17, v28

    .line 703
    :cond_567
    const/16 v28, 0x0

    aget-object v28, v17, v28

    const/16 v29, 0x1

    aget-object v29, v17, v29

    const/16 v30, 0x2

    aget-object v30, v17, v30

    const/16 v31, 0x3

    aget-object v31, v17, v31

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    move-object/from16 v2, v29

    move-object/from16 v3, v30

    move-object/from16 v4, v31

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 706
    .end local v17    # "drawables":[Landroid/graphics/drawable/Drawable;
    :cond_584
    if-eqz v13, :cond_5bd

    sget v28, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v29, 0x11

    move/from16 v0, v28

    move/from16 v1, v29

    if-lt v0, v1, :cond_5bd

    .line 707
    invoke-virtual/range {p0 .. p0}, Landroid/widget/TextView;->getCompoundDrawablesRelative()[Landroid/graphics/drawable/Drawable;

    move-result-object v17

    .line 708
    .restart local v17    # "drawables":[Landroid/graphics/drawable/Drawable;
    if-eqz v15, :cond_59a

    .line 709
    const/16 v28, 0x0

    aput-object v15, v17, v28

    .line 710
    :cond_59a
    if-eqz v11, :cond_5a0

    .line 711
    const/16 v28, 0x2

    aput-object v11, v17, v28

    .line 712
    :cond_5a0
    const/16 v28, 0x0

    aget-object v28, v17, v28

    const/16 v29, 0x1

    aget-object v29, v17, v29

    const/16 v30, 0x2

    aget-object v30, v17, v30

    const/16 v31, 0x3

    aget-object v31, v17, v31

    move-object/from16 v0, p0

    move-object/from16 v1, v28

    move-object/from16 v2, v29

    move-object/from16 v3, v30

    move-object/from16 v4, v31

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/TextView;->setCompoundDrawablesRelativeWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 715
    .end local v17    # "drawables":[Landroid/graphics/drawable/Drawable;
    :cond_5bd
    const/16 v26, 0x0

    .line 716
    .local v26, "tf":Landroid/graphics/Typeface;
    if-eqz v20, :cond_5d8

    .line 717
    invoke-virtual/range {p0 .. p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v28

    move-object/from16 v0, v28

    move-object/from16 v1, v20

    move/from16 v2, v25

    invoke-static {v0, v1, v2}, Lcom/rey/material/util/TypefaceUtil;->load(Landroid/content/Context;Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v26

    .line 718
    if-eqz v26, :cond_5d8

    .line 719
    move-object/from16 v0, p0

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 721
    :cond_5d8
    if-eqz v26, :cond_5e6

    .line 722
    packed-switch v27, :pswitch_data_60e

    .line 733
    :goto_5dd
    move-object/from16 v0, p0

    move-object/from16 v1, v26

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 736
    :cond_5e6
    move-object/from16 v0, p0

    instance-of v0, v0, Landroid/widget/AutoCompleteTextView;

    move/from16 v28, v0

    if-eqz v28, :cond_5f3

    .line 737
    check-cast p0, Landroid/widget/AutoCompleteTextView;

    .end local p0    # "v":Landroid/widget/TextView;
    invoke-static/range {p0 .. p3}, Lcom/rey/material/util/ViewUtil;->applyStyle(Landroid/widget/AutoCompleteTextView;Landroid/util/AttributeSet;II)V

    .line 738
    :cond_5f3
    return-void

    .line 693
    .end local v26    # "tf":Landroid/graphics/Typeface;
    .restart local v17    # "drawables":[Landroid/graphics/drawable/Drawable;
    .restart local p0    # "v":Landroid/widget/TextView;
    :cond_5f4
    if-eqz v12, :cond_555

    .line 694
    const/16 v28, 0x0

    aput-object v12, v17, v28

    goto/16 :goto_555

    .line 699
    :cond_5fc
    if-eqz v14, :cond_561

    .line 700
    const/16 v28, 0x2

    aput-object v14, v17, v28

    goto/16 :goto_561

    .line 724
    .end local v17    # "drawables":[Landroid/graphics/drawable/Drawable;
    .restart local v26    # "tf":Landroid/graphics/Typeface;
    :pswitch_604
    sget-object v26, Landroid/graphics/Typeface;->SANS_SERIF:Landroid/graphics/Typeface;

    .line 725
    goto :goto_5dd

    .line 727
    :pswitch_607
    sget-object v26, Landroid/graphics/Typeface;->SERIF:Landroid/graphics/Typeface;

    .line 728
    goto :goto_5dd

    .line 730
    :pswitch_60a
    sget-object v26, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    goto :goto_5dd

    .line 722
    nop

    :pswitch_data_60e
    .packed-switch 0x1
        :pswitch_604
        :pswitch_607
        :pswitch_60a
    .end packed-switch
.end method

.method public static applyTextAppearance(Landroid/widget/TextView;I)V
    .registers 16
    .param p0, "v"    # Landroid/widget/TextView;
    .param p1, "resId"    # I

    .prologue
    .line 343
    if-nez p1, :cond_3

    .line 442
    :cond_2
    :goto_2
    return-void

    .line 346
    :cond_3
    const/4 v4, 0x0

    .line 347
    .local v4, "fontFamily":Ljava/lang/String;
    const/4 v11, -0x1

    .line 348
    .local v11, "typefaceIndex":I
    const/4 v9, -0x1

    .line 349
    .local v9, "styleIndex":I
    const/4 v8, 0x0

    .line 350
    .local v8, "shadowColor":I
    const/4 v2, 0x0

    .local v2, "dx":F
    const/4 v3, 0x0

    .local v3, "dy":F
    const/4 v7, 0x0

    .line 352
    .local v7, "r":F
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v12

    sget-object v13, Lcom/rey/material/R$styleable;->TextAppearance:[I

    invoke-virtual {v12, p1, v13}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 353
    .local v0, "appearance":Landroid/content/res/TypedArray;
    if-eqz v0, :cond_105

    .line 354
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->getIndexCount()I

    move-result v6

    .line 355
    .local v6, "n":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_1b
    if-ge v5, v6, :cond_102

    .line 356
    invoke-virtual {v0, v5}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v1

    .line 358
    .local v1, "attr":I
    sget v12, Lcom/rey/material/R$styleable;->TextAppearance_android_textColorHighlight:I

    if-ne v1, v12, :cond_30

    .line 359
    const/4 v12, 0x0

    invoke-virtual {v0, v1, v12}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v12

    invoke-virtual {p0, v12}, Landroid/widget/TextView;->setHighlightColor(I)V

    .line 355
    :cond_2d
    :goto_2d
    add-int/lit8 v5, v5, 0x1

    goto :goto_1b

    .line 361
    :cond_30
    sget v12, Lcom/rey/material/R$styleable;->TextAppearance_android_textColor:I

    if-ne v1, v12, :cond_3c

    .line 362
    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v12

    invoke-virtual {p0, v12}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    goto :goto_2d

    .line 364
    :cond_3c
    sget v12, Lcom/rey/material/R$styleable;->TextAppearance_android_textColorHint:I

    if-ne v1, v12, :cond_48

    .line 365
    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v12

    invoke-virtual {p0, v12}, Landroid/widget/TextView;->setHintTextColor(Landroid/content/res/ColorStateList;)V

    goto :goto_2d

    .line 367
    :cond_48
    sget v12, Lcom/rey/material/R$styleable;->TextAppearance_android_textColorLink:I

    if-ne v1, v12, :cond_54

    .line 368
    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v12

    invoke-virtual {p0, v12}, Landroid/widget/TextView;->setLinkTextColor(Landroid/content/res/ColorStateList;)V

    goto :goto_2d

    .line 370
    :cond_54
    sget v12, Lcom/rey/material/R$styleable;->TextAppearance_android_textSize:I

    if-ne v1, v12, :cond_63

    .line 371
    const/4 v12, 0x0

    const/4 v13, 0x0

    invoke-virtual {v0, v1, v13}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v13

    int-to-float v13, v13

    invoke-virtual {p0, v12, v13}, Landroid/widget/TextView;->setTextSize(IF)V

    goto :goto_2d

    .line 373
    :cond_63
    sget v12, Lcom/rey/material/R$styleable;->TextAppearance_android_typeface:I

    if-ne v1, v12, :cond_6d

    .line 374
    const/4 v12, -0x1

    invoke-virtual {v0, v1, v12}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v11

    goto :goto_2d

    .line 376
    :cond_6d
    sget v12, Lcom/rey/material/R$styleable;->TextAppearance_android_fontFamily:I

    if-ne v1, v12, :cond_76

    .line 377
    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    goto :goto_2d

    .line 379
    :cond_76
    sget v12, Lcom/rey/material/R$styleable;->TextAppearance_tv_fontFamily:I

    if-ne v1, v12, :cond_7f

    .line 380
    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    goto :goto_2d

    .line 382
    :cond_7f
    sget v12, Lcom/rey/material/R$styleable;->TextAppearance_android_textStyle:I

    if-ne v1, v12, :cond_89

    .line 383
    const/4 v12, -0x1

    invoke-virtual {v0, v1, v12}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v9

    goto :goto_2d

    .line 385
    :cond_89
    sget v12, Lcom/rey/material/R$styleable;->TextAppearance_android_textAllCaps:I

    if-ne v1, v12, :cond_9c

    .line 386
    sget v12, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v13, 0xe

    if-lt v12, v13, :cond_2d

    .line 387
    const/4 v12, 0x0

    invoke-virtual {v0, v1, v12}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v12

    invoke-virtual {p0, v12}, Landroid/widget/TextView;->setAllCaps(Z)V

    goto :goto_2d

    .line 389
    :cond_9c
    sget v12, Lcom/rey/material/R$styleable;->TextAppearance_android_shadowColor:I

    if-ne v1, v12, :cond_a6

    .line 390
    const/4 v12, 0x0

    invoke-virtual {v0, v1, v12}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v8

    goto :goto_2d

    .line 392
    :cond_a6
    sget v12, Lcom/rey/material/R$styleable;->TextAppearance_android_shadowDx:I

    if-ne v1, v12, :cond_b1

    .line 393
    const/4 v12, 0x0

    invoke-virtual {v0, v1, v12}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    goto/16 :goto_2d

    .line 395
    :cond_b1
    sget v12, Lcom/rey/material/R$styleable;->TextAppearance_android_shadowDy:I

    if-ne v1, v12, :cond_bc

    .line 396
    const/4 v12, 0x0

    invoke-virtual {v0, v1, v12}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v3

    goto/16 :goto_2d

    .line 398
    :cond_bc
    sget v12, Lcom/rey/material/R$styleable;->TextAppearance_android_shadowRadius:I

    if-ne v1, v12, :cond_c7

    .line 399
    const/4 v12, 0x0

    invoke-virtual {v0, v1, v12}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v7

    goto/16 :goto_2d

    .line 401
    :cond_c7
    sget v12, Lcom/rey/material/R$styleable;->TextAppearance_android_elegantTextHeight:I

    if-ne v1, v12, :cond_db

    .line 402
    sget v12, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v13, 0x15

    if-lt v12, v13, :cond_2d

    .line 403
    const/4 v12, 0x0

    invoke-virtual {v0, v1, v12}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v12

    invoke-virtual {p0, v12}, Landroid/widget/TextView;->setElegantTextHeight(Z)V

    goto/16 :goto_2d

    .line 405
    :cond_db
    sget v12, Lcom/rey/material/R$styleable;->TextAppearance_android_letterSpacing:I

    if-ne v1, v12, :cond_ef

    .line 406
    sget v12, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v13, 0x15

    if-lt v12, v13, :cond_2d

    .line 407
    const/4 v12, 0x0

    invoke-virtual {v0, v1, v12}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v12

    invoke-virtual {p0, v12}, Landroid/widget/TextView;->setLetterSpacing(F)V

    goto/16 :goto_2d

    .line 409
    :cond_ef
    sget v12, Lcom/rey/material/R$styleable;->TextAppearance_android_fontFeatureSettings:I

    if-ne v1, v12, :cond_2d

    .line 410
    sget v12, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v13, 0x15

    if-lt v12, v13, :cond_2d

    .line 411
    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {p0, v12}, Landroid/widget/TextView;->setFontFeatureSettings(Ljava/lang/String;)V

    goto/16 :goto_2d

    .line 416
    .end local v1    # "attr":I
    :cond_102
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 419
    .end local v5    # "i":I
    .end local v6    # "n":I
    :cond_105
    if-eqz v8, :cond_10a

    .line 420
    invoke-virtual {p0, v7, v2, v3, v8}, Landroid/widget/TextView;->setShadowLayer(FFFI)V

    .line 422
    :cond_10a
    const/4 v10, 0x0

    .line 423
    .local v10, "tf":Landroid/graphics/Typeface;
    if-eqz v4, :cond_11a

    .line 424
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v12

    invoke-static {v12, v4, v9}, Lcom/rey/material/util/TypefaceUtil;->load(Landroid/content/Context;Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v10

    .line 425
    if-eqz v10, :cond_11a

    .line 426
    invoke-virtual {p0, v10}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 428
    :cond_11a
    if-eqz v10, :cond_2

    .line 429
    packed-switch v11, :pswitch_data_12e

    .line 440
    :goto_11f
    invoke-virtual {p0, v10, v9}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    goto/16 :goto_2

    .line 431
    :pswitch_124
    sget-object v10, Landroid/graphics/Typeface;->SANS_SERIF:Landroid/graphics/Typeface;

    .line 432
    goto :goto_11f

    .line 434
    :pswitch_127
    sget-object v10, Landroid/graphics/Typeface;->SERIF:Landroid/graphics/Typeface;

    .line 435
    goto :goto_11f

    .line 437
    :pswitch_12a
    sget-object v10, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    goto :goto_11f

    .line 429
    nop

    :pswitch_data_12e
    .packed-switch 0x1
        :pswitch_124
        :pswitch_127
        :pswitch_12a
    .end packed-switch
.end method

.method public static generateViewId()I
    .registers 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 29
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x11

    if-ge v2, v3, :cond_1d

    .line 31
    .local v0, "newValue":I
    .local v1, "result":I
    :cond_6
    sget-object v2, Lcom/rey/material/util/ViewUtil;->sNextGeneratedId:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v1

    .line 33
    add-int/lit8 v0, v1, 0x1

    .line 34
    const v2, 0xffffff

    if-le v0, v2, :cond_14

    .line 35
    const/4 v0, 0x1

    .line 36
    :cond_14
    sget-object v2, Lcom/rey/material/util/ViewUtil;->sNextGeneratedId:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2, v1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 41
    .end local v0    # "newValue":I
    .end local v1    # "result":I
    :goto_1c
    return v1

    :cond_1d
    invoke-static {}, Landroid/view/View;->generateViewId()I

    move-result v1

    goto :goto_1c
.end method

.method public static hasState([II)Z
    .registers 7
    .param p0, "states"    # [I
    .param p1, "state"    # I

    .prologue
    const/4 v4, 0x0

    .line 45
    if-nez p0, :cond_4

    .line 52
    :cond_3
    :goto_3
    return v4

    .line 48
    :cond_4
    move-object v0, p0

    .local v0, "arr$":[I
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_7
    if-ge v1, v2, :cond_3

    aget v3, v0, v1

    .line 49
    .local v3, "state1":I
    if-ne v3, p1, :cond_f

    .line 50
    const/4 v4, 0x1

    goto :goto_3

    .line 48
    :cond_f
    add-int/lit8 v1, v1, 0x1

    goto :goto_7
.end method

.method public static setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V
    .registers 4
    .param p0, "v"    # Landroid/view/View;
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 56
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_a

    .line 57
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 60
    :goto_9
    return-void

    .line 59
    :cond_a
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_9
.end method
