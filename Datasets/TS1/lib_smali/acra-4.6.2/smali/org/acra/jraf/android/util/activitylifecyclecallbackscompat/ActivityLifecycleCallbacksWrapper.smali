.class Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksWrapper;
.super Ljava/lang/Object;
.source "ActivityLifecycleCallbacksWrapper.java"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# instance fields
.field private mCallback:Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksCompat;


# direct methods
.method public constructor <init>(Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksCompat;)V
    .registers 2
    .param p1, "callback"    # Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksCompat;

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object p1, p0, Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksWrapper;->mCallback:Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksCompat;

    .line 40
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 5
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 82
    instance-of v2, p1, Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksWrapper;

    if-nez v2, :cond_6

    .line 85
    :cond_5
    :goto_5
    return v1

    :cond_6
    move-object v0, p1

    .line 84
    check-cast v0, Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksWrapper;

    .line 85
    .local v0, "that":Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksWrapper;
    iget-object v2, p0, Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksWrapper;->mCallback:Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksCompat;

    if-nez v2, :cond_13

    iget-object v2, v0, Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksWrapper;->mCallback:Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksCompat;

    if-nez v2, :cond_5

    const/4 v1, 0x1

    goto :goto_5

    :cond_13
    iget-object v1, p0, Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksWrapper;->mCallback:Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksCompat;

    iget-object v2, v0, Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksWrapper;->mCallback:Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksCompat;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_5
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 94
    iget-object v0, p0, Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksWrapper;->mCallback:Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksCompat;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksWrapper;->mCallback:Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksCompat;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 4
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 44
    iget-object v0, p0, Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksWrapper;->mCallback:Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksCompat;

    invoke-interface {v0, p1, p2}, Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksCompat;->onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V

    .line 45
    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .registers 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 74
    iget-object v0, p0, Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksWrapper;->mCallback:Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksCompat;

    invoke-interface {v0, p1}, Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksCompat;->onActivityDestroyed(Landroid/app/Activity;)V

    .line 75
    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .registers 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 59
    iget-object v0, p0, Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksWrapper;->mCallback:Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksCompat;

    invoke-interface {v0, p1}, Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksCompat;->onActivityPaused(Landroid/app/Activity;)V

    .line 60
    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .registers 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 54
    iget-object v0, p0, Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksWrapper;->mCallback:Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksCompat;

    invoke-interface {v0, p1}, Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksCompat;->onActivityResumed(Landroid/app/Activity;)V

    .line 55
    return-void
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 4
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 69
    iget-object v0, p0, Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksWrapper;->mCallback:Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksCompat;

    invoke-interface {v0, p1, p2}, Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksCompat;->onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V

    .line 70
    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .registers 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 49
    iget-object v0, p0, Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksWrapper;->mCallback:Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksCompat;

    invoke-interface {v0, p1}, Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksCompat;->onActivityStarted(Landroid/app/Activity;)V

    .line 50
    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .registers 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 64
    iget-object v0, p0, Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksWrapper;->mCallback:Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksCompat;

    invoke-interface {v0, p1}, Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksCompat;->onActivityStopped(Landroid/app/Activity;)V

    .line 65
    return-void
.end method
