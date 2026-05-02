.class Lcom/facebook/stetho/inspector/protocol/module/DOM$RGBAColor;
.super Ljava/lang/Object;
.source "DOM.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/stetho/inspector/protocol/module/DOM;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "RGBAColor"
.end annotation


# instance fields
.field public a:Ljava/lang/Double;
    .annotation runtime Lcom/facebook/stetho/json/annotation/JsonProperty;
    .end annotation
.end field

.field public b:I
    .annotation runtime Lcom/facebook/stetho/json/annotation/JsonProperty;
        required = true
    .end annotation
.end field

.field public g:I
    .annotation runtime Lcom/facebook/stetho/json/annotation/JsonProperty;
        required = true
    .end annotation
.end field

.field public r:I
    .annotation runtime Lcom/facebook/stetho/json/annotation/JsonProperty;
        required = true
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 510
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getColor()I
    .registers 8

    .prologue
    .line 525
    iget-object v3, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM$RGBAColor;->a:Ljava/lang/Double;

    if-nez v3, :cond_10

    .line 526
    const/4 v2, -0x1

    .line 532
    .local v2, "alpha":B
    :goto_5
    iget v3, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM$RGBAColor;->r:I

    iget v4, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM$RGBAColor;->g:I

    iget v5, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM$RGBAColor;->b:I

    invoke-static {v2, v3, v4, v5}, Landroid/graphics/Color;->argb(IIII)I

    move-result v3

    return v3

    .line 528
    .end local v2    # "alpha":B
    :cond_10
    iget-object v3, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM$RGBAColor;->a:Ljava/lang/Double;

    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v3

    const-wide v5, 0x406fe00000000000L    # 255.0

    mul-double/2addr v3, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->round(D)J

    move-result-wide v0

    .line 529
    .local v0, "aLong":J
    const-wide/16 v3, 0x0

    cmp-long v3, v0, v3

    if-gez v3, :cond_28

    const/4 v2, 0x0

    .restart local v2    # "alpha":B
    :goto_27
    goto :goto_5

    .end local v2    # "alpha":B
    :cond_28
    const-wide/16 v3, 0xff

    cmp-long v3, v0, v3

    if-ltz v3, :cond_30

    const/4 v2, -0x1

    goto :goto_27

    :cond_30
    long-to-int v3, v0

    int-to-byte v2, v3

    goto :goto_27
.end method
