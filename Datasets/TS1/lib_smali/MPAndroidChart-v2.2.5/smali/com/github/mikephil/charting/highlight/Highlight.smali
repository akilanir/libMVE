.class public Lcom/github/mikephil/charting/highlight/Highlight;
.super Ljava/lang/Object;
.source "Highlight.java"


# instance fields
.field private mDataIndex:I

.field private mDataSetIndex:I

.field private mRange:Lcom/github/mikephil/charting/highlight/Range;

.field private mStackIndex:I

.field private mValue:F

.field private mXIndex:I


# direct methods
.method public constructor <init>(IFII)V
    .registers 6
    .param p1, "x"    # I
    .param p2, "value"    # F
    .param p3, "dataIndex"    # I
    .param p4, "dataSetIndex"    # I

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    const/high16 v0, 0x7fc00000    # Float.NaN

    iput v0, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mValue:F

    .line 24
    const/4 v0, -0x1

    iput v0, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mStackIndex:I

    .line 38
    iput p1, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mXIndex:I

    .line 39
    iput p2, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mValue:F

    .line 40
    iput p3, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mDataIndex:I

    .line 41
    iput p4, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mDataSetIndex:I

    .line 42
    return-void
.end method

.method public constructor <init>(IFIII)V
    .registers 6
    .param p1, "x"    # I
    .param p2, "value"    # F
    .param p3, "dataIndex"    # I
    .param p4, "dataSetIndex"    # I
    .param p5, "stackIndex"    # I

    .prologue
    .line 54
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/github/mikephil/charting/highlight/Highlight;-><init>(IFII)V

    .line 55
    iput p5, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mStackIndex:I

    .line 56
    return-void
.end method

.method public constructor <init>(IFIIILcom/github/mikephil/charting/highlight/Range;)V
    .registers 7
    .param p1, "x"    # I
    .param p2, "value"    # F
    .param p3, "dataIndex"    # I
    .param p4, "dataSetIndex"    # I
    .param p5, "stackIndex"    # I
    .param p6, "range"    # Lcom/github/mikephil/charting/highlight/Range;

    .prologue
    .line 70
    invoke-direct/range {p0 .. p5}, Lcom/github/mikephil/charting/highlight/Highlight;-><init>(IFIII)V

    .line 71
    iput-object p6, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mRange:Lcom/github/mikephil/charting/highlight/Range;

    .line 72
    return-void
.end method

.method public constructor <init>(II)V
    .registers 9
    .param p1, "x"    # I
    .param p2, "dataSetIndex"    # I

    .prologue
    .line 81
    const/high16 v2, 0x7fc00000    # Float.NaN

    const/4 v3, 0x0

    const/4 v5, -0x1

    move-object v0, p0

    move v1, p1

    move v4, p2

    invoke-direct/range {v0 .. v5}, Lcom/github/mikephil/charting/highlight/Highlight;-><init>(IFIII)V

    .line 82
    return-void
.end method


# virtual methods
.method public equalTo(Lcom/github/mikephil/charting/highlight/Highlight;)Z
    .registers 5
    .param p1, "h"    # Lcom/github/mikephil/charting/highlight/Highlight;

    .prologue
    const/4 v0, 0x0

    .line 147
    if-nez p1, :cond_4

    .line 154
    :cond_3
    :goto_3
    return v0

    .line 150
    :cond_4
    iget v1, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mDataSetIndex:I

    iget v2, p1, Lcom/github/mikephil/charting/highlight/Highlight;->mDataSetIndex:I

    if-ne v1, v2, :cond_3

    iget v1, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mXIndex:I

    iget v2, p1, Lcom/github/mikephil/charting/highlight/Highlight;->mXIndex:I

    if-ne v1, v2, :cond_3

    iget v1, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mStackIndex:I

    iget v2, p1, Lcom/github/mikephil/charting/highlight/Highlight;->mStackIndex:I

    if-ne v1, v2, :cond_3

    .line 152
    const/4 v0, 0x1

    goto :goto_3
.end method

.method public getDataIndex()I
    .registers 2

    .prologue
    .line 108
    iget v0, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mDataIndex:I

    return v0
.end method

.method public getDataSetIndex()I
    .registers 2

    .prologue
    .line 117
    iget v0, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mDataSetIndex:I

    return v0
.end method

.method public getRange()Lcom/github/mikephil/charting/highlight/Range;
    .registers 2

    .prologue
    .line 135
    iget-object v0, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mRange:Lcom/github/mikephil/charting/highlight/Range;

    return-object v0
.end method

.method public getStackIndex()I
    .registers 2

    .prologue
    .line 127
    iget v0, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mStackIndex:I

    return v0
.end method

.method public getValue()F
    .registers 2

    .prologue
    .line 99
    iget v0, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mValue:F

    return v0
.end method

.method public getXIndex()I
    .registers 2

    .prologue
    .line 90
    iget v0, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mXIndex:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 160
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Highlight, xIndex: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mXIndex:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", dataSetIndex: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mDataSetIndex:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", stackIndex (only stacked barentry): "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/github/mikephil/charting/highlight/Highlight;->mStackIndex:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
