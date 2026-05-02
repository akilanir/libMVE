.class final Lbutterknife/ImmutableViewList;
.super Ljava/util/AbstractList;
.source "ImmutableViewList.java"

# interfaces
.implements Ljava/util/RandomAccess;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroid/view/View;",
        ">",
        "Ljava/util/AbstractList",
        "<TT;>;",
        "Ljava/util/RandomAccess;"
    }
.end annotation


# instance fields
.field private final views:[Landroid/view/View;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[TT;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>([Landroid/view/View;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;)V"
        }
    .end annotation

    .prologue
    .line 14
    .local p0, "this":Lbutterknife/ImmutableViewList;, "Lbutterknife/ImmutableViewList<TT;>;"
    .local p1, "views":[Landroid/view/View;, "[TT;"
    invoke-direct {p0}, Ljava/util/AbstractList;-><init>()V

    .line 15
    iput-object p1, p0, Lbutterknife/ImmutableViewList;->views:[Landroid/view/View;

    .line 16
    return-void
.end method


# virtual methods
.method public contains(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .local p0, "this":Lbutterknife/ImmutableViewList;, "Lbutterknife/ImmutableViewList<TT;>;"
    const/4 v1, 0x0

    .line 27
    iget-object v3, p0, Lbutterknife/ImmutableViewList;->views:[Landroid/view/View;

    array-length v4, v3

    move v2, v1

    :goto_5
    if-ge v2, v4, :cond_c

    aget-object v0, v3, v2

    .line 28
    .local v0, "view":Landroid/view/View;
    if-ne v0, p1, :cond_d

    .line 29
    const/4 v1, 0x1

    .line 32
    .end local v0    # "view":Landroid/view/View;
    :cond_c
    return v1

    .line 27
    .restart local v0    # "view":Landroid/view/View;
    :cond_d
    add-int/lit8 v2, v2, 0x1

    goto :goto_5
.end method

.method public get(I)Landroid/view/View;
    .registers 3
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 19
    .local p0, "this":Lbutterknife/ImmutableViewList;, "Lbutterknife/ImmutableViewList<TT;>;"
    iget-object v0, p0, Lbutterknife/ImmutableViewList;->views:[Landroid/view/View;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public bridge synthetic get(I)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 11
    .local p0, "this":Lbutterknife/ImmutableViewList;, "Lbutterknife/ImmutableViewList<TT;>;"
    invoke-virtual {p0, p1}, Lbutterknife/ImmutableViewList;->get(I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public size()I
    .registers 2

    .prologue
    .line 23
    .local p0, "this":Lbutterknife/ImmutableViewList;, "Lbutterknife/ImmutableViewList<TT;>;"
    iget-object v0, p0, Lbutterknife/ImmutableViewList;->views:[Landroid/view/View;

    array-length v0, v0

    return v0
.end method
