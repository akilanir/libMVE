.class final Lcat/ereza/customactivityoncrash/CustomActivityOnCrash$1;
.super Ljava/lang/Object;
.source "CustomActivityOnCrash.java"

# interfaces
.implements Ljava/lang/Thread$UncaughtExceptionHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->install(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 103
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .registers 13
    .param p1, "thread"    # Ljava/lang/Thread;
    .param p2, "throwable"    # Ljava/lang/Throwable;

    .prologue
    const v9, 0x1ffff

    .line 106
    const-string v6, "CustomActivityOnCrash"

    const-string v7, "App has crashed, executing CustomActivityOnCrash\'s UncaughtExceptionHandler"

    invoke-static {v6, v7, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 108
    # getter for: Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->errorActivityClass:Ljava/lang/Class;
    invoke-static {}, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->access$000()Ljava/lang/Class;

    move-result-object v6

    if-nez v6, :cond_1b

    .line 109
    # getter for: Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->application:Landroid/app/Application;
    invoke-static {}, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->access$100()Landroid/app/Application;

    move-result-object v6

    # invokes: Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->guessErrorActivityClass(Landroid/content/Context;)Ljava/lang/Class;
    invoke-static {v6}, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->access$200(Landroid/content/Context;)Ljava/lang/Class;

    move-result-object v6

    # setter for: Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->errorActivityClass:Ljava/lang/Class;
    invoke-static {v6}, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->access$002(Ljava/lang/Class;)Ljava/lang/Class;

    .line 112
    :cond_1b
    # getter for: Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->errorActivityClass:Ljava/lang/Class;
    invoke-static {}, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->access$000()Ljava/lang/Class;

    move-result-object v6

    # invokes: Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->isStackTraceLikelyConflictive(Ljava/lang/Throwable;Ljava/lang/Class;)Z
    invoke-static {p2, v6}, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->access$300(Ljava/lang/Throwable;Ljava/lang/Class;)Z

    move-result v6

    if-eqz v6, :cond_46

    .line 113
    const-string v6, "CustomActivityOnCrash"

    const-string v7, "Your application class or your error activity have crashed, the custom activity will not be launched!"

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 148
    :cond_2c
    :goto_2c
    # getter for: Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->lastActivityCreated:Ljava/lang/ref/WeakReference;
    invoke-static {}, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->access$1100()Ljava/lang/ref/WeakReference;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/Activity;

    .line 149
    .local v2, "lastActivity":Landroid/app/Activity;
    if-eqz v2, :cond_42

    .line 153
    invoke-virtual {v2}, Landroid/app/Activity;->finish()V

    .line 154
    # getter for: Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->lastActivityCreated:Ljava/lang/ref/WeakReference;
    invoke-static {}, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->access$1100()Ljava/lang/ref/WeakReference;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/ref/WeakReference;->clear()V

    .line 156
    :cond_42
    # invokes: Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->killCurrentProcess()V
    invoke-static {}, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->access$1200()V

    .line 157
    return-void

    .line 115
    .end local v2    # "lastActivity":Landroid/app/Activity;
    :cond_46
    # getter for: Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->launchErrorActivityWhenInBackground:Z
    invoke-static {}, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->access$400()Z

    move-result v6

    if-nez v6, :cond_52

    # getter for: Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->isInBackground:Z
    invoke-static {}, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->access$500()Z

    move-result v6

    if-nez v6, :cond_2c

    .line 116
    :cond_52
    new-instance v1, Landroid/content/Intent;

    # getter for: Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->application:Landroid/app/Application;
    invoke-static {}, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->access$100()Landroid/app/Application;

    move-result-object v6

    # getter for: Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->errorActivityClass:Ljava/lang/Class;
    invoke-static {}, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->access$000()Ljava/lang/Class;

    move-result-object v7

    invoke-direct {v1, v6, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 117
    .local v1, "intent":Landroid/content/Intent;
    new-instance v5, Ljava/io/StringWriter;

    invoke-direct {v5}, Ljava/io/StringWriter;-><init>()V

    .line 118
    .local v5, "sw":Ljava/io/StringWriter;
    new-instance v3, Ljava/io/PrintWriter;

    invoke-direct {v3, v5}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 119
    .local v3, "pw":Ljava/io/PrintWriter;
    invoke-virtual {p2, v3}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 120
    invoke-virtual {v5}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v4

    .line 126
    .local v4, "stackTraceString":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v6

    if-le v6, v9, :cond_94

    .line 127
    const-string v0, " [stack trace too large]"

    .line 128
    .local v0, "disclaimer":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v7, 0x0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v8

    sub-int v8, v9, v8

    invoke-virtual {v4, v7, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 131
    .end local v0    # "disclaimer":Ljava/lang/String;
    :cond_94
    # getter for: Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->enableAppRestart:Z
    invoke-static {}, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->access$600()Z

    move-result v6

    if-eqz v6, :cond_da

    # getter for: Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->restartActivityClass:Ljava/lang/Class;
    invoke-static {}, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->access$700()Ljava/lang/Class;

    move-result-object v6

    if-nez v6, :cond_da

    .line 134
    # getter for: Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->application:Landroid/app/Application;
    invoke-static {}, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->access$100()Landroid/app/Application;

    move-result-object v6

    # invokes: Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->guessRestartActivityClass(Landroid/content/Context;)Ljava/lang/Class;
    invoke-static {v6}, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->access$800(Landroid/content/Context;)Ljava/lang/Class;

    move-result-object v6

    # setter for: Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->restartActivityClass:Ljava/lang/Class;
    invoke-static {v6}, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->access$702(Ljava/lang/Class;)Ljava/lang/Class;

    .line 140
    :cond_ab
    :goto_ab
    const-string v6, "cat.ereza.customactivityoncrash.EXTRA_STACK_TRACE"

    invoke-virtual {v1, v6, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 141
    const-string v6, "cat.ereza.customactivityoncrash.EXTRA_RESTART_ACTIVITY_CLASS"

    # getter for: Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->restartActivityClass:Ljava/lang/Class;
    invoke-static {}, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->access$700()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v1, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 142
    const-string v6, "cat.ereza.customactivityoncrash.EXTRA_SHOW_ERROR_DETAILS"

    # getter for: Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->showErrorDetails:Z
    invoke-static {}, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->access$900()Z

    move-result v7

    invoke-virtual {v1, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 143
    const-string v6, "cat.ereza.customactivityoncrash.EXTRA_IMAGE_DRAWABLE_ID"

    # getter for: Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->defaultErrorActivityDrawableId:I
    invoke-static {}, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->access$1000()I

    move-result v7

    invoke-virtual {v1, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 144
    const v6, 0x10008000

    invoke-virtual {v1, v6}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 145
    # getter for: Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->application:Landroid/app/Application;
    invoke-static {}, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->access$100()Landroid/app/Application;

    move-result-object v6

    invoke-virtual {v6, v1}, Landroid/app/Application;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_2c

    .line 135
    :cond_da
    # getter for: Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->enableAppRestart:Z
    invoke-static {}, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->access$600()Z

    move-result v6

    if-nez v6, :cond_ab

    .line 137
    const/4 v6, 0x0

    # setter for: Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->restartActivityClass:Ljava/lang/Class;
    invoke-static {v6}, Lcat/ereza/customactivityoncrash/CustomActivityOnCrash;->access$702(Ljava/lang/Class;)Ljava/lang/Class;

    goto :goto_ab
.end method
