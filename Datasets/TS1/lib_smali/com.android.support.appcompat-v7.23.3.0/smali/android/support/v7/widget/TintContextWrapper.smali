.class Landroid/support/v7/widget/TintContextWrapper;
.super Landroid/content/ContextWrapper;
.source "TintContextWrapper.java"


# static fields
.field private static final sCache:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/support/v7/widget/TintContextWrapper;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field private mResources:Landroid/content/res/Resources;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 33
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Landroid/support/v7/widget/TintContextWrapper;->sCache:Ljava/util/ArrayList;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "base"    # Landroid/content/Context;

    .prologue
    .line 58
    invoke-direct {p0, p1}, Landroid/content/ContextWrapper;-><init>(Landroid/content/Context;)V

    .line 59
    return-void
.end method

.method public static wrap(Landroid/content/Context;)Landroid/content/Context;
    .registers 7
    .param p0, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 36
    instance-of v4, p0, Landroid/support/v7/widget/TintContextWrapper;

    if-nez v4, :cond_3c

    .line 38
    const/4 v1, 0x0

    .local v1, "i":I
    sget-object v4, Landroid/support/v7/widget/TintContextWrapper;->sCache:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v0

    .local v0, "count":I
    :goto_b
    if-ge v1, v0, :cond_2c

    .line 39
    sget-object v4, Landroid/support/v7/widget/TintContextWrapper;->sCache:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ref/WeakReference;

    .line 40
    .local v2, "ref":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/support/v7/widget/TintContextWrapper;>;"
    if-eqz v2, :cond_27

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/support/v7/widget/TintContextWrapper;

    move-object v3, v4

    .line 41
    .local v3, "wrapper":Landroid/support/v7/widget/TintContextWrapper;
    :goto_1e
    if-eqz v3, :cond_29

    invoke-virtual {v3}, Landroid/support/v7/widget/TintContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v4

    if-ne v4, p0, :cond_29

    .line 52
    .end local v0    # "count":I
    .end local v1    # "i":I
    .end local v2    # "ref":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/support/v7/widget/TintContextWrapper;>;"
    .end local v3    # "wrapper":Landroid/support/v7/widget/TintContextWrapper;
    :goto_26
    return-object v3

    .line 40
    .restart local v0    # "count":I
    .restart local v1    # "i":I
    .restart local v2    # "ref":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/support/v7/widget/TintContextWrapper;>;"
    :cond_27
    const/4 v3, 0x0

    goto :goto_1e

    .line 38
    .restart local v3    # "wrapper":Landroid/support/v7/widget/TintContextWrapper;
    :cond_29
    add-int/lit8 v1, v1, 0x1

    goto :goto_b

    .line 47
    .end local v2    # "ref":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/support/v7/widget/TintContextWrapper;>;"
    .end local v3    # "wrapper":Landroid/support/v7/widget/TintContextWrapper;
    :cond_2c
    new-instance v3, Landroid/support/v7/widget/TintContextWrapper;

    invoke-direct {v3, p0}, Landroid/support/v7/widget/TintContextWrapper;-><init>(Landroid/content/Context;)V

    .line 48
    .restart local v3    # "wrapper":Landroid/support/v7/widget/TintContextWrapper;
    sget-object v4, Landroid/support/v7/widget/TintContextWrapper;->sCache:Ljava/util/ArrayList;

    new-instance v5, Ljava/lang/ref/WeakReference;

    invoke-direct {v5, v3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_26

    .end local v0    # "count":I
    .end local v1    # "i":I
    .end local v3    # "wrapper":Landroid/support/v7/widget/TintContextWrapper;
    :cond_3c
    move-object v3, p0

    .line 52
    goto :goto_26
.end method


# virtual methods
.method public getResources()Landroid/content/res/Resources;
    .registers 3

    .prologue
    .line 63
    iget-object v0, p0, Landroid/support/v7/widget/TintContextWrapper;->mResources:Landroid/content/res/Resources;

    if-nez v0, :cond_f

    .line 64
    new-instance v0, Landroid/support/v7/widget/TintResources;

    invoke-super {p0}, Landroid/content/ContextWrapper;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Landroid/support/v7/widget/TintResources;-><init>(Landroid/content/Context;Landroid/content/res/Resources;)V

    iput-object v0, p0, Landroid/support/v7/widget/TintContextWrapper;->mResources:Landroid/content/res/Resources;

    .line 66
    :cond_f
    iget-object v0, p0, Landroid/support/v7/widget/TintContextWrapper;->mResources:Landroid/content/res/Resources;

    return-object v0
.end method
