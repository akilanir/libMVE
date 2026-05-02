.class public Lorg/ligi/axt/extensions/ActivityAXT;
.super Lorg/ligi/axt/extensions/ContextAXT;
.source "ActivityAXT.java"


# instance fields
.field private final activity:Landroid/app/Activity;


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .registers 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 16
    invoke-direct {p0, p1}, Lorg/ligi/axt/extensions/ContextAXT;-><init>(Landroid/content/Context;)V

    .line 17
    iput-object p1, p0, Lorg/ligi/axt/extensions/ActivityAXT;->activity:Landroid/app/Activity;

    .line 18
    return-void
.end method

.method static synthetic access$000(Lorg/ligi/axt/extensions/ActivityAXT;)Landroid/app/Activity;
    .registers 2
    .param p0, "x0"    # Lorg/ligi/axt/extensions/ActivityAXT;

    .prologue
    .line 11
    iget-object v0, p0, Lorg/ligi/axt/extensions/ActivityAXT;->activity:Landroid/app/Activity;

    return-object v0
.end method


# virtual methods
.method public disableRotation()V
    .registers 2

    .prologue
    .line 30
    iget-object v0, p0, Lorg/ligi/axt/extensions/ActivityAXT;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    invoke-virtual {p0, v0}, Lorg/ligi/axt/extensions/ActivityAXT;->lockOrientation(I)V

    .line 31
    return-void
.end method

.method public enableRotation()V
    .registers 3

    .prologue
    .line 69
    iget-object v0, p0, Lorg/ligi/axt/extensions/ActivityAXT;->activity:Landroid/app/Activity;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setRequestedOrientation(I)V

    .line 70
    return-void
.end method

