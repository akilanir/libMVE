.class final Lcom/jjoe64/graphview/series/PointsGraphSeries$Styles;
.super Ljava/lang/Object;
.source "PointsGraphSeries.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jjoe64/graphview/series/PointsGraphSeries;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "Styles"
.end annotation


# instance fields
.field shape:Lcom/jjoe64/graphview/series/PointsGraphSeries$Shape;

.field size:F

.field final synthetic this$0:Lcom/jjoe64/graphview/series/PointsGraphSeries;


# direct methods
.method private constructor <init>(Lcom/jjoe64/graphview/series/PointsGraphSeries;)V
    .registers 2

    .prologue
    .line 85
    .local p0, "this":Lcom/jjoe64/graphview/series/PointsGraphSeries$Styles;, "Lcom/jjoe64/graphview/series/PointsGraphSeries<TE;>.Styles;"
    iput-object p1, p0, Lcom/jjoe64/graphview/series/PointsGraphSeries$Styles;->this$0:Lcom/jjoe64/graphview/series/PointsGraphSeries;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/jjoe64/graphview/series/PointsGraphSeries;Lcom/jjoe64/graphview/series/PointsGraphSeries$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/jjoe64/graphview/series/PointsGraphSeries;
    .param p2, "x1"    # Lcom/jjoe64/graphview/series/PointsGraphSeries$1;

    .prologue
    .line 85
    .local p0, "this":Lcom/jjoe64/graphview/series/PointsGraphSeries$Styles;, "Lcom/jjoe64/graphview/series/PointsGraphSeries<TE;>.Styles;"
    invoke-direct {p0, p1}, Lcom/jjoe64/graphview/series/PointsGraphSeries$Styles;-><init>(Lcom/jjoe64/graphview/series/PointsGraphSeries;)V

    return-void
.end method
