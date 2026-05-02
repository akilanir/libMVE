.class public abstract Lcom/bumptech/glide/request/target/ViewTarget;
.super Lcom/bumptech/glide/request/target/BaseTarget;
.source "ViewTarget.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/request/target/ViewTarget$SizeDeterminer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroid/view/View;",
        "Z:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/bumptech/glide/request/target/BaseTarget",
        "<TZ;>;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "ViewTarget"


# instance fields
.field private final sizeDeterminer:Lcom/bumptech/glide/request/target/ViewTarget$SizeDeterminer;

.field protected final view:Landroid/view/View;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 46
    .local p0, "this":Lcom/bumptech/glide/request/target/ViewTarget;, "Lcom/bumptech/glide/request/target/ViewTarget<TT;TZ;>;"
    .local p1, "view":Landroid/view/View;, "TT;"
    invoke-direct {p0}, Lcom/bumptech/glide/request/target/BaseTarget;-><init>()V

    .line 47
    if-nez p1, :cond_d

    .line 48
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "View must not be null!"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 50
    :cond_d
    iput-object p1, p0, Lcom/bumptech/glide/request/target/ViewTarget;->view:Landroid/view/View;

    .line 51
    new-instance v0, Lcom/bumptech/glide/request/target/ViewTarget$SizeDeterminer;

    invoke-direct {v0, p1}, Lcom/bumptech/glide/request/target/ViewTarget$SizeDeterminer;-><init>(Landroid/view/View;)V

    iput-object v0, p0, Lcom/bumptech/glide/request/target/ViewTarget;->sizeDeterminer:Lcom/bumptech/glide/request/target/ViewTarget$SizeDeterminer;

    .line 52
    return-void
.end method


# virtual methods
.method public getRequest()Lcom/bumptech/glide/request/Request;
    .registers 5

    .prologue
    .line 99
    .local p0, "this":Lcom/bumptech/glide/request/target/ViewTarget;, "Lcom/bumptech/glide/request/target/ViewTarget<TT;TZ;>;"
    iget-object v2, p0, Lcom/bumptech/glide/request/target/ViewTarget;->view:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    .line 100
    .local v1, "tag":Ljava/lang/Object;
    const/4 v0, 0x0

    .line 101
    .local v0, "request":Lcom/bumptech/glide/request/Request;
    if-eqz v1, :cond_10

    .line 102
    instance-of v2, v1, Lcom/bumptech/glide/request/Request;

    if-eqz v2, :cond_11

    move-object v0, v1

    .line 103
    check-cast v0, Lcom/bumptech/glide/request/Request;

    .line 108
    :cond_10
    return-object v0

    .line 105
    :cond_11
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "You must not call setTag() on a view Glide is targeting"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public getSize(Lcom/bumptech/glide/request/target/SizeReadyCallback;)V
    .registers 3
    .param p1, "cb"    # Lcom/bumptech/glide/request/target/SizeReadyCallback;

    .prologue
    .line 72
    .local p0, "this":Lcom/bumptech/glide/request/target/ViewTarget;, "Lcom/bumptech/glide/request/target/ViewTarget<TT;TZ;>;"
    iget-object v0, p0, Lcom/bumptech/glide/request/target/ViewTarget;->sizeDeterminer:Lcom/bumptech/glide/request/target/ViewTarget$SizeDeterminer;

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/request/target/ViewTarget$SizeDeterminer;->getSize(Lcom/bumptech/glide/request/target/SizeReadyCallback;)V

    .line 73
    return-void
.end method

.method public getView()Landroid/view/View;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 58
    .local p0, "this":Lcom/bumptech/glide/request/target/ViewTarget;, "Lcom/bumptech/glide/request/target/ViewTarget<TT;TZ;>;"
    iget-object v0, p0, Lcom/bumptech/glide/request/target/ViewTarget;->view:Landroid/view/View;

    return-object v0
.end method

.method public setRequest(Lcom/bumptech/glide/request/Request;)V
    .registers 3
    .param p1, "request"    # Lcom/bumptech/glide/request/Request;

    .prologue
    .line 82
    .local p0, "this":Lcom/bumptech/glide/request/target/ViewTarget;, "Lcom/bumptech/glide/request/target/ViewTarget<TT;TZ;>;"
    iget-object v0, p0, Lcom/bumptech/glide/request/target/ViewTarget;->view:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 83
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 113
    .local p0, "this":Lcom/bumptech/glide/request/target/ViewTarget;, "Lcom/bumptech/glide/request/target/ViewTarget<TT;TZ;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Target for: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/bumptech/glide/request/target/ViewTarget;->view:Landroid/view/View;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
