.class public Lcom/github/mikephil/charting/formatter/PercentFormatter;
.super Ljava/lang/Object;
.source "PercentFormatter.java"

# interfaces
.implements Lcom/github/mikephil/charting/formatter/ValueFormatter;
.implements Lcom/github/mikephil/charting/formatter/YAxisValueFormatter;


# instance fields
.field protected mFormat:Ljava/text/DecimalFormat;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    new-instance v0, Ljava/text/DecimalFormat;

    const-string v1, "###,###,##0.0"

    invoke-direct {v0, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/github/mikephil/charting/formatter/PercentFormatter;->mFormat:Ljava/text/DecimalFormat;

    .line 22
    return-void
.end method

.method public constructor <init>(Ljava/text/DecimalFormat;)V
    .registers 2
    .param p1, "format"    # Ljava/text/DecimalFormat;

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p1, p0, Lcom/github/mikephil/charting/formatter/PercentFormatter;->mFormat:Ljava/text/DecimalFormat;

    .line 31
    return-void
.end method


# virtual methods
.method public getFormattedValue(FLcom/github/mikephil/charting/components/YAxis;)Ljava/lang/String;
    .registers 7
    .param p1, "value"    # F
    .param p2, "yAxis"    # Lcom/github/mikephil/charting/components/YAxis;

    .prologue
    .line 42
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/github/mikephil/charting/formatter/PercentFormatter;->mFormat:Ljava/text/DecimalFormat;

    float-to-double v2, p1

    invoke-virtual {v1, v2, v3}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " %"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFormattedValue(FLcom/github/mikephil/charting/data/Entry;ILcom/github/mikephil/charting/utils/ViewPortHandler;)Ljava/lang/String;
    .registers 9
    .param p1, "value"    # F
    .param p2, "entry"    # Lcom/github/mikephil/charting/data/Entry;
    .param p3, "dataSetIndex"    # I
    .param p4, "viewPortHandler"    # Lcom/github/mikephil/charting/utils/ViewPortHandler;

    .prologue
    .line 36
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/github/mikephil/charting/formatter/PercentFormatter;->mFormat:Ljava/text/DecimalFormat;

    float-to-double v2, p1

    invoke-virtual {v1, v2, v3}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " %"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
