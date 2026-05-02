.class public Lcom/rey/material/widget/YearPicker;
.super Lcom/rey/material/widget/ListView;
.source "YearPicker.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/rey/material/widget/YearPicker$SavedState;,
        Lcom/rey/material/widget/YearPicker$YearAdapter;,
        Lcom/rey/material/widget/YearPicker$OnYearChangedListener;
    }
.end annotation


# static fields
.field private static final STATES:[[I

.field private static final YEAR_FORMAT:Ljava/lang/String; = "%4d"


# instance fields
.field private mAdapter:Lcom/rey/material/widget/YearPicker$YearAdapter;

.field private mAnimDuration:I

.field private mDistanceShift:I

.field private mInInterpolator:Landroid/view/animation/Interpolator;

.field private mItemHeight:I

.field private mItemRealHeight:I

.field private mOnYearChangedListener:Lcom/rey/material/widget/YearPicker$OnYearChangedListener;

.field private mOutInterpolator:Landroid/view/animation/Interpolator;

.field private mPadding:I

.field private mPaint:Landroid/graphics/Paint;

.field private mPositionShift:I

.field private mSelectionColor:I

.field private mTextColors:[I

.field private mTextSize:I

.field private mTypeface:Landroid/graphics/Typeface;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 68
    const/4 v0, 0x2

    new-array v0, v0, [[I

    new-array v1, v4, [I

    const v2, -0x10100a0

    aput v2, v1, v3

    aput-object v1, v0, v3

    new-array v1, v4, [I

    const v2, 0x10100a0

    aput v2, v1, v3

    aput-object v1, v0, v4

    sput-object v0, Lcom/rey/material/widget/YearPicker;->STATES:[[I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 78
    invoke-direct {p0, p1}, Lcom/rey/material/widget/ListView;-><init>(Landroid/content/Context;)V

    .line 73
    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_c

    iput-object v0, p0, Lcom/rey/material/widget/YearPicker;->mTextColors:[I

    .line 79
    return-void

    .line 73
    :array_c
    .array-data 4
        -0x1000000
        -0x1
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 82
    invoke-direct {p0, p1, p2}, Lcom/rey/material/widget/ListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 73
    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_c

    iput-object v0, p0, Lcom/rey/material/widget/YearPicker;->mTextColors:[I

    .line 83
    return-void

    .line 73
    :array_c
    .array-data 4
        -0x1000000
        -0x1
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 86
    invoke-direct {p0, p1, p2, p3}, Lcom/rey/material/widget/ListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 73
    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_c

    iput-object v0, p0, Lcom/rey/material/widget/YearPicker;->mTextColors:[I

    .line 87
    return-void

    .line 73
    :array_c
    .array-data 4
        -0x1000000
        -0x1
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    .line 90
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/rey/material/widget/ListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 73
    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_c

    iput-object v0, p0, Lcom/rey/material/widget/YearPicker;->mTextColors:[I

    .line 91
    return-void

    .line 73
    :array_c
    .array-data 4
        -0x1000000
        -0x1
    .end array-data
.end method

.method static synthetic access$000(Lcom/rey/material/widget/YearPicker;)Lcom/rey/material/widget/YearPicker$OnYearChangedListener;
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/YearPicker;

    .prologue
    .line 33
    iget-object v0, p0, Lcom/rey/material/widget/YearPicker;->mOnYearChangedListener:Lcom/rey/material/widget/YearPicker$OnYearChangedListener;

    return-object v0
.end method

.method static synthetic access$100(Lcom/rey/material/widget/YearPicker;)I
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/YearPicker;

    .prologue
    .line 33
    iget v0, p0, Lcom/rey/material/widget/YearPicker;->mItemRealHeight:I

    return v0
.end method

.method static synthetic access$200(Lcom/rey/material/widget/YearPicker;)I
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/YearPicker;

    .prologue
    .line 33
    iget v0, p0, Lcom/rey/material/widget/YearPicker;->mAnimDuration:I

    return v0
.end method

.method static synthetic access$300(Lcom/rey/material/widget/YearPicker;)Landroid/view/animation/Interpolator;
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/YearPicker;

    .prologue
    .line 33
    iget-object v0, p0, Lcom/rey/material/widget/YearPicker;->mInInterpolator:Landroid/view/animation/Interpolator;

    return-object v0
.end method

.method static synthetic access$400(Lcom/rey/material/widget/YearPicker;)Landroid/view/animation/Interpolator;
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/YearPicker;

    .prologue
    .line 33
    iget-object v0, p0, Lcom/rey/material/widget/YearPicker;->mOutInterpolator:Landroid/view/animation/Interpolator;

    return-object v0
.end method

.method static synthetic access$500(Lcom/rey/material/widget/YearPicker;)I
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/YearPicker;

    .prologue
    .line 33
    iget v0, p0, Lcom/rey/material/widget/YearPicker;->mSelectionColor:I

    return v0
.end method

.method static synthetic access$600(Lcom/rey/material/widget/YearPicker;)Landroid/graphics/Typeface;
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/YearPicker;

    .prologue
    .line 33
    iget-object v0, p0, Lcom/rey/material/widget/YearPicker;->mTypeface:Landroid/graphics/Typeface;

    return-object v0
.end method

.method static synthetic access$700(Lcom/rey/material/widget/YearPicker;)I
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/YearPicker;

    .prologue
    .line 33
    iget v0, p0, Lcom/rey/material/widget/YearPicker;->mTextSize:I

    return v0
.end method

.method static synthetic access$800()[[I
    .registers 1

    .prologue
    .line 33
    sget-object v0, Lcom/rey/material/widget/YearPicker;->STATES:[[I

    return-object v0
.end method

.method static synthetic access$900(Lcom/rey/material/widget/YearPicker;)[I
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/YearPicker;

    .prologue
    .line 33
    iget-object v0, p0, Lcom/rey/material/widget/YearPicker;->mTextColors:[I

    return-object v0
.end method

.method private measureItemHeight()V
    .registers 5

    .prologue
    .line 271
    iget v0, p0, Lcom/rey/material/widget/YearPicker;->mItemRealHeight:I

    if-lez v0, :cond_5

    .line 276
    :goto_4
    return-void

    .line 274
    :cond_5
    iget-object v0, p0, Lcom/rey/material/widget/YearPicker;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/rey/material/widget/YearPicker;->mTextSize:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 275
    iget-object v0, p0, Lcom/rey/material/widget/YearPicker;->mPaint:Landroid/graphics/Paint;

    const-string v1, "9999"

    const/4 v2, 0x0

    const/4 v3, 0x4

    invoke-virtual {v0, v1, v2, v3}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;II)F

    move-result v0

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    iget v1, p0, Lcom/rey/material/widget/YearPicker;->mPadding:I

    mul-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    iget v1, p0, Lcom/rey/material/widget/YearPicker;->mItemHeight:I

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lcom/rey/material/widget/YearPicker;->mItemRealHeight:I

    goto :goto_4
.end method


# virtual methods
.method protected applyStyle(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 22
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    .line 122
    invoke-super/range {p0 .. p4}, Lcom/rey/material/widget/ListView;->applyStyle(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 124
    sget-object v14, Lcom/rey/material/R$styleable;->YearPicker:[I

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move/from16 v2, p3

    move/from16 v3, p4

    invoke-virtual {v0, v1, v14, v2, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v4

    .line 126
    .local v4, "a":Landroid/content/res/TypedArray;
    const/4 v11, -0x1

    .line 127
    .local v11, "year":I
    const/4 v13, -0x1

    .line 128
    .local v13, "yearMin":I
    const/4 v12, -0x1

    .line 129
    .local v12, "yearMax":I
    const/4 v8, 0x0

    .line 130
    .local v8, "familyName":Ljava/lang/String;
    const/4 v10, -0x1

    .line 132
    .local v10, "style":I
    const/4 v9, 0x0

    .local v9, "i":I
    invoke-virtual {v4}, Landroid/content/res/TypedArray;->getIndexCount()I

    move-result v7

    .local v7, "count":I
    :goto_1b
    if-ge v9, v7, :cond_e0

    .line 133
    invoke-virtual {v4, v9}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v5

    .line 135
    .local v5, "attr":I
    sget v14, Lcom/rey/material/R$styleable;->YearPicker_dp_yearTextSize:I

    if-ne v5, v14, :cond_31

    .line 136
    const/4 v14, 0x0

    invoke-virtual {v4, v5, v14}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v14

    move-object/from16 v0, p0

    iput v14, v0, Lcom/rey/material/widget/YearPicker;->mTextSize:I

    .line 132
    :cond_2e
    :goto_2e
    add-int/lit8 v9, v9, 0x1

    goto :goto_1b

    .line 137
    :cond_31
    sget v14, Lcom/rey/material/R$styleable;->YearPicker_dp_year:I

    if-ne v5, v14, :cond_3b

    .line 138
    const/4 v14, 0x0

    invoke-virtual {v4, v5, v14}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v11

    goto :goto_2e

    .line 139
    :cond_3b
    sget v14, Lcom/rey/material/R$styleable;->YearPicker_dp_yearMin:I

    if-ne v5, v14, :cond_45

    .line 140
    const/4 v14, 0x0

    invoke-virtual {v4, v5, v14}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v13

    goto :goto_2e

    .line 141
    :cond_45
    sget v14, Lcom/rey/material/R$styleable;->YearPicker_dp_yearMax:I

    if-ne v5, v14, :cond_4f

    .line 142
    const/4 v14, 0x0

    invoke-virtual {v4, v5, v14}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v12

    goto :goto_2e

    .line 143
    :cond_4f
    sget v14, Lcom/rey/material/R$styleable;->YearPicker_dp_yearItemHeight:I

    if-ne v5, v14, :cond_5d

    .line 144
    const/4 v14, 0x0

    invoke-virtual {v4, v5, v14}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v14

    move-object/from16 v0, p0

    iput v14, v0, Lcom/rey/material/widget/YearPicker;->mItemHeight:I

    goto :goto_2e

    .line 145
    :cond_5d
    sget v14, Lcom/rey/material/R$styleable;->YearPicker_dp_textColor:I

    if-ne v5, v14, :cond_71

    .line 146
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/rey/material/widget/YearPicker;->mTextColors:[I

    const/4 v15, 0x0

    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-virtual {v4, v5, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v16

    aput v16, v14, v15

    goto :goto_2e

    .line 147
    :cond_71
    sget v14, Lcom/rey/material/R$styleable;->YearPicker_dp_textHighlightColor:I

    if-ne v5, v14, :cond_85

    .line 148
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/rey/material/widget/YearPicker;->mTextColors:[I

    const/4 v15, 0x1

    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-virtual {v4, v5, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v16

    aput v16, v14, v15

    goto :goto_2e

    .line 149
    :cond_85
    sget v14, Lcom/rey/material/R$styleable;->YearPicker_dp_selectionColor:I

    if-ne v5, v14, :cond_93

    .line 150
    const/4 v14, 0x0

    invoke-virtual {v4, v5, v14}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v14

    move-object/from16 v0, p0

    iput v14, v0, Lcom/rey/material/widget/YearPicker;->mSelectionColor:I

    goto :goto_2e

    .line 151
    :cond_93
    sget v14, Lcom/rey/material/R$styleable;->YearPicker_dp_animDuration:I

    if-ne v5, v14, :cond_a1

    .line 152
    const/4 v14, 0x0

    invoke-virtual {v4, v5, v14}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v14

    move-object/from16 v0, p0

    iput v14, v0, Lcom/rey/material/widget/YearPicker;->mAnimDuration:I

    goto :goto_2e

    .line 153
    :cond_a1
    sget v14, Lcom/rey/material/R$styleable;->YearPicker_dp_inInterpolator:I

    if-ne v5, v14, :cond_b6

    .line 154
    const/4 v14, 0x0

    invoke-virtual {v4, v5, v14}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v14

    move-object/from16 v0, p1

    invoke-static {v0, v14}, Landroid/view/animation/AnimationUtils;->loadInterpolator(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    move-result-object v14

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/rey/material/widget/YearPicker;->mInInterpolator:Landroid/view/animation/Interpolator;

    goto/16 :goto_2e

    .line 155
    :cond_b6
    sget v14, Lcom/rey/material/R$styleable;->YearPicker_dp_outInterpolator:I

    if-ne v5, v14, :cond_cb

    .line 156
    const/4 v14, 0x0

    invoke-virtual {v4, v5, v14}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v14

    move-object/from16 v0, p1

    invoke-static {v0, v14}, Landroid/view/animation/AnimationUtils;->loadInterpolator(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    move-result-object v14

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/rey/material/widget/YearPicker;->mOutInterpolator:Landroid/view/animation/Interpolator;

    goto/16 :goto_2e

    .line 157
    :cond_cb
    sget v14, Lcom/rey/material/R$styleable;->YearPicker_dp_fontFamily:I

    if-ne v5, v14, :cond_d5

    .line 158
    invoke-virtual {v4, v5}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v8

    goto/16 :goto_2e

    .line 159
    :cond_d5
    sget v14, Lcom/rey/material/R$styleable;->YearPicker_dp_textStyle:I

    if-ne v5, v14, :cond_2e

    .line 160
    const/4 v14, 0x0

    invoke-virtual {v4, v5, v14}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v10

    goto/16 :goto_2e

    .line 163
    .end local v5    # "attr":I
    :cond_e0
    invoke-virtual {v4}, Landroid/content/res/TypedArray;->recycle()V

    .line 165
    move-object/from16 v0, p0

    iget v14, v0, Lcom/rey/material/widget/YearPicker;->mTextSize:I

    if-gez v14, :cond_f7

    .line 166
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    sget v15, Lcom/rey/material/R$dimen;->abc_text_size_title_material:I

    invoke-virtual {v14, v15}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v14

    move-object/from16 v0, p0

    iput v14, v0, Lcom/rey/material/widget/YearPicker;->mTextSize:I

    .line 168
    :cond_f7
    move-object/from16 v0, p0

    iget v14, v0, Lcom/rey/material/widget/YearPicker;->mItemHeight:I

    if-gez v14, :cond_109

    .line 169
    const/16 v14, 0x30

    move-object/from16 v0, p1

    invoke-static {v0, v14}, Lcom/rey/material/util/ThemeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v14

    move-object/from16 v0, p0

    iput v14, v0, Lcom/rey/material/widget/YearPicker;->mItemHeight:I

    .line 171
    :cond_109
    move-object/from16 v0, p0

    iget v14, v0, Lcom/rey/material/widget/YearPicker;->mAnimDuration:I

    if-gez v14, :cond_11e

    .line 172
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    const v15, 0x10e0001

    invoke-virtual {v14, v15}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v14

    move-object/from16 v0, p0

    iput v14, v0, Lcom/rey/material/widget/YearPicker;->mAnimDuration:I

    .line 174
    :cond_11e
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/rey/material/widget/YearPicker;->mInInterpolator:Landroid/view/animation/Interpolator;

    if-nez v14, :cond_12d

    .line 175
    new-instance v14, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v14}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/rey/material/widget/YearPicker;->mInInterpolator:Landroid/view/animation/Interpolator;

    .line 177
    :cond_12d
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/rey/material/widget/YearPicker;->mOutInterpolator:Landroid/view/animation/Interpolator;

    if-nez v14, :cond_13c

    .line 178
    new-instance v14, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v14}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/rey/material/widget/YearPicker;->mOutInterpolator:Landroid/view/animation/Interpolator;

    .line 180
    :cond_13c
    if-nez v8, :cond_140

    if-ltz v10, :cond_14a

    .line 181
    :cond_140
    move-object/from16 v0, p1

    invoke-static {v0, v8, v10}, Lcom/rey/material/util/TypefaceUtil;->load(Landroid/content/Context;Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v14

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/rey/material/widget/YearPicker;->mTypeface:Landroid/graphics/Typeface;

    .line 183
    :cond_14a
    if-gez v13, :cond_14e

    if-ltz v12, :cond_16c

    .line 184
    :cond_14e
    if-gez v13, :cond_158

    .line 185
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/rey/material/widget/YearPicker;->mAdapter:Lcom/rey/material/widget/YearPicker$YearAdapter;

    invoke-virtual {v14}, Lcom/rey/material/widget/YearPicker$YearAdapter;->getMinYear()I

    move-result v13

    .line 187
    :cond_158
    if-gez v12, :cond_162

    .line 188
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/rey/material/widget/YearPicker;->mAdapter:Lcom/rey/material/widget/YearPicker$YearAdapter;

    invoke-virtual {v14}, Lcom/rey/material/widget/YearPicker$YearAdapter;->getMaxYear()I

    move-result v12

    .line 190
    :cond_162
    if-ge v12, v13, :cond_167

    .line 191
    const v12, 0x7fffffff

    .line 193
    :cond_167
    move-object/from16 v0, p0

    invoke-virtual {v0, v13, v12}, Lcom/rey/material/widget/YearPicker;->setYearRange(II)V

    .line 196
    :cond_16c
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/rey/material/widget/YearPicker;->mAdapter:Lcom/rey/material/widget/YearPicker$YearAdapter;

    invoke-virtual {v14}, Lcom/rey/material/widget/YearPicker$YearAdapter;->getYear()I

    move-result v14

    if-gez v14, :cond_181

    if-gez v11, :cond_181

    .line 197
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v6

    .line 198
    .local v6, "cal":Ljava/util/Calendar;
    const/4 v14, 0x1

    invoke-virtual {v6, v14}, Ljava/util/Calendar;->get(I)I

    move-result v11

    .line 201
    .end local v6    # "cal":Ljava/util/Calendar;
    :cond_181
    if-ltz v11, :cond_190

    .line 202
    invoke-static {v12, v11}, Ljava/lang/Math;->min(II)I

    move-result v14

    invoke-static {v13, v14}, Ljava/lang/Math;->max(II)I

    move-result v11

    .line 203
    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Lcom/rey/material/widget/YearPicker;->setYear(I)V

    .line 206
    :cond_190
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/rey/material/widget/YearPicker;->mAdapter:Lcom/rey/material/widget/YearPicker$YearAdapter;

    invoke-virtual {v14}, Lcom/rey/material/widget/YearPicker$YearAdapter;->notifyDataSetChanged()V

    .line 207
    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/YearPicker;->requestLayout()V

    .line 208
    return-void
.end method

.method public getYear()I
    .registers 2

    .prologue
    .line 259
    iget-object v0, p0, Lcom/rey/material/widget/YearPicker;->mAdapter:Lcom/rey/material/widget/YearPicker$YearAdapter;

    invoke-virtual {v0}, Lcom/rey/material/widget/YearPicker$YearAdapter;->getYear()I

    move-result v0

    return v0
.end method

.method public goTo(I)V
    .registers 6
    .param p1, "year"    # I

    .prologue
    .line 224
    iget-object v2, p0, Lcom/rey/material/widget/YearPicker;->mAdapter:Lcom/rey/material/widget/YearPicker$YearAdapter;

    invoke-virtual {v2, p1}, Lcom/rey/material/widget/YearPicker$YearAdapter;->positionOfYear(I)I

    move-result v2

    iget v3, p0, Lcom/rey/material/widget/YearPicker;->mPositionShift:I

    sub-int v1, v2, v3

    .line 225
    .local v1, "position":I
    iget v0, p0, Lcom/rey/material/widget/YearPicker;->mDistanceShift:I

    .line 226
    .local v0, "offset":I
    if-gez v1, :cond_10

    .line 227
    const/4 v1, 0x0

    .line 228
    const/4 v0, 0x0

    .line 230
    :cond_10
    invoke-virtual {p0, v1, v0}, Lcom/rey/material/widget/YearPicker;->postSetSelectionFromTop(II)V

    .line 231
    return-void
.end method

.method protected init(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    const/4 v2, 0x0

    const/4 v1, -0x1

    .line 95
    iput v1, p0, Lcom/rey/material/widget/YearPicker;->mTextSize:I

    .line 96
    iput v1, p0, Lcom/rey/material/widget/YearPicker;->mItemHeight:I

    .line 97
    iput v1, p0, Lcom/rey/material/widget/YearPicker;->mAnimDuration:I

    .line 98
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    iput-object v0, p0, Lcom/rey/material/widget/YearPicker;->mTypeface:Landroid/graphics/Typeface;

    .line 99
    iput v1, p0, Lcom/rey/material/widget/YearPicker;->mItemRealHeight:I

    .line 101
    invoke-virtual {p0, v2}, Lcom/rey/material/widget/YearPicker;->setWillNotDraw(Z)V

    .line 102
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/rey/material/widget/YearPicker;->mPaint:Landroid/graphics/Paint;

    .line 103
    iget-object v0, p0, Lcom/rey/material/widget/YearPicker;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 105
    new-instance v0, Lcom/rey/material/widget/YearPicker$YearAdapter;

    invoke-direct {v0, p0}, Lcom/rey/material/widget/YearPicker$YearAdapter;-><init>(Lcom/rey/material/widget/YearPicker;)V

    iput-object v0, p0, Lcom/rey/material/widget/YearPicker;->mAdapter:Lcom/rey/material/widget/YearPicker$YearAdapter;

    .line 106
    iget-object v0, p0, Lcom/rey/material/widget/YearPicker;->mAdapter:Lcom/rey/material/widget/YearPicker$YearAdapter;

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/YearPicker;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 107
    const/high16 v0, 0x2000000

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/YearPicker;->setScrollBarStyle(I)V

    .line 108
    invoke-static {}, Lcom/rey/material/drawable/BlankDrawable;->getInstance()Lcom/rey/material/drawable/BlankDrawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/YearPicker;->setSelector(Landroid/graphics/drawable/Drawable;)V

    .line 109
    invoke-virtual {p0, v2}, Lcom/rey/material/widget/YearPicker;->setDividerHeight(I)V

    .line 110
    invoke-virtual {p0, v2}, Lcom/rey/material/widget/YearPicker;->setCacheColorHint(I)V

    .line 111
    invoke-virtual {p0, v2}, Lcom/rey/material/widget/YearPicker;->setClipToPadding(Z)V

    .line 113
    const/4 v0, 0x4

    invoke-static {p1, v0}, Lcom/rey/material/util/ThemeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v0

    iput v0, p0, Lcom/rey/material/widget/YearPicker;->mPadding:I

    .line 115
    const/high16 v0, -0x1000000

    invoke-static {p1, v0}, Lcom/rey/material/util/ThemeUtil;->colorPrimary(Landroid/content/Context;I)I

    move-result v0

    iput v0, p0, Lcom/rey/material/widget/YearPicker;->mSelectionColor:I

    .line 117
    invoke-super {p0, p1, p2, p3, p4}, Lcom/rey/material/widget/ListView;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 118
    return-void
.end method

.method protected onMeasure(II)V
    .registers 9
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    const/high16 v5, 0x40000000    # 2.0f

    .line 280
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    .line 281
    .local v0, "heightMode":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    .line 283
    .local v1, "heightSize":I
    invoke-direct {p0}, Lcom/rey/material/widget/YearPicker;->measureItemHeight()V

    .line 285
    if-eq v0, v5, :cond_3c

    .line 286
    const/high16 v3, -0x80000000

    if-ne v0, v3, :cond_40

    .line 287
    iget-object v3, p0, Lcom/rey/material/widget/YearPicker;->mAdapter:Lcom/rey/material/widget/YearPicker$YearAdapter;

    invoke-virtual {v3}, Lcom/rey/material/widget/YearPicker$YearAdapter;->getCount()I

    move-result v3

    iget v4, p0, Lcom/rey/material/widget/YearPicker;->mItemRealHeight:I

    div-int v4, v1, v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 288
    .local v2, "num":I
    const/4 v3, 0x3

    if-lt v2, v3, :cond_2e

    .line 289
    iget v3, p0, Lcom/rey/material/widget/YearPicker;->mItemRealHeight:I

    rem-int/lit8 v4, v2, 0x2

    if-nez v4, :cond_2c

    add-int/lit8 v2, v2, -0x1

    .end local v2    # "num":I
    :cond_2c
    mul-int v1, v3, v2

    .line 293
    :cond_2e
    :goto_2e
    invoke-virtual {p0}, Lcom/rey/material/widget/YearPicker;->getPaddingTop()I

    move-result v3

    add-int/2addr v3, v1

    invoke-virtual {p0}, Lcom/rey/material/widget/YearPicker;->getPaddingBottom()I

    move-result v4

    add-int/2addr v3, v4

    invoke-static {v3, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    .line 296
    :cond_3c
    invoke-super {p0, p1, p2}, Lcom/rey/material/widget/ListView;->onMeasure(II)V

    .line 297
    return-void

    .line 292
    :cond_40
    iget v3, p0, Lcom/rey/material/widget/YearPicker;->mItemRealHeight:I

    iget-object v4, p0, Lcom/rey/material/widget/YearPicker;->mAdapter:Lcom/rey/material/widget/YearPicker$YearAdapter;

    invoke-virtual {v4}, Lcom/rey/material/widget/YearPicker$YearAdapter;->getCount()I

    move-result v4

    mul-int v1, v3, v4

    goto :goto_2e
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 5
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 420
    move-object v0, p1

    check-cast v0, Lcom/rey/material/widget/YearPicker$SavedState;

    .line 421
    .local v0, "ss":Lcom/rey/material/widget/YearPicker$SavedState;
    invoke-virtual {v0}, Lcom/rey/material/widget/YearPicker$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Lcom/rey/material/widget/ListView;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 422
    iget v1, v0, Lcom/rey/material/widget/YearPicker$SavedState;->yearMin:I

    iget v2, v0, Lcom/rey/material/widget/YearPicker$SavedState;->yearMax:I

    invoke-virtual {p0, v1, v2}, Lcom/rey/material/widget/YearPicker;->setYearRange(II)V

    .line 423
    iget v1, v0, Lcom/rey/material/widget/YearPicker$SavedState;->year:I

    invoke-virtual {p0, v1}, Lcom/rey/material/widget/YearPicker;->setYear(I)V

    .line 424
    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .registers 4

    .prologue
    .line 407
    invoke-super {p0}, Lcom/rey/material/widget/ListView;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    .line 409
    .local v1, "superState":Landroid/os/Parcelable;
    new-instance v0, Lcom/rey/material/widget/YearPicker$SavedState;

    invoke-direct {v0, v1}, Lcom/rey/material/widget/YearPicker$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 411
    .local v0, "ss":Lcom/rey/material/widget/YearPicker$SavedState;
    iget-object v2, p0, Lcom/rey/material/widget/YearPicker;->mAdapter:Lcom/rey/material/widget/YearPicker$YearAdapter;

    invoke-virtual {v2}, Lcom/rey/material/widget/YearPicker$YearAdapter;->getMinYear()I

    move-result v2

    iput v2, v0, Lcom/rey/material/widget/YearPicker$SavedState;->yearMin:I

    .line 412
    iget-object v2, p0, Lcom/rey/material/widget/YearPicker;->mAdapter:Lcom/rey/material/widget/YearPicker$YearAdapter;

    invoke-virtual {v2}, Lcom/rey/material/widget/YearPicker$YearAdapter;->getMaxYear()I

    move-result v2

    iput v2, v0, Lcom/rey/material/widget/YearPicker$SavedState;->yearMax:I

    .line 413
    iget-object v2, p0, Lcom/rey/material/widget/YearPicker;->mAdapter:Lcom/rey/material/widget/YearPicker$YearAdapter;

    invoke-virtual {v2}, Lcom/rey/material/widget/YearPicker$YearAdapter;->getYear()I

    move-result v2

    iput v2, v0, Lcom/rey/material/widget/YearPicker$SavedState;->year:I

    .line 415
    return-object v0
.end method

.method protected onSizeChanged(IIII)V
    .registers 8
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    .line 301
    int-to-float v1, p2

    iget v2, p0, Lcom/rey/material/widget/YearPicker;->mItemRealHeight:I

    int-to-float v2, v2

    div-float/2addr v1, v2

    const/high16 v2, 0x3f800000    # 1.0f

    sub-float/2addr v1, v2

    const/high16 v2, 0x40000000    # 2.0f

    div-float v0, v1, v2

    .line 302
    .local v0, "shift":F
    float-to-double v1, v0

    invoke-static {v1, v2}, Ljava/lang/Math;->floor(D)D

    move-result-wide v1

    double-to-int v1, v1

    iput v1, p0, Lcom/rey/material/widget/YearPicker;->mPositionShift:I

    .line 303
    iget v1, p0, Lcom/rey/material/widget/YearPicker;->mPositionShift:I

    int-to-float v1, v1

    cmpl-float v1, v0, v1

    if-lez v1, :cond_3c

    iget v1, p0, Lcom/rey/material/widget/YearPicker;->mPositionShift:I

    add-int/lit8 v1, v1, 0x1

    :goto_1f
    iput v1, p0, Lcom/rey/material/widget/YearPicker;->mPositionShift:I

    .line 304
    iget v1, p0, Lcom/rey/material/widget/YearPicker;->mPositionShift:I

    int-to-float v1, v1

    sub-float v1, v0, v1

    iget v2, p0, Lcom/rey/material/widget/YearPicker;->mItemRealHeight:I

    int-to-float v2, v2

    mul-float/2addr v1, v2

    float-to-int v1, v1

    invoke-virtual {p0}, Lcom/rey/material/widget/YearPicker;->getPaddingTop()I

    move-result v2

    sub-int/2addr v1, v2

    iput v1, p0, Lcom/rey/material/widget/YearPicker;->mDistanceShift:I

    .line 305
    iget-object v1, p0, Lcom/rey/material/widget/YearPicker;->mAdapter:Lcom/rey/material/widget/YearPicker$YearAdapter;

    invoke-virtual {v1}, Lcom/rey/material/widget/YearPicker$YearAdapter;->getYear()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/rey/material/widget/YearPicker;->goTo(I)V

    .line 306
    return-void

    .line 303
    :cond_3c
    iget v1, p0, Lcom/rey/material/widget/YearPicker;->mPositionShift:I

    goto :goto_1f
.end method

.method public postSetSelectionFromTop(II)V
    .registers 4
    .param p1, "position"    # I
    .param p2, "offset"    # I

    .prologue
    .line 234
    new-instance v0, Lcom/rey/material/widget/YearPicker$1;

    invoke-direct {v0, p0, p1, p2}, Lcom/rey/material/widget/YearPicker$1;-><init>(Lcom/rey/material/widget/YearPicker;II)V

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/YearPicker;->post(Ljava/lang/Runnable;)Z

    .line 241
    return-void
.end method

.method public setOnYearChangedListener(Lcom/rey/material/widget/YearPicker$OnYearChangedListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/rey/material/widget/YearPicker$OnYearChangedListener;

    .prologue
    .line 267
    iput-object p1, p0, Lcom/rey/material/widget/YearPicker;->mOnYearChangedListener:Lcom/rey/material/widget/YearPicker$OnYearChangedListener;

    .line 268
    return-void
.end method

.method public setYear(I)V
    .registers 3
    .param p1, "year"    # I

    .prologue
    .line 248
    iget-object v0, p0, Lcom/rey/material/widget/YearPicker;->mAdapter:Lcom/rey/material/widget/YearPicker$YearAdapter;

    invoke-virtual {v0}, Lcom/rey/material/widget/YearPicker$YearAdapter;->getYear()I

    move-result v0

    if-ne v0, p1, :cond_9

    .line 253
    :goto_8
    return-void

    .line 251
    :cond_9
    iget-object v0, p0, Lcom/rey/material/widget/YearPicker;->mAdapter:Lcom/rey/material/widget/YearPicker$YearAdapter;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/YearPicker$YearAdapter;->setYear(I)V

    .line 252
    invoke-virtual {p0, p1}, Lcom/rey/material/widget/YearPicker;->goTo(I)V

    goto :goto_8
.end method

.method public setYearRange(II)V
    .registers 4
    .param p1, "min"    # I
    .param p2, "max"    # I

    .prologue
    .line 216
    iget-object v0, p0, Lcom/rey/material/widget/YearPicker;->mAdapter:Lcom/rey/material/widget/YearPicker$YearAdapter;

    invoke-virtual {v0, p1, p2}, Lcom/rey/material/widget/YearPicker$YearAdapter;->setYearRange(II)V

    .line 217
    return-void
.end method
