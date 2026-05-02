.class public Lcom/jjoe64/graphview/helper/StaticLabelsFormatter;
.super Ljava/lang/Object;
.source "StaticLabelsFormatter.java"

# interfaces
.implements Lcom/jjoe64/graphview/LabelFormatter;


# instance fields
.field protected mDynamicLabelFormatter:Lcom/jjoe64/graphview/LabelFormatter;

.field protected final mGraphView:Lcom/jjoe64/graphview/GraphView;

.field protected mHorizontalLabels:[Ljava/lang/String;

.field protected mVerticalLabels:[Ljava/lang/String;

.field protected mViewport:Lcom/jjoe64/graphview/Viewport;


# direct methods
.method public constructor <init>(Lcom/jjoe64/graphview/GraphView;)V
    .registers 3
    .param p1, "graphView"    # Lcom/jjoe64/graphview/GraphView;

    .prologue
    const/4 v0, 0x0

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    iput-object p1, p0, Lcom/jjoe64/graphview/helper/StaticLabelsFormatter;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    .line 57
    invoke-virtual {p0, v0, v0, v0}, Lcom/jjoe64/graphview/helper/StaticLabelsFormatter;->init([Ljava/lang/String;[Ljava/lang/String;Lcom/jjoe64/graphview/LabelFormatter;)V

    .line 58
    return-void
.end method

.method public constructor <init>(Lcom/jjoe64/graphview/GraphView;Lcom/jjoe64/graphview/LabelFormatter;)V
    .registers 4
    .param p1, "graphView"    # Lcom/jjoe64/graphview/GraphView;
    .param p2, "dynamicLabelFormatter"    # Lcom/jjoe64/graphview/LabelFormatter;

    .prologue
    const/4 v0, 0x0

    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    iput-object p1, p0, Lcom/jjoe64/graphview/helper/StaticLabelsFormatter;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    .line 70
    invoke-virtual {p0, v0, v0, p2}, Lcom/jjoe64/graphview/helper/StaticLabelsFormatter;->init([Ljava/lang/String;[Ljava/lang/String;Lcom/jjoe64/graphview/LabelFormatter;)V

    .line 71
    return-void
.end method

.method public constructor <init>(Lcom/jjoe64/graphview/GraphView;[Ljava/lang/String;[Ljava/lang/String;)V
    .registers 5
    .param p1, "graphView"    # Lcom/jjoe64/graphview/GraphView;
    .param p2, "horizontalLabels"    # [Ljava/lang/String;
    .param p3, "verticalLabels"    # [Ljava/lang/String;

    .prologue
    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 83
    iput-object p1, p0, Lcom/jjoe64/graphview/helper/StaticLabelsFormatter;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    .line 84
    const/4 v0, 0x0

    invoke-virtual {p0, p2, p3, v0}, Lcom/jjoe64/graphview/helper/StaticLabelsFormatter;->init([Ljava/lang/String;[Ljava/lang/String;Lcom/jjoe64/graphview/LabelFormatter;)V

    .line 85
    return-void
.end method

.method public constructor <init>(Lcom/jjoe64/graphview/GraphView;[Ljava/lang/String;[Ljava/lang/String;Lcom/jjoe64/graphview/LabelFormatter;)V
    .registers 5
    .param p1, "graphView"    # Lcom/jjoe64/graphview/GraphView;
    .param p2, "horizontalLabels"    # [Ljava/lang/String;
    .param p3, "verticalLabels"    # [Ljava/lang/String;
    .param p4, "dynamicLabelFormatter"    # Lcom/jjoe64/graphview/LabelFormatter;

    .prologue
    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 99
    iput-object p1, p0, Lcom/jjoe64/graphview/helper/StaticLabelsFormatter;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    .line 100
    invoke-virtual {p0, p2, p3, p4}, Lcom/jjoe64/graphview/helper/StaticLabelsFormatter;->init([Ljava/lang/String;[Ljava/lang/String;Lcom/jjoe64/graphview/LabelFormatter;)V

    .line 101
    return-void
.end method


# virtual methods
.method protected adjust()V
    .registers 4

    .prologue
    const/4 v2, 0x2

    .line 195
    iget-object v0, p0, Lcom/jjoe64/graphview/helper/StaticLabelsFormatter;->mDynamicLabelFormatter:Lcom/jjoe64/graphview/LabelFormatter;

    iget-object v1, p0, Lcom/jjoe64/graphview/helper/StaticLabelsFormatter;->mViewport:Lcom/jjoe64/graphview/Viewport;

    invoke-interface {v0, v1}, Lcom/jjoe64/graphview/LabelFormatter;->setViewport(Lcom/jjoe64/graphview/Viewport;)V

    .line 196
    iget-object v0, p0, Lcom/jjoe64/graphview/helper/StaticLabelsFormatter;->mVerticalLabels:[Ljava/lang/String;

    if-eqz v0, :cond_25

    .line 197
    iget-object v0, p0, Lcom/jjoe64/graphview/helper/StaticLabelsFormatter;->mVerticalLabels:[Ljava/lang/String;

    array-length v0, v0

    if-ge v0, v2, :cond_19

    .line 198
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "You need at least 2 vertical labels if you use static label formatter."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 200
    :cond_19
    iget-object v0, p0, Lcom/jjoe64/graphview/helper/StaticLabelsFormatter;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    invoke-virtual {v0}, Lcom/jjoe64/graphview/GraphView;->getGridLabelRenderer()Lcom/jjoe64/graphview/GridLabelRenderer;

    move-result-object v0

    iget-object v1, p0, Lcom/jjoe64/graphview/helper/StaticLabelsFormatter;->mVerticalLabels:[Ljava/lang/String;

    array-length v1, v1

    invoke-virtual {v0, v1}, Lcom/jjoe64/graphview/GridLabelRenderer;->setNumVerticalLabels(I)V

    .line 202
    :cond_25
    iget-object v0, p0, Lcom/jjoe64/graphview/helper/StaticLabelsFormatter;->mHorizontalLabels:[Ljava/lang/String;

    if-eqz v0, :cond_42

    .line 203
    iget-object v0, p0, Lcom/jjoe64/graphview/helper/StaticLabelsFormatter;->mHorizontalLabels:[Ljava/lang/String;

    array-length v0, v0

    if-ge v0, v2, :cond_36

    .line 204
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "You need at least 2 horizontal labels if you use static label formatter."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 206
    :cond_36
    iget-object v0, p0, Lcom/jjoe64/graphview/helper/StaticLabelsFormatter;->mGraphView:Lcom/jjoe64/graphview/GraphView;

    invoke-virtual {v0}, Lcom/jjoe64/graphview/GraphView;->getGridLabelRenderer()Lcom/jjoe64/graphview/GridLabelRenderer;

    move-result-object v0

    iget-object v1, p0, Lcom/jjoe64/graphview/helper/StaticLabelsFormatter;->mHorizontalLabels:[Ljava/lang/String;

    array-length v1, v1

    invoke-virtual {v0, v1}, Lcom/jjoe64/graphview/GridLabelRenderer;->setNumHorizontalLabels(I)V

    .line 208
    :cond_42
    return-void
.end method

.method public formatLabel(DZ)Ljava/lang/String;
    .registers 22
    .param p1, "value"    # D
    .param p3, "isValueX"    # Z

    .prologue
    .line 163
    if-eqz p3, :cond_3c

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/jjoe64/graphview/helper/StaticLabelsFormatter;->mHorizontalLabels:[Ljava/lang/String;

    if-eqz v14, :cond_3c

    .line 164
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/jjoe64/graphview/helper/StaticLabelsFormatter;->mViewport:Lcom/jjoe64/graphview/Viewport;

    const/4 v15, 0x0

    invoke-virtual {v14, v15}, Lcom/jjoe64/graphview/Viewport;->getMinX(Z)D

    move-result-wide v8

    .line 165
    .local v8, "minX":D
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/jjoe64/graphview/helper/StaticLabelsFormatter;->mViewport:Lcom/jjoe64/graphview/Viewport;

    const/4 v15, 0x0

    invoke-virtual {v14, v15}, Lcom/jjoe64/graphview/Viewport;->getMaxX(Z)D

    move-result-wide v4

    .line 166
    .local v4, "maxX":D
    sub-double v12, v4, v8

    .line 167
    .local v12, "range":D
    sub-double p1, p1, v8

    .line 168
    div-double v14, p1, v12

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/helper/StaticLabelsFormatter;->mHorizontalLabels:[Ljava/lang/String;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    array-length v0, v0

    move/from16 v16, v0

    add-int/lit8 v16, v16, -0x1

    move/from16 v0, v16

    int-to-double v0, v0

    move-wide/from16 v16, v0

    mul-double v14, v14, v16

    double-to-int v3, v14

    .line 169
    .local v3, "idx":I
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/jjoe64/graphview/helper/StaticLabelsFormatter;->mHorizontalLabels:[Ljava/lang/String;

    aget-object v14, v14, v3

    .line 178
    .end local v3    # "idx":I
    .end local v4    # "maxX":D
    .end local v8    # "minX":D
    .end local v12    # "range":D
    :goto_3b
    return-object v14

    .line 170
    :cond_3c
    if-nez p3, :cond_78

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/jjoe64/graphview/helper/StaticLabelsFormatter;->mVerticalLabels:[Ljava/lang/String;

    if-eqz v14, :cond_78

    .line 171
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/jjoe64/graphview/helper/StaticLabelsFormatter;->mViewport:Lcom/jjoe64/graphview/Viewport;

    const/4 v15, 0x0

    invoke-virtual {v14, v15}, Lcom/jjoe64/graphview/Viewport;->getMinY(Z)D

    move-result-wide v10

    .line 172
    .local v10, "minY":D
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/jjoe64/graphview/helper/StaticLabelsFormatter;->mViewport:Lcom/jjoe64/graphview/Viewport;

    const/4 v15, 0x0

    invoke-virtual {v14, v15}, Lcom/jjoe64/graphview/Viewport;->getMaxY(Z)D

    move-result-wide v6

    .line 173
    .local v6, "maxY":D
    sub-double v12, v6, v10

    .line 174
    .restart local v12    # "range":D
    sub-double p1, p1, v10

    .line 175
    div-double v14, p1, v12

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/jjoe64/graphview/helper/StaticLabelsFormatter;->mVerticalLabels:[Ljava/lang/String;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    array-length v0, v0

    move/from16 v16, v0

    add-int/lit8 v16, v16, -0x1

    move/from16 v0, v16

    int-to-double v0, v0

    move-wide/from16 v16, v0

    mul-double v14, v14, v16

    double-to-int v3, v14

    .line 176
    .restart local v3    # "idx":I
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/jjoe64/graphview/helper/StaticLabelsFormatter;->mVerticalLabels:[Ljava/lang/String;

    aget-object v14, v14, v3

    goto :goto_3b

    .line 178
    .end local v3    # "idx":I
    .end local v6    # "maxY":D
    .end local v10    # "minY":D
    .end local v12    # "range":D
    :cond_78
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/jjoe64/graphview/helper/StaticLabelsFormatter;->mDynamicLabelFormatter:Lcom/jjoe64/graphview/LabelFormatter;

    move-wide/from16 v0, p1

    move/from16 v2, p3

    invoke-interface {v14, v0, v1, v2}, Lcom/jjoe64/graphview/LabelFormatter;->formatLabel(DZ)Ljava/lang/String;

    move-result-object v14

    goto :goto_3b
.end method

.method protected init([Ljava/lang/String;[Ljava/lang/String;Lcom/jjoe64/graphview/LabelFormatter;)V
    .registers 5
    .param p1, "horizontalLabels"    # [Ljava/lang/String;
    .param p2, "verticalLabels"    # [Ljava/lang/String;
    .param p3, "dynamicLabelFormatter"    # Lcom/jjoe64/graphview/LabelFormatter;

    .prologue
    .line 112
    iput-object p3, p0, Lcom/jjoe64/graphview/helper/StaticLabelsFormatter;->mDynamicLabelFormatter:Lcom/jjoe64/graphview/LabelFormatter;

    .line 113
    iget-object v0, p0, Lcom/jjoe64/graphview/helper/StaticLabelsFormatter;->mDynamicLabelFormatter:Lcom/jjoe64/graphview/LabelFormatter;

    if-nez v0, :cond_d

    .line 114
    new-instance v0, Lcom/jjoe64/graphview/DefaultLabelFormatter;

    invoke-direct {v0}, Lcom/jjoe64/graphview/DefaultLabelFormatter;-><init>()V

    iput-object v0, p0, Lcom/jjoe64/graphview/helper/StaticLabelsFormatter;->mDynamicLabelFormatter:Lcom/jjoe64/graphview/LabelFormatter;

    .line 117
    :cond_d
    iput-object p1, p0, Lcom/jjoe64/graphview/helper/StaticLabelsFormatter;->mHorizontalLabels:[Ljava/lang/String;

    .line 118
    iput-object p2, p0, Lcom/jjoe64/graphview/helper/StaticLabelsFormatter;->mVerticalLabels:[Ljava/lang/String;

    .line 119
    return-void
.end method

.method public setDynamicLabelFormatter(Lcom/jjoe64/graphview/LabelFormatter;)V
    .registers 2
    .param p1, "dynamicLabelFormatter"    # Lcom/jjoe64/graphview/LabelFormatter;

    .prologue
    .line 132
    iput-object p1, p0, Lcom/jjoe64/graphview/helper/StaticLabelsFormatter;->mDynamicLabelFormatter:Lcom/jjoe64/graphview/LabelFormatter;

    .line 133
    invoke-virtual {p0}, Lcom/jjoe64/graphview/helper/StaticLabelsFormatter;->adjust()V

    .line 134
    return-void
.end method

.method public setHorizontalLabels([Ljava/lang/String;)V
    .registers 2
    .param p1, "horizontalLabels"    # [Ljava/lang/String;

    .prologue
    .line 141
    iput-object p1, p0, Lcom/jjoe64/graphview/helper/StaticLabelsFormatter;->mHorizontalLabels:[Ljava/lang/String;

    .line 142
    invoke-virtual {p0}, Lcom/jjoe64/graphview/helper/StaticLabelsFormatter;->adjust()V

    .line 143
    return-void
.end method

.method public setVerticalLabels([Ljava/lang/String;)V
    .registers 2
    .param p1, "verticalLabels"    # [Ljava/lang/String;

    .prologue
    .line 150
    iput-object p1, p0, Lcom/jjoe64/graphview/helper/StaticLabelsFormatter;->mVerticalLabels:[Ljava/lang/String;

    .line 151
    invoke-virtual {p0}, Lcom/jjoe64/graphview/helper/StaticLabelsFormatter;->adjust()V

    .line 152
    return-void
.end method

.method public setViewport(Lcom/jjoe64/graphview/Viewport;)V
    .registers 2
    .param p1, "viewport"    # Lcom/jjoe64/graphview/Viewport;

    .prologue
    .line 187
    iput-object p1, p0, Lcom/jjoe64/graphview/helper/StaticLabelsFormatter;->mViewport:Lcom/jjoe64/graphview/Viewport;

    .line 188
    invoke-virtual {p0}, Lcom/jjoe64/graphview/helper/StaticLabelsFormatter;->adjust()V

    .line 189
    return-void
.end method
