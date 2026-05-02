.class final Lcom/octo/android/robospice/SpiceManager$MinPriorityThreadFactory;
.super Ljava/lang/Object;
.source "SpiceManager.java"

# interfaces
.implements Ljava/util/concurrent/ThreadFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/octo/android/robospice/SpiceManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "MinPriorityThreadFactory"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 1069
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/octo/android/robospice/SpiceManager$1;)V
    .registers 2
    .param p1, "x0"    # Lcom/octo/android/robospice/SpiceManager$1;

    .prologue
    .line 1069
    invoke-direct {p0}, Lcom/octo/android/robospice/SpiceManager$MinPriorityThreadFactory;-><init>()V

    return-void
.end method


# virtual methods
.method public newThread(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .registers 4
    .param p1, "arg0"    # Ljava/lang/Runnable;

    .prologue
    .line 1072
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 1073
    .local v0, "t":Ljava/lang/Thread;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setPriority(I)V

    .line 1074
    return-object v0
.end method
