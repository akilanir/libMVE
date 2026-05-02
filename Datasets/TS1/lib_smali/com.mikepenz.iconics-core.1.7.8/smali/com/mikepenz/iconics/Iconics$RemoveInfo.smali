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
    .line 443
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 444
    iput p1, p0, Lcom/mikepenz/iconics/Iconics$RemoveInfo;->start:I

    .line 445
    iput p2, p0, Lcom/mikepenz/iconics/Iconics$RemoveInfo;->count:I

    .line 446
    return-void
.end method

.method public constructor <init>(III)V
    .registers 4
    .param p1, "start"    # I
    .param p2, "count"    # I
    .param p3, "total"    # I

    .prologue
    .line 448
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 449
    iput p1, p0, Lcom/mikepenz/iconics/Iconics$RemoveInfo;->start:I

    .line 450
    iput p2, p0, Lcom/mikepenz/iconics/Iconics$RemoveInfo;->count:I

    .line 451
    iput p3, p0, Lcom/mikepenz/iconics/Iconics$RemoveInfo;->total:I

    .line 452
    return-void
.end method


# virtual methods
.method public getCount()I
    .registers 2

    .prologue
    .line 463
    iget v0, p0, Lcom/mikepenz/iconics/Iconics$RemoveInfo;->count:I

    return v0
.end method

.method public getStart()I
    .registers 2

    .prologue
    .line 455
    iget v0, p0, Lcom/mikepenz/iconics/Iconics$RemoveInfo;->start:I

    return v0
.end method

.method public getTotal()I
    .registers 2

    .prologue
    .line 471
    iget v0, p0, Lcom/mikepenz/iconics/Iconics$RemoveInfo;->total:I

    return v0
.end method

.method public setCount(I)V
    .registers 2
    .param p1, "count"    # I

    .prologue
    .line 467
    iput p1, p0, Lcom/mikepenz/iconics/Iconics$RemoveInfo;->count:I

    .line 468
    return-void
.end method

.method public setStart(I)V
    .registers 2
    .param p1, "start"    # I

    .prologue
    .line 459
    iput p1, p0, Lcom/mikepenz/iconics/Iconics$RemoveInfo;->start:I

    .line 460
    return-void
.end method

.method public setTotal(I)V
    .registers 2
    .param p1, "total"    # I

    .prologue
    .line 475
    iput p1, p0, Lcom/mikepenz/iconics/Iconics$RemoveInfo;->total:I

    .line 476
    return-void
.end method
