.class public Lorg/ligi/axt/adapters/PeriodicallyInvalidateAdapter;
.super Ljava/lang/Object;
.source "PeriodicallyInvalidateAdapter.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/ligi/axt/adapters/PeriodicallyInvalidateAdapter$Invalidator;
    }
.end annotation


# instance fields
.field private final ctx:Landroid/app/Activity;

.field private final myInvalidator:Lorg/ligi/axt/adapters/PeriodicallyInvalidateAdapter$Invalidator;

.field private running:Z


# direct methods
.method public constructor <init>(Landroid/app/ListActivity;Landroid/widget/BaseAdapter;)V
    .registers 4
    .param p1, "ctx"    # Landroid/app/ListActivity;
    .param p2, "adapter"    # Landroid/widget/BaseAdapter;

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/ligi/axt/adapters/PeriodicallyInvalidateAdapter;->running:Z

    .line 35
    iput-object p1, p0, Lorg/ligi/axt/adapters/PeriodicallyInvalidateAdapter;->ctx:Landroid/app/Activity;

    .line 36
    new-instance v0, Lorg/ligi/axt/adapters/PeriodicallyInvalidateAdapter$Invalidator;

    invoke-direct {v0, p0, p2}, Lorg/ligi/axt/adapters/PeriodicallyInvalidateAdapter$Invalidator;-><init>(Lorg/ligi/axt/adapters/PeriodicallyInvalidateAdapter;Landroid/widget/BaseAdapter;)V

    iput-object v0, p0, Lorg/ligi/axt/adapters/PeriodicallyInvalidateAdapter;->myInvalidator:Lorg/ligi/axt/adapters/PeriodicallyInvalidateAdapter$Invalidator;

    .line 37
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 38
    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 55
    :goto_0
    iget-boolean v0, p0, Lorg/ligi/axt/adapters/PeriodicallyInvalidateAdapter;->running:Z

    if-eqz v0, :cond_13

    .line 56
    :try_start_4
    iget-object v0, p0, Lorg/ligi/axt/adapters/PeriodicallyInvalidateAdapter;->ctx:Landroid/app/Activity;

    iget-object v1, p0, Lorg/ligi/axt/adapters/PeriodicallyInvalidateAdapter;->myInvalidator:Lorg/ligi/axt/adapters/PeriodicallyInvalidateAdapter$Invalidator;

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 57
    const-wide/16 v0, 0xc8

    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_10} :catch_11

    goto :goto_0

    .line 58
    :catch_11
    move-exception v0

    goto :goto_0

    .line 60
    :cond_13
    return-void
.end method
