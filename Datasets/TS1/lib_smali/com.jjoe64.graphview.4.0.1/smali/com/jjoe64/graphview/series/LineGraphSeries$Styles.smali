.class final Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;
.super Ljava/lang/Object;
.source "LineGraphSeries.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jjoe64/graphview/series/LineGraphSeries;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "Styles"
.end annotation


# instance fields
.field private backgroundColor:I

.field private dataPointsRadius:F

.field private drawBackground:Z

.field private drawDataPoints:Z

.field private thickness:I

.field final synthetic this$0:Lcom/jjoe64/graphview/series/LineGraphSeries;


# direct methods
.method private constructor <init>(Lcom/jjoe64/graphview/series/LineGraphSeries;)V
    .registers 6

    .prologue
    .local p0, "this":Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;, "Lcom/jjoe64/graphview/series/LineGraphSeries<TE;>.Styles;"
    const/4 v1, 0x0

    .line 41
    iput-object p1, p0, Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;->this$0:Lcom/jjoe64/graphview/series/LineGraphSeries;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    const/4 v0, 0x5

    iput v0, p0, Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;->thickness:I

    .line 56
    iput-boolean v1, p0, Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;->drawBackground:Z

    .line 64
    iput-boolean v1, p0, Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;->drawDataPoints:Z

    .line 71
    const/high16 v0, 0x41200000    # 10.0f

    iput v0, p0, Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;->dataPointsRadius:F

    .line 79
    const/16 v0, 0x64

    const/16 v1, 0xac

    const/16 v2, 0xda

    const/16 v3, 0xff

    invoke-static {v0, v1, v2, v3}, Landroid/graphics/Color;->argb(IIII)I

    move-result v0

    iput v0, p0, Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;->backgroundColor:I

    return-void
.end method

.method synthetic constructor <init>(Lcom/jjoe64/graphview/series/LineGraphSeries;Lcom/jjoe64/graphview/series/LineGraphSeries$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/jjoe64/graphview/series/LineGraphSeries;
    .param p2, "x1"    # Lcom/jjoe64/graphview/series/LineGraphSeries$1;

    .prologue
    .line 41
    .local p0, "this":Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;, "Lcom/jjoe64/graphview/series/LineGraphSeries<TE;>.Styles;"
    invoke-direct {p0, p1}, Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;-><init>(Lcom/jjoe64/graphview/series/LineGraphSeries;)V

    return-void
.end method

.method static synthetic access$100(Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;)I
    .registers 2
    .param p0, "x0"    # Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;

    .prologue
    .line 41
    iget v0, p0, Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;->thickness:I

    return v0
.end method

.method static synthetic access$102(Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;I)I
    .registers 2
    .param p0, "x0"    # Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;
    .param p1, "x1"    # I

    .prologue
    .line 41
    iput p1, p0, Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;->thickness:I

    return p1
.end method

.method static synthetic access$200(Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;)I
    .registers 2
    .param p0, "x0"    # Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;

    .prologue
    .line 41
    iget v0, p0, Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;->backgroundColor:I

    return v0
.end method

.method static synthetic access$202(Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;I)I
    .registers 2
    .param p0, "x0"    # Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;
    .param p1, "x1"    # I

    .prologue
    .line 41
    iput p1, p0, Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;->backgroundColor:I

    return p1
.end method

.method static synthetic access$300(Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;)Z
    .registers 2
    .param p0, "x0"    # Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;

    .prologue
    .line 41
    iget-boolean v0, p0, Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;->drawBackground:Z

    return v0
.end method

.method static synthetic access$302(Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;
    .param p1, "x1"    # Z

    .prologue
    .line 41
    iput-boolean p1, p0, Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;->drawBackground:Z

    return p1
.end method

.method static synthetic access$400(Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;)Z
    .registers 2
    .param p0, "x0"    # Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;

    .prologue
    .line 41
    iget-boolean v0, p0, Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;->drawDataPoints:Z

    return v0
.end method

.method static synthetic access$402(Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;
    .param p1, "x1"    # Z

    .prologue
    .line 41
    iput-boolean p1, p0, Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;->drawDataPoints:Z

    return p1
.end method

.method static synthetic access$500(Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;)F
    .registers 2
    .param p0, "x0"    # Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;

    .prologue
    .line 41
    iget v0, p0, Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;->dataPointsRadius:F

    return v0
.end method

.method static synthetic access$502(Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;F)F
    .registers 2
    .param p0, "x0"    # Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;
    .param p1, "x1"    # F

    .prologue
    .line 41
    iput p1, p0, Lcom/jjoe64/graphview/series/LineGraphSeries$Styles;->dataPointsRadius:F

    return p1
.end method
