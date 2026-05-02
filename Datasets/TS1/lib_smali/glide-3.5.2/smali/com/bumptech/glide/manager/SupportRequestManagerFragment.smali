.class public Lcom/bumptech/glide/manager/SupportRequestManagerFragment;
.super Landroid/support/v4/app/Fragment;
.source "SupportRequestManagerFragment.java"


# instance fields
.field private final lifecycle:Lcom/bumptech/glide/manager/ActivityFragmentLifecycle;

.field private requestManager:Lcom/bumptech/glide/RequestManager;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 22
    new-instance v0, Lcom/bumptech/glide/manager/ActivityFragmentLifecycle;

    invoke-direct {v0}, Lcom/bumptech/glide/manager/ActivityFragmentLifecycle;-><init>()V

    invoke-direct {p0, v0}, Lcom/bumptech/glide/manager/SupportRequestManagerFragment;-><init>(Lcom/bumptech/glide/manager/ActivityFragmentLifecycle;)V

    .line 23
    return-void
.end method

.method public constructor <init>(Lcom/bumptech/glide/manager/ActivityFragmentLifecycle;)V
    .registers 2
    .param p1, "lifecycle"    # Lcom/bumptech/glide/manager/ActivityFragmentLifecycle;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ValidFragment"
        }
    .end annotation

    .prologue
    .line 27
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    .line 28
    iput-object p1, p0, Lcom/bumptech/glide/manager/SupportRequestManagerFragment;->lifecycle:Lcom/bumptech/glide/manager/ActivityFragmentLifecycle;

    .line 29
    return-void
.end method


# virtual methods
.method getLifecycle()Lcom/bumptech/glide/manager/ActivityFragmentLifecycle;
    .registers 2

    .prologue
    .line 41
    iget-object v0, p0, Lcom/bumptech/glide/manager/SupportRequestManagerFragment;->lifecycle:Lcom/bumptech/glide/manager/ActivityFragmentLifecycle;

    return-object v0
.end method

.method public getRequestManager()Lcom/bumptech/glide/RequestManager;
    .registers 2

    .prologue
    .line 48
    iget-object v0, p0, Lcom/bumptech/glide/manager/SupportRequestManagerFragment;->requestManager:Lcom/bumptech/glide/RequestManager;

    return-object v0
.end method

.method public onDestroy()V
    .registers 2

    .prologue
    .line 65
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onDestroy()V

    .line 66
    iget-object v0, p0, Lcom/bumptech/glide/manager/SupportRequestManagerFragment;->lifecycle:Lcom/bumptech/glide/manager/ActivityFragmentLifecycle;

    invoke-virtual {v0}, Lcom/bumptech/glide/manager/ActivityFragmentLifecycle;->onDestroy()V

    .line 67
    return-void
.end method

.method public onLowMemory()V
    .registers 2

    .prologue
    .line 71
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onLowMemory()V

    .line 74
    iget-object v0, p0, Lcom/bumptech/glide/manager/SupportRequestManagerFragment;->requestManager:Lcom/bumptech/glide/RequestManager;

    if-eqz v0, :cond_c

    .line 75
    iget-object v0, p0, Lcom/bumptech/glide/manager/SupportRequestManagerFragment;->requestManager:Lcom/bumptech/glide/RequestManager;

    invoke-virtual {v0}, Lcom/bumptech/glide/RequestManager;->onLowMemory()V

    .line 77
    :cond_c
    return-void
.end method

.method public onStart()V
    .registers 2

    .prologue
    .line 53
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onStart()V

    .line 54
    iget-object v0, p0, Lcom/bumptech/glide/manager/SupportRequestManagerFragment;->lifecycle:Lcom/bumptech/glide/manager/ActivityFragmentLifecycle;

    invoke-virtual {v0}, Lcom/bumptech/glide/manager/ActivityFragmentLifecycle;->onStart()V

    .line 55
    return-void
.end method

.method public onStop()V
    .registers 2

    .prologue
    .line 59
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onStop()V

    .line 60
    iget-object v0, p0, Lcom/bumptech/glide/manager/SupportRequestManagerFragment;->lifecycle:Lcom/bumptech/glide/manager/ActivityFragmentLifecycle;

    invoke-virtual {v0}, Lcom/bumptech/glide/manager/ActivityFragmentLifecycle;->onStop()V

    .line 61
    return-void
.end method

.method public setRequestManager(Lcom/bumptech/glide/RequestManager;)V
    .registers 2
    .param p1, "requestManager"    # Lcom/bumptech/glide/RequestManager;

    .prologue
    .line 37
    iput-object p1, p0, Lcom/bumptech/glide/manager/SupportRequestManagerFragment;->requestManager:Lcom/bumptech/glide/RequestManager;

    .line 38
    return-void
.end method
