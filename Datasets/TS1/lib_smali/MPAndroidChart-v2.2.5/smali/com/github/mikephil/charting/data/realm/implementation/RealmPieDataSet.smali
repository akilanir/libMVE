.class public Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;
.super Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;
.source "RealmPieDataSet.java"

# interfaces
.implements Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lio/realm/RealmObject;",
        ">",
        "Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet",
        "<TT;",
        "Lcom/github/mikephil/charting/data/Entry;",
        ">;",
        "Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;"
    }
.end annotation


# instance fields
.field private mShift:F

.field private mSliceSpace:F

.field private mValueLineColor:I

.field private mValueLinePart1Length:F

.field private mValueLinePart1OffsetPercentage:F

.field private mValueLinePart2Length:F

.field private mValueLineVariableLength:Z

.field private mValueLineWidth:F

.field private mXValuePosition:Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;

.field private mYValuePosition:Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;


# direct methods
.method public constructor <init>(Lio/realm/RealmResults;Ljava/lang/String;)V
    .registers 5
    .param p2, "yValuesField"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/realm/RealmResults",
            "<TT;>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 44
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet<TT;>;"
    .local p1, "result":Lio/realm/RealmResults;, "Lio/realm/RealmResults<TT;>;"
    invoke-direct {p0, p1, p2}, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;-><init>(Lio/realm/RealmResults;Ljava/lang/String;)V

    .line 21
    const/4 v0, 0x0

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;->mSliceSpace:F

    .line 26
    const/high16 v0, 0x41900000    # 18.0f

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;->mShift:F

    .line 28
    sget-object v0, Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;->INSIDE_SLICE:Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;

    iput-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;->mXValuePosition:Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;

    .line 29
    sget-object v0, Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;->INSIDE_SLICE:Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;

    iput-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;->mYValuePosition:Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;

    .line 30
    const/high16 v0, -0x1000000

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;->mValueLineColor:I

    .line 31
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;->mValueLineWidth:F

    .line 32
    const/high16 v0, 0x42960000    # 75.0f

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;->mValueLinePart1OffsetPercentage:F

    .line 33
    const v0, 0x3e99999a    # 0.3f

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;->mValueLinePart1Length:F

    .line 34
    const v0, 0x3ecccccd    # 0.4f

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;->mValueLinePart2Length:F

    .line 35
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;->mValueLineVariableLength:Z

    .line 46
    iget-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;->results:Lio/realm/RealmResults;

    invoke-virtual {p0, v0}, Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;->build(Lio/realm/RealmResults;)V

    .line 47
    const/4 v0, 0x0

    iget-object v1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;->results:Lio/realm/RealmResults;

    invoke-virtual {v1}, Lio/realm/RealmResults;->size()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;->calcMinMax(II)V

    .line 48
    return-void
.end method

