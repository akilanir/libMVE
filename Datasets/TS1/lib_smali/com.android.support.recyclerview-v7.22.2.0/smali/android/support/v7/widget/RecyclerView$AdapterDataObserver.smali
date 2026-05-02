.class public abstract Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;
.super Ljava/lang/Object;
.source "RecyclerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/widget/RecyclerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "AdapterDataObserver"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 8436
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onChanged()V
    .registers 1

    .prologue
    .line 8439
    return-void
.end method

.method public onItemRangeChanged(II)V
    .registers 3
    .param p1, "positionStart"    # I
    .param p2, "itemCount"    # I

    .prologue
    .line 8443
    return-void
.end method

.method public onItemRangeInserted(II)V
    .registers 3
    .param p1, "positionStart"    # I
    .param p2, "itemCount"    # I

    .prologue
    .line 8447
    return-void
.end method

.method public onItemRangeMoved(III)V
    .registers 4
    .param p1, "fromPosition"    # I
    .param p2, "toPosition"    # I
    .param p3, "itemCount"    # I

    .prologue
    .line 8455
    return-void
.end method

.method public onItemRangeRemoved(II)V
    .registers 3
    .param p1, "positionStart"    # I
    .param p2, "itemCount"    # I

    .prologue
    .line 8451
    return-void
.end method
