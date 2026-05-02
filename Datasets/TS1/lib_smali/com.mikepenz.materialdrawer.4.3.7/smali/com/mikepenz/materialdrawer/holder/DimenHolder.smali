.class public Lcom/mikepenz/materialdrawer/holder/DimenHolder;
.super Ljava/lang/Object;
.source "DimenHolder.java"


# instance fields
.field private mDp:I

.field private mPixel:I

.field private mResource:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    const/high16 v0, -0x80000000

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput v0, p0, Lcom/mikepenz/materialdrawer/holder/DimenHolder;->mPixel:I

    .line 13
    iput v0, p0, Lcom/mikepenz/materialdrawer/holder/DimenHolder;->mDp:I

    .line 14
    iput v0, p0, Lcom/mikepenz/materialdrawer/holder/DimenHolder;->mResource:I

    .line 18
    return-void
.end method

.method public static fromDp(I)Lcom/mikepenz/materialdrawer/holder/DimenHolder;
    .registers 2
    .param p0, "dp"    # I

    .prologue
    .line 27
    new-instance v0, Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    invoke-direct {v0}, Lcom/mikepenz/materialdrawer/holder/DimenHolder;-><init>()V

    .line 28
    .local v0, "dimenHolder":Lcom/mikepenz/materialdrawer/holder/DimenHolder;
    iput p0, v0, Lcom/mikepenz/materialdrawer/holder/DimenHolder;->mDp:I

    .line 29
    return-object v0
.end method

.method public static fromPixel(I)Lcom/mikepenz/materialdrawer/holder/DimenHolder;
    .registers 2
    .param p0, "pixel"    # I

    .prologue
    .line 21
    new-instance v0, Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    invoke-direct {v0}, Lcom/mikepenz/materialdrawer/holder/DimenHolder;-><init>()V

    .line 22
    .local v0, "dimenHolder":Lcom/mikepenz/materialdrawer/holder/DimenHolder;
    iput p0, v0, Lcom/mikepenz/materialdrawer/holder/DimenHolder;->mPixel:I

    .line 23
    return-object v0
.end method

.method public static fromResource(I)Lcom/mikepenz/materialdrawer/holder/DimenHolder;
    .registers 2
    .param p0, "resource"    # I
        .annotation build Landroid/support/annotation/DimenRes;
        .end annotation
    .end param

    .prologue
    .line 33
    new-instance v0, Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    invoke-direct {v0}, Lcom/mikepenz/materialdrawer/holder/DimenHolder;-><init>()V

    .line 34
    .local v0, "dimenHolder":Lcom/mikepenz/materialdrawer/holder/DimenHolder;
    iput p0, v0, Lcom/mikepenz/materialdrawer/holder/DimenHolder;->mResource:I

    .line 35
    return-object v0
.end method


# virtual methods
.method public asPixel(Landroid/content/Context;)I
    .registers 4
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    const/high16 v1, -0x80000000

    .line 51
    iget v0, p0, Lcom/mikepenz/materialdrawer/holder/DimenHolder;->mPixel:I

    if-eq v0, v1, :cond_9

    .line 52
    iget v0, p0, Lcom/mikepenz/materialdrawer/holder/DimenHolder;->mPixel:I

    .line 58
    :goto_8
    return v0

    .line 53
    :cond_9
    iget v0, p0, Lcom/mikepenz/materialdrawer/holder/DimenHolder;->mDp:I

    if-eq v0, v1, :cond_16

    .line 54
    iget v0, p0, Lcom/mikepenz/materialdrawer/holder/DimenHolder;->mDp:I

    int-to-float v0, v0

    invoke-static {v0, p1}, Lcom/mikepenz/materialize/util/UIUtils;->convertDpToPixel(FLandroid/content/Context;)F

    move-result v0

    float-to-int v0, v0

    goto :goto_8

    .line 55
    :cond_16
    iget v0, p0, Lcom/mikepenz/materialdrawer/holder/DimenHolder;->mResource:I

    if-eq v0, v1, :cond_25

    .line 56
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iget v1, p0, Lcom/mikepenz/materialdrawer/holder/DimenHolder;->mResource:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    goto :goto_8

    .line 58
    :cond_25
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public getDp()I
    .registers 2

    .prologue
    .line 43
    iget v0, p0, Lcom/mikepenz/materialdrawer/holder/DimenHolder;->mDp:I

    return v0
.end method

.method public getPixel()I
    .registers 2

    .prologue
    .line 39
    iget v0, p0, Lcom/mikepenz/materialdrawer/holder/DimenHolder;->mPixel:I

    return v0
.end method

.method public getResource()I
    .registers 2

    .prologue
    .line 47
    iget v0, p0, Lcom/mikepenz/materialdrawer/holder/DimenHolder;->mResource:I

    return v0
.end method
