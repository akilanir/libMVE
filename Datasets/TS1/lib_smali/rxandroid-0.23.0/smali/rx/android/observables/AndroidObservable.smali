.class public final Lrx/android/observables/AndroidObservable;
.super Ljava/lang/Object;
.source "AndroidObservable.java"


# static fields
.field private static final ACTIVITY_VALIDATOR:Lrx/functions/Func1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/functions/Func1",
            "<",
            "Landroid/app/Activity;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private static final FRAGMENTV4_VALIDATOR:Lrx/functions/Func1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/functions/Func1",
            "<",
            "Landroid/support/v4/app/Fragment;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private static final FRAGMENT_VALIDATOR:Lrx/functions/Func1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/functions/Func1",
            "<",
            "Landroid/app/Fragment;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private static final USES_SUPPORT_FRAGMENTS:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 40
    const/4 v0, 0x0

    .line 42
    .local v0, "supportFragmentsAvailable":Z
    :try_start_1
    const-string v1, "android.support.v4.app.Fragment"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_6
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_6} :catch_1f

    .line 43
    const/4 v0, 0x1

    .line 46
    :goto_7
    sput-boolean v0, Lrx/android/observables/AndroidObservable;->USES_SUPPORT_FRAGMENTS:Z

    .line 49
    new-instance v1, Lrx/android/observables/AndroidObservable$1;

    invoke-direct {v1}, Lrx/android/observables/AndroidObservable$1;-><init>()V

    sput-object v1, Lrx/android/observables/AndroidObservable;->ACTIVITY_VALIDATOR:Lrx/functions/Func1;

    .line 56
    new-instance v1, Lrx/android/observables/AndroidObservable$2;

    invoke-direct {v1}, Lrx/android/observables/AndroidObservable$2;-><init>()V

    sput-object v1, Lrx/android/observables/AndroidObservable;->FRAGMENT_VALIDATOR:Lrx/functions/Func1;

    .line 63
    new-instance v1, Lrx/android/observables/AndroidObservable$3;

    invoke-direct {v1}, Lrx/android/observables/AndroidObservable$3;-><init>()V

    sput-object v1, Lrx/android/observables/AndroidObservable;->FRAGMENTV4_VALIDATOR:Lrx/functions/Func1;

    return-void

    .line 44
    :catch_1f
    move-exception v1

    goto :goto_7
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    return-void
.end method

