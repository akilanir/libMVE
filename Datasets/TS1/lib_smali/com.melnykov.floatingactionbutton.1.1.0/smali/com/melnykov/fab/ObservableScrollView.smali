.class public Lcom/melnykov/fab/ObservableScrollView;
.super Landroid/widget/ScrollView;
.source "ObservableScrollView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/melnykov/fab/ObservableScrollView$OnScrollChangedListener;
    }
.end annotation


# instance fields
.field private mOnScrollChangedListener:Lcom/melnykov/fab/ObservableScrollView$OnScrollChangedListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 17
    invoke-direct {p0, p1}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 18
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 21
    invoke-direct {p0, p1, p2}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 22
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 25
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 26
    return-void
.end method


# virtual methods
.method protected onScrollChanged(IIII)V
    .registers 11
    .param p1, "l"    # I
    .param p2, "t"    # I
    .param p3, "oldl"    # I
    .param p4, "oldt"    # I

    .prologue
    .line 30
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/ScrollView;->onScrollChanged(IIII)V

    .line 31
    iget-object v0, p0, Lcom/melnykov/fab/ObservableScrollView;->mOnScrollChangedListener:Lcom/melnykov/fab/ObservableScrollView$OnScrollChangedListener;

    if-eqz v0, :cond_11

    .line 32
    iget-object v0, p0, Lcom/melnykov/fab/ObservableScrollView;->mOnScrollChangedListener:Lcom/melnykov/fab/ObservableScrollView$OnScrollChangedListener;

    move-object v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-interface/range {v0 .. v5}, Lcom/melnykov/fab/ObservableScrollView$OnScrollChangedListener;->onScrollChanged(Landroid/widget/ScrollView;IIII)V

    .line 34
    :cond_11
    return-void
.end method

.method public setOnScrollChangedListener(Lcom/melnykov/fab/ObservableScrollView$OnScrollChangedListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/melnykov/fab/ObservableScrollView$OnScrollChangedListener;

    .prologue
    .line 37
    iput-object p1, p0, Lcom/melnykov/fab/ObservableScrollView;->mOnScrollChangedListener:Lcom/melnykov/fab/ObservableScrollView$OnScrollChangedListener;

    .line 38
    return-void
.end method
