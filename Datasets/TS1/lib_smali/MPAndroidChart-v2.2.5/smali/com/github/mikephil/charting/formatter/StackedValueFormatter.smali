.class public Lcom/github/mikephil/charting/formatter/StackedValueFormatter;
.super Ljava/lang/Object;
.source "StackedValueFormatter.java"

# interfaces
.implements Lcom/github/mikephil/charting/formatter/ValueFormatter;


# instance fields
.field private mAppendix:Ljava/lang/String;

.field private mDrawWholeStack:Z

.field private mFormat:Ljava/text/DecimalFormat;


# direct methods
.method public constructor <init>(ZLjava/lang/String;I)V
    .registers 9
    .param p1, "drawWholeStack"    # Z
    .param p2, "appendix"    # Ljava/lang/String;
    .param p3, "decimals"    # I

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-boolean p1, p0, Lcom/github/mikephil/charting/formatter/StackedValueFormatter;->mDrawWholeStack:Z

    .line 38
    iput-object p2, p0, Lcom/github/mikephil/charting/formatter/StackedValueFormatter;->mAppendix:Ljava/lang/String;

    .line 40
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 41
    .local v0, "b":Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_d
    if-ge v1, p3, :cond_1e

    .line 42
    if-nez v1, :cond_16

    .line 43
    const-string v2, "."

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 44
    :cond_16
    const-string v2, "0"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 41
    add-int/lit8 v1, v1, 0x1

    goto :goto_d

    .line 47
    :cond_1e
    new-instance v2, Ljava/text/DecimalFormat;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "###,###,###,##0"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    iput-object v2, p0, Lcom/github/mikephil/charting/formatter/StackedValueFormatter;->mFormat:Ljava/text/DecimalFormat;

    .line 48
    return-void
.end method


# virtual methods
.method public getFormattedValue(FLcom/github/mikephil/charting/data/Entry;ILcom/github/mikephil/charting/utils/ViewPortHandler;)Ljava/lang/String;
    .registers 11
    .param p1, "value"    # F
    .param p2, "entry"    # Lcom/github/mikephil/charting/data/Entry;
    .param p3, "dataSetIndex"    # I
    .param p4, "viewPortHandler"    # Lcom/github/mikephil/charting/utils/ViewPortHandler;

    .prologue
    .line 53
    iget-boolean v2, p0, Lcom/github/mikephil/charting/formatter/StackedValueFormatter;->mDrawWholeStack:Z

    if-nez v2, :cond_3c

    instance-of v2, p2, Lcom/github/mikephil/charting/data/BarEntry;

    if-eqz v2, :cond_3c

    move-object v0, p2

    .line 55
    check-cast v0, Lcom/github/mikephil/charting/data/BarEntry;

    .line 56
    .local v0, "barEntry":Lcom/github/mikephil/charting/data/BarEntry;
    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/BarEntry;->getVals()[F

    move-result-object v1

    .line 58
    .local v1, "vals":[F
    if-eqz v1, :cond_3c

    .line 61
    array-length v2, v1

    add-int/lit8 v2, v2, -0x1

    aget v2, v1, v2

    cmpl-float v2, v2, p1

    if-nez v2, :cond_39

    .line 64
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/github/mikephil/charting/formatter/StackedValueFormatter;->mFormat:Ljava/text/DecimalFormat;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/data/BarEntry;->getVal()F

    move-result v4

    float-to-double v4, v4

    invoke-virtual {v3, v4, v5}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/github/mikephil/charting/formatter/StackedValueFormatter;->mAppendix:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 72
    .end local v0    # "barEntry":Lcom/github/mikephil/charting/data/BarEntry;
    .end local v1    # "vals":[F
    :goto_38
    return-object v2

    .line 66
    .restart local v0    # "barEntry":Lcom/github/mikephil/charting/data/BarEntry;
    .restart local v1    # "vals":[F
    :cond_39
    const-string v2, ""

    goto :goto_38

    .line 72
    .end local v0    # "barEntry":Lcom/github/mikephil/charting/data/BarEntry;
    .end local v1    # "vals":[F
    :cond_3c
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/github/mikephil/charting/formatter/StackedValueFormatter;->mFormat:Ljava/text/DecimalFormat;

    float-to-double v4, p1

    invoke-virtual {v3, v4, v5}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/github/mikephil/charting/formatter/StackedValueFormatter;->mAppendix:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_38
.end method
