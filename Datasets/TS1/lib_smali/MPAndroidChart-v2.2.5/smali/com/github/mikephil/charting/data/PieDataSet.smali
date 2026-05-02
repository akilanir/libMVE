.class public Lcom/github/mikephil/charting/data/PieDataSet;
.super Lcom/github/mikephil/charting/data/DataSet;
.source "PieDataSet.java"

# interfaces
.implements Lcom/github/mikephil/charting/interfaces/datasets/IPieDataSet;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/github/mikephil/charting/data/DataSet",
        "<",
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
.method public constructor <init>(Ljava/util/List;Ljava/lang/String;)V
    .registers 4
    .param p2, "label"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/github/mikephil/charting/data/Entry;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 28
    .local p1, "yVals":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/data/Entry;>;"
    invoke-direct {p0, p1, p2}, Lcom/github/mikephil/charting/data/DataSet;-><init>(Ljava/util/List;Ljava/lang/String;)V

    .line 13
    const/4 v0, 0x0

    iput v0, p0, Lcom/github/mikephil/charting/data/PieDataSet;->mSliceSpace:F

    .line 16
    const/high16 v0, 0x41900000    # 18.0f

    iput v0, p0, Lcom/github/mikephil/charting/data/PieDataSet;->mShift:F

    .line 18
    sget-object v0, Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;->INSIDE_SLICE:Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;

    iput-object v0, p0, Lcom/github/mikephil/charting/data/PieDataSet;->mXValuePosition:Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;

    .line 19
    sget-object v0, Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;->INSIDE_SLICE:Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;

    iput-object v0, p0, Lcom/github/mikephil/charting/data/PieDataSet;->mYValuePosition:Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;

    .line 20
    const/high16 v0, -0x1000000

    iput v0, p0, Lcom/github/mikephil/charting/data/PieDataSet;->mValueLineColor:I

    .line 21
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/github/mikephil/charting/data/PieDataSet;->mValueLineWidth:F

    .line 22
    const/high16 v0, 0x42960000    # 75.0f

    iput v0, p0, Lcom/github/mikephil/charting/data/PieDataSet;->mValueLinePart1OffsetPercentage:F

    .line 23
    const v0, 0x3e99999a    # 0.3f

    iput v0, p0, Lcom/github/mikephil/charting/data/PieDataSet;->mValueLinePart1Length:F

    .line 24
    const v0, 0x3ecccccd    # 0.4f

    iput v0, p0, Lcom/github/mikephil/charting/data/PieDataSet;->mValueLinePart2Length:F

    .line 25
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/github/mikephil/charting/data/PieDataSet;->mValueLineVariableLength:Z

    .line 30
    return-void
.end method


# virtual methods
.method public copy()Lcom/github/mikephil/charting/data/DataSet;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/github/mikephil/charting/data/DataSet",
            "<",
            "Lcom/github/mikephil/charting/data/Entry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 35
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 37
    .local v2, "yVals":Ljava/util/List;, "Ljava/util/List<Lcom/github/mikephil/charting/data/Entry;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_6
    iget-object v3, p0, Lcom/github/mikephil/charting/data/PieDataSet;->mYVals:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v1, v3, :cond_20

    .line 38
    iget-object v3, p0, Lcom/github/mikephil/charting/data/PieDataSet;->mYVals:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/github/mikephil/charting/data/Entry;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/data/Entry;->copy()Lcom/github/mikephil/charting/data/Entry;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 37
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 41
    :cond_20
    new-instance v0, Lcom/github/mikephil/charting/data/PieDataSet;

    invoke-virtual {p0}, Lcom/github/mikephil/charting/data/PieDataSet;->getLabel()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Lcom/github/mikephil/charting/data/PieDataSet;-><init>(Ljava/util/List;Ljava/lang/String;)V

    .line 42
    .local v0, "copied":Lcom/github/mikephil/charting/data/PieDataSet;
    iget-object v3, p0, Lcom/github/mikephil/charting/data/PieDataSet;->mColors:Ljava/util/List;

    iput-object v3, v0, Lcom/github/mikephil/charting/data/PieDataSet;->mColors:Ljava/util/List;

    .line 43
    iget v3, p0, Lcom/github/mikephil/charting/data/PieDataSet;->mSliceSpace:F

    iput v3, v0, Lcom/github/mikephil/charting/data/PieDataSet;->mSliceSpace:F

    .line 44
    iget v3, p0, Lcom/github/mikephil/charting/data/PieDataSet;->mShift:F

    iput v3, v0, Lcom/github/mikephil/charting/data/PieDataSet;->mShift:F

    .line 45
    return-object v0
.end method

.method public getSelectionShift()F
    .registers 2

    .prologue
    .line 81
    iget v0, p0, Lcom/github/mikephil/charting/data/PieDataSet;->mShift:F

    return v0
.end method

.method public getSliceSpace()F
    .registers 2

    .prologue
    .line 66
    iget v0, p0, Lcom/github/mikephil/charting/data/PieDataSet;->mSliceSpace:F

    return v0
.end method

.method public getValueLineColor()I
    .registers 2

    .prologue
    .line 110
    iget v0, p0, Lcom/github/mikephil/charting/data/PieDataSet;->mValueLineColor:I

    return v0
