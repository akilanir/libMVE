.class public Lcom/mikepenz/iconics/utils/RemoveInfo;
.super Ljava/lang/Object;
.source "RemoveInfo.java"


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
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    iput p1, p0, Lcom/mikepenz/iconics/utils/RemoveInfo;->start:I

    .line 10
    iput p2, p0, Lcom/mikepenz/iconics/utils/RemoveInfo;->count:I

    .line 11
    return-void
.end method

.method public constructor <init>(III)V
    .registers 4
    .param p1, "start"    # I
    .param p2, "count"    # I
    .param p3, "total"    # I

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput p1, p0, Lcom/mikepenz/iconics/utils/RemoveInfo;->start:I

    .line 15
    iput p2, p0, Lcom/mikepenz/iconics/utils/RemoveInfo;->count:I

    .line 16
    iput p3, p0, Lcom/mikepenz/iconics/utils/RemoveInfo;->total:I

    .line 17
    return-void
.end method


# virtual methods
.method public getCount()I
    .registers 2

    .prologue
    .line 28
    iget v0, p0, Lcom/mikepenz/iconics/utils/RemoveInfo;->count:I

    return v0
.end method

.method public getStart()I
    .registers 2

    .prologue
    .line 20
    iget v0, p0, Lcom/mikepenz/iconics/utils/RemoveInfo;->start:I

    return v0
.end method

.method public getTotal()I
    .registers 2

    .prologue
    .line 36
    iget v0, p0, Lcom/mikepenz/iconics/utils/RemoveInfo;->total:I

    return v0
.end method

.method public setCount(I)V
    .registers 2
    .param p1, "count"    # I

    .prologue
    .line 32
    iput p1, p0, Lcom/mikepenz/iconics/utils/RemoveInfo;->count:I

    .line 33
    return-void
.end method

.method public setStart(I)V
    .registers 2
    .param p1, "start"    # I

    .prologue
    .line 24
    iput p1, p0, Lcom/mikepenz/iconics/utils/RemoveInfo;->start:I

    .line 25
    return-void
.end method

.method public setTotal(I)V
    .registers 2
    .param p1, "total"    # I

    .prologue
    .line 40
    iput p1, p0, Lcom/mikepenz/iconics/utils/RemoveInfo;->total:I

    .line 41
    return-void
.end method
