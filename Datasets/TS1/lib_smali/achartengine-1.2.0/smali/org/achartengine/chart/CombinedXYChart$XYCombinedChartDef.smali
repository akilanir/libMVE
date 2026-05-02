.class public Lorg/achartengine/chart/CombinedXYChart$XYCombinedChartDef;
.super Ljava/lang/Object;
.source "CombinedXYChart.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/achartengine/chart/CombinedXYChart;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "XYCombinedChartDef"
.end annotation


# instance fields
.field private seriesIndex:[I

.field private type:Ljava/lang/String;


# direct methods
.method public varargs constructor <init>(Ljava/lang/String;[I)V
    .registers 3
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "seriesIndex"    # [I

    .prologue
    .line 211
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 212
    iput-object p1, p0, Lorg/achartengine/chart/CombinedXYChart$XYCombinedChartDef;->type:Ljava/lang/String;

    .line 213
    iput-object p2, p0, Lorg/achartengine/chart/CombinedXYChart$XYCombinedChartDef;->seriesIndex:[I

    .line 214
    return-void
.end method


# virtual methods
.method public containsSeries(I)Z
    .registers 3
    .param p1, "seriesIndex"    # I

    .prologue
    .line 217
    invoke-virtual {p0, p1}, Lorg/achartengine/chart/CombinedXYChart$XYCombinedChartDef;->getChartSeriesIndex(I)I

    move-result v0

    if-ltz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public getChartSeriesIndex(I)I
    .registers 4
    .param p1, "seriesIndex"    # I

    .prologue
    .line 221
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-virtual {p0}, Lorg/achartengine/chart/CombinedXYChart$XYCombinedChartDef;->getSeriesIndex()[I

    move-result-object v1

    array-length v1, v1

    if-ge v0, v1, :cond_12

    .line 222
    iget-object v1, p0, Lorg/achartengine/chart/CombinedXYChart$XYCombinedChartDef;->seriesIndex:[I

    aget v1, v1, v0

    if-ne v1, p1, :cond_f

    .line 226
    .end local v0    # "i":I
    :goto_e
    return v0

    .line 221
    .restart local v0    # "i":I
    :cond_f
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 226
    :cond_12
    const/4 v0, -0x1

    goto :goto_e
.end method

.method public getSeriesIndex()[I
    .registers 2

    .prologue
    .line 234
    iget-object v0, p0, Lorg/achartengine/chart/CombinedXYChart$XYCombinedChartDef;->seriesIndex:[I

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 230
    iget-object v0, p0, Lorg/achartengine/chart/CombinedXYChart$XYCombinedChartDef;->type:Ljava/lang/String;

    return-object v0
.end method
