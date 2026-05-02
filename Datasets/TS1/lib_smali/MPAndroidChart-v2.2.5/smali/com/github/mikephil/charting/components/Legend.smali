.class public Lcom/github/mikephil/charting/components/Legend;
.super Lcom/github/mikephil/charting/components/ComponentBase;
.source "Legend.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/github/mikephil/charting/components/Legend$1;,
        Lcom/github/mikephil/charting/components/Legend$LegendDirection;,
        Lcom/github/mikephil/charting/components/Legend$LegendOrientation;,
        Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;,
        Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;,
        Lcom/github/mikephil/charting/components/Legend$LegendForm;,
        Lcom/github/mikephil/charting/components/Legend$LegendPosition;
    }
.end annotation


# instance fields
.field private mCalculatedLabelBreakPoints:[Ljava/lang/Boolean;

.field private mCalculatedLabelSizes:[Lcom/github/mikephil/charting/utils/FSize;

.field private mCalculatedLineSizes:[Lcom/github/mikephil/charting/utils/FSize;

.field private mColors:[I

.field private mDirection:Lcom/github/mikephil/charting/components/Legend$LegendDirection;

.field private mDrawInside:Z

.field private mExtraColors:[I

.field private mExtraLabels:[Ljava/lang/String;

.field private mFormSize:F

.field private mFormToTextSpace:F

.field private mHorizontalAlignment:Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;

.field private mIsLegendCustom:Z

.field private mLabels:[Ljava/lang/String;

.field private mMaxSizePercent:F

.field public mNeededHeight:F

.field public mNeededWidth:F

.field private mOrientation:Lcom/github/mikephil/charting/components/Legend$LegendOrientation;

.field private mShape:Lcom/github/mikephil/charting/components/Legend$LegendForm;

.field private mStackSpace:F

.field public mTextHeightMax:F

.field public mTextWidthMax:F

.field private mVerticalAlignment:Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;

.field private mWordWrapEnabled:Z

.field private mXEntrySpace:F

.field private mYEntrySpace:F


# direct methods
.method public constructor <init>()V
    .registers 7

    .prologue
    const/high16 v5, 0x40c00000    # 6.0f

    const/high16 v4, 0x40a00000    # 5.0f

    const/high16 v3, 0x40400000    # 3.0f

    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 122
    invoke-direct {p0}, Lcom/github/mikephil/charting/components/ComponentBase;-><init>()V

    .line 82
    iput-boolean v2, p0, Lcom/github/mikephil/charting/components/Legend;->mIsLegendCustom:Z

    .line 84
    sget-object v0, Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;->LEFT:Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;

    iput-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mHorizontalAlignment:Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;

    .line 85
    sget-object v0, Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;->BOTTOM:Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;

    iput-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mVerticalAlignment:Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;

    .line 86
    sget-object v0, Lcom/github/mikephil/charting/components/Legend$LegendOrientation;->HORIZONTAL:Lcom/github/mikephil/charting/components/Legend$LegendOrientation;

    iput-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mOrientation:Lcom/github/mikephil/charting/components/Legend$LegendOrientation;

    .line 87
    iput-boolean v2, p0, Lcom/github/mikephil/charting/components/Legend;->mDrawInside:Z

    .line 90
    sget-object v0, Lcom/github/mikephil/charting/components/Legend$LegendDirection;->LEFT_TO_RIGHT:Lcom/github/mikephil/charting/components/Legend$LegendDirection;

    iput-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mDirection:Lcom/github/mikephil/charting/components/Legend$LegendDirection;

    .line 93
    sget-object v0, Lcom/github/mikephil/charting/components/Legend$LegendForm;->SQUARE:Lcom/github/mikephil/charting/components/Legend$LegendForm;

    iput-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mShape:Lcom/github/mikephil/charting/components/Legend$LegendForm;

    .line 96
    const/high16 v0, 0x41000000    # 8.0f

    iput v0, p0, Lcom/github/mikephil/charting/components/Legend;->mFormSize:F

    .line 101
    iput v5, p0, Lcom/github/mikephil/charting/components/Legend;->mXEntrySpace:F

    .line 106
    iput v1, p0, Lcom/github/mikephil/charting/components/Legend;->mYEntrySpace:F

    .line 113
    iput v4, p0, Lcom/github/mikephil/charting/components/Legend;->mFormToTextSpace:F

    .line 116
    iput v3, p0, Lcom/github/mikephil/charting/components/Legend;->mStackSpace:F

    .line 119
    const v0, 0x3f733333    # 0.95f

    iput v0, p0, Lcom/github/mikephil/charting/components/Legend;->mMaxSizePercent:F

    .line 734
    iput v1, p0, Lcom/github/mikephil/charting/components/Legend;->mNeededWidth:F

    .line 737
    iput v1, p0, Lcom/github/mikephil/charting/components/Legend;->mNeededHeight:F

    .line 739
    iput v1, p0, Lcom/github/mikephil/charting/components/Legend;->mTextHeightMax:F

    .line 741
    iput v1, p0, Lcom/github/mikephil/charting/components/Legend;->mTextWidthMax:F

    .line 744
    iput-boolean v2, p0, Lcom/github/mikephil/charting/components/Legend;->mWordWrapEnabled:Z

    .line 795
    new-array v0, v2, [Lcom/github/mikephil/charting/utils/FSize;

    iput-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mCalculatedLabelSizes:[Lcom/github/mikephil/charting/utils/FSize;

    .line 796
    new-array v0, v2, [Ljava/lang/Boolean;

    iput-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mCalculatedLabelBreakPoints:[Ljava/lang/Boolean;

    .line 797
    new-array v0, v2, [Lcom/github/mikephil/charting/utils/FSize;

    iput-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mCalculatedLineSizes:[Lcom/github/mikephil/charting/utils/FSize;

    .line 124
    const/high16 v0, 0x41000000    # 8.0f

    invoke-static {v0}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/components/Legend;->mFormSize:F

    .line 125
    invoke-static {v5}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/components/Legend;->mXEntrySpace:F

    .line 126
    invoke-static {v1}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/components/Legend;->mYEntrySpace:F

    .line 127
    invoke-static {v4}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/components/Legend;->mFormToTextSpace:F

    .line 128
    const/high16 v0, 0x41200000    # 10.0f

    invoke-static {v0}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/components/Legend;->mTextSize:F

    .line 129
    invoke-static {v3}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/components/Legend;->mStackSpace:F

    .line 130
    invoke-static {v4}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/components/Legend;->mXOffset:F

    .line 131
    invoke-static {v3}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/components/Legend;->mYOffset:F

    .line 132
    return-void
.end method

.method public constructor <init>(Ljava/util/List;Ljava/util/List;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 163
    .local p1, "colors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local p2, "labels":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {p0}, Lcom/github/mikephil/charting/components/Legend;-><init>()V

    .line 165
    if-eqz p1, :cond_7

    if-nez p2, :cond_f

    .line 166
    :cond_7
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "colors array or labels array is NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 169
    :cond_f
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v1

    if-eq v0, v1, :cond_21

    .line 170
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "colors array and labels array need to be of same size"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 174
    :cond_21
    invoke-static {p1}, Lcom/github/mikephil/charting/utils/Utils;->convertIntegers(Ljava/util/List;)[I

    move-result-object v0

    iput-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mColors:[I

    .line 175
    invoke-static {p2}, Lcom/github/mikephil/charting/utils/Utils;->convertStrings(Ljava/util/List;)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mLabels:[Ljava/lang/String;

    .line 176
    return-void
.end method

.method public constructor <init>([I[Ljava/lang/String;)V
    .registers 5
    .param p1, "colors"    # [I
    .param p2, "labels"    # [Ljava/lang/String;

    .prologue
    .line 141
    invoke-direct {p0}, Lcom/github/mikephil/charting/components/Legend;-><init>()V

    .line 143
    if-eqz p1, :cond_7

    if-nez p2, :cond_f

    .line 144
    :cond_7
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "colors array or labels array is NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 147
    :cond_f
    array-length v0, p1

    array-length v1, p2

    if-eq v0, v1, :cond_1b

    .line 148
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "colors array and labels array need to be of same size"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 152
    :cond_1b
    iput-object p1, p0, Lcom/github/mikephil/charting/components/Legend;->mColors:[I

    .line 153
    iput-object p2, p0, Lcom/github/mikephil/charting/components/Legend;->mLabels:[Ljava/lang/String;

    .line 154
    return-void
.end method


# virtual methods
.method public calculateDimensions(Landroid/graphics/Paint;Lcom/github/mikephil/charting/utils/ViewPortHandler;)V
    .registers 27
    .param p1, "labelpaint"    # Landroid/graphics/Paint;
    .param p2, "viewPortHandler"    # Lcom/github/mikephil/charting/utils/ViewPortHandler;

    .prologue
    .line 820
    invoke-virtual/range {p0 .. p1}, Lcom/github/mikephil/charting/components/Legend;->getMaximumEntryWidth(Landroid/graphics/Paint;)F

    move-result v21

    move/from16 v0, v21

    move-object/from16 v1, p0

    iput v0, v1, Lcom/github/mikephil/charting/components/Legend;->mTextWidthMax:F

    .line 821
    invoke-virtual/range {p0 .. p1}, Lcom/github/mikephil/charting/components/Legend;->getMaximumEntryHeight(Landroid/graphics/Paint;)F

    move-result v21

    move/from16 v0, v21

    move-object/from16 v1, p0

    iput v0, v1, Lcom/github/mikephil/charting/components/Legend;->mTextHeightMax:F

    .line 823
    sget-object v21, Lcom/github/mikephil/charting/components/Legend$1;->$SwitchMap$com$github$mikephil$charting$components$Legend$LegendOrientation:[I

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/components/Legend;->mOrientation:Lcom/github/mikephil/charting/components/Legend$LegendOrientation;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lcom/github/mikephil/charting/components/Legend$LegendOrientation;->ordinal()I

    move-result v22

    aget v21, v21, v22

    packed-switch v21, :pswitch_data_2dc

    .line 983
    :goto_25
    return-void

    .line 826
    :pswitch_26
    const/4 v15, 0x0

    .local v15, "maxWidth":F
    const/4 v13, 0x0

    .local v13, "maxHeight":F
    const/16 v20, 0x0

    .line 827
    .local v20, "width":F
    invoke-static/range {p1 .. p1}, Lcom/github/mikephil/charting/utils/Utils;->getLineHeight(Landroid/graphics/Paint;)F

    move-result v11

    .line 828
    .local v11, "labelLineHeight":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/components/Legend;->mLabels:[Ljava/lang/String;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    array-length v6, v0

    .line 829
    .local v6, "count":I
    const/16 v19, 0x0

    .line 831
    .local v19, "wasStacked":Z
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_3a
    if-ge v9, v6, :cond_de

    .line 833
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/components/Legend;->mColors:[I

    move-object/from16 v21, v0

    aget v21, v21, v9

    const v22, 0x112234

    move/from16 v0, v21

    move/from16 v1, v22

    if-eq v0, v1, :cond_ac

    const/4 v8, 0x1

    .line 835
    .local v8, "drawingForm":Z
    :goto_4e
    if-nez v19, :cond_52

    .line 836
    const/16 v20, 0x0

    .line 838
    :cond_52
    if-eqz v8, :cond_66

    .line 839
    if-eqz v19, :cond_5e

    .line 840
    move-object/from16 v0, p0

    iget v0, v0, Lcom/github/mikephil/charting/components/Legend;->mStackSpace:F

    move/from16 v21, v0

    add-float v20, v20, v21

    .line 841
    :cond_5e
    move-object/from16 v0, p0

    iget v0, v0, Lcom/github/mikephil/charting/components/Legend;->mFormSize:F

    move/from16 v21, v0

    add-float v20, v20, v21

    .line 845
    :cond_66
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/components/Legend;->mLabels:[Ljava/lang/String;

    move-object/from16 v21, v0

    aget-object v21, v21, v9

    if-eqz v21, :cond_c5

    .line 848
    if-eqz v8, :cond_ae

    if-nez v19, :cond_ae

    .line 849
    move-object/from16 v0, p0

    iget v0, v0, Lcom/github/mikephil/charting/components/Legend;->mFormToTextSpace:F

    move/from16 v21, v0

    add-float v20, v20, v21

    .line 857
    :cond_7c
    :goto_7c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/components/Legend;->mLabels:[Ljava/lang/String;

    move-object/from16 v21, v0

    aget-object v21, v21, v9

    move-object/from16 v0, p1

    move-object/from16 v1, v21

    invoke-static {v0, v1}, Lcom/github/mikephil/charting/utils/Utils;->calcTextWidth(Landroid/graphics/Paint;Ljava/lang/String;)I

    move-result v21

    move/from16 v0, v21

    int-to-float v0, v0

    move/from16 v21, v0

    add-float v20, v20, v21

    .line 859
    add-int/lit8 v21, v6, -0x1

    move/from16 v0, v21

    if-ge v9, v0, :cond_a3

    .line 860
    move-object/from16 v0, p0

    iget v0, v0, Lcom/github/mikephil/charting/components/Legend;->mYEntrySpace:F

    move/from16 v21, v0

    add-float v21, v21, v11

    add-float v13, v13, v21

    .line 869
    :cond_a3
    :goto_a3
    move/from16 v0, v20

    invoke-static {v15, v0}, Ljava/lang/Math;->max(FF)F

    move-result v15

    .line 831
    add-int/lit8 v9, v9, 0x1

    goto :goto_3a

    .line 833
    .end local v8    # "drawingForm":Z
    :cond_ac
    const/4 v8, 0x0

    goto :goto_4e

    .line 850
    .restart local v8    # "drawingForm":Z
    :cond_ae
    if-eqz v19, :cond_7c

    .line 851
    move/from16 v0, v20

    invoke-static {v15, v0}, Ljava/lang/Math;->max(FF)F

    move-result v15

    .line 852
    move-object/from16 v0, p0

    iget v0, v0, Lcom/github/mikephil/charting/components/Legend;->mYEntrySpace:F

    move/from16 v21, v0

    add-float v21, v21, v11

    add-float v13, v13, v21

    .line 853
    const/16 v20, 0x0

    .line 854
    const/16 v19, 0x0

    goto :goto_7c

    .line 863
    :cond_c5
    const/16 v19, 0x1

    .line 864
    move-object/from16 v0, p0

    iget v0, v0, Lcom/github/mikephil/charting/components/Legend;->mFormSize:F

    move/from16 v21, v0

    add-float v20, v20, v21

    .line 865
    add-int/lit8 v21, v6, -0x1

    move/from16 v0, v21

    if-ge v9, v0, :cond_a3

    .line 866
    move-object/from16 v0, p0

    iget v0, v0, Lcom/github/mikephil/charting/components/Legend;->mStackSpace:F

    move/from16 v21, v0

    add-float v20, v20, v21

    goto :goto_a3

    .line 872
    .end local v8    # "drawingForm":Z
    :cond_de
    move-object/from16 v0, p0

    iput v15, v0, Lcom/github/mikephil/charting/components/Legend;->mNeededWidth:F

    .line 873
    move-object/from16 v0, p0

    iput v13, v0, Lcom/github/mikephil/charting/components/Legend;->mNeededHeight:F

    goto/16 :goto_25

    .line 879
    .end local v6    # "count":I
    .end local v9    # "i":I
    .end local v11    # "labelLineHeight":F
    .end local v13    # "maxHeight":F
    .end local v15    # "maxWidth":F
    .end local v19    # "wasStacked":Z
    .end local v20    # "width":F
    :pswitch_e8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/components/Legend;->mLabels:[Ljava/lang/String;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    array-length v10, v0

    .line 880
    .local v10, "labelCount":I
    invoke-static/range {p1 .. p1}, Lcom/github/mikephil/charting/utils/Utils;->getLineHeight(Landroid/graphics/Paint;)F

    move-result v11

    .line 881
    .restart local v11    # "labelLineHeight":F
    invoke-static/range {p1 .. p1}, Lcom/github/mikephil/charting/utils/Utils;->getLineSpacing(Landroid/graphics/Paint;)F

    move-result v21

    move-object/from16 v0, p0

    iget v0, v0, Lcom/github/mikephil/charting/components/Legend;->mYEntrySpace:F

    move/from16 v22, v0

    add-float v12, v21, v22

    .line 882
    .local v12, "labelLineSpacing":F
    invoke-virtual/range {p2 .. p2}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentWidth()F

    move-result v21

    move-object/from16 v0, p0

    iget v0, v0, Lcom/github/mikephil/charting/components/Legend;->mMaxSizePercent:F

    move/from16 v22, v0

    mul-float v5, v21, v22

    .line 885
    .local v5, "contentWidth":F
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v10}, Ljava/util/ArrayList;-><init>(I)V

    .line 886
    .local v3, "calculatedLabelSizes":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/github/mikephil/charting/utils/FSize;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v10}, Ljava/util/ArrayList;-><init>(I)V

    .line 887
    .local v2, "calculatedLabelBreakPoints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Boolean;>;"
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 890
    .local v4, "calculatedLineSizes":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/github/mikephil/charting/utils/FSize;>;"
    const/4 v14, 0x0

    .line 891
    .local v14, "maxLineWidth":F
    const/4 v7, 0x0

    .line 892
    .local v7, "currentLineWidth":F
    const/16 v17, 0x0

    .line 893
    .local v17, "requiredWidth":F
    const/16 v18, -0x1

    .line 895
    .local v18, "stackedStartIndex":I
    const/4 v9, 0x0

    .restart local v9    # "i":I
    :goto_123
    if-ge v9, v10, :cond_24f

    .line 897
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/components/Legend;->mColors:[I

    move-object/from16 v21, v0

    aget v21, v21, v9

    const v22, 0x112234

    move/from16 v0, v21

    move/from16 v1, v22

    if-eq v0, v1, :cond_1e3

    const/4 v8, 0x1

    .line 899
    .restart local v8    # "drawingForm":Z
    :goto_137
    const/16 v21, 0x0

    invoke-static/range {v21 .. v21}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 901
    const/16 v21, -0x1

    move/from16 v0, v18

    move/from16 v1, v21

    if-ne v0, v1, :cond_1e6

    .line 904
    const/16 v17, 0x0

    .line 912
    :goto_14c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/components/Legend;->mLabels:[Ljava/lang/String;

    move-object/from16 v21, v0

    aget-object v21, v21, v9

    if-eqz v21, :cond_1f3

    .line 914
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/components/Legend;->mLabels:[Ljava/lang/String;

    move-object/from16 v21, v0

    aget-object v21, v21, v9

    move-object/from16 v0, p1

    move-object/from16 v1, v21

    invoke-static {v0, v1}, Lcom/github/mikephil/charting/utils/Utils;->calcTextSize(Landroid/graphics/Paint;Ljava/lang/String;)Lcom/github/mikephil/charting/utils/FSize;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 915
    if-eqz v8, :cond_1f0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/github/mikephil/charting/components/Legend;->mFormToTextSpace:F

    move/from16 v21, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/github/mikephil/charting/components/Legend;->mFormSize:F

    move/from16 v22, v0

    add-float v21, v21, v22

    :goto_17b
    add-float v17, v17, v21

    .line 916
    invoke-virtual {v3, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Lcom/github/mikephil/charting/utils/FSize;

    move-object/from16 v0, v21

    iget v0, v0, Lcom/github/mikephil/charting/utils/FSize;->width:F

    move/from16 v21, v0

    add-float v17, v17, v21

    .line 929
    :cond_18b
    :goto_18b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/components/Legend;->mLabels:[Ljava/lang/String;

    move-object/from16 v21, v0

    aget-object v21, v21, v9

    if-nez v21, :cond_19b

    add-int/lit8 v21, v10, -0x1

    move/from16 v0, v21

    if-ne v9, v0, :cond_1d3

    .line 931
    :cond_19b
    const/16 v21, 0x0

    cmpl-float v21, v7, v21

    if-nez v21, :cond_21a

    const/16 v16, 0x0

    .line 933
    .local v16, "requiredSpacing":F
    :goto_1a3
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/github/mikephil/charting/components/Legend;->mWordWrapEnabled:Z

    move/from16 v21, v0

    if-eqz v21, :cond_1b9

    const/16 v21, 0x0

    cmpl-float v21, v7, v21

    if-eqz v21, :cond_1b9

    sub-float v21, v5, v7

    add-float v22, v16, v17

    cmpl-float v21, v21, v22

    if-ltz v21, :cond_221

    .line 940
    :cond_1b9
    add-float v21, v16, v17

    add-float v7, v7, v21

    .line 955
    :goto_1bd
    add-int/lit8 v21, v10, -0x1

    move/from16 v0, v21

    if-ne v9, v0, :cond_1d3

    .line 957
    new-instance v21, Lcom/github/mikephil/charting/utils/FSize;

    move-object/from16 v0, v21

    invoke-direct {v0, v7, v11}, Lcom/github/mikephil/charting/utils/FSize;-><init>(FF)V

    move-object/from16 v0, v21

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 958
    invoke-static {v14, v7}, Ljava/lang/Math;->max(FF)F

    move-result v14

    .line 962
    .end local v16    # "requiredSpacing":F
    :cond_1d3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/components/Legend;->mLabels:[Ljava/lang/String;

    move-object/from16 v21, v0

    aget-object v21, v21, v9

    if-eqz v21, :cond_1df

    const/16 v18, -0x1

    .line 895
    :cond_1df
    add-int/lit8 v9, v9, 0x1

    goto/16 :goto_123

    .line 897
    .end local v8    # "drawingForm":Z
    :cond_1e3
    const/4 v8, 0x0

    goto/16 :goto_137

    .line 908
    .restart local v8    # "drawingForm":Z
    :cond_1e6
    move-object/from16 v0, p0

    iget v0, v0, Lcom/github/mikephil/charting/components/Legend;->mStackSpace:F

    move/from16 v21, v0

    add-float v17, v17, v21

    goto/16 :goto_14c

    .line 915
    :cond_1f0
    const/16 v21, 0x0

    goto :goto_17b

    .line 920
    :cond_1f3
    new-instance v21, Lcom/github/mikephil/charting/utils/FSize;

    const/16 v22, 0x0

    const/16 v23, 0x0

    invoke-direct/range {v21 .. v23}, Lcom/github/mikephil/charting/utils/FSize;-><init>(FF)V

    move-object/from16 v0, v21

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 921
    if-eqz v8, :cond_217

    move-object/from16 v0, p0

    iget v0, v0, Lcom/github/mikephil/charting/components/Legend;->mFormSize:F

    move/from16 v21, v0

    :goto_209
    add-float v17, v17, v21

    .line 923
    const/16 v21, -0x1

    move/from16 v0, v18

    move/from16 v1, v21

    if-ne v0, v1, :cond_18b

    .line 925
    move/from16 v18, v9

    goto/16 :goto_18b

    .line 921
    :cond_217
    const/16 v21, 0x0

    goto :goto_209

    .line 931
    :cond_21a
    move-object/from16 v0, p0

    iget v0, v0, Lcom/github/mikephil/charting/components/Legend;->mXEntrySpace:F

    move/from16 v16, v0

    goto :goto_1a3

    .line 945
    .restart local v16    # "requiredSpacing":F
    :cond_221
    new-instance v21, Lcom/github/mikephil/charting/utils/FSize;

    move-object/from16 v0, v21

    invoke-direct {v0, v7, v11}, Lcom/github/mikephil/charting/utils/FSize;-><init>(FF)V

    move-object/from16 v0, v21

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 946
    invoke-static {v14, v7}, Ljava/lang/Math;->max(FF)F

    move-result v14

    .line 949
    const/16 v21, -0x1

    move/from16 v0, v18

    move/from16 v1, v21

    if-le v0, v1, :cond_24c

    move/from16 v21, v18

    :goto_23b
    const/16 v22, 0x1

    invoke-static/range {v22 .. v22}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v22

    move/from16 v0, v21

    move-object/from16 v1, v22

    invoke-virtual {v2, v0, v1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 952
    move/from16 v7, v17

    goto/16 :goto_1bd

    :cond_24c
    move/from16 v21, v9

    .line 949
    goto :goto_23b

    .line 965
    .end local v8    # "drawingForm":Z
    .end local v16    # "requiredSpacing":F
    :cond_24f
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v21

    move/from16 v0, v21

    new-array v0, v0, [Lcom/github/mikephil/charting/utils/FSize;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v21

    check-cast v21, [Lcom/github/mikephil/charting/utils/FSize;

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/github/mikephil/charting/components/Legend;->mCalculatedLabelSizes:[Lcom/github/mikephil/charting/utils/FSize;

    .line 967
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v21

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Boolean;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v21

    check-cast v21, [Ljava/lang/Boolean;

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/github/mikephil/charting/components/Legend;->mCalculatedLabelBreakPoints:[Ljava/lang/Boolean;

    .line 969
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v21

    move/from16 v0, v21

    new-array v0, v0, [Lcom/github/mikephil/charting/utils/FSize;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v21

    check-cast v21, [Lcom/github/mikephil/charting/utils/FSize;

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/github/mikephil/charting/components/Legend;->mCalculatedLineSizes:[Lcom/github/mikephil/charting/utils/FSize;

    .line 972
    move-object/from16 v0, p0

    iput v14, v0, Lcom/github/mikephil/charting/components/Legend;->mNeededWidth:F

    .line 973
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/components/Legend;->mCalculatedLineSizes:[Lcom/github/mikephil/charting/utils/FSize;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    array-length v0, v0

    move/from16 v21, v0

    move/from16 v0, v21

    int-to-float v0, v0

    move/from16 v21, v0

    mul-float v22, v11, v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/components/Legend;->mCalculatedLineSizes:[Lcom/github/mikephil/charting/utils/FSize;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    array-length v0, v0

    move/from16 v21, v0

    if-nez v21, :cond_2cd

    const/16 v21, 0x0

    :goto_2bc
    move/from16 v0, v21

    int-to-float v0, v0

    move/from16 v21, v0

    mul-float v21, v21, v12

    add-float v21, v21, v22

    move/from16 v0, v21

    move-object/from16 v1, p0

    iput v0, v1, Lcom/github/mikephil/charting/components/Legend;->mNeededHeight:F

    goto/16 :goto_25

    :cond_2cd
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/components/Legend;->mCalculatedLineSizes:[Lcom/github/mikephil/charting/utils/FSize;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    array-length v0, v0

    move/from16 v21, v0

    add-int/lit8 v21, v21, -0x1

    goto :goto_2bc

    .line 823
    nop

    :pswitch_data_2dc
    .packed-switch 0x1
        :pswitch_26
        :pswitch_e8
    .end packed-switch
.end method

.method public getCalculatedLabelBreakPoints()[Ljava/lang/Boolean;
    .registers 2

    .prologue
    .line 804
    iget-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mCalculatedLabelBreakPoints:[Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCalculatedLabelSizes()[Lcom/github/mikephil/charting/utils/FSize;
    .registers 2

    .prologue
    .line 800
    iget-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mCalculatedLabelSizes:[Lcom/github/mikephil/charting/utils/FSize;

    return-object v0
.end method

.method public getCalculatedLineSizes()[Lcom/github/mikephil/charting/utils/FSize;
    .registers 2

    .prologue
    .line 808
    iget-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mCalculatedLineSizes:[Lcom/github/mikephil/charting/utils/FSize;

    return-object v0
.end method

.method public getColors()[I
    .registers 2

    .prologue
    .line 249
    iget-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mColors:[I

    return-object v0
.end method

.method public getDirection()Lcom/github/mikephil/charting/components/Legend$LegendDirection;
    .registers 2

    .prologue
    .line 551
    iget-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mDirection:Lcom/github/mikephil/charting/components/Legend$LegendDirection;

    return-object v0
.end method

.method public getExtraColors()[I
    .registers 2

    .prologue
    .line 276
    iget-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mExtraColors:[I

    return-object v0
.end method

.method public getExtraLabels()[Ljava/lang/String;
    .registers 2

    .prologue
    .line 284
    iget-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mExtraLabels:[Ljava/lang/String;

    return-object v0
.end method

.method public getForm()Lcom/github/mikephil/charting/components/Legend$LegendForm;
    .registers 2

    .prologue
    .line 569
    iget-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mShape:Lcom/github/mikephil/charting/components/Legend$LegendForm;

    return-object v0
.end method

.method public getFormSize()F
    .registers 2

    .prologue
    .line 597
    iget v0, p0, Lcom/github/mikephil/charting/components/Legend;->mFormSize:F

    return v0
.end method

.method public getFormToTextSpace()F
    .registers 2

    .prologue
    .line 645
    iget v0, p0, Lcom/github/mikephil/charting/components/Legend;->mFormToTextSpace:F

    return v0
.end method

.method public getFullHeight(Landroid/graphics/Paint;)F
    .registers 5
    .param p1, "labelpaint"    # Landroid/graphics/Paint;

    .prologue
    .line 716
    const/4 v0, 0x0

    .line 718
    .local v0, "height":F
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2
    iget-object v2, p0, Lcom/github/mikephil/charting/components/Legend;->mLabels:[Ljava/lang/String;

    array-length v2, v2

    if-ge v1, v2, :cond_24

    .line 721
    iget-object v2, p0, Lcom/github/mikephil/charting/components/Legend;->mLabels:[Ljava/lang/String;

    aget-object v2, v2, v1

    if-eqz v2, :cond_21

    .line 723
    iget-object v2, p0, Lcom/github/mikephil/charting/components/Legend;->mLabels:[Ljava/lang/String;

    aget-object v2, v2, v1

    invoke-static {p1, v2}, Lcom/github/mikephil/charting/utils/Utils;->calcTextHeight(Landroid/graphics/Paint;Ljava/lang/String;)I

    move-result v2

    int-to-float v2, v2

    add-float/2addr v0, v2

    .line 725
    iget-object v2, p0, Lcom/github/mikephil/charting/components/Legend;->mLabels:[Ljava/lang/String;

    array-length v2, v2

    add-int/lit8 v2, v2, -0x1

    if-ge v1, v2, :cond_21

    .line 726
    iget v2, p0, Lcom/github/mikephil/charting/components/Legend;->mYEntrySpace:F

    add-float/2addr v0, v2

    .line 718
    :cond_21
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 730
    :cond_24
    return v0
.end method

.method public getFullWidth(Landroid/graphics/Paint;)F
    .registers 6
    .param p1, "labelpaint"    # Landroid/graphics/Paint;

    .prologue
    .line 683
    const/4 v1, 0x0

    .line 685
    .local v1, "width":F
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2
    iget-object v2, p0, Lcom/github/mikephil/charting/components/Legend;->mLabels:[Ljava/lang/String;

    array-length v2, v2

    if-ge v0, v2, :cond_41

    .line 688
    iget-object v2, p0, Lcom/github/mikephil/charting/components/Legend;->mLabels:[Ljava/lang/String;

    aget-object v2, v2, v0

    if-eqz v2, :cond_33

    .line 691
    iget-object v2, p0, Lcom/github/mikephil/charting/components/Legend;->mColors:[I

    aget v2, v2, v0

    const v3, 0x112234

    if-eq v2, v3, :cond_1c

    .line 692
    iget v2, p0, Lcom/github/mikephil/charting/components/Legend;->mFormSize:F

    iget v3, p0, Lcom/github/mikephil/charting/components/Legend;->mFormToTextSpace:F

    add-float/2addr v2, v3

    add-float/2addr v1, v2

    .line 694
    :cond_1c
    iget-object v2, p0, Lcom/github/mikephil/charting/components/Legend;->mLabels:[Ljava/lang/String;

    aget-object v2, v2, v0

    invoke-static {p1, v2}, Lcom/github/mikephil/charting/utils/Utils;->calcTextWidth(Landroid/graphics/Paint;Ljava/lang/String;)I

    move-result v2

    int-to-float v2, v2

    add-float/2addr v1, v2

    .line 696
    iget-object v2, p0, Lcom/github/mikephil/charting/components/Legend;->mLabels:[Ljava/lang/String;

    array-length v2, v2

    add-int/lit8 v2, v2, -0x1

    if-ge v0, v2, :cond_30

    .line 697
    iget v2, p0, Lcom/github/mikephil/charting/components/Legend;->mXEntrySpace:F

    add-float/2addr v1, v2

    .line 685
    :cond_30
    :goto_30
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 699
    :cond_33
    iget v2, p0, Lcom/github/mikephil/charting/components/Legend;->mFormSize:F

    add-float/2addr v1, v2

    .line 700
    iget-object v2, p0, Lcom/github/mikephil/charting/components/Legend;->mLabels:[Ljava/lang/String;

    array-length v2, v2

    add-int/lit8 v2, v2, -0x1

    if-ge v0, v2, :cond_30

    .line 701
    iget v2, p0, Lcom/github/mikephil/charting/components/Legend;->mStackSpace:F

    add-float/2addr v1, v2

    goto :goto_30

    .line 705
    :cond_41
    return v1
.end method

.method public getHorizontalAlignment()Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;
    .registers 2

    .prologue
    .line 479
    iget-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mHorizontalAlignment:Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;

    return-object v0
.end method

.method public getLabel(I)Ljava/lang/String;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 268
    iget-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mLabels:[Ljava/lang/String;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public getLabels()[Ljava/lang/String;
    .registers 2

    .prologue
    .line 258
    iget-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mLabels:[Ljava/lang/String;

    return-object v0
.end method

.method public getMaxSizePercent()F
    .registers 2

    .prologue
    .line 780
    iget v0, p0, Lcom/github/mikephil/charting/components/Legend;->mMaxSizePercent:F

    return v0
.end method

.method public getMaximumEntryHeight(Landroid/graphics/Paint;)F
    .registers 6
    .param p1, "p"    # Landroid/graphics/Paint;

    .prologue
    .line 227
    const/4 v2, 0x0

    .line 229
    .local v2, "max":F
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2
    iget-object v3, p0, Lcom/github/mikephil/charting/components/Legend;->mLabels:[Ljava/lang/String;

    array-length v3, v3

    if-ge v0, v3, :cond_1e

    .line 231
    iget-object v3, p0, Lcom/github/mikephil/charting/components/Legend;->mLabels:[Ljava/lang/String;

    aget-object v3, v3, v0

    if-eqz v3, :cond_1b

    .line 233
    iget-object v3, p0, Lcom/github/mikephil/charting/components/Legend;->mLabels:[Ljava/lang/String;

    aget-object v3, v3, v0

    invoke-static {p1, v3}, Lcom/github/mikephil/charting/utils/Utils;->calcTextHeight(Landroid/graphics/Paint;Ljava/lang/String;)I

    move-result v3

    int-to-float v1, v3

    .line 235
    .local v1, "length":F
    cmpl-float v3, v1, v2

    if-lez v3, :cond_1b

    .line 236
    move v2, v1

    .line 229
    .end local v1    # "length":F
    :cond_1b
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 240
    :cond_1e
    return v2
.end method

.method public getMaximumEntryWidth(Landroid/graphics/Paint;)F
    .registers 7
    .param p1, "p"    # Landroid/graphics/Paint;

    .prologue
    .line 203
    const/4 v2, 0x0

    .line 205
    .local v2, "max":F
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2
    iget-object v3, p0, Lcom/github/mikephil/charting/components/Legend;->mLabels:[Ljava/lang/String;

    array-length v3, v3

    if-ge v0, v3, :cond_1e

    .line 207
    iget-object v3, p0, Lcom/github/mikephil/charting/components/Legend;->mLabels:[Ljava/lang/String;

    aget-object v3, v3, v0

    if-eqz v3, :cond_1b

    .line 209
    iget-object v3, p0, Lcom/github/mikephil/charting/components/Legend;->mLabels:[Ljava/lang/String;

    aget-object v3, v3, v0

    invoke-static {p1, v3}, Lcom/github/mikephil/charting/utils/Utils;->calcTextWidth(Landroid/graphics/Paint;Ljava/lang/String;)I

    move-result v3

    int-to-float v1, v3

    .line 211
    .local v1, "length":F
    cmpl-float v3, v1, v2

    if-lez v3, :cond_1b

    .line 212
    move v2, v1

    .line 205
    .end local v1    # "length":F
    :cond_1b
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 216
    :cond_1e
    iget v3, p0, Lcom/github/mikephil/charting/components/Legend;->mFormSize:F

    add-float/2addr v3, v2

    iget v4, p0, Lcom/github/mikephil/charting/components/Legend;->mFormToTextSpace:F

    add-float/2addr v3, v4

    return v3
.end method

.method public getOrientation()Lcom/github/mikephil/charting/components/Legend$LegendOrientation;
    .registers 2

    .prologue
    .line 515
    iget-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mOrientation:Lcom/github/mikephil/charting/components/Legend$LegendOrientation;

    return-object v0
.end method

.method public getPosition()Lcom/github/mikephil/charting/components/Legend$LegendPosition;
    .registers 3

    .prologue
    .line 375
    iget-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mOrientation:Lcom/github/mikephil/charting/components/Legend$LegendOrientation;

    sget-object v1, Lcom/github/mikephil/charting/components/Legend$LegendOrientation;->VERTICAL:Lcom/github/mikephil/charting/components/Legend$LegendOrientation;

    if-ne v0, v1, :cond_15

    iget-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mHorizontalAlignment:Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;

    sget-object v1, Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;->CENTER:Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;

    if-ne v0, v1, :cond_15

    iget-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mVerticalAlignment:Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;

    sget-object v1, Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;->CENTER:Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;

    if-ne v0, v1, :cond_15

    .line 378
    sget-object v0, Lcom/github/mikephil/charting/components/Legend$LegendPosition;->PIECHART_CENTER:Lcom/github/mikephil/charting/components/Legend$LegendPosition;

    .line 402
    :goto_14
    return-object v0

    .line 380
    :cond_15
    iget-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mOrientation:Lcom/github/mikephil/charting/components/Legend$LegendOrientation;

    sget-object v1, Lcom/github/mikephil/charting/components/Legend$LegendOrientation;->HORIZONTAL:Lcom/github/mikephil/charting/components/Legend$LegendOrientation;

    if-ne v0, v1, :cond_4b

    .line 381
    iget-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mVerticalAlignment:Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;

    sget-object v1, Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;->TOP:Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;

    if-ne v0, v1, :cond_36

    .line 382
    iget-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mHorizontalAlignment:Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;

    sget-object v1, Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;->LEFT:Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;

    if-ne v0, v1, :cond_2a

    sget-object v0, Lcom/github/mikephil/charting/components/Legend$LegendPosition;->ABOVE_CHART_LEFT:Lcom/github/mikephil/charting/components/Legend$LegendPosition;

    goto :goto_14

    :cond_2a
    iget-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mHorizontalAlignment:Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;

    sget-object v1, Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;->RIGHT:Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;

    if-ne v0, v1, :cond_33

    sget-object v0, Lcom/github/mikephil/charting/components/Legend$LegendPosition;->ABOVE_CHART_RIGHT:Lcom/github/mikephil/charting/components/Legend$LegendPosition;

    goto :goto_14

    :cond_33
    sget-object v0, Lcom/github/mikephil/charting/components/Legend$LegendPosition;->ABOVE_CHART_CENTER:Lcom/github/mikephil/charting/components/Legend$LegendPosition;

    goto :goto_14

    .line 388
    :cond_36
    iget-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mHorizontalAlignment:Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;

    sget-object v1, Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;->LEFT:Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;

    if-ne v0, v1, :cond_3f

    sget-object v0, Lcom/github/mikephil/charting/components/Legend$LegendPosition;->BELOW_CHART_LEFT:Lcom/github/mikephil/charting/components/Legend$LegendPosition;

    goto :goto_14

    :cond_3f
    iget-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mHorizontalAlignment:Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;

    sget-object v1, Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;->RIGHT:Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;

    if-ne v0, v1, :cond_48

    sget-object v0, Lcom/github/mikephil/charting/components/Legend$LegendPosition;->BELOW_CHART_RIGHT:Lcom/github/mikephil/charting/components/Legend$LegendPosition;

    goto :goto_14

    :cond_48
    sget-object v0, Lcom/github/mikephil/charting/components/Legend$LegendPosition;->BELOW_CHART_CENTER:Lcom/github/mikephil/charting/components/Legend$LegendPosition;

    goto :goto_14

    .line 395
    :cond_4b
    iget-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mHorizontalAlignment:Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;

    sget-object v1, Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;->LEFT:Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;

    if-ne v0, v1, :cond_6a

    .line 396
    iget-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mVerticalAlignment:Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;

    sget-object v1, Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;->TOP:Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;

    if-ne v0, v1, :cond_5e

    iget-boolean v0, p0, Lcom/github/mikephil/charting/components/Legend;->mDrawInside:Z

    if-eqz v0, :cond_5e

    sget-object v0, Lcom/github/mikephil/charting/components/Legend$LegendPosition;->LEFT_OF_CHART_INSIDE:Lcom/github/mikephil/charting/components/Legend$LegendPosition;

    goto :goto_14

    :cond_5e
    iget-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mVerticalAlignment:Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;

    sget-object v1, Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;->CENTER:Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;

    if-ne v0, v1, :cond_67

    sget-object v0, Lcom/github/mikephil/charting/components/Legend$LegendPosition;->LEFT_OF_CHART_CENTER:Lcom/github/mikephil/charting/components/Legend$LegendPosition;

    goto :goto_14

    :cond_67
    sget-object v0, Lcom/github/mikephil/charting/components/Legend$LegendPosition;->LEFT_OF_CHART:Lcom/github/mikephil/charting/components/Legend$LegendPosition;

    goto :goto_14

    .line 402
    :cond_6a
    iget-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mVerticalAlignment:Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;

    sget-object v1, Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;->TOP:Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;

    if-ne v0, v1, :cond_77

    iget-boolean v0, p0, Lcom/github/mikephil/charting/components/Legend;->mDrawInside:Z

    if-eqz v0, :cond_77

    sget-object v0, Lcom/github/mikephil/charting/components/Legend$LegendPosition;->RIGHT_OF_CHART_INSIDE:Lcom/github/mikephil/charting/components/Legend$LegendPosition;

    goto :goto_14

    :cond_77
    iget-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mVerticalAlignment:Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;

    sget-object v1, Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;->CENTER:Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;

    if-ne v0, v1, :cond_80

    sget-object v0, Lcom/github/mikephil/charting/components/Legend$LegendPosition;->RIGHT_OF_CHART_CENTER:Lcom/github/mikephil/charting/components/Legend$LegendPosition;

    goto :goto_14

    :cond_80
    sget-object v0, Lcom/github/mikephil/charting/components/Legend$LegendPosition;->RIGHT_OF_CHART:Lcom/github/mikephil/charting/components/Legend$LegendPosition;

    goto :goto_14
.end method

.method public getStackSpace()F
    .registers 2

    .prologue
    .line 664
    iget v0, p0, Lcom/github/mikephil/charting/components/Legend;->mStackSpace:F

    return v0
.end method

.method public getVerticalAlignment()Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;
    .registers 2

    .prologue
    .line 497
    iget-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mVerticalAlignment:Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;

    return-object v0
.end method

.method public getXEntrySpace()F
    .registers 2

    .prologue
    .line 607
    iget v0, p0, Lcom/github/mikephil/charting/components/Legend;->mXEntrySpace:F

    return v0
.end method

.method public getYEntrySpace()F
    .registers 2

    .prologue
    .line 626
    iget v0, p0, Lcom/github/mikephil/charting/components/Legend;->mYEntrySpace:F

    return v0
.end method

.method public isDrawInsideEnabled()Z
    .registers 2

    .prologue
    .line 533
    iget-boolean v0, p0, Lcom/github/mikephil/charting/components/Legend;->mDrawInside:Z

    return v0
.end method

.method public isLegendCustom()Z
    .registers 2

    .prologue
    .line 365
    iget-boolean v0, p0, Lcom/github/mikephil/charting/components/Legend;->mIsLegendCustom:Z

    return v0
.end method

.method public isWordWrapEnabled()Z
    .registers 2

    .prologue
    .line 766
    iget-boolean v0, p0, Lcom/github/mikephil/charting/components/Legend;->mWordWrapEnabled:Z

    return v0
.end method

.method public resetCustom()V
    .registers 2

    .prologue
    .line 357
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/github/mikephil/charting/components/Legend;->mIsLegendCustom:Z

    .line 358
    return-void
.end method

.method public setComputedColors(Ljava/util/List;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 183
    .local p1, "colors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-static {p1}, Lcom/github/mikephil/charting/utils/Utils;->convertIntegers(Ljava/util/List;)[I

    move-result-object v0

    iput-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mColors:[I

    .line 184
    return-void
.end method

.method public setComputedLabels(Ljava/util/List;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 191
    .local p1, "labels":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-static {p1}, Lcom/github/mikephil/charting/utils/Utils;->convertStrings(Ljava/util/List;)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mLabels:[Ljava/lang/String;

    .line 192
    return-void
.end method

.method public setCustom(Ljava/util/List;Ljava/util/List;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 341
    .local p1, "colors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local p2, "labels":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v1

    if-eq v0, v1, :cond_12

    .line 342
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "colors array and labels array need to be of same size"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 346
    :cond_12
    invoke-static {p1}, Lcom/github/mikephil/charting/utils/Utils;->convertIntegers(Ljava/util/List;)[I

    move-result-object v0

    iput-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mColors:[I

    .line 347
    invoke-static {p2}, Lcom/github/mikephil/charting/utils/Utils;->convertStrings(Ljava/util/List;)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mLabels:[Ljava/lang/String;

    .line 348
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/github/mikephil/charting/components/Legend;->mIsLegendCustom:Z

    .line 349
    return-void
.end method

.method public setCustom([I[Ljava/lang/String;)V
    .registers 5
    .param p1, "colors"    # [I
    .param p2, "labels"    # [Ljava/lang/String;

    .prologue
    .line 320
    array-length v0, p1

    array-length v1, p2

    if-eq v0, v1, :cond_c

    .line 321
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "colors array and labels array need to be of same size"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 325
    :cond_c
    iput-object p2, p0, Lcom/github/mikephil/charting/components/Legend;->mLabels:[Ljava/lang/String;

    .line 326
    iput-object p1, p0, Lcom/github/mikephil/charting/components/Legend;->mColors:[I

    .line 327
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/github/mikephil/charting/components/Legend;->mIsLegendCustom:Z

    .line 328
    return-void
.end method

.method public setDirection(Lcom/github/mikephil/charting/components/Legend$LegendDirection;)V
    .registers 2
    .param p1, "pos"    # Lcom/github/mikephil/charting/components/Legend$LegendDirection;

    .prologue
    .line 560
    iput-object p1, p0, Lcom/github/mikephil/charting/components/Legend;->mDirection:Lcom/github/mikephil/charting/components/Legend$LegendDirection;

    .line 561
    return-void
.end method

.method public setDrawInside(Z)V
    .registers 2
    .param p1, "value"    # Z

    .prologue
    .line 542
    iput-boolean p1, p0, Lcom/github/mikephil/charting/components/Legend;->mDrawInside:Z

    .line 543
    return-void
.end method

.method public setExtra(Ljava/util/List;Ljava/util/List;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 294
    .local p1, "colors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local p2, "labels":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-static {p1}, Lcom/github/mikephil/charting/utils/Utils;->convertIntegers(Ljava/util/List;)[I

    move-result-object v0

    iput-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mExtraColors:[I

    .line 295
    invoke-static {p2}, Lcom/github/mikephil/charting/utils/Utils;->convertStrings(Ljava/util/List;)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mExtraLabels:[Ljava/lang/String;

    .line 296
    return-void
.end method

.method public setExtra([I[Ljava/lang/String;)V
    .registers 3
    .param p1, "colors"    # [I
    .param p2, "labels"    # [Ljava/lang/String;

    .prologue
    .line 305
    iput-object p1, p0, Lcom/github/mikephil/charting/components/Legend;->mExtraColors:[I

    .line 306
    iput-object p2, p0, Lcom/github/mikephil/charting/components/Legend;->mExtraLabels:[Ljava/lang/String;

    .line 307
    return-void
.end method

.method public setForm(Lcom/github/mikephil/charting/components/Legend$LegendForm;)V
    .registers 2
    .param p1, "shape"    # Lcom/github/mikephil/charting/components/Legend$LegendForm;

    .prologue
    .line 578
    iput-object p1, p0, Lcom/github/mikephil/charting/components/Legend;->mShape:Lcom/github/mikephil/charting/components/Legend$LegendForm;

    .line 579
    return-void
.end method

.method public setFormSize(F)V
    .registers 3
    .param p1, "size"    # F

    .prologue
    .line 588
    invoke-static {p1}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/components/Legend;->mFormSize:F

    .line 589
    return-void
.end method

.method public setFormToTextSpace(F)V
    .registers 3
    .param p1, "space"    # F

    .prologue
    .line 655
    invoke-static {p1}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/components/Legend;->mFormToTextSpace:F

    .line 656
    return-void
.end method

.method public setHorizontalAlignment(Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;)V
    .registers 2
    .param p1, "value"    # Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;

    .prologue
    .line 488
    iput-object p1, p0, Lcom/github/mikephil/charting/components/Legend;->mHorizontalAlignment:Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;

    .line 489
    return-void
.end method

.method public setMaxSizePercent(F)V
    .registers 2
    .param p1, "maxSize"    # F

    .prologue
    .line 792
    iput p1, p0, Lcom/github/mikephil/charting/components/Legend;->mMaxSizePercent:F

    .line 793
    return-void
.end method

.method public setOrientation(Lcom/github/mikephil/charting/components/Legend$LegendOrientation;)V
    .registers 2
    .param p1, "value"    # Lcom/github/mikephil/charting/components/Legend$LegendOrientation;

    .prologue
    .line 524
    iput-object p1, p0, Lcom/github/mikephil/charting/components/Legend;->mOrientation:Lcom/github/mikephil/charting/components/Legend$LegendOrientation;

    .line 525
    return-void
.end method

.method public setPosition(Lcom/github/mikephil/charting/components/Legend$LegendPosition;)V
    .registers 4
    .param p1, "newValue"    # Lcom/github/mikephil/charting/components/Legend$LegendPosition;

    .prologue
    .line 417
    sget-object v0, Lcom/github/mikephil/charting/components/Legend$1;->$SwitchMap$com$github$mikephil$charting$components$Legend$LegendPosition:[I

    invoke-virtual {p1}, Lcom/github/mikephil/charting/components/Legend$LegendPosition;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_84

    .line 469
    :goto_b
    sget-object v0, Lcom/github/mikephil/charting/components/Legend$LegendPosition;->LEFT_OF_CHART_INSIDE:Lcom/github/mikephil/charting/components/Legend$LegendPosition;

    if-eq p1, v0, :cond_13

    sget-object v0, Lcom/github/mikephil/charting/components/Legend$LegendPosition;->RIGHT_OF_CHART_INSIDE:Lcom/github/mikephil/charting/components/Legend$LegendPosition;

    if-ne p1, v0, :cond_82

    :cond_13
    const/4 v0, 0x1

    :goto_14
    iput-boolean v0, p0, Lcom/github/mikephil/charting/components/Legend;->mDrawInside:Z

    .line 471
    return-void

    .line 421
    :pswitch_17
    sget-object v0, Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;->LEFT:Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;

    iput-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mHorizontalAlignment:Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;

    .line 422
    sget-object v0, Lcom/github/mikephil/charting/components/Legend$LegendPosition;->LEFT_OF_CHART_CENTER:Lcom/github/mikephil/charting/components/Legend$LegendPosition;

    if-ne p1, v0, :cond_28

    sget-object v0, Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;->CENTER:Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;

    :goto_21
    iput-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mVerticalAlignment:Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;

    .line 425
    sget-object v0, Lcom/github/mikephil/charting/components/Legend$LegendOrientation;->VERTICAL:Lcom/github/mikephil/charting/components/Legend$LegendOrientation;

    iput-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mOrientation:Lcom/github/mikephil/charting/components/Legend$LegendOrientation;

    goto :goto_b

    .line 422
    :cond_28
    sget-object v0, Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;->TOP:Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;

    goto :goto_21

    .line 431
    :pswitch_2b
    sget-object v0, Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;->RIGHT:Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;

    iput-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mHorizontalAlignment:Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;

    .line 432
    sget-object v0, Lcom/github/mikephil/charting/components/Legend$LegendPosition;->RIGHT_OF_CHART_CENTER:Lcom/github/mikephil/charting/components/Legend$LegendPosition;

    if-ne p1, v0, :cond_3c

    sget-object v0, Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;->CENTER:Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;

    :goto_35
    iput-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mVerticalAlignment:Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;

    .line 435
    sget-object v0, Lcom/github/mikephil/charting/components/Legend$LegendOrientation;->VERTICAL:Lcom/github/mikephil/charting/components/Legend$LegendOrientation;

    iput-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mOrientation:Lcom/github/mikephil/charting/components/Legend$LegendOrientation;

    goto :goto_b

    .line 432
    :cond_3c
    sget-object v0, Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;->TOP:Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;

    goto :goto_35

    .line 441
    :pswitch_3f
    sget-object v0, Lcom/github/mikephil/charting/components/Legend$LegendPosition;->ABOVE_CHART_LEFT:Lcom/github/mikephil/charting/components/Legend$LegendPosition;

    if-ne p1, v0, :cond_50

    sget-object v0, Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;->LEFT:Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;

    :goto_45
    iput-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mHorizontalAlignment:Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;

    .line 446
    sget-object v0, Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;->TOP:Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;

    iput-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mVerticalAlignment:Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;

    .line 447
    sget-object v0, Lcom/github/mikephil/charting/components/Legend$LegendOrientation;->HORIZONTAL:Lcom/github/mikephil/charting/components/Legend$LegendOrientation;

    iput-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mOrientation:Lcom/github/mikephil/charting/components/Legend$LegendOrientation;

    goto :goto_b

    .line 441
    :cond_50
    sget-object v0, Lcom/github/mikephil/charting/components/Legend$LegendPosition;->ABOVE_CHART_RIGHT:Lcom/github/mikephil/charting/components/Legend$LegendPosition;

    if-ne p1, v0, :cond_57

    sget-object v0, Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;->RIGHT:Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;

    goto :goto_45

    :cond_57
    sget-object v0, Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;->CENTER:Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;

    goto :goto_45

    .line 453
    :pswitch_5a
    sget-object v0, Lcom/github/mikephil/charting/components/Legend$LegendPosition;->BELOW_CHART_LEFT:Lcom/github/mikephil/charting/components/Legend$LegendPosition;

    if-ne p1, v0, :cond_6b

    sget-object v0, Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;->LEFT:Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;

    :goto_60
    iput-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mHorizontalAlignment:Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;

    .line 458
    sget-object v0, Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;->BOTTOM:Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;

    iput-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mVerticalAlignment:Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;

    .line 459
    sget-object v0, Lcom/github/mikephil/charting/components/Legend$LegendOrientation;->HORIZONTAL:Lcom/github/mikephil/charting/components/Legend$LegendOrientation;

    iput-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mOrientation:Lcom/github/mikephil/charting/components/Legend$LegendOrientation;

    goto :goto_b

    .line 453
    :cond_6b
    sget-object v0, Lcom/github/mikephil/charting/components/Legend$LegendPosition;->BELOW_CHART_RIGHT:Lcom/github/mikephil/charting/components/Legend$LegendPosition;

    if-ne p1, v0, :cond_72

    sget-object v0, Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;->RIGHT:Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;

    goto :goto_60

    :cond_72
    sget-object v0, Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;->CENTER:Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;

    goto :goto_60

    .line 463
    :pswitch_75
    sget-object v0, Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;->CENTER:Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;

    iput-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mHorizontalAlignment:Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;

    .line 464
    sget-object v0, Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;->CENTER:Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;

    iput-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mVerticalAlignment:Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;

    .line 465
    sget-object v0, Lcom/github/mikephil/charting/components/Legend$LegendOrientation;->VERTICAL:Lcom/github/mikephil/charting/components/Legend$LegendOrientation;

    iput-object v0, p0, Lcom/github/mikephil/charting/components/Legend;->mOrientation:Lcom/github/mikephil/charting/components/Legend$LegendOrientation;

    goto :goto_b

    .line 469
    :cond_82
    const/4 v0, 0x0

    goto :goto_14

    .line 417
    :pswitch_data_84
    .packed-switch 0x1
        :pswitch_17
        :pswitch_17
        :pswitch_17
        :pswitch_2b
        :pswitch_2b
        :pswitch_2b
        :pswitch_3f
        :pswitch_3f
        :pswitch_3f
        :pswitch_5a
        :pswitch_5a
        :pswitch_5a
        :pswitch_75
    .end packed-switch
.end method

.method public setStackSpace(F)V
    .registers 2
    .param p1, "space"    # F

    .prologue
    .line 673
    iput p1, p0, Lcom/github/mikephil/charting/components/Legend;->mStackSpace:F

    .line 674
    return-void
.end method

.method public setVerticalAlignment(Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;)V
    .registers 2
    .param p1, "value"    # Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;

    .prologue
    .line 506
    iput-object p1, p0, Lcom/github/mikephil/charting/components/Legend;->mVerticalAlignment:Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;

    .line 507
    return-void
.end method

.method public setWordWrapEnabled(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 756
    iput-boolean p1, p0, Lcom/github/mikephil/charting/components/Legend;->mWordWrapEnabled:Z

    .line 757
    return-void
.end method

.method public setXEntrySpace(F)V
    .registers 3
    .param p1, "space"    # F

    .prologue
    .line 617
    invoke-static {p1}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/components/Legend;->mXEntrySpace:F

    .line 618
    return-void
.end method

.method public setYEntrySpace(F)V
    .registers 3
    .param p1, "space"    # F

    .prologue
    .line 636
    invoke-static {p1}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/components/Legend;->mYEntrySpace:F

    .line 637
    return-void
.end method
