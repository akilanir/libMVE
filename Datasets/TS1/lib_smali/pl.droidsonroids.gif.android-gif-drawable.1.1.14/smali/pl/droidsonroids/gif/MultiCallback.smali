.class public Lpl/droidsonroids/gif/MultiCallback;
.super Ljava/lang/Object;
.source "MultiCallback.java"

# interfaces
.implements Landroid/graphics/drawable/Drawable$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lpl/droidsonroids/gif/MultiCallback$CallbackWeakReference;
    }
.end annotation


# instance fields
.field private final mCallbacks:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList",
            "<",
            "Lpl/droidsonroids/gif/MultiCallback$CallbackWeakReference;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v0, p0, Lpl/droidsonroids/gif/MultiCallback;->mCallbacks:Ljava/util/concurrent/CopyOnWriteArrayList;

    return-void
.end method


# virtual methods
.method public addView(Landroid/graphics/drawable/Drawable$Callback;)V
    .registers 7
    .param p1, "callback"    # Landroid/graphics/drawable/Drawable$Callback;

    .prologue
    .line 71
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v3, p0, Lpl/droidsonroids/gif/MultiCallback;->mCallbacks:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v3}, Ljava/util/concurrent/CopyOnWriteArrayList;->size()I

    move-result v3

    if-ge v0, v3, :cond_21

    .line 72
    iget-object v3, p0, Lpl/droidsonroids/gif/MultiCallback;->mCallbacks:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v3, v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lpl/droidsonroids/gif/MultiCallback$CallbackWeakReference;

    .line 73
    .local v2, "reference":Lpl/droidsonroids/gif/MultiCallback$CallbackWeakReference;
    invoke-virtual {v2}, Lpl/droidsonroids/gif/MultiCallback$CallbackWeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/drawable/Drawable$Callback;

    .line 74
    .local v1, "item":Landroid/graphics/drawable/Drawable$Callback;
    if-nez v1, :cond_1e

    .line 76
    iget-object v3, p0, Lpl/droidsonroids/gif/MultiCallback;->mCallbacks:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v3, v2}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    .line 71
    :cond_1e
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 79
    .end local v1    # "item":Landroid/graphics/drawable/Drawable$Callback;
    .end local v2    # "reference":Lpl/droidsonroids/gif/MultiCallback$CallbackWeakReference;
    :cond_21
    iget-object v3, p0, Lpl/droidsonroids/gif/MultiCallback;->mCallbacks:Ljava/util/concurrent/CopyOnWriteArrayList;

    new-instance v4, Lpl/droidsonroids/gif/MultiCallback$CallbackWeakReference;

    invoke-direct {v4, p1}, Lpl/droidsonroids/gif/MultiCallback$CallbackWeakReference;-><init>(Landroid/graphics/drawable/Drawable$Callback;)V

    invoke-virtual {v3, v4}, Ljava/util/concurrent/CopyOnWriteArrayList;->addIfAbsent(Ljava/lang/Object;)Z

    .line 80
    return-void
.end method

.method public invalidateDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 6
    .param p1, "who"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 25
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    iget-object v3, p0, Lpl/droidsonroids/gif/MultiCallback;->mCallbacks:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v3}, Ljava/util/concurrent/CopyOnWriteArrayList;->size()I

    move-result v3

    if-ge v1, v3, :cond_25

    .line 26
    iget-object v3, p0, Lpl/droidsonroids/gif/MultiCallback;->mCallbacks:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v3, v1}, Ljava/util/concurrent/CopyOnWriteArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lpl/droidsonroids/gif/MultiCallback$CallbackWeakReference;

    .line 27
    .local v2, "reference":Lpl/droidsonroids/gif/MultiCallback$CallbackWeakReference;
    invoke-virtual {v2}, Lpl/droidsonroids/gif/MultiCallback$CallbackWeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/Drawable$Callback;

    .line 28
    .local v0, "callback":Landroid/graphics/drawable/Drawable$Callback;
    if-eqz v0, :cond_1f

    .line 29
    invoke-interface {v0, p1}, Landroid/graphics/drawable/Drawable$Callback;->invalidateDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 25
    :goto_1c
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 32
    :cond_1f
    iget-object v3, p0, Lpl/droidsonroids/gif/MultiCallback;->mCallbacks:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v3, v2}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_1c

    .line 35
    .end local v0    # "callback":Landroid/graphics/drawable/Drawable$Callback;
    .end local v2    # "reference":Lpl/droidsonroids/gif/MultiCallback$CallbackWeakReference;
    :cond_25
    return-void
.end method

