.class public Lcom/octo/android/robospice/priority/CustomizablePriorityThreadFactory;
.super Ljava/lang/Object;
.source "CustomizablePriorityThreadFactory.java"

# interfaces
.implements Ljava/util/concurrent/ThreadFactory;


# instance fields
.field private threadPriority:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 24
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/octo/android/robospice/priority/CustomizablePriorityThreadFactory;-><init>(I)V

    .line 25
    return-void
.end method

.method public constructor <init>(I)V
    .registers 3
    .param p1, "threadPriority"    # I

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    const/4 v0, 0x1

    iput v0, p0, Lcom/octo/android/robospice/priority/CustomizablePriorityThreadFactory;->threadPriority:I

    .line 20
    iput p1, p0, Lcom/octo/android/robospice/priority/CustomizablePriorityThreadFactory;->threadPriority:I

    .line 21
    return-void
.end method


# virtual methods
.method public newThread(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .registers 4
    .param p1, "runnable"    # Ljava/lang/Runnable;

    .prologue
    .line 33
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 34
    .local v0, "thread":Ljava/lang/Thread;
    iget v1, p0, Lcom/octo/android/robospice/priority/CustomizablePriorityThreadFactory;->threadPriority:I

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setPriority(I)V

    .line 35
    return-object v0
.end method