.end method

.method public getValueLinePart1Length()F
    .registers 2

    .prologue
    .line 146
    iget v0, p0, Lcom/github/mikephil/charting/data/PieDataSet;->mValueLinePart1Length:F

    return v0
.end method

.method public getValueLinePart1OffsetPercentage()F
    .registers 2

    .prologue
    .line 134
    iget v0, p0, Lcom/github/mikephil/charting/data/PieDataSet;->mValueLinePart1OffsetPercentage:F

    return v0
.end method

.method public getValueLinePart2Length()F
    .registers 2

    .prologue
    .line 158
    iget v0, p0, Lcom/github/mikephil/charting/data/PieDataSet;->mValueLinePart2Length:F

    return v0
.end method

.method public getValueLineWidth()F
    .registers 2

    .prologue
    .line 122
    iget v0, p0, Lcom/github/mikephil/charting/data/PieDataSet;->mValueLineWidth:F

    return v0
.end method

.method public getXValuePosition()Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;
    .registers 2

    .prologue
    .line 87
    iget-object v0, p0, Lcom/github/mikephil/charting/data/PieDataSet;->mXValuePosition:Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;

    return-object v0
.end method

.method public getYValuePosition()Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;
    .registers 2

    .prologue
    .line 98
    iget-object v0, p0, Lcom/github/mikephil/charting/data/PieDataSet;->mYValuePosition:Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;

    return-object v0
.end method

.method public isValueLineVariableLength()Z
    .registers 2

    .prologue
    .line 170
    iget-boolean v0, p0, Lcom/github/mikephil/charting/data/PieDataSet;->mValueLineVariableLength:Z

    return v0
.end method

.method public setSelectionShift(F)V
    .registers 3
    .param p1, "shift"    # F

    .prologue
    .line 76
    invoke-static {p1}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/data/PieDataSet;->mShift:F

    .line 77
    return-void
.end method

.method public setSliceSpace(F)V
    .registers 3
    .param p1, "spaceDp"    # F

    .prologue
    .line 56
    const/high16 v0, 0x41a00000    # 20.0f

    cmpl-float v0, p1, v0

    if-lez v0, :cond_8

    .line 57
    const/high16 p1, 0x41a00000    # 20.0f

    .line 58
    :cond_8
    const/4 v0, 0x0

    cmpg-float v0, p1, v0

    if-gez v0, :cond_e

    .line 59
    const/4 p1, 0x0

    .line 61
    :cond_e
    invoke-static {p1}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/data/PieDataSet;->mSliceSpace:F

    .line 62
    return-void
.end method

.method public setValueLineColor(I)V
    .registers 2
    .param p1, "valueLineColor"    # I

    .prologue
    .line 115
    iput p1, p0, Lcom/github/mikephil/charting/data/PieDataSet;->mValueLineColor:I

    .line 116
    return-void
.end method

.method public setValueLinePart1Length(F)V
    .registers 2
    .param p1, "valueLinePart1Length"    # F

    .prologue
    .line 151
    iput p1, p0, Lcom/github/mikephil/charting/data/PieDataSet;->mValueLinePart1Length:F

    .line 152
    return-void
.end method

.method public setValueLinePart1OffsetPercentage(F)V
    .registers 2
    .param p1, "valueLinePart1OffsetPercentage"    # F

    .prologue
    .line 139
    iput p1, p0, Lcom/github/mikephil/charting/data/PieDataSet;->mValueLinePart1OffsetPercentage:F

    .line 140
    return-void
.end method

.method public setValueLinePart2Length(F)V
    .registers 2
    .param p1, "valueLinePart2Length"    # F

    .prologue
    .line 163
    iput p1, p0, Lcom/github/mikephil/charting/data/PieDataSet;->mValueLinePart2Length:F

    .line 164
    return-void
.end method

.method public setValueLineVariableLength(Z)V
    .registers 2
    .param p1, "valueLineVariableLength"    # Z

    .prologue
    .line 175
    iput-boolean p1, p0, Lcom/github/mikephil/charting/data/PieDataSet;->mValueLineVariableLength:Z

    .line 176
    return-void
.end method

.method public setValueLineWidth(F)V
    .registers 2
    .param p1, "valueLineWidth"    # F

    .prologue
    .line 127
    iput p1, p0, Lcom/github/mikephil/charting/data/PieDataSet;->mValueLineWidth:F

    .line 128
    return-void
.end method

.method public setXValuePosition(Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;)V
    .registers 2
    .param p1, "xValuePosition"    # Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;

    .prologue
    .line 92
    iput-object p1, p0, Lcom/github/mikephil/charting/data/PieDataSet;->mXValuePosition:Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;

    .line 93
    return-void
.end method

.method public setYValuePosition(Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;)V
    .registers 2
    .param p1, "yValuePosition"    # Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;

    .prologue
    .line 103
    iput-object p1, p0, Lcom/github/mikephil/charting/data/PieDataSet;->mYValuePosition:Lcom/github/mikephil/charting/data/PieDataSet$ValuePosition;

    .line 104
    return-void
.end method
