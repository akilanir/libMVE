.class Lorg/acra/ErrorReporter$2;
.super Ljava/lang/Object;
.source "ErrorReporter.java"

# interfaces
.implements Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksCompat;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/acra/ErrorReporter;-><init>(Landroid/app/Application;Landroid/content/SharedPreferences;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/acra/ErrorReporter;


# direct methods
.method constructor <init>(Lorg/acra/ErrorReporter;)V
    .registers 2

    .prologue
    .line 157
    iput-object p1, p0, Lorg/acra/ErrorReporter$2;->this$0:Lorg/acra/ErrorReporter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 5
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 162
    instance-of v0, p1, Lorg/acra/BaseCrashReportDialog;

    if-nez v0, :cond_e

    .line 166
    iget-object v0, p0, Lorg/acra/ErrorReporter$2;->this$0:Lorg/acra/ErrorReporter;

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    # setter for: Lorg/acra/ErrorReporter;->lastActivityCreated:Ljava/lang/ref/WeakReference;
    invoke-static {v0, v1}, Lorg/acra/ErrorReporter;->access$002(Lorg/acra/ErrorReporter;Ljava/lang/ref/WeakReference;)Ljava/lang/ref/WeakReference;

    .line 168
    :cond_e
    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .registers 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 204
    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .registers 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 186
    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .registers 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 180
    return-void
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 198
    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .registers 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 174
    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .registers 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 192
    return-void
.end method
