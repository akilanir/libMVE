.class public Lcom/rey/material/drawable/LineMorphingDrawable$State;
.super Ljava/lang/Object;
.source "LineMorphingDrawable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/drawable/LineMorphingDrawable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "State"
.end annotation


# instance fields
.field links:[I

.field points:[F


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 379
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>([F[I)V
    .registers 3
    .param p1, "points"    # [F
    .param p2, "links"    # [I

    .prologue
    .line 381
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 382
    iput-object p1, p0, Lcom/rey/material/drawable/LineMorphingDrawable$State;->points:[F

    .line 383
    iput-object p2, p0, Lcom/rey/material/drawable/LineMorphingDrawable$State;->links:[I

    .line 384
    return-void
.end method
