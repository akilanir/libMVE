.class public abstract Lrx/android/functions/ViewAction1;
.super Ljava/lang/Object;
.source "ViewAction1.java"

# interfaces
.implements Lrx/functions/Action1;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Landroid/view/View;",
        "T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/functions/Action1",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private final viewReference:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<TV;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)V"
        }
    .end annotation

    .prologue
    .line 32
    .local p0, "this":Lrx/android/functions/ViewAction1;, "Lrx/android/functions/ViewAction1<TV;TT;>;"
    .local p1, "view":Landroid/view/View;, "TV;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lrx/android/functions/ViewAction1;->viewReference:Ljava/lang/ref/WeakReference;

    .line 34
    return-void
.end method


# virtual methods
.method public abstract call(Landroid/view/View;Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;TT;)V"
        }
    .end annotation
.end method

.method public final call(Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 38
    .local p0, "this":Lrx/android/functions/ViewAction1;, "Lrx/android/functions/ViewAction1<TV;TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v1, p0, Lrx/android/functions/ViewAction1;->viewReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 39
    .local v0, "view":Landroid/view/View;, "TV;"
    if-eqz v0, :cond_d

    .line 40
    invoke-virtual {p0, v0, p1}, Lrx/android/functions/ViewAction1;->call(Landroid/view/View;Ljava/lang/Object;)V

    .line 42
    :cond_d
    return-void
.end method
