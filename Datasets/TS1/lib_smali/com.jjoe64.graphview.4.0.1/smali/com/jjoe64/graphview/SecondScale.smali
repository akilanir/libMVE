.class public Lcom/jjoe64/graphview/SecondScale;
.super Ljava/lang/Object;
.source "SecondScale.java"


# instance fields
.field protected mLabelFormatter:Lcom/jjoe64/graphview/LabelFormatter;

.field private mMaxY:D

.field private mMinY:D

.field protected mSeries:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/jjoe64/graphview/series/Series;",
            ">;"
        }
    .end annotation
.end field

.field protected final mViewport:Lcom/jjoe64/graphview/Viewport;

.field private mYAxisBoundsManual:Z


# direct methods
.method constructor <init>(Lcom/jjoe64/graphview/Viewport;)V
    .registers 4
    .param p1, "viewport"    # Lcom/jjoe64/graphview/Viewport;

    .prologue
    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/jjoe64/graphview/SecondScale;->mYAxisBoundsManual:Z

    .line 81
    iput-object p1, p0, Lcom/jjoe64/graphview/SecondScale;->mViewport:Lcom/jjoe64/graphview/Viewport;

    .line 82
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/jjoe64/graphview/SecondScale;->mSeries:Ljava/util/List;

    .line 83
    new-instance v0, Lcom/jjoe64/graphview/DefaultLabelFormatter;

    invoke-direct {v0}, Lcom/jjoe64/graphview/DefaultLabelFormatter;-><init>()V

    iput-object v0, p0, Lcom/jjoe64/graphview/SecondScale;->mLabelFormatter:Lcom/jjoe64/graphview/LabelFormatter;

    .line 84
    iget-object v0, p0, Lcom/jjoe64/graphview/SecondScale;->mLabelFormatter:Lcom/jjoe64/graphview/LabelFormatter;

    iget-object v1, p0, Lcom/jjoe64/graphview/SecondScale;->mViewport:Lcom/jjoe64/graphview/Viewport;

    invoke-interface {v0, v1}, Lcom/jjoe64/graphview/LabelFormatter;->setViewport(Lcom/jjoe64/graphview/Viewport;)V

    .line 85
    return-void
.end method


# virtual methods
.method public addSeries(Lcom/jjoe64/graphview/series/Series;)V
    .registers 3
    .param p1, "s"    # Lcom/jjoe64/graphview/series/Series;

    .prologue
    .line 95
    iget-object v0, p0, Lcom/jjoe64/graphview/SecondScale;->mSeries:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 96
    return-void
.end method

.method public getLabelFormatter()Lcom/jjoe64/graphview/LabelFormatter;
    .registers 2

    .prologue
    .line 152
    iget-object v0, p0, Lcom/jjoe64/graphview/SecondScale;->mLabelFormatter:Lcom/jjoe64/graphview/LabelFormatter;

    return-object v0
.end method

.method public getMaxY()D
    .registers 3

    .prologue
    .line 138
    iget-wide v0, p0, Lcom/jjoe64/graphview/SecondScale;->mMaxY:D

    return-wide v0
.end method

.method public getMinY()D
    .registers 3

    .prologue
    .line 131
    iget-wide v0, p0, Lcom/jjoe64/graphview/SecondScale;->mMinY:D

    return-wide v0
.end method

.method public getSeries()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/jjoe64/graphview/series/Series;",
            ">;"
        }
    .end annotation

    .prologue
    .line 124
    iget-object v0, p0, Lcom/jjoe64/graphview/SecondScale;->mSeries:Ljava/util/List;

    return-object v0
.end method

.method public isYAxisBoundsManual()Z
    .registers 2

    .prologue
    .line 145
    iget-boolean v0, p0, Lcom/jjoe64/graphview/SecondScale;->mYAxisBoundsManual:Z

    return v0
.end method

.method public setLabelFormatter(Lcom/jjoe64/graphview/LabelFormatter;)V
    .registers 4
    .param p1, "formatter"    # Lcom/jjoe64/graphview/LabelFormatter;

    .prologue
    .line 162
    iput-object p1, p0, Lcom/jjoe64/graphview/SecondScale;->mLabelFormatter:Lcom/jjoe64/graphview/LabelFormatter;

    .line 163
    iget-object v0, p0, Lcom/jjoe64/graphview/SecondScale;->mLabelFormatter:Lcom/jjoe64/graphview/LabelFormatter;

    iget-object v1, p0, Lcom/jjoe64/graphview/SecondScale;->mViewport:Lcom/jjoe64/graphview/Viewport;

    invoke-interface {v0, v1}, Lcom/jjoe64/graphview/LabelFormatter;->setViewport(Lcom/jjoe64/graphview/Viewport;)V

    .line 164
    return-void
.end method

.method public setMaxY(D)V
    .registers 3
    .param p1, "d"    # D

    .prologue
    .line 117
    iput-wide p1, p0, Lcom/jjoe64/graphview/SecondScale;->mMaxY:D

    .line 118
    return-void
.end method

.method public setMinY(D)V
    .registers 3
    .param p1, "d"    # D

    .prologue
    .line 108
    iput-wide p1, p0, Lcom/jjoe64/graphview/SecondScale;->mMinY:D

    .line 109
    return-void
.end method