.method public static bindActivity(Landroid/app/Activity;Lrx/Observable;)Lrx/Observable;
    .registers 5
    .param p0, "activity"    # Landroid/app/Activity;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/app/Activity;",
            "Lrx/Observable",
            "<TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 89
    .local p1, "source":Lrx/Observable;, "Lrx/Observable<TT;>;"
    invoke-static {}, Lrx/android/observables/Assertions;->assertUiThread()V

    .line 90
    invoke-static {}, Lrx/android/schedulers/AndroidSchedulers;->mainThread()Lrx/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lrx/Observable;->observeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    new-instance v1, Lrx/android/operators/OperatorConditionalBinding;

    sget-object v2, Lrx/android/observables/AndroidObservable;->ACTIVITY_VALIDATOR:Lrx/functions/Func1;

    invoke-direct {v1, p0, v2}, Lrx/android/operators/OperatorConditionalBinding;-><init>(Ljava/lang/Object;Lrx/functions/Func1;)V

    invoke-virtual {v0, v1}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static bindFragment(Ljava/lang/Object;Lrx/Observable;)Lrx/Observable;
    .registers 6
    .param p0, "fragment"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Lrx/Observable",
            "<TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 108
    .local p1, "source":Lrx/Observable;, "Lrx/Observable<TT;>;"
    invoke-static {}, Lrx/android/observables/Assertions;->assertUiThread()V

    .line 109
    invoke-static {}, Lrx/android/schedulers/AndroidSchedulers;->mainThread()Lrx/Scheduler;

    move-result-object v2

    invoke-virtual {p1, v2}, Lrx/Observable;->observeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v1

    .line 110
    .local v1, "o":Lrx/Observable;, "Lrx/Observable<TT;>;"
    sget-boolean v2, Lrx/android/observables/AndroidObservable;->USES_SUPPORT_FRAGMENTS:Z

    if-eqz v2, :cond_22

    instance-of v2, p0, Landroid/support/v4/app/Fragment;

    if-eqz v2, :cond_22

    move-object v0, p0

    .line 111
    check-cast v0, Landroid/support/v4/app/Fragment;

    .line 112
    .local v0, "f":Landroid/support/v4/app/Fragment;
    new-instance v2, Lrx/android/operators/OperatorConditionalBinding;

    sget-object v3, Lrx/android/observables/AndroidObservable;->FRAGMENTV4_VALIDATOR:Lrx/functions/Func1;

    invoke-direct {v2, v0, v3}, Lrx/android/operators/OperatorConditionalBinding;-><init>(Ljava/lang/Object;Lrx/functions/Func1;)V

    invoke-virtual {v1, v2}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v2

    .line 115
    .end local v0    # "f":Landroid/support/v4/app/Fragment;
    :goto_21
    return-object v2

    .line 113
    :cond_22
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xb

    if-lt v2, v3, :cond_3b

    instance-of v2, p0, Landroid/app/Fragment;

    if-eqz v2, :cond_3b

    move-object v0, p0

    .line 114
    check-cast v0, Landroid/app/Fragment;

    .line 115
    .local v0, "f":Landroid/app/Fragment;
    new-instance v2, Lrx/android/operators/OperatorConditionalBinding;

    sget-object v3, Lrx/android/observables/AndroidObservable;->FRAGMENT_VALIDATOR:Lrx/functions/Func1;

    invoke-direct {v2, v0, v3}, Lrx/android/operators/OperatorConditionalBinding;-><init>(Ljava/lang/Object;Lrx/functions/Func1;)V

    invoke-virtual {v1, v2}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v2

    goto :goto_21

    .line 117
    .end local v0    # "f":Landroid/app/Fragment;
    :cond_3b
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Target fragment is neither a native nor support library Fragment"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public static fromBroadcast(Landroid/content/Context;Landroid/content/IntentFilter;)Lrx/Observable;
    .registers 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "filter"    # Landroid/content/IntentFilter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/content/IntentFilter;",
            ")",
            "Lrx/Observable",
            "<",
            "Landroid/content/Intent;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 127
    new-instance v0, Lrx/android/operators/OperatorBroadcastRegister;

    invoke-direct {v0, p0, p1, v1, v1}, Lrx/android/operators/OperatorBroadcastRegister;-><init>(Landroid/content/Context;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)V

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static fromBroadcast(Landroid/content/Context;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Lrx/Observable;
    .registers 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "filter"    # Landroid/content/IntentFilter;
    .param p2, "broadcastPermission"    # Ljava/lang/String;
    .param p3, "schedulerHandler"    # Landroid/os/Handler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/content/IntentFilter;",
            "Ljava/lang/String;",
            "Landroid/os/Handler;",
            ")",
            "Lrx/Observable",
            "<",
            "Landroid/content/Intent;",
            ">;"
        }
    .end annotation

    .prologue
    .line 141
    new-instance v0, Lrx/android/operators/OperatorBroadcastRegister;

    invoke-direct {v0, p0, p1, p2, p3}, Lrx/android/operators/OperatorBroadcastRegister;-><init>(Landroid/content/Context;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)V

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static fromLocalBroadcast(Landroid/content/Context;Landroid/content/IntentFilter;)Lrx/Observable;
    .registers 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "filter"    # Landroid/content/IntentFilter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/content/IntentFilter;",
            ")",
            "Lrx/Observable",
            "<",
            "Landroid/content/Intent;",
            ">;"
        }
    .end annotation

    .prologue
    .line 151
    new-instance v0, Lrx/android/operators/OperatorLocalBroadcastRegister;

    invoke-direct {v0, p0, p1}, Lrx/android/operators/OperatorLocalBroadcastRegister;-><init>(Landroid/content/Context;Landroid/content/IntentFilter;)V

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static fromSharedPreferencesChanges(Landroid/content/SharedPreferences;)Lrx/Observable;
    .registers 2
    .param p0, "sharedPreferences"    # Landroid/content/SharedPreferences;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/SharedPreferences;",
            ")",
            "Lrx/Observable",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 160
    new-instance v0, Lrx/android/operators/OperatorSharedPreferenceChange;

    invoke-direct {v0, p0}, Lrx/android/operators/OperatorSharedPreferenceChange;-><init>(Landroid/content/SharedPreferences;)V

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method
