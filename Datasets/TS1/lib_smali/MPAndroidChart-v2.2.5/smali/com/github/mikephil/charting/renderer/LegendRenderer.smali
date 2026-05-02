.class public Lcom/github/mikephil/charting/renderer/LegendRenderer;
.super Lcom/github/mikephil/charting/renderer/Renderer;
.source "LegendRenderer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/github/mikephil/charting/renderer/LegendRenderer$1;
    }
.end annotation


# instance fields
.field protected mLegend:Lcom/github/mikephil/charting/components/Legend;

.field protected mLegendFormPaint:Landroid/graphics/Paint;

.field protected mLegendLabelPaint:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;Lcom/github/mikephil/charting/components/Legend;)V
    .registers 6
    .param p1, "viewPortHandler"    # Lcom/github/mikephil/charting/utils/ViewPortHandler;
    .param p2, "legend"    # Lcom/github/mikephil/charting/components/Legend;

    .prologue
    const/4 v2, 0x1

    .line 42
    invoke-direct {p0, p1}, Lcom/github/mikephil/charting/renderer/Renderer;-><init>(Lcom/github/mikephil/charting/utils/ViewPortHandler;)V

    .line 44
    iput-object p2, p0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    .line 46
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegendLabelPaint:Landroid/graphics/Paint;

    .line 47
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegendLabelPaint:Landroid/graphics/Paint;

    const/high16 v1, 0x41100000    # 9.0f

    invoke-static {v1}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 48
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegendLabelPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 50
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegendFormPaint:Landroid/graphics/Paint;

    .line 51
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegendFormPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 52
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegendFormPaint:Landroid/graphics/Paint;

    const/high16 v1, 0x40400000    # 3.0f

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 53
    return-void
.end method


