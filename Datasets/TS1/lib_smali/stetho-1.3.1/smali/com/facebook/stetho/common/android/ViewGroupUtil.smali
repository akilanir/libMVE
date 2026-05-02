.class public final Lcom/facebook/stetho/common/android/ViewGroupUtil;
.super Ljava/lang/Object;
.source "ViewGroupUtil.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    return-void
.end method

.method public static findChildIndex(Landroid/view/ViewGroup;Landroid/view/View;)I
    .registers 5
    .param p0, "parent"    # Landroid/view/ViewGroup;
    .param p1, "child"    # Landroid/view/View;

    .prologue
    .line 26
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    .line 27
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_5
    if-ge v1, v0, :cond_11

    .line 28
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    if-ne v2, p1, :cond_e

    .line 32
    .end local v1    # "i":I
    :goto_d
    return v1

    .line 27
    .restart local v1    # "i":I
    :cond_e
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 32
    :cond_11
    const/4 v1, -0x1

    goto :goto_d
.end method
