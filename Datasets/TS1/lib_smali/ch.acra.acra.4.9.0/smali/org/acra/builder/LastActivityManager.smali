.class public final Lorg/acra/builder/LastActivityManager;
.super Ljava/lang/Object;
.source "LastActivityManager.java"


# instance fields
.field private lastActivityCreated:Ljava/lang/ref/WeakReference;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/app/Application;)V
    .registers 4
    .param p1, "application"    # Landroid/app/Application;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    new-instance v0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lorg/acra/builder/LastActivityManager;->lastActivityCreated:Ljava/lang/ref/WeakReference;

    .line 28
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_19

    .line 31
    new-instance v0, Lorg/acra/builder/LastActivityManager$1;

    invoke-direct {v0, p0}, Lorg/acra/builder/LastActivityManager$1;-><init>(Lorg/acra/builder/LastActivityManager;)V

    invoke-virtual {p1, v0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 73
    :cond_19
    return-void
.end method

.method static synthetic access$002(Lorg/acra/builder/LastActivityManager;Ljava/lang/ref/WeakReference;)Ljava/lang/ref/WeakReference;
    .registers 2
    .param p0, "x0"    # Lorg/acra/builder/LastActivityManager;
    .param p1, "x1"    # Ljava/lang/ref/WeakReference;

    .prologue
    .line 22
    iput-object p1, p0, Lorg/acra/builder/LastActivityManager;->lastActivityCreated:Ljava/lang/ref/WeakReference;

    return-object p1
.end method


# virtual methods
.method public clearLastActivity()V
    .registers 2

    .prologue
    .line 81
    iget-object v0, p0, Lorg/acra/builder/LastActivityManager;->lastActivityCreated:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->clear()V

    .line 82
    return-void
.end method

.method public getLastActivity()Landroid/app/Activity;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 77
    iget-object v0, p0, Lorg/acra/builder/LastActivityManager;->lastActivityCreated:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    return-object v0
.end method
