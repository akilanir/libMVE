.class final Lcom/facebook/stetho/inspector/elements/android/WindowDescriptor;
.super Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;
.source "WindowDescriptor.java"

# interfaces
.implements Lcom/facebook/stetho/inspector/elements/android/HighlightableDescriptor;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor",
        "<",
        "Landroid/view/Window;",
        ">;",
        "Lcom/facebook/stetho/inspector/elements/android/HighlightableDescriptor;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 20
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;-><init>()V

    return-void
.end method


# virtual methods
.method public getViewForHighlighting(Ljava/lang/Object;)Landroid/view/View;
    .registers 4
    .param p1, "element"    # Ljava/lang/Object;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .prologue
    .line 33
    move-object v0, p1

    check-cast v0, Landroid/view/Window;

    .line 34
    .local v0, "window":Landroid/view/Window;
    invoke-virtual {v0}, Landroid/view/Window;->peekDecorView()Landroid/view/View;

    move-result-object v1

    return-object v1
.end method

.method protected onGetChildren(Landroid/view/Window;Lcom/facebook/stetho/common/Accumulator;)V
    .registers 4
    .param p1, "element"    # Landroid/view/Window;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/Window;",
            "Lcom/facebook/stetho/common/Accumulator",
            "<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 24
    .local p2, "children":Lcom/facebook/stetho/common/Accumulator;, "Lcom/facebook/stetho/common/Accumulator<Ljava/lang/Object;>;"
    invoke-virtual {p1}, Landroid/view/Window;->peekDecorView()Landroid/view/View;

    move-result-object v0

    .line 25
    .local v0, "decorView":Landroid/view/View;
    if-eqz v0, :cond_9

    .line 26
    invoke-interface {p2, v0}, Lcom/facebook/stetho/common/Accumulator;->store(Ljava/lang/Object;)V

    .line 28
    :cond_9
    return-void
.end method

.method protected bridge synthetic onGetChildren(Ljava/lang/Object;Lcom/facebook/stetho/common/Accumulator;)V
    .registers 3

    .prologue
    .line 20
    check-cast p1, Landroid/view/Window;

    invoke-virtual {p0, p1, p2}, Lcom/facebook/stetho/inspector/elements/android/WindowDescriptor;->onGetChildren(Landroid/view/Window;Lcom/facebook/stetho/common/Accumulator;)V

    return-void
.end method
