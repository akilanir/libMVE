.class public Lcom/rey/material/drawable/BlankDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "BlankDrawable.java"


# static fields
.field private static mInstance:Lcom/rey/material/drawable/BlankDrawable;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 13
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/rey/material/drawable/BlankDrawable;
    .registers 2

    .prologue
    .line 18
    sget-object v0, Lcom/rey/material/drawable/BlankDrawable;->mInstance:Lcom/rey/material/drawable/BlankDrawable;

    if-nez v0, :cond_13

    .line 19
    const-class v1, Lcom/rey/material/drawable/BlankDrawable;

    monitor-enter v1

    .line 20
    :try_start_7
    sget-object v0, Lcom/rey/material/drawable/BlankDrawable;->mInstance:Lcom/rey/material/drawable/BlankDrawable;

    if-nez v0, :cond_12

    .line 21
    new-instance v0, Lcom/rey/material/drawable/BlankDrawable;

    invoke-direct {v0}, Lcom/rey/material/drawable/BlankDrawable;-><init>()V

    sput-object v0, Lcom/rey/material/drawable/BlankDrawable;->mInstance:Lcom/rey/material/drawable/BlankDrawable;

    .line 22
    :cond_12
    monitor-exit v1
    :try_end_13
    .catchall {:try_start_7 .. :try_end_13} :catchall_16

    .line 24
    :cond_13
    sget-object v0, Lcom/rey/material/drawable/BlankDrawable;->mInstance:Lcom/rey/material/drawable/BlankDrawable;

    return-object v0

    .line 22
    :catchall_16
    move-exception v0

    :try_start_17
    monitor-exit v1
    :try_end_18
    .catchall {:try_start_17 .. :try_end_18} :catchall_16

    throw v0
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 2
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 28
    return-void
.end method

.method public getOpacity()I
    .registers 2

    .prologue
    .line 38
    const/4 v0, -0x2

    return v0
.end method

.method public setAlpha(I)V
    .registers 2
    .param p1, "alpha"    # I

    .prologue
    .line 31
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 2
    .param p1, "cf"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 34
    return-void
.end method
