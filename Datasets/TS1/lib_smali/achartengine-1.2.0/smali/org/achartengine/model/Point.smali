.class public final Lorg/achartengine/model/Point;
.super Ljava/lang/Object;
.source "Point.java"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private mX:F

.field private mY:F


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    return-void
.end method

.method public constructor <init>(FF)V
    .registers 3
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput p1, p0, Lorg/achartengine/model/Point;->mX:F

    .line 34
    iput p2, p0, Lorg/achartengine/model/Point;->mY:F

    .line 35
    return-void
.end method


# virtual methods
.method public getX()F
    .registers 2

    .prologue
    .line 38
    iget v0, p0, Lorg/achartengine/model/Point;->mX:F

    return v0
.end method

.method public getY()F
    .registers 2

    .prologue
    .line 42
    iget v0, p0, Lorg/achartengine/model/Point;->mY:F

    return v0
.end method

.method public setX(F)V
    .registers 2
    .param p1, "x"    # F

    .prologue
    .line 46
    iput p1, p0, Lorg/achartengine/model/Point;->mX:F

    .line 47
    return-void
.end method

.method public setY(F)V
    .registers 2
    .param p1, "y"    # F

    .prologue
    .line 50
    iput p1, p0, Lorg/achartengine/model/Point;->mY:F

    .line 51
    return-void
.end method
