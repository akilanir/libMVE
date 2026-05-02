.class Lcom/mikepenz/iconics/Iconics$RemoveInfo;
.super Ljava/lang/Object;
.source "Iconics.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mikepenz/iconics/Iconics;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "RemoveInfo"
.end annotation


# instance fields
.field private count:I

.field private start:I

.field private total:I


# direct methods
.method public constructor <init>(II)V
    .registers 3
    .param p1, "start"    # I
    .param p2, "count"    # I

    .prologue
    .line 415
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 416
    iput p1, p0, Lcom/mikepenz/iconics/Iconics$RemoveInfo;->start:I

    .line 417
    iput p2, p0, Lcom/mikepenz/iconics/Iconics$RemoveInfo;->count:I

    .line 418
    return-void
.end method

.method public constructor <init>(III)V
    .registers 4
    .param p1, "start"    # I
    .param p2, "count"    # I
    .param p3, "total"    # I

    .prologue
    .line 420
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 421
    iput p1, p0, Lcom/mikepenz/iconics/Iconics$RemoveInfo;->start:I

    .line 422
    iput p2, p0, Lcom/mikepenz/iconics/Iconics$RemoveInfo;->count:I

    .line 423
    iput p3, p0, Lcom/mikepenz/iconics/Iconics$RemoveInfo;->total:I

    .line 424
    return-void
.end method


# virtual methods
.method public getCount()I
    .registers 2

    .prologue
    .line 435
    iget v0, p0, Lcom/mikepenz/iconics/Iconics$RemoveInfo;->count:I

    return v0
.end method

.method public getStart()I
    .registers 2

    .prologue
    .line 427
    iget v0, p0, Lcom/mikepenz/iconics/Iconics$RemoveInfo;->start:I

    return v0
.end method

.method public getTotal()I
    .registers 2

    .prologue
    .line 443
    iget v0, p0, Lcom/mikepenz/iconics/Iconics$RemoveInfo;->total:I

    return v0
.end method

.method public setCount(I)V
    .registers 2
    .param p1, "count"    # I

    .prologue
    .line 439
    iput p1, p0, Lcom/mikepenz/iconics/Iconics$RemoveInfo;->count:I

    .line 440
    return-void
.end method

.method public setStart(I)V
    .registers 2
    .param p1, "start"    # I

    .prologue
    .line 431
    iput p1, p0, Lcom/mikepenz/iconics/Iconics$RemoveInfo;->start:I

    .line 432
    return-void
.end method

.method public setTotal(I)V
    .registers 2
    .param p1, "total"    # I

    .prologue
    .line 447
    iput p1, p0, Lcom/mikepenz/iconics/Iconics$RemoveInfo;->total:I

    .line 448
    return-void
.end method
