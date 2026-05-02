.class public Lcom/devspark/appmsg/AppMsg$Style;
.super Ljava/lang/Object;
.source "AppMsg.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/devspark/appmsg/AppMsg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Style"
.end annotation


# instance fields
.field private final background:I

.field private final duration:I


# direct methods
.method public constructor <init>(II)V
    .registers 3
    .param p1, "duration"    # I
    .param p2, "resId"    # I

    .prologue
    .line 556
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 557
    iput p1, p0, Lcom/devspark/appmsg/AppMsg$Style;->duration:I

    .line 558
    iput p2, p0, Lcom/devspark/appmsg/AppMsg$Style;->background:I

    .line 559
    return-void
.end method

.method static synthetic access$000(Lcom/devspark/appmsg/AppMsg$Style;)I
    .registers 2
    .param p0, "x0"    # Lcom/devspark/appmsg/AppMsg$Style;

    .prologue
    .line 544
    iget v0, p0, Lcom/devspark/appmsg/AppMsg$Style;->background:I

    return v0
.end method

.method static synthetic access$100(Lcom/devspark/appmsg/AppMsg$Style;)I
    .registers 2
    .param p0, "x0"    # Lcom/devspark/appmsg/AppMsg$Style;

    .prologue
    .line 544
    iget v0, p0, Lcom/devspark/appmsg/AppMsg$Style;->duration:I

    return v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 577
    instance-of v2, p1, Lcom/devspark/appmsg/AppMsg$Style;

    if-nez v2, :cond_6

    .line 581
    :cond_5
    :goto_5
    return v1

    :cond_6
    move-object v0, p1

    .line 580
    check-cast v0, Lcom/devspark/appmsg/AppMsg$Style;

    .line 581
    .local v0, "style":Lcom/devspark/appmsg/AppMsg$Style;
    iget v2, v0, Lcom/devspark/appmsg/AppMsg$Style;->duration:I

    iget v3, p0, Lcom/devspark/appmsg/AppMsg$Style;->duration:I

    if-ne v2, v3, :cond_5

    iget v2, v0, Lcom/devspark/appmsg/AppMsg$Style;->background:I

    iget v3, p0, Lcom/devspark/appmsg/AppMsg$Style;->background:I

    if-ne v2, v3, :cond_5

    const/4 v1, 0x1

    goto :goto_5
.end method

.method public getBackground()I
    .registers 2

    .prologue
    .line 572
    iget v0, p0, Lcom/devspark/appmsg/AppMsg$Style;->background:I

    return v0
.end method

.method public getDuration()I
    .registers 2

    .prologue
    .line 565
    iget v0, p0, Lcom/devspark/appmsg/AppMsg$Style;->duration:I

    return v0
.end method