.method public constructor <init>(Lio/realm/RealmResults;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p2, "yValuesField"    # Ljava/lang/String;
    .param p3, "xIndexField"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/realm/RealmResults",
            "<TT;>;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 58
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet<TT;>;"
    .local p1, "result":Lio/realm/RealmResults;, "Lio/realm/RealmResults<TT;>;"
    invoke-direct {p0, p1, p2, p3}, Lcom/github/mikephil/charting/data/realm/base/RealmBaseDataSet;-><init>(Lio/realm/RealmResults;Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    const/4 v0, 0x0

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;->mSliceSpace:F

    .line 26
    const/high16 v0, 0x41900000    # 18.0f

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;->mShift:F

    .line 28
    sget-object v0, Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;->INSIDE_SLICE:Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;

    iput-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;->mXValuePosition:Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;

    .line 29
    sget-object v0, Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;->INSIDE_SLICE:Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;

    iput-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;->mYValuePosition:Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;

    .line 30
    const/high16 v0, -0x1000000

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;->mValueLineColor:I

    .line 31
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;->mValueLineWidth:F

    .line 32
    const/high16 v0, 0x42960000    # 75.0f

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;->mValueLinePart1OffsetPercentage:F

    .line 33
    const v0, 0x3e99999a    # 0.3f

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;->mValueLinePart1Length:F

    .line 34
    const v0, 0x3ecccccd    # 0.4f

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;->mValueLinePart2Length:F

    .line 35
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;->mValueLineVariableLength:Z

    .line 60
    iget-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;->results:Lio/realm/RealmResults;

    invoke-virtual {p0, v0}, Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;->build(Lio/realm/RealmResults;)V

    .line 61
    const/4 v0, 0x0

    iget-object v1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;->results:Lio/realm/RealmResults;

    invoke-virtual {v1}, Lio/realm/RealmResults;->size()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;->calcMinMax(II)V

    .line 62
    return-void
.end method


# virtual methods
.method public getSelectionShift()F
    .registers 2

    .prologue
    .line 97
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;->mShift:F

    return v0
.end method

.method public getSliceSpace()F
    .registers 2

    .prologue
    .line 82
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;->mSliceSpace:F

    return v0
.end method

.method public getValueLineColor()I
    .registers 2

    .prologue
    .line 126
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;->mValueLineColor:I

    return v0
.end method

.method public getValueLinePart1Length()F
    .registers 2

    .prologue
    .line 162
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;->mValueLinePart1Length:F

    return v0
.end method

.method public getValueLinePart1OffsetPercentage()F
    .registers 2

    .prologue
    .line 150
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;->mValueLinePart1OffsetPercentage:F

    return v0
.end method

.method public getValueLinePart2Length()F
    .registers 2

    .prologue
    .line 174
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;->mValueLinePart2Length:F

    return v0
.end method

.method public getValueLineWidth()F
    .registers 2

    .prologue
    .line 138
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;->mValueLineWidth:F

    return v0
.end method

.method public getXValuePosition()Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;
    .registers 2

    .prologue
    .line 103
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;->mXValuePosition:Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;

    return-object v0
.end method

.method public getYValuePosition()Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;
    .registers 2

    .prologue
    .line 114
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;->mYValuePosition:Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;

    return-object v0
.end method

.method public isValueLineVariableLength()Z
    .registers 2

    .prologue
    .line 186
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet<TT;>;"
    iget-boolean v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;->mValueLineVariableLength:Z

    return v0
.end method

.method public setSelectionShift(F)V
    .registers 3
    .param p1, "shift"    # F

    .prologue
    .line 92
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet<TT;>;"
    invoke-static {p1}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;->mShift:F

    .line 93
    return-void
.end method

.method public setSliceSpace(F)V
    .registers 3
    .param p1, "spaceDp"    # F

    .prologue
    .line 72
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet<TT;>;"
    const/high16 v0, 0x41a00000    # 20.0f

    cmpl-float v0, p1, v0

    if-lez v0, :cond_8

    .line 73
    const/high16 p1, 0x41a00000    # 20.0f

    .line 74
    :cond_8
    const/4 v0, 0x0

    cmpg-float v0, p1, v0

    if-gez v0, :cond_e

    .line 75
    const/4 p1, 0x0

    .line 77
    :cond_e
    invoke-static {p1}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;->mSliceSpace:F

    .line 78
    return-void
.end method

.method public setValueLineColor(I)V
    .registers 2
    .param p1, "valueLineColor"    # I

    .prologue
    .line 131
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet<TT;>;"
    iput p1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;->mValueLineColor:I

    .line 132
    return-void
.end method

.method public setValueLinePart1Length(F)V
    .registers 2
    .param p1, "valueLinePart1Length"    # F

    .prologue
    .line 167
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet<TT;>;"
    iput p1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;->mValueLinePart1Length:F

    .line 168
    return-void
.end method

.method public setValueLinePart1OffsetPercentage(F)V
    .registers 2
    .param p1, "valueLinePart1OffsetPercentage"    # F

    .prologue
    .line 155
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet<TT;>;"
    iput p1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;->mValueLinePart1OffsetPercentage:F

    .line 156
    return-void
.end method

.method public setValueLinePart2Length(F)V
    .registers 2
    .param p1, "valueLinePart2Length"    # F

    .prologue
    .line 179
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet<TT;>;"
    iput p1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;->mValueLinePart2Length:F

    .line 180
    return-void
.end method

.method public setValueLineVariableLength(Z)V
    .registers 2
    .param p1, "valueLineVariableLength"    # Z

    .prologue
    .line 191
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet<TT;>;"
    iput-boolean p1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;->mValueLineVariableLength:Z

    .line 192
    return-void
.end method

.method public setValueLineWidth(F)V
    .registers 2
    .param p1, "valueLineWidth"    # F

    .prologue
    .line 143
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet<TT;>;"
    iput p1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;->mValueLineWidth:F

    .line 144
    return-void
.end method

.method public setXValuePosition(Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;)V
    .registers 2
    .param p1, "xValuePosition"    # Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;

    .prologue
    .line 108
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet<TT;>;"
    iput-object p1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;->mXValuePosition:Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;

    .line 109
    return-void
.end method

.method public setYValuePosition(Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;)V
    .registers 2
    .param p1, "yValuePosition"    # Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;

    .prologue
    .line 119
    .local p0, "this":Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;, "Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet<TT;>;"
    iput-object p1, p0, Lcom/github/mikephil/charting/data/realm/implementation/RealmPieDataSet;->mYValuePosition:Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;

    .line 120
    return-void
.end method
