.class public Lorg/achartengine/renderer/SimpleSeriesRenderer;
.super Ljava/lang/Object;
.source "SimpleSeriesRenderer.java"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private mChartValuesFormat:Ljava/text/NumberFormat;

.field private mColor:I

.field private mDisplayBoundingPoints:Z

.field private mGradientEnabled:Z

.field private mGradientStartColor:I

.field private mGradientStartValue:D

.field private mGradientStopColor:I

.field private mGradientStopValue:D

.field private mHighlighted:Z

.field private mShowLegendItem:Z

.field private mStroke:Lorg/achartengine/renderer/BasicStroke;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x1

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    const v0, -0xffff01

    iput v0, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mColor:I

    .line 32
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mGradientEnabled:Z

    .line 42
    iput-boolean v1, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mShowLegendItem:Z

    .line 46
    iput-boolean v1, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mDisplayBoundingPoints:Z

    return-void
.end method


# virtual methods
.method public getChartValuesFormat()Ljava/text/NumberFormat;
    .registers 2

    .prologue
    .line 222
    iget-object v0, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mChartValuesFormat:Ljava/text/NumberFormat;

    return-object v0
.end method

.method public getColor()I
    .registers 2

    .prologue
    .line 56
    iget v0, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mColor:I

    return v0
.end method

.method public getGradientStartColor()I
    .registers 2

    .prologue
    .line 119
    iget v0, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mGradientStartColor:I

    return v0
.end method

.method public getGradientStartValue()D
    .registers 3

    .prologue
    .line 110
    iget-wide v0, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mGradientStartValue:D

    return-wide v0
.end method

.method public getGradientStopColor()I
    .registers 2

    .prologue
    .line 148
    iget v0, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mGradientStopColor:I

    return v0
.end method

.method public getGradientStopValue()D
    .registers 3

    .prologue
    .line 139
    iget-wide v0, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mGradientStopValue:D

    return-wide v0
.end method

.method public getStroke()Lorg/achartengine/renderer/BasicStroke;
    .registers 2

    .prologue
    .line 74
    iget-object v0, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mStroke:Lorg/achartengine/renderer/BasicStroke;

    return-object v0
.end method

.method public isDisplayBoundingPoints()Z
    .registers 2

    .prologue
    .line 204
    iget-boolean v0, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mDisplayBoundingPoints:Z

    return v0
.end method

.method public isGradientEnabled()Z
    .registers 2

    .prologue
    .line 92
    iget-boolean v0, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mGradientEnabled:Z

    return v0
.end method

.method public isHighlighted()Z
    .registers 2

    .prologue
    .line 186
    iget-boolean v0, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mHighlighted:Z

    return v0
.end method

.method public isShowLegendItem()Z
    .registers 2

    .prologue
    .line 168
    iget-boolean v0, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mShowLegendItem:Z

    return v0
.end method

.method public setChartValuesFormat(Ljava/text/NumberFormat;)V
    .registers 2
    .param p1, "format"    # Ljava/text/NumberFormat;

    .prologue
    .line 231
    iput-object p1, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mChartValuesFormat:Ljava/text/NumberFormat;

    .line 232
    return-void
.end method

.method public setColor(I)V
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 65
    iput p1, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mColor:I

    .line 66
    return-void
.end method

.method public setDisplayBoundingPoints(Z)V
    .registers 2
    .param p1, "display"    # Z

    .prologue
    .line 213
    iput-boolean p1, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mDisplayBoundingPoints:Z

    .line 214
    return-void
.end method

.method public setGradientEnabled(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 101
    iput-boolean p1, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mGradientEnabled:Z

    .line 102
    return-void
.end method

.method public setGradientStart(DI)V
    .registers 4
    .param p1, "start"    # D
    .param p3, "color"    # I

    .prologue
    .line 129
    iput-wide p1, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mGradientStartValue:D

    .line 130
    iput p3, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mGradientStartColor:I

    .line 131
    return-void
.end method

.method public setGradientStop(DI)V
    .registers 4
    .param p1, "start"    # D
    .param p3, "color"    # I

    .prologue
    .line 158
    iput-wide p1, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mGradientStopValue:D

    .line 159
    iput p3, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mGradientStopColor:I

    .line 160
    return-void
.end method

.method public setHighlighted(Z)V
    .registers 2
    .param p1, "highlighted"    # Z

    .prologue
    .line 195
    iput-boolean p1, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mHighlighted:Z

    .line 196
    return-void
.end method

.method public setShowLegendItem(Z)V
    .registers 2
    .param p1, "showLegend"    # Z

    .prologue
    .line 177
    iput-boolean p1, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mShowLegendItem:Z

    .line 178
    return-void
.end method

.method public setStroke(Lorg/achartengine/renderer/BasicStroke;)V
    .registers 2
    .param p1, "stroke"    # Lorg/achartengine/renderer/BasicStroke;

    .prologue
    .line 83
    iput-object p1, p0, Lorg/achartengine/renderer/SimpleSeriesRenderer;->mStroke:Lorg/achartengine/renderer/BasicStroke;

    .line 84
    return-void
.end method