.method public removeView(Landroid/graphics/drawable/Drawable$Callback;)V
    .registers 6
    .param p1, "callback"    # Landroid/graphics/drawable/Drawable$Callback;

    .prologue
    .line 88
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v3, p0, Lpl/droidsonroids/gif/MultiCallback;->mCallbacks:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v3}, Ljava/util/concurrent/CopyOnWriteArrayList;->size()I

    move-result v3

    if-ge v0, v3, :cond_23

    .line 89
    iget-object v3, p0, Lpl/droidsonroids/gif/MultiCallback;->mCallbacks:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v3, v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lpl/droidsonroids/gif/MultiCallback$CallbackWeakReference;

    .line 90
    .local v2, "reference":Lpl/droidsonroids/gif/MultiCallback$CallbackWeakReference;
    invoke-virtual {v2}, Lpl/droidsonroids/gif/MultiCallback$CallbackWeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/drawable/Drawable$Callback;

    .line 91
    .local v1, "item":Landroid/graphics/drawable/Drawable$Callback;
    if-eqz v1, :cond_1b

    if-ne v1, p1, :cond_20

    .line 93
    :cond_1b
    iget-object v3, p0, Lpl/droidsonroids/gif/MultiCallback;->mCallbacks:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v3, v2}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    .line 88
    :cond_20
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 96
    .end local v1    # "item":Landroid/graphics/drawable/Drawable$Callback;
    .end local v2    # "reference":Lpl/droidsonroids/gif/MultiCallback$CallbackWeakReference;
    :cond_23
    return-void
.end method

.method public scheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;J)V
    .registers 9
    .param p1, "who"    # Landroid/graphics/drawable/Drawable;
    .param p2, "what"    # Ljava/lang/Runnable;
    .param p3, "when"    # J

    .prologue
    .line 39
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    iget-object v3, p0, Lpl/droidsonroids/gif/MultiCallback;->mCallbacks:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v3}, Ljava/util/concurrent/CopyOnWriteArrayList;->size()I

    move-result v3

    if-ge v1, v3, :cond_25

    .line 40
    iget-object v3, p0, Lpl/droidsonroids/gif/MultiCallback;->mCallbacks:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v3, v1}, Ljava/util/concurrent/CopyOnWriteArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lpl/droidsonroids/gif/MultiCallback$CallbackWeakReference;

    .line 41
    .local v2, "reference":Lpl/droidsonroids/gif/MultiCallback$CallbackWeakReference;
    invoke-virtual {v2}, Lpl/droidsonroids/gif/MultiCallback$CallbackWeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/Drawable$Callback;

    .line 42
    .local v0, "callback":Landroid/graphics/drawable/Drawable$Callback;
    if-eqz v0, :cond_1f

    .line 43
    invoke-interface {v0, p1, p2, p3, p4}, Landroid/graphics/drawable/Drawable$Callback;->scheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;J)V

    .line 39
    :goto_1c
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 46
    :cond_1f
    iget-object v3, p0, Lpl/droidsonroids/gif/MultiCallback;->mCallbacks:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v3, v2}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_1c

    .line 49
    .end local v0    # "callback":Landroid/graphics/drawable/Drawable$Callback;
    .end local v2    # "reference":Lpl/droidsonroids/gif/MultiCallback$CallbackWeakReference;
    :cond_25
    return-void
.end method

.method public unscheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;)V
    .registers 7
    .param p1, "who"    # Landroid/graphics/drawable/Drawable;
    .param p2, "what"    # Ljava/lang/Runnable;

    .prologue
    .line 53
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    iget-object v3, p0, Lpl/droidsonroids/gif/MultiCallback;->mCallbacks:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v3}, Ljava/util/concurrent/CopyOnWriteArrayList;->size()I

    move-result v3

    if-ge v1, v3, :cond_25

    .line 54
    iget-object v3, p0, Lpl/droidsonroids/gif/MultiCallback;->mCallbacks:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v3, v1}, Ljava/util/concurrent/CopyOnWriteArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lpl/droidsonroids/gif/MultiCallback$CallbackWeakReference;

    .line 55
    .local v2, "reference":Lpl/droidsonroids/gif/MultiCallback$CallbackWeakReference;
    invoke-virtual {v2}, Lpl/droidsonroids/gif/MultiCallback$CallbackWeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/Drawable$Callback;

    .line 56
    .local v0, "callback":Landroid/graphics/drawable/Drawable$Callback;
    if-eqz v0, :cond_1f

    .line 57
    invoke-interface {v0, p1, p2}, Landroid/graphics/drawable/Drawable$Callback;->unscheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;)V

    .line 53
    :goto_1c
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 60
    :cond_1f
    iget-object v3, p0, Lpl/droidsonroids/gif/MultiCallback;->mCallbacks:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v3, v2}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_1c

    .line 63
    .end local v0    # "callback":Landroid/graphics/drawable/Drawable$Callback;
    .end local v2    # "reference":Lpl/droidsonroids/gif/MultiCallback$CallbackWeakReference;
    :cond_25
    return-void
.end method