.method public findById(I)Landroid/view/View;
    .registers 3
    .param p1, "id"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/view/View;",
            ">(I)TT;"
        }
    .end annotation

    .prologue
    .line 21
    iget-object v0, p0, Lorg/ligi/axt/extensions/ActivityAXT;->activity:Landroid/app/Activity;

    invoke-virtual {v0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public lockOrientation(I)V
    .registers 7
    .param p1, "orientation"    # I

    .prologue
    const/4 v4, 0x0

    const/16 v3, 0x8

    const/4 v2, 0x1

    .line 34
    packed-switch p1, :pswitch_data_5c

    .line 61
    :goto_7
    return-void

    .line 36
    :pswitch_8
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-ge v1, v3, :cond_12

    .line 37
    iget-object v1, p0, Lorg/ligi/axt/extensions/ActivityAXT;->activity:Landroid/app/Activity;

    invoke-virtual {v1, v2}, Landroid/app/Activity;->setRequestedOrientation(I)V

    goto :goto_7

    .line 39
    :cond_12
    iget-object v1, p0, Lorg/ligi/axt/extensions/ActivityAXT;->activity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v1

    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Display;->getRotation()I

    move-result v0

    .line 40
    .local v0, "rotation":I
    if-eq v0, v2, :cond_25

    const/4 v1, 0x2

    if-ne v0, v1, :cond_2d

    .line 41
    :cond_25
    iget-object v1, p0, Lorg/ligi/axt/extensions/ActivityAXT;->activity:Landroid/app/Activity;

    const/16 v2, 0x9

    invoke-virtual {v1, v2}, Landroid/app/Activity;->setRequestedOrientation(I)V

    goto :goto_7

    .line 43
    :cond_2d
    iget-object v1, p0, Lorg/ligi/axt/extensions/ActivityAXT;->activity:Landroid/app/Activity;

    invoke-virtual {v1, v2}, Landroid/app/Activity;->setRequestedOrientation(I)V

    goto :goto_7

    .line 49
    .end local v0    # "rotation":I
    :pswitch_33
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-ge v1, v3, :cond_3d

    .line 50
    iget-object v1, p0, Lorg/ligi/axt/extensions/ActivityAXT;->activity:Landroid/app/Activity;

    invoke-virtual {v1, v4}, Landroid/app/Activity;->setRequestedOrientation(I)V

    goto :goto_7

    .line 52
    :cond_3d
    iget-object v1, p0, Lorg/ligi/axt/extensions/ActivityAXT;->activity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v1

    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Display;->getRotation()I

    move-result v0

    .line 53
    .restart local v0    # "rotation":I
    if-eqz v0, :cond_4f

    if-ne v0, v2, :cond_55

    .line 54
    :cond_4f
    iget-object v1, p0, Lorg/ligi/axt/extensions/ActivityAXT;->activity:Landroid/app/Activity;

    invoke-virtual {v1, v4}, Landroid/app/Activity;->setRequestedOrientation(I)V

    goto :goto_7

    .line 56
    :cond_55
    iget-object v1, p0, Lorg/ligi/axt/extensions/ActivityAXT;->activity:Landroid/app/Activity;

    invoke-virtual {v1, v3}, Landroid/app/Activity;->setRequestedOrientation(I)V

    goto :goto_7

    .line 34
    nop

    :pswitch_data_5c
    .packed-switch 0x1
        :pswitch_8
        :pswitch_33
    .end packed-switch
.end method

.method public rethrowIntentExcludingSelf()V
    .registers 9

    .prologue
    const-wide/16 v6, 0xfa

    .line 76
    new-instance v0, Landroid/content/ComponentName;

    iget-object v3, p0, Lorg/ligi/axt/extensions/ActivityAXT;->activity:Landroid/app/Activity;

    iget-object v4, p0, Lorg/ligi/axt/extensions/ActivityAXT;->activity:Landroid/app/Activity;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-direct {v0, v3, v4}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 77
    .local v0, "component":Landroid/content/ComponentName;
    iget-object v3, p0, Lorg/ligi/axt/extensions/ActivityAXT;->activity:Landroid/app/Activity;

    invoke-virtual {v3}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    const/4 v4, 0x2

    const/4 v5, 0x1

    invoke-virtual {v3, v0, v4, v5}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V

    .line 80
    :try_start_1a
    iget-object v3, p0, Lorg/ligi/axt/extensions/ActivityAXT;->activity:Landroid/app/Activity;

    invoke-virtual {v3}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    .line 81
    .local v2, "intent":Landroid/content/Intent;
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 82
    iget-object v3, p0, Lorg/ligi/axt/extensions/ActivityAXT;->activity:Landroid/app/Activity;

    invoke-virtual {v3, v2}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_29
    .catch Ljava/lang/Exception; {:try_start_1a .. :try_end_29} :catch_37
    .catchall {:try_start_1a .. :try_end_29} :catchall_49

    .line 87
    new-instance v3, Landroid/os/Handler;

    invoke-direct {v3}, Landroid/os/Handler;-><init>()V

    new-instance v4, Lorg/ligi/axt/extensions/ActivityAXT$1;

    invoke-direct {v4, p0, v0}, Lorg/ligi/axt/extensions/ActivityAXT$1;-><init>(Lorg/ligi/axt/extensions/ActivityAXT;Landroid/content/ComponentName;)V

    invoke-virtual {v3, v4, v6, v7}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 97
    .end local v2    # "intent":Landroid/content/Intent;
    :goto_36
    return-void

    .line 83
    :catch_37
    move-exception v1

    .line 84
    .local v1, "e":Ljava/lang/Exception;
    :try_start_38
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_3b
    .catchall {:try_start_38 .. :try_end_3b} :catchall_49

    .line 87
    new-instance v3, Landroid/os/Handler;

    invoke-direct {v3}, Landroid/os/Handler;-><init>()V

    new-instance v4, Lorg/ligi/axt/extensions/ActivityAXT$1;

    invoke-direct {v4, p0, v0}, Lorg/ligi/axt/extensions/ActivityAXT$1;-><init>(Lorg/ligi/axt/extensions/ActivityAXT;Landroid/content/ComponentName;)V

    invoke-virtual {v3, v4, v6, v7}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_36

    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_49
    move-exception v3

    new-instance v4, Landroid/os/Handler;

    invoke-direct {v4}, Landroid/os/Handler;-><init>()V

    new-instance v5, Lorg/ligi/axt/extensions/ActivityAXT$1;

    invoke-direct {v5, p0, v0}, Lorg/ligi/axt/extensions/ActivityAXT$1;-><init>(Lorg/ligi/axt/extensions/ActivityAXT;Landroid/content/ComponentName;)V

    invoke-virtual {v4, v5, v6, v7}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    throw v3
.end method
