.class Lcom/koushikdutta/ion/IonDrawable$IonDrawableCallback;
.super Ljava/lang/Object;
.source "IonDrawable.java"

# interfaces
.implements Lcom/koushikdutta/async/future/FutureCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/koushikdutta/ion/IonDrawable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "IonDrawableCallback"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/koushikdutta/async/future/FutureCallback",
        "<",
        "Lcom/koushikdutta/ion/bitmap/BitmapInfo;",
        ">;"
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private bitmapKey:Ljava/lang/String;

.field private ion:Lcom/koushikdutta/ion/Ion;

.field private ionDrawableRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/koushikdutta/ion/IonDrawable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 107
    const-class v0, Lcom/koushikdutta/ion/IonDrawable;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/koushikdutta/ion/IonDrawable$IonDrawableCallback;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>(Lcom/koushikdutta/ion/IonDrawable;)V
    .registers 3
    .param p1, "drawable"    # Lcom/koushikdutta/ion/IonDrawable;

    .prologue
    .line 111
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 112
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/koushikdutta/ion/IonDrawable$IonDrawableCallback;->ionDrawableRef:Ljava/lang/ref/WeakReference;

    .line 114
    return-void
.end method

.method private unregister(Lcom/koushikdutta/ion/Ion;Ljava/lang/String;)V
    .registers 8
    .param p1, "ion"    # Lcom/koushikdutta/ion/Ion;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 129
    if-nez p2, :cond_3

    .line 158
    :goto_2
    return-void

    .line 137
    :cond_3
    iget-object v3, p1, Lcom/koushikdutta/ion/Ion;->bitmapsPending:Lcom/koushikdutta/async/util/HashList;

    invoke-virtual {v3, p2, p0}, Lcom/koushikdutta/async/util/HashList;->removeItem(Ljava/lang/String;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3f

    .line 139
    iget-object v3, p1, Lcom/koushikdutta/ion/Ion;->bitmapsPending:Lcom/koushikdutta/async/util/HashList;

    invoke-virtual {v3, p2}, Lcom/koushikdutta/async/util/HashList;->tag(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 140
    .local v2, "owner":Ljava/lang/Object;
    instance-of v3, v2, Lcom/koushikdutta/ion/TransformBitmap;

    if-eqz v3, :cond_31

    move-object v1, v2

    .line 141
    check-cast v1, Lcom/koushikdutta/ion/TransformBitmap;

    .line 142
    .local v1, "info":Lcom/koushikdutta/ion/TransformBitmap;
    iget-object v3, p1, Lcom/koushikdutta/ion/Ion;->bitmapsPending:Lcom/koushikdutta/async/util/HashList;

    iget-object v4, v1, Lcom/koushikdutta/ion/TransformBitmap;->key:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/koushikdutta/async/util/HashList;->remove(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 145
    iget-object v3, p1, Lcom/koushikdutta/ion/Ion;->bitmapsPending:Lcom/koushikdutta/async/util/HashList;

    iget-object v4, v1, Lcom/koushikdutta/ion/TransformBitmap;->downloadKey:Ljava/lang/String;

    invoke-virtual {v3, v4, v1}, Lcom/koushikdutta/async/util/HashList;->removeItem(Ljava/lang/String;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_31

    .line 146
    iget-object v3, p1, Lcom/koushikdutta/ion/Ion;->bitmapsPending:Lcom/koushikdutta/async/util/HashList;

    iget-object v4, v1, Lcom/koushikdutta/ion/TransformBitmap;->downloadKey:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/koushikdutta/async/util/HashList;->tag(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 151
    .end local v1    # "info":Lcom/koushikdutta/ion/TransformBitmap;
    :cond_31
    instance-of v3, v2, Lcom/koushikdutta/ion/DeferredLoadBitmap;

    if-eqz v3, :cond_3f

    move-object v0, v2

    .line 152
    check-cast v0, Lcom/koushikdutta/ion/DeferredLoadBitmap;

    .line 153
    .local v0, "defer":Lcom/koushikdutta/ion/DeferredLoadBitmap;
    iget-object v3, p1, Lcom/koushikdutta/ion/Ion;->bitmapsPending:Lcom/koushikdutta/async/util/HashList;

    iget-object v4, v0, Lcom/koushikdutta/ion/DeferredLoadBitmap;->key:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/koushikdutta/async/util/HashList;->remove(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 157
    .end local v0    # "defer":Lcom/koushikdutta/ion/DeferredLoadBitmap;
    .end local v2    # "owner":Ljava/lang/Object;
    :cond_3f
    invoke-virtual {p1}, Lcom/koushikdutta/ion/Ion;->processDeferred()V

    goto :goto_2
.end method


# virtual methods
.method public onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/ion/bitmap/BitmapInfo;)V
    .registers 7
    .param p1, "e"    # Ljava/lang/Exception;
    .param p2, "result"    # Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    .prologue
    .line 162
    sget-boolean v2, Lcom/koushikdutta/ion/IonDrawable$IonDrawableCallback;->$assertionsDisabled:Z

    if-nez v2, :cond_18

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-virtual {v3}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v3

    if-eq v2, v3, :cond_18

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 163
    :cond_18
    sget-boolean v2, Lcom/koushikdutta/ion/IonDrawable$IonDrawableCallback;->$assertionsDisabled:Z

    if-nez v2, :cond_24

    if-nez p2, :cond_24

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 165
    :cond_24
    iget-object v2, p0, Lcom/koushikdutta/ion/IonDrawable$IonDrawableCallback;->ionDrawableRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/koushikdutta/ion/IonDrawable;

    .line 166
    .local v1, "drawable":Lcom/koushikdutta/ion/IonDrawable;
    if-nez v1, :cond_2f

    .line 174
    :cond_2e
    :goto_2e
    return-void

    .line 168
    :cond_2f
    iget-object v2, p2, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->servedFrom:Lcom/koushikdutta/ion/ResponseServedFrom;

    .line 169
    invoke-virtual {v1, p2, v2}, Lcom/koushikdutta/ion/IonDrawable;->setBitmap(Lcom/koushikdutta/ion/bitmap/BitmapInfo;Lcom/koushikdutta/ion/ResponseServedFrom;)Lcom/koushikdutta/ion/IonDrawable;

    move-result-object v2

    .line 170
    invoke-virtual {v2}, Lcom/koushikdutta/ion/IonDrawable;->updateLayers()Lcom/koushikdutta/ion/IonDrawable;

    .line 171
    # getter for: Lcom/koushikdutta/ion/IonDrawable;->loadCallback:Lcom/koushikdutta/async/future/FutureCallback;
    invoke-static {v1}, Lcom/koushikdutta/ion/IonDrawable;->access$000(Lcom/koushikdutta/ion/IonDrawable;)Lcom/koushikdutta/async/future/FutureCallback;

    move-result-object v0

    .line 172
    .local v0, "callback":Lcom/koushikdutta/async/future/FutureCallback;, "Lcom/koushikdutta/async/future/FutureCallback<Lcom/koushikdutta/ion/IonDrawable;>;"
    if-eqz v0, :cond_2e

    .line 173
    invoke-interface {v0, p1, v1}, Lcom/koushikdutta/async/future/FutureCallback;->onCompleted(Ljava/lang/Exception;Ljava/lang/Object;)V

    goto :goto_2e
.end method

.method public bridge synthetic onCompleted(Ljava/lang/Exception;Ljava/lang/Object;)V
    .registers 3
    .param p1, "x0"    # Ljava/lang/Exception;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 107
    check-cast p2, Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/koushikdutta/ion/IonDrawable$IonDrawableCallback;->onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/ion/bitmap/BitmapInfo;)V

    return-void
.end method

.method public register(Lcom/koushikdutta/ion/Ion;Ljava/lang/String;)V
    .registers 6
    .param p1, "ion"    # Lcom/koushikdutta/ion/Ion;
    .param p2, "bitmapKey"    # Ljava/lang/String;

    .prologue
    .line 117
    iget-object v1, p0, Lcom/koushikdutta/ion/IonDrawable$IonDrawableCallback;->bitmapKey:Ljava/lang/String;

    .line 118
    .local v1, "previousKey":Ljava/lang/String;
    iget-object v0, p0, Lcom/koushikdutta/ion/IonDrawable$IonDrawableCallback;->ion:Lcom/koushikdutta/ion/Ion;

    .line 119
    .local v0, "previousIon":Lcom/koushikdutta/ion/Ion;
    invoke-static {v1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_f

    iget-object v2, p0, Lcom/koushikdutta/ion/IonDrawable$IonDrawableCallback;->ion:Lcom/koushikdutta/ion/Ion;

    if-ne v2, p1, :cond_f

    .line 126
    :goto_e
    return-void

    .line 121
    :cond_f
    iput-object p1, p0, Lcom/koushikdutta/ion/IonDrawable$IonDrawableCallback;->ion:Lcom/koushikdutta/ion/Ion;

    .line 122
    iput-object p2, p0, Lcom/koushikdutta/ion/IonDrawable$IonDrawableCallback;->bitmapKey:Ljava/lang/String;

    .line 123
    if-eqz p1, :cond_1a

    .line 124
    iget-object v2, p1, Lcom/koushikdutta/ion/Ion;->bitmapsPending:Lcom/koushikdutta/async/util/HashList;

    invoke-virtual {v2, p2, p0}, Lcom/koushikdutta/async/util/HashList;->add(Ljava/lang/String;Ljava/lang/Object;)V

    .line 125
    :cond_1a
    invoke-direct {p0, v0, v1}, Lcom/koushikdutta/ion/IonDrawable$IonDrawableCallback;->unregister(Lcom/koushikdutta/ion/Ion;Ljava/lang/String;)V

    goto :goto_e
.end method
