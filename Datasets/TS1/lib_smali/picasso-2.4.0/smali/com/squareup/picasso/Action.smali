.class abstract Lcom/squareup/picasso/Action;
.super Ljava/lang/Object;
.source "Action.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/squareup/picasso/Action$RequestWeakReference;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field cancelled:Z

.field final errorDrawable:Landroid/graphics/drawable/Drawable;

.field final errorResId:I

.field final key:Ljava/lang/String;

.field final noFade:Z

.field final picasso:Lcom/squareup/picasso/Picasso;

.field final request:Lcom/squareup/picasso/Request;

.field final skipCache:Z

.field final tag:Ljava/lang/Object;

.field final target:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<TT;>;"
        }
    .end annotation
.end field

.field willReplay:Z


# direct methods
.method constructor <init>(Lcom/squareup/picasso/Picasso;Ljava/lang/Object;Lcom/squareup/picasso/Request;ZZILandroid/graphics/drawable/Drawable;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 12
    .param p1, "picasso"    # Lcom/squareup/picasso/Picasso;
    .param p3, "request"    # Lcom/squareup/picasso/Request;
    .param p4, "skipCache"    # Z
    .param p5, "noFade"    # Z
    .param p6, "errorResId"    # I
    .param p7, "errorDrawable"    # Landroid/graphics/drawable/Drawable;
    .param p8, "key"    # Ljava/lang/String;
    .param p9, "tag"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/squareup/picasso/Picasso;",
            "TT;",
            "Lcom/squareup/picasso/Request;",
            "ZZI",
            "Landroid/graphics/drawable/Drawable;",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .prologue
    .line 49
    .local p0, "this":Lcom/squareup/picasso/Action;, "Lcom/squareup/picasso/Action<TT;>;"
    .local p2, "target":Ljava/lang/Object;, "TT;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    iput-object p1, p0, Lcom/squareup/picasso/Action;->picasso:Lcom/squareup/picasso/Picasso;

    .line 51
    iput-object p3, p0, Lcom/squareup/picasso/Action;->request:Lcom/squareup/picasso/Request;

    .line 52
    if-nez p2, :cond_1b

    const/4 v0, 0x0

    :goto_a
    iput-object v0, p0, Lcom/squareup/picasso/Action;->target:Ljava/lang/ref/WeakReference;

    .line 54
    iput-boolean p4, p0, Lcom/squareup/picasso/Action;->skipCache:Z

    .line 55
    iput-boolean p5, p0, Lcom/squareup/picasso/Action;->noFade:Z

    .line 56
    iput p6, p0, Lcom/squareup/picasso/Action;->errorResId:I

    .line 57
    iput-object p7, p0, Lcom/squareup/picasso/Action;->errorDrawable:Landroid/graphics/drawable/Drawable;

    .line 58
    iput-object p8, p0, Lcom/squareup/picasso/Action;->key:Ljava/lang/String;

    .line 59
    if-eqz p9, :cond_23

    .end local p9    # "tag":Ljava/lang/Object;
    :goto_18
    iput-object p9, p0, Lcom/squareup/picasso/Action;->tag:Ljava/lang/Object;

    .line 60
    return-void

    .line 52
    .restart local p9    # "tag":Ljava/lang/Object;
    :cond_1b
    new-instance v0, Lcom/squareup/picasso/Action$RequestWeakReference;

    iget-object v1, p1, Lcom/squareup/picasso/Picasso;->referenceQueue:Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v0, p0, p2, v1}, Lcom/squareup/picasso/Action$RequestWeakReference;-><init>(Lcom/squareup/picasso/Action;Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;)V

    goto :goto_a

    :cond_23
    move-object p9, p0

    .line 59
    goto :goto_18
.end method


# virtual methods
.method cancel()V
    .registers 2

    .prologue
    .line 67
    .local p0, "this":Lcom/squareup/picasso/Action;, "Lcom/squareup/picasso/Action<TT;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/squareup/picasso/Action;->cancelled:Z

    .line 68
    return-void
.end method

.method abstract complete(Landroid/graphics/Bitmap;Lcom/squareup/picasso/Picasso$LoadedFrom;)V
.end method

.method abstract error()V
.end method

.method getKey()Ljava/lang/String;
    .registers 2

    .prologue
    .line 79
    .local p0, "this":Lcom/squareup/picasso/Action;, "Lcom/squareup/picasso/Action<TT;>;"
    iget-object v0, p0, Lcom/squareup/picasso/Action;->key:Ljava/lang/String;

    return-object v0
.end method

.method getPicasso()Lcom/squareup/picasso/Picasso;
    .registers 2

    .prologue
    .line 91
    .local p0, "this":Lcom/squareup/picasso/Action;, "Lcom/squareup/picasso/Action<TT;>;"
    iget-object v0, p0, Lcom/squareup/picasso/Action;->picasso:Lcom/squareup/picasso/Picasso;

    return-object v0
.end method

.method getPriority()Lcom/squareup/picasso/Picasso$Priority;
    .registers 2

    .prologue
    .line 95
    .local p0, "this":Lcom/squareup/picasso/Action;, "Lcom/squareup/picasso/Action<TT;>;"
    iget-object v0, p0, Lcom/squareup/picasso/Action;->request:Lcom/squareup/picasso/Request;

    iget-object v0, v0, Lcom/squareup/picasso/Request;->priority:Lcom/squareup/picasso/Picasso$Priority;

    return-object v0
.end method

.method getRequest()Lcom/squareup/picasso/Request;
    .registers 2

    .prologue
    .line 71
    .local p0, "this":Lcom/squareup/picasso/Action;, "Lcom/squareup/picasso/Action<TT;>;"
    iget-object v0, p0, Lcom/squareup/picasso/Action;->request:Lcom/squareup/picasso/Request;

    return-object v0
.end method

.method getTag()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 99
    .local p0, "this":Lcom/squareup/picasso/Action;, "Lcom/squareup/picasso/Action<TT;>;"
    iget-object v0, p0, Lcom/squareup/picasso/Action;->tag:Ljava/lang/Object;

    return-object v0
.end method

.method getTarget()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 75
    .local p0, "this":Lcom/squareup/picasso/Action;, "Lcom/squareup/picasso/Action<TT;>;"
    iget-object v0, p0, Lcom/squareup/picasso/Action;->target:Ljava/lang/ref/WeakReference;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lcom/squareup/picasso/Action;->target:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    goto :goto_5
.end method

.method isCancelled()Z
    .registers 2

    .prologue
    .line 83
    .local p0, "this":Lcom/squareup/picasso/Action;, "Lcom/squareup/picasso/Action<TT;>;"
    iget-boolean v0, p0, Lcom/squareup/picasso/Action;->cancelled:Z

    return v0
.end method

.method willReplay()Z
    .registers 2

    .prologue
    .line 87
    .local p0, "this":Lcom/squareup/picasso/Action;, "Lcom/squareup/picasso/Action<TT;>;"
    iget-boolean v0, p0, Lcom/squareup/picasso/Action;->willReplay:Z

    return v0
.end method