# virtual methods
.method public computeLegend(Lcom/github/mikephil/charting/data/ChartData;)V
    .registers 24
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/github/mikephil/charting/data/ChartData",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 80
    .local p1, "data":Lcom/github/mikephil/charting/data/ChartData;, "Lcom/github/mikephil/charting/data/ChartData<*>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/github/mikephil/charting/components/Legend;->isLegendCustom()Z

    move-result v19

    if-nez v19, :cond_1c0

    .line 82
    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    .line 83
    .local v13, "labels":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 86
    .local v6, "colors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_17
    invoke-virtual/range {p1 .. p1}, Lcom/github/mikephil/charting/data/ChartData;->getDataSetCount()I

    move-result v19

    move/from16 v0, v19

    if-ge v9, v0, :cond_167

    .line 88
    move-object/from16 v0, p1

    invoke-virtual {v0, v9}, Lcom/github/mikephil/charting/data/ChartData;->getDataSetByIndex(I)Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    move-result-object v7

    .line 90
    .local v7, "dataSet":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;
    invoke-interface {v7}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getColors()Ljava/util/List;

    move-result-object v4

    .line 91
    .local v4, "clrs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-interface {v7}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getEntryCount()I

    move-result v8

    .line 94
    .local v8, "entryCount":I
    instance-of v0, v7, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;

    move/from16 v19, v0

    if-eqz v19, :cond_8d

    move-object/from16 v19, v7

    check-cast v19, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;

    invoke-interface/range {v19 .. v19}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->isStacked()Z

    move-result v19

    if-eqz v19, :cond_8d

    move-object v3, v7

    .line 96
    check-cast v3, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;

    .line 97
    .local v3, "bds":Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;
    invoke-interface {v3}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getStackLabels()[Ljava/lang/String;

    move-result-object v16

    .line 99
    .local v16, "sLabels":[Ljava/lang/String;
    const/4 v11, 0x0

    .local v11, "j":I
    :goto_45
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v19

    move/from16 v0, v19

    if-ge v11, v0, :cond_6f

    invoke-interface {v3}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getStackSize()I

    move-result v19

    move/from16 v0, v19

    if-ge v11, v0, :cond_6f

    .line 101
    move-object/from16 v0, v16

    array-length v0, v0

    move/from16 v19, v0

    rem-int v19, v11, v19

    aget-object v19, v16, v19

    move-object/from16 v0, v19

    invoke-interface {v13, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 102
    invoke-interface {v4, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-interface {v6, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 99
    add-int/lit8 v11, v11, 0x1

    goto :goto_45

    .line 105
    :cond_6f
    invoke-interface {v3}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getLabel()Ljava/lang/String;

    move-result-object v19

    if-eqz v19, :cond_8a

    .line 107
    const v19, 0x112234

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-interface {v6, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 108
    invoke-interface {v3}, Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;->getLabel()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-interface {v13, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 86
    .end local v3    # "bds":Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;
    .end local v11    # "j":I
    .end local v16    # "sLabels":[Ljava/lang/String;
    :cond_8a
    :goto_8a
    add-int/lit8 v9, v9, 0x1

    goto :goto_17

    .line 111
    :cond_8d
    instance-of v0, v7, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;

    move/from16 v19, v0

    if-eqz v19, :cond_e0

    .line 113
    invoke-virtual/range {p1 .. p1}, Lcom/github/mikephil/charting/data/ChartData;->getXVals()Ljava/util/List;

    move-result-object v18

    .local v18, "xVals":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    move-object v15, v7

    .line 114
    check-cast v15, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;

    .line 116
    .local v15, "pds":Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;
    const/4 v11, 0x0

    .restart local v11    # "j":I
    :goto_9b
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v19

    move/from16 v0, v19

    if-ge v11, v0, :cond_c4

    if-ge v11, v8, :cond_c4

    invoke-interface/range {v18 .. v18}, Ljava/util/List;->size()I

    move-result v19

    move/from16 v0, v19

    if-ge v11, v0, :cond_c4

    .line 118
    move-object/from16 v0, v18

    invoke-interface {v0, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-interface {v13, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 119
    invoke-interface {v4, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-interface {v6, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 116
    add-int/lit8 v11, v11, 0x1

    goto :goto_9b

    .line 122
    :cond_c4
    invoke-interface {v15}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getLabel()Ljava/lang/String;

    move-result-object v19

    if-eqz v19, :cond_8a

    .line 124
    const v19, 0x112234

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-interface {v6, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 125
    invoke-interface {v15}, Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;->getLabel()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-interface {v13, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_8a

    .line 128
    .end local v11    # "j":I
    .end local v15    # "pds":Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;
    .end local v18    # "xVals":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_e0
    instance-of v0, v7, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;

    move/from16 v19, v0

    if-eqz v19, :cond_12b

    move-object/from16 v19, v7

    check-cast v19, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;

    invoke-interface/range {v19 .. v19}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->getDecreasingColor()I

    move-result v19

    const v20, 0x112233

    move/from16 v0, v19

    move/from16 v1, v20

    if-eq v0, v1, :cond_12b

    move-object/from16 v19, v7

    .line 130
    check-cast v19, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;

    invoke-interface/range {v19 .. v19}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->getDecreasingColor()I

    move-result v19

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-interface {v6, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-object/from16 v19, v7

    .line 131
    check-cast v19, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;

    invoke-interface/range {v19 .. v19}, Lcom/github/mikephil/charting/interfaces/datasets/ICandleDataSet;->getIncreasingColor()I

    move-result v19

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-interface {v6, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 132
    const/16 v19, 0x0

    move-object/from16 v0, v19

    invoke-interface {v13, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 133
    invoke-interface {v7}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getLabel()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-interface {v13, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_8a

    .line 137
    :cond_12b
    const/4 v11, 0x0

    .restart local v11    # "j":I
    :goto_12c
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v19

    move/from16 v0, v19

    if-ge v11, v0, :cond_8a

    if-ge v11, v8, :cond_8a

    .line 140
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v19

    add-int/lit8 v19, v19, -0x1

    move/from16 v0, v19

    if-ge v11, v0, :cond_159

    add-int/lit8 v19, v8, -0x1

    move/from16 v0, v19

    if-ge v11, v0, :cond_159

    .line 142
    const/16 v19, 0x0

    move-object/from16 v0, v19

    invoke-interface {v13, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 149
    :goto_14d
    invoke-interface {v4, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-interface {v6, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 137
    add-int/lit8 v11, v11, 0x1

    goto :goto_12c

    .line 145
    :cond_159
    move-object/from16 v0, p1

    invoke-virtual {v0, v9}, Lcom/github/mikephil/charting/data/ChartData;->getDataSetByIndex(I)Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    move-result-object v19

    invoke-interface/range {v19 .. v19}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getLabel()Ljava/lang/String;

    move-result-object v12

    .line 146
    .local v12, "label":Ljava/lang/String;
    invoke-interface {v13, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_14d

    .line 154
    .end local v4    # "clrs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v7    # "dataSet":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;
    .end local v8    # "entryCount":I
    .end local v11    # "j":I
    .end local v12    # "label":Ljava/lang/String;
    :cond_167
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/github/mikephil/charting/components/Legend;->getExtraColors()[I

    move-result-object v19

    if-eqz v19, :cond_1aa

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/github/mikephil/charting/components/Legend;->getExtraLabels()[Ljava/lang/String;

    move-result-object v19

    if-eqz v19, :cond_1aa

    .line 155
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/github/mikephil/charting/components/Legend;->getExtraColors()[I

    move-result-object v2

    .local v2, "arr$":[I
    array-length v14, v2

    .local v14, "len$":I
    const/4 v10, 0x0

    .local v10, "i$":I
    :goto_18b
    if-ge v10, v14, :cond_19b

    aget v5, v2, v10

    .line 156
    .local v5, "color":I
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-interface {v6, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 155
    add-int/lit8 v10, v10, 0x1

    goto :goto_18b

    .line 157
    .end local v5    # "color":I
    :cond_19b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/github/mikephil/charting/components/Legend;->getExtraLabels()[Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-static {v13, v0}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 160
    .end local v2    # "arr$":[I
    .end local v10    # "i$":I
    .end local v14    # "len$":I
    :cond_1aa
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Lcom/github/mikephil/charting/components/Legend;->setComputedColors(Ljava/util/List;)V

    .line 161
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v13}, Lcom/github/mikephil/charting/components/Legend;->setComputedLabels(Ljava/util/List;)V

    .line 164
    .end local v6    # "colors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v9    # "i":I
    .end local v13    # "labels":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_1c0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/github/mikephil/charting/components/Legend;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v17

    .line 166
    .local v17, "tf":Landroid/graphics/Typeface;
    if-eqz v17, :cond_1d9

    .line 167
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegendLabelPaint:Landroid/graphics/Paint;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 169
    :cond_1d9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegendLabelPaint:Landroid/graphics/Paint;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/github/mikephil/charting/components/Legend;->getTextSize()F

    move-result v20

    invoke-virtual/range {v19 .. v20}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 170
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegendLabelPaint:Landroid/graphics/Paint;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/github/mikephil/charting/components/Legend;->getTextColor()I

    move-result v20

    invoke-virtual/range {v19 .. v20}, Landroid/graphics/Paint;->setColor(I)V

    .line 173
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegendLabelPaint:Landroid/graphics/Paint;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    move-object/from16 v21, v0

    invoke-virtual/range {v19 .. v21}, Lcom/github/mikephil/charting/components/Legend;->calculateDimensions(Landroid/graphics/Paint;Lcom/github/mikephil/charting/utils/ViewPortHandler;)V

    .line 174
    return-void
.end method

.method protected drawForm(Landroid/graphics/Canvas;FFILcom/github/mikephil/charting/components/Legend;)V
    .registers 14
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "x"    # F
    .param p3, "y"    # F
    .param p4, "index"    # I
    .param p5, "legend"    # Lcom/github/mikephil/charting/components/Legend;

    .prologue
    .line 422
    invoke-virtual {p5}, Lcom/github/mikephil/charting/components/Legend;->getColors()[I

    move-result-object v0

    aget v0, v0, p4

    const v1, 0x112234

    if-ne v0, v1, :cond_c

    .line 441
    :goto_b
    return-void

    .line 425
    :cond_c
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegendFormPaint:Landroid/graphics/Paint;

    invoke-virtual {p5}, Lcom/github/mikephil/charting/components/Legend;->getColors()[I

    move-result-object v1

    aget v1, v1, p4

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 427
    invoke-virtual {p5}, Lcom/github/mikephil/charting/components/Legend;->getFormSize()F

    move-result v6

    .line 428
    .local v6, "formsize":F
    const/high16 v0, 0x40000000    # 2.0f

    div-float v7, v6, v0

    .line 430
    .local v7, "half":F
    sget-object v0, Lcom/github/mikephil/charting/renderer/LegendRenderer$1;->$SwitchMap$com$github$mikephil$charting$components$Legend$LegendForm:[I

    invoke-virtual {p5}, Lcom/github/mikephil/charting/components/Legend;->getForm()Lcom/github/mikephil/charting/components/Legend$LegendForm;

    move-result-object v1

    invoke-virtual {v1}, Lcom/github/mikephil/charting/components/Legend$LegendForm;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_52

    goto :goto_b

    .line 432
    :pswitch_2f
    add-float v0, p2, v7

    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegendFormPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, p3, v7, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto :goto_b

    .line 435
    :pswitch_37
    sub-float v2, p3, v7

    add-float v3, p2, v6

    add-float v4, p3, v7

    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegendFormPaint:Landroid/graphics/Paint;

    move-object v0, p1

    move v1, p2

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    goto :goto_b

    .line 438
    :pswitch_45
    add-float v3, p2, v6

    iget-object v5, p0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegendFormPaint:Landroid/graphics/Paint;

    move-object v0, p1

    move v1, p2

    move v2, p3

    move v4, p3

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto :goto_b

    .line 430
    nop

    :pswitch_data_52
    .packed-switch 0x1
        :pswitch_2f
        :pswitch_37
        :pswitch_45
    .end packed-switch
.end method

.method protected drawLabel(Landroid/graphics/Canvas;FFLjava/lang/String;)V
    .registers 6
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "x"    # F
    .param p3, "y"    # F
    .param p4, "label"    # Ljava/lang/String;

    .prologue
    .line 452
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegendLabelPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, p4, p2, p3, v0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 453
    return-void
.end method

.method public getFormPaint()Landroid/graphics/Paint;
    .registers 2

    .prologue
    .line 70
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegendFormPaint:Landroid/graphics/Paint;

    return-object v0
.end method

.method public getLabelPaint()Landroid/graphics/Paint;
    .registers 2

    .prologue
    .line 61
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegendLabelPaint:Landroid/graphics/Paint;

    return-object v0
.end method

.method public renderLegend(Landroid/graphics/Canvas;)V
    .registers 41
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    .line 178
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/components/Legend;->isEnabled()Z

    move-result v2

    if-nez v2, :cond_b

    .line 409
    :cond_a
    :goto_a
    return-void

    .line 181
    :cond_b
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/components/Legend;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v29

    .line 183
    .local v29, "tf":Landroid/graphics/Typeface;
    if-eqz v29, :cond_1e

    .line 184
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegendLabelPaint:Landroid/graphics/Paint;

    move-object/from16 v0, v29

    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 186
    :cond_1e
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegendLabelPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/components/Legend;->getTextSize()F

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 187
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegendLabelPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/components/Legend;->getTextColor()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 189
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegendLabelPaint:Landroid/graphics/Paint;

    invoke-static {v2}, Lcom/github/mikephil/charting/utils/Utils;->getLineHeight(Landroid/graphics/Paint;)F

    move-result v20

    .line 190
    .local v20, "labelLineHeight":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegendLabelPaint:Landroid/graphics/Paint;

    invoke-static {v2}, Lcom/github/mikephil/charting/utils/Utils;->getLineSpacing(Landroid/graphics/Paint;)F

    move-result v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/components/Legend;->getYEntrySpace()F

    move-result v3

    add-float v21, v2, v3

    .line 191
    .local v21, "labelLineSpacing":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegendLabelPaint:Landroid/graphics/Paint;

    const-string v3, "ABC"

    invoke-static {v2, v3}, Lcom/github/mikephil/charting/utils/Utils;->calcTextHeight(Landroid/graphics/Paint;Ljava/lang/String;)I

    move-result v2

    int-to-float v2, v2

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v2, v3

    sub-float v17, v20, v2

    .line 193
    .local v17, "formYOffset":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/components/Legend;->getLabels()[Ljava/lang/String;

    move-result-object v22

    .line 194
    .local v22, "labels":[Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/components/Legend;->getColors()[I

    move-result-object v11

    .line 196
    .local v11, "colors":[I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/components/Legend;->getFormToTextSpace()F

    move-result v16

    .line 197
    .local v16, "formToTextSpace":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/components/Legend;->getXEntrySpace()F

    move-result v32

    .line 198
    .local v32, "xEntrySpace":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/components/Legend;->getOrientation()Lcom/github/mikephil/charting/components/Legend$LegendOrientation;

    move-result-object v24

    .line 199
    .local v24, "orientation":Lcom/github/mikephil/charting/components/Legend$LegendOrientation;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/components/Legend;->getHorizontalAlignment()Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;

    move-result-object v18

    .line 200
    .local v18, "horizontalAlignment":Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/components/Legend;->getVerticalAlignment()Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;

    move-result-object v30

    .line 201
    .local v30, "verticalAlignment":Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/components/Legend;->getDirection()Lcom/github/mikephil/charting/components/Legend$LegendDirection;

    move-result-object v13

    .line 202
    .local v13, "direction":Lcom/github/mikephil/charting/components/Legend$LegendDirection;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/components/Legend;->getFormSize()F

    move-result v15

    .line 205
    .local v15, "formSize":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/components/Legend;->getStackSpace()F

    move-result v28

    .line 207
    .local v28, "stackSpace":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/components/Legend;->getYOffset()F

    move-result v34

    .line 208
    .local v34, "yoffset":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/components/Legend;->getXOffset()F

    move-result v33

    .line 209
    .local v33, "xoffset":F
    const/16 v25, 0x0

    .line 211
    .local v25, "originPosX":F
    sget-object v2, Lcom/github/mikephil/charting/renderer/LegendRenderer$1;->$SwitchMap$com$github$mikephil$charting$components$Legend$LegendHorizontalAlignment:[I

    invoke-virtual/range {v18 .. v18}, Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_3a4

    .line 259
    :cond_d3
    :goto_d3
    sget-object v2, Lcom/github/mikephil/charting/renderer/LegendRenderer$1;->$SwitchMap$com$github$mikephil$charting$components$Legend$LegendOrientation:[I

    invoke-virtual/range {v24 .. v24}, Lcom/github/mikephil/charting/components/Legend$LegendOrientation;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_3ae

    goto/16 :goto_a

    .line 262
    :pswitch_e0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/components/Legend;->getCalculatedLineSizes()[Lcom/github/mikephil/charting/utils/FSize;

    move-result-object v10

    .line 263
    .local v10, "calculatedLineSizes":[Lcom/github/mikephil/charting/utils/FSize;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/components/Legend;->getCalculatedLabelSizes()[Lcom/github/mikephil/charting/utils/FSize;

    move-result-object v9

    .line 264
    .local v9, "calculatedLabelSizes":[Lcom/github/mikephil/charting/utils/FSize;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/components/Legend;->getCalculatedLabelBreakPoints()[Ljava/lang/Boolean;

    move-result-object v8

    .line 266
    .local v8, "calculatedLabelBreakPoints":[Ljava/lang/Boolean;
    move/from16 v4, v25

    .line 267
    .local v4, "posX":F
    const/16 v26, 0x0

    .line 269
    .local v26, "posY":F
    sget-object v2, Lcom/github/mikephil/charting/renderer/LegendRenderer$1;->$SwitchMap$com$github$mikephil$charting$components$Legend$LegendVerticalAlignment:[I

    invoke-virtual/range {v30 .. v30}, Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_3b6

    .line 283
    :goto_107
    const/16 v23, 0x0

    .line 285
    .local v23, "lineIndex":I
    const/4 v6, 0x0

    .local v6, "i":I
    move-object/from16 v0, v22

    array-length v12, v0

    .local v12, "count":I
    :goto_10d
    if-ge v6, v12, :cond_a

    .line 286
    array-length v2, v8

    if-ge v6, v2, :cond_120

    aget-object v2, v8, v6

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_120

    .line 287
    move/from16 v4, v25

    .line 288
    add-float v2, v20, v21

    add-float v26, v26, v2

    .line 291
    :cond_120
    cmpl-float v2, v4, v25

    if-nez v2, :cond_13d

    sget-object v2, Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;->CENTER:Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;

    move-object/from16 v0, v18

    if-ne v0, v2, :cond_13d

    array-length v2, v10

    move/from16 v0, v23

    if-ge v0, v2, :cond_13d

    .line 294
    sget-object v2, Lcom/github/mikephil/charting/components/Legend$LegendDirection;->RIGHT_TO_LEFT:Lcom/github/mikephil/charting/components/Legend$LegendDirection;

    if-ne v13, v2, :cond_281

    aget-object v2, v10, v23

    iget v2, v2, Lcom/github/mikephil/charting/utils/FSize;->width:F

    :goto_137
    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v2, v3

    add-float/2addr v4, v2

    .line 297
    add-int/lit8 v23, v23, 0x1

    .line 300
    :cond_13d
    aget v2, v11, v6

    const v3, 0x112234

    if-eq v2, v3, :cond_288

    const/4 v14, 0x1

    .line 301
    .local v14, "drawingForm":Z
    :goto_145
    aget-object v2, v22, v6

    if-nez v2, :cond_28b

    const/16 v19, 0x1

    .line 303
    .local v19, "isStacked":Z
    :goto_14b
    if-eqz v14, :cond_164

    .line 304
    sget-object v2, Lcom/github/mikephil/charting/components/Legend$LegendDirection;->RIGHT_TO_LEFT:Lcom/github/mikephil/charting/components/Legend$LegendDirection;

    if-ne v13, v2, :cond_152

    .line 305
    sub-float/2addr v4, v15

    .line 307
    :cond_152
    add-float v5, v26, v17

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    invoke-virtual/range {v2 .. v7}, Lcom/github/mikephil/charting/renderer/LegendRenderer;->drawForm(Landroid/graphics/Canvas;FFILcom/github/mikephil/charting/components/Legend;)V

    .line 309
    sget-object v2, Lcom/github/mikephil/charting/components/Legend$LegendDirection;->LEFT_TO_RIGHT:Lcom/github/mikephil/charting/components/Legend$LegendDirection;

    if-ne v13, v2, :cond_164

    .line 310
    add-float/2addr v4, v15

    .line 313
    :cond_164
    if-nez v19, :cond_297

    .line 314
    if-eqz v14, :cond_170

    .line 315
    sget-object v2, Lcom/github/mikephil/charting/components/Legend$LegendDirection;->RIGHT_TO_LEFT:Lcom/github/mikephil/charting/components/Legend$LegendDirection;

    if-ne v13, v2, :cond_28f

    move/from16 v0, v16

    neg-float v2, v0

    :goto_16f
    add-float/2addr v4, v2

    .line 317
    :cond_170
    sget-object v2, Lcom/github/mikephil/charting/components/Legend$LegendDirection;->RIGHT_TO_LEFT:Lcom/github/mikephil/charting/components/Legend$LegendDirection;

    if-ne v13, v2, :cond_179

    .line 318
    aget-object v2, v9, v6

    iget v2, v2, Lcom/github/mikephil/charting/utils/FSize;->width:F

    sub-float/2addr v4, v2

    .line 320
    :cond_179
    add-float v2, v26, v20

    aget-object v3, v22, v6

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v4, v2, v3}, Lcom/github/mikephil/charting/renderer/LegendRenderer;->drawLabel(Landroid/graphics/Canvas;FFLjava/lang/String;)V

    .line 322
    sget-object v2, Lcom/github/mikephil/charting/components/Legend$LegendDirection;->LEFT_TO_RIGHT:Lcom/github/mikephil/charting/components/Legend$LegendDirection;

    if-ne v13, v2, :cond_18d

    .line 323
    aget-object v2, v9, v6

    iget v2, v2, Lcom/github/mikephil/charting/utils/FSize;->width:F

    add-float/2addr v4, v2

    .line 325
    :cond_18d
    sget-object v2, Lcom/github/mikephil/charting/components/Legend$LegendDirection;->RIGHT_TO_LEFT:Lcom/github/mikephil/charting/components/Legend$LegendDirection;

    if-ne v13, v2, :cond_293

    move/from16 v0, v32

    neg-float v2, v0

    :goto_194
    add-float/2addr v4, v2

    .line 285
    :goto_195
    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_10d

    .line 214
    .end local v4    # "posX":F
    .end local v6    # "i":I
    .end local v8    # "calculatedLabelBreakPoints":[Ljava/lang/Boolean;
    .end local v9    # "calculatedLabelSizes":[Lcom/github/mikephil/charting/utils/FSize;
    .end local v10    # "calculatedLineSizes":[Lcom/github/mikephil/charting/utils/FSize;
    .end local v12    # "count":I
    .end local v14    # "drawingForm":Z
    .end local v19    # "isStacked":Z
    .end local v23    # "lineIndex":I
    .end local v26    # "posY":F
    :pswitch_199
    sget-object v2, Lcom/github/mikephil/charting/components/Legend$LegendOrientation;->VERTICAL:Lcom/github/mikephil/charting/components/Legend$LegendOrientation;

    move-object/from16 v0, v24

    if-ne v0, v2, :cond_1af

    .line 215
    move/from16 v25, v33

    .line 219
    :goto_1a1
    sget-object v2, Lcom/github/mikephil/charting/components/Legend$LegendDirection;->RIGHT_TO_LEFT:Lcom/github/mikephil/charting/components/Legend$LegendDirection;

    if-ne v13, v2, :cond_d3

    .line 220
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    iget v2, v2, Lcom/github/mikephil/charting/components/Legend;->mNeededWidth:F

    add-float v25, v25, v2

    goto/16 :goto_d3

    .line 217
    :cond_1af
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentLeft()F

    move-result v2

    add-float v25, v2, v33

    goto :goto_1a1

    .line 226
    :pswitch_1ba
    sget-object v2, Lcom/github/mikephil/charting/components/Legend$LegendOrientation;->VERTICAL:Lcom/github/mikephil/charting/components/Legend$LegendOrientation;

    move-object/from16 v0, v24

    if-ne v0, v2, :cond_1d8

    .line 227
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getChartWidth()F

    move-result v2

    sub-float v25, v2, v33

    .line 231
    :goto_1ca
    sget-object v2, Lcom/github/mikephil/charting/components/Legend$LegendDirection;->LEFT_TO_RIGHT:Lcom/github/mikephil/charting/components/Legend$LegendDirection;

    if-ne v13, v2, :cond_d3

    .line 232
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    iget v2, v2, Lcom/github/mikephil/charting/components/Legend;->mNeededWidth:F

    sub-float v25, v25, v2

    goto/16 :goto_d3

    .line 229
    :cond_1d8
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentRight()F

    move-result v2

    sub-float v25, v2, v33

    goto :goto_1ca

    .line 238
    :pswitch_1e3
    sget-object v2, Lcom/github/mikephil/charting/components/Legend$LegendOrientation;->VERTICAL:Lcom/github/mikephil/charting/components/Legend$LegendOrientation;

    move-object/from16 v0, v24

    if-ne v0, v2, :cond_226

    .line 239
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getChartWidth()F

    move-result v2

    const/high16 v3, 0x40000000    # 2.0f

    div-float v25, v2, v3

    .line 244
    :goto_1f5
    sget-object v2, Lcom/github/mikephil/charting/components/Legend$LegendDirection;->LEFT_TO_RIGHT:Lcom/github/mikephil/charting/components/Legend$LegendDirection;

    if-ne v13, v2, :cond_23c

    move/from16 v2, v33

    :goto_1fb
    add-float v25, v25, v2

    .line 250
    sget-object v2, Lcom/github/mikephil/charting/components/Legend$LegendOrientation;->VERTICAL:Lcom/github/mikephil/charting/components/Legend$LegendOrientation;

    move-object/from16 v0, v24

    if-ne v0, v2, :cond_d3

    .line 251
    move/from16 v0, v25

    float-to-double v0, v0

    move-wide/from16 v35, v0

    sget-object v2, Lcom/github/mikephil/charting/components/Legend$LegendDirection;->LEFT_TO_RIGHT:Lcom/github/mikephil/charting/components/Legend$LegendDirection;

    if-ne v13, v2, :cond_240

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    iget v2, v2, Lcom/github/mikephil/charting/components/Legend;->mNeededWidth:F

    neg-float v2, v2

    float-to-double v2, v2

    const-wide/high16 v37, 0x4000000000000000L    # 2.0

    div-double v2, v2, v37

    move/from16 v0, v33

    float-to-double v0, v0

    move-wide/from16 v37, v0

    add-double v2, v2, v37

    :goto_21f
    add-double v2, v2, v35

    double-to-float v0, v2

    move/from16 v25, v0

    goto/16 :goto_d3

    .line 241
    :cond_226
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentLeft()F

    move-result v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentWidth()F

    move-result v3

    const/high16 v5, 0x40000000    # 2.0f

    div-float/2addr v3, v5

    add-float v25, v2, v3

    goto :goto_1f5

    .line 244
    :cond_23c
    move/from16 v0, v33

    neg-float v2, v0

    goto :goto_1fb

    .line 251
    :cond_240
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    iget v2, v2, Lcom/github/mikephil/charting/components/Legend;->mNeededWidth:F

    float-to-double v2, v2

    const-wide/high16 v37, 0x4000000000000000L    # 2.0

    div-double v2, v2, v37

    move/from16 v0, v33

    float-to-double v0, v0

    move-wide/from16 v37, v0

    sub-double v2, v2, v37

    goto :goto_21f

    .line 271
    .restart local v4    # "posX":F
    .restart local v8    # "calculatedLabelBreakPoints":[Ljava/lang/Boolean;
    .restart local v9    # "calculatedLabelSizes":[Lcom/github/mikephil/charting/utils/FSize;
    .restart local v10    # "calculatedLineSizes":[Lcom/github/mikephil/charting/utils/FSize;
    .restart local v26    # "posY":F
    :pswitch_253
    move/from16 v26, v34

    .line 272
    goto/16 :goto_107

    .line 275
    :pswitch_257
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getChartHeight()F

    move-result v2

    sub-float v2, v2, v34

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    iget v3, v3, Lcom/github/mikephil/charting/components/Legend;->mNeededHeight:F

    sub-float v26, v2, v3

    .line 276
    goto/16 :goto_107

    .line 279
    :pswitch_26b
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getChartHeight()F

    move-result v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    iget v3, v3, Lcom/github/mikephil/charting/components/Legend;->mNeededHeight:F

    sub-float/2addr v2, v3

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v2, v3

    add-float v26, v2, v34

    goto/16 :goto_107

    .line 294
    .restart local v6    # "i":I
    .restart local v12    # "count":I
    .restart local v23    # "lineIndex":I
    :cond_281
    aget-object v2, v10, v23

    iget v2, v2, Lcom/github/mikephil/charting/utils/FSize;->width:F

    neg-float v2, v2

    goto/16 :goto_137

    .line 300
    :cond_288
    const/4 v14, 0x0

    goto/16 :goto_145

    .line 301
    .restart local v14    # "drawingForm":Z
    :cond_28b
    const/16 v19, 0x0

    goto/16 :goto_14b

    .restart local v19    # "isStacked":Z
    :cond_28f
    move/from16 v2, v16

    .line 315
    goto/16 :goto_16f

    :cond_293
    move/from16 v2, v32

    .line 325
    goto/16 :goto_194

    .line 327
    :cond_297
    sget-object v2, Lcom/github/mikephil/charting/components/Legend$LegendDirection;->RIGHT_TO_LEFT:Lcom/github/mikephil/charting/components/Legend$LegendDirection;

    if-ne v13, v2, :cond_2a1

    move/from16 v0, v28

    neg-float v2, v0

    :goto_29e
    add-float/2addr v4, v2

    goto/16 :goto_195

    :cond_2a1
    move/from16 v2, v28

    goto :goto_29e

    .line 335
    .end local v4    # "posX":F
    .end local v6    # "i":I
    .end local v8    # "calculatedLabelBreakPoints":[Ljava/lang/Boolean;
    .end local v9    # "calculatedLabelSizes":[Lcom/github/mikephil/charting/utils/FSize;
    .end local v10    # "calculatedLineSizes":[Lcom/github/mikephil/charting/utils/FSize;
    .end local v12    # "count":I
    .end local v14    # "drawingForm":Z
    .end local v19    # "isStacked":Z
    .end local v23    # "lineIndex":I
    .end local v26    # "posY":F
    :pswitch_2a4
    const/16 v27, 0x0

    .line 336
    .local v27, "stack":F
    const/16 v31, 0x0

    .line 337
    .local v31, "wasStacked":Z
    const/16 v26, 0x0

    .line 339
    .restart local v26    # "posY":F
    sget-object v2, Lcom/github/mikephil/charting/renderer/LegendRenderer$1;->$SwitchMap$com$github$mikephil$charting$components$Legend$LegendVerticalAlignment:[I

    invoke-virtual/range {v30 .. v30}, Lcom/github/mikephil/charting/components/Legend$LegendVerticalAlignment;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_3c0

    .line 361
    :goto_2b5
    const/4 v6, 0x0

    .restart local v6    # "i":I
    :goto_2b6
    move-object/from16 v0, v22

    array-length v2, v0

    if-ge v6, v2, :cond_a

    .line 363
    aget v2, v11, v6

    const v3, 0x112234

    if-eq v2, v3, :cond_378

    const/4 v2, 0x1

    :goto_2c3
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v14

    .line 364
    .local v14, "drawingForm":Ljava/lang/Boolean;
    move/from16 v4, v25

    .line 366
    .restart local v4    # "posX":F
    invoke-virtual {v14}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_2e7

    .line 367
    sget-object v2, Lcom/github/mikephil/charting/components/Legend$LegendDirection;->LEFT_TO_RIGHT:Lcom/github/mikephil/charting/components/Legend$LegendDirection;

    if-ne v13, v2, :cond_37b

    .line 368
    add-float v4, v4, v27

    .line 372
    :goto_2d5
    add-float v5, v26, v17

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    invoke-virtual/range {v2 .. v7}, Lcom/github/mikephil/charting/renderer/LegendRenderer;->drawForm(Landroid/graphics/Canvas;FFILcom/github/mikephil/charting/components/Legend;)V

    .line 374
    sget-object v2, Lcom/github/mikephil/charting/components/Legend$LegendDirection;->LEFT_TO_RIGHT:Lcom/github/mikephil/charting/components/Legend$LegendDirection;

    if-ne v13, v2, :cond_2e7

    .line 375
    add-float/2addr v4, v15

    .line 378
    :cond_2e7
    aget-object v2, v22, v6

    if-eqz v2, :cond_39c

    .line 380
    invoke-virtual {v14}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_385

    if-nez v31, :cond_385

    .line 381
    sget-object v2, Lcom/github/mikephil/charting/components/Legend$LegendDirection;->LEFT_TO_RIGHT:Lcom/github/mikephil/charting/components/Legend$LegendDirection;

    if-ne v13, v2, :cond_380

    move/from16 v2, v16

    :goto_2f9
    add-float/2addr v4, v2

    .line 386
    :cond_2fa
    :goto_2fa
    sget-object v2, Lcom/github/mikephil/charting/components/Legend$LegendDirection;->RIGHT_TO_LEFT:Lcom/github/mikephil/charting/components/Legend$LegendDirection;

    if-ne v13, v2, :cond_30a

    .line 387
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegendLabelPaint:Landroid/graphics/Paint;

    aget-object v3, v22, v6

    invoke-static {v2, v3}, Lcom/github/mikephil/charting/utils/Utils;->calcTextWidth(Landroid/graphics/Paint;Ljava/lang/String;)I

    move-result v2

    int-to-float v2, v2

    sub-float/2addr v4, v2

    .line 389
    :cond_30a
    if-nez v31, :cond_38b

    .line 390
    add-float v2, v26, v20

    aget-object v3, v22, v6

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v4, v2, v3}, Lcom/github/mikephil/charting/renderer/LegendRenderer;->drawLabel(Landroid/graphics/Canvas;FFLjava/lang/String;)V

    .line 397
    :goto_317
    add-float v2, v20, v21

    add-float v26, v26, v2

    .line 398
    const/16 v27, 0x0

    .line 361
    :goto_31d
    add-int/lit8 v6, v6, 0x1

    goto :goto_2b6

    .line 341
    .end local v4    # "posX":F
    .end local v6    # "i":I
    .end local v14    # "drawingForm":Ljava/lang/Boolean;
    :pswitch_320
    sget-object v2, Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;->CENTER:Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;

    move-object/from16 v0, v18

    if-ne v0, v2, :cond_32b

    const/16 v26, 0x0

    .line 344
    :goto_328
    add-float v26, v26, v34

    .line 345
    goto :goto_2b5

    .line 341
    :cond_32b
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentTop()F

    move-result v26

    goto :goto_328

    .line 348
    :pswitch_334
    sget-object v2, Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;->CENTER:Lcom/github/mikephil/charting/components/Legend$LegendHorizontalAlignment;

    move-object/from16 v0, v18

    if-ne v0, v2, :cond_34e

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getChartHeight()F

    move-result v26

    .line 351
    :goto_342
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    iget v2, v2, Lcom/github/mikephil/charting/components/Legend;->mNeededHeight:F

    add-float v2, v2, v34

    sub-float v26, v26, v2

    .line 352
    goto/16 :goto_2b5

    .line 348
    :cond_34e
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentBottom()F

    move-result v26

    goto :goto_342

    .line 355
    :pswitch_357
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->getChartHeight()F

    move-result v2

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v2, v3

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    iget v3, v3, Lcom/github/mikephil/charting/components/Legend;->mNeededHeight:F

    const/high16 v5, 0x40000000    # 2.0f

    div-float/2addr v3, v5

    sub-float/2addr v2, v3

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/github/mikephil/charting/renderer/LegendRenderer;->mLegend:Lcom/github/mikephil/charting/components/Legend;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/components/Legend;->getYOffset()F

    move-result v3

    add-float v26, v2, v3

    goto/16 :goto_2b5

    .line 363
    .restart local v6    # "i":I
    :cond_378
    const/4 v2, 0x0

    goto/16 :goto_2c3

    .line 370
    .restart local v4    # "posX":F
    .restart local v14    # "drawingForm":Ljava/lang/Boolean;
    :cond_37b
    sub-float v2, v15, v27

    sub-float/2addr v4, v2

    goto/16 :goto_2d5

    .line 381
    :cond_380
    move/from16 v0, v16

    neg-float v2, v0

    goto/16 :goto_2f9

    .line 383
    :cond_385
    if-eqz v31, :cond_2fa

    .line 384
    move/from16 v4, v25

    goto/16 :goto_2fa

    .line 392
    :cond_38b
    add-float v2, v20, v21

    add-float v26, v26, v2

    .line 393
    add-float v2, v26, v20

    aget-object v3, v22, v6

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v4, v2, v3}, Lcom/github/mikephil/charting/renderer/LegendRenderer;->drawLabel(Landroid/graphics/Canvas;FFLjava/lang/String;)V

    goto/16 :goto_317

    .line 400
    :cond_39c
    add-float v2, v15, v28

    add-float v27, v27, v2

    .line 401
    const/16 v31, 0x1

    goto/16 :goto_31d

    .line 211
    :pswitch_data_3a4
    .packed-switch 0x1
        :pswitch_199
        :pswitch_1ba
        :pswitch_1e3
    .end packed-switch

    .line 259
    :pswitch_data_3ae
    .packed-switch 0x1
        :pswitch_e0
        :pswitch_2a4
    .end packed-switch

    .line 269
    :pswitch_data_3b6
    .packed-switch 0x1
        :pswitch_253
        :pswitch_257
        :pswitch_26b
    .end packed-switch

    .line 339
    :pswitch_data_3c0
    .packed-switch 0x1
        :pswitch_320
        :pswitch_334
        :pswitch_357
    .end packed-switch
.end method
