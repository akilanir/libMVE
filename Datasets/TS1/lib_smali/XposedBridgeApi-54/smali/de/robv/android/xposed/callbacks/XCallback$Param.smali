.class public Lde/robv/android/xposed/callbacks/XCallback$Param;
.super Ljava/lang/Object;
.source "XCallback.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/robv/android/xposed/callbacks/XCallback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Param"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lde/robv/android/xposed/callbacks/XCallback$Param$SerializeWrapper;
    }
.end annotation


# instance fields
.field public final callbacks:[Ljava/lang/Object;

.field private extra:Landroid/os/Bundle;


# direct methods
.method protected constructor <init>()V
    .registers 2

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    const/4 v0, 0x0

    iput-object v0, p0, Lde/robv/android/xposed/callbacks/XCallback$Param;->callbacks:[Ljava/lang/Object;

    .line 24
    return-void
.end method

.method protected constructor <init>(Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet",
            "<+",
            "Lde/robv/android/xposed/callbacks/XCallback;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 26
    .local p1, "callbacks":Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;, "Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet<+Lde/robv/android/xposed/callbacks/XCallback;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    invoke-virtual {p1}, Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;->getSnapshot()[Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lde/robv/android/xposed/callbacks/XCallback$Param;->callbacks:[Ljava/lang/Object;

    .line 28
    return-void
.end method


# virtual methods
.method public declared-synchronized getExtra()Landroid/os/Bundle;
    .registers 2

    .prologue
    .line 37
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lde/robv/android/xposed/callbacks/XCallback$Param;->extra:Landroid/os/Bundle;

    if-nez v0, :cond_c

    .line 38
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iput-object v0, p0, Lde/robv/android/xposed/callbacks/XCallback$Param;->extra:Landroid/os/Bundle;

    .line 39
    :cond_c
    iget-object v0, p0, Lde/robv/android/xposed/callbacks/XCallback$Param;->extra:Landroid/os/Bundle;
    :try_end_e
    .catchall {:try_start_1 .. :try_end_e} :catchall_10

    monitor-exit p0

    return-object v0

    .line 37
    :catchall_10
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getObjectExtra(Ljava/lang/String;)Ljava/lang/Object;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 44
    invoke-virtual {p0}, Lde/robv/android/xposed/callbacks/XCallback$Param;->getExtra()Landroid/os/Bundle;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    .line 45
    .local v0, "o":Ljava/io/Serializable;
    instance-of v1, v0, Lde/robv/android/xposed/callbacks/XCallback$Param$SerializeWrapper;

    if-eqz v1, :cond_13

    .line 46
    check-cast v0, Lde/robv/android/xposed/callbacks/XCallback$Param$SerializeWrapper;

    .end local v0    # "o":Ljava/io/Serializable;
    # getter for: Lde/robv/android/xposed/callbacks/XCallback$Param$SerializeWrapper;->object:Ljava/lang/Object;
    invoke-static {v0}, Lde/robv/android/xposed/callbacks/XCallback$Param$SerializeWrapper;->access$0(Lde/robv/android/xposed/callbacks/XCallback$Param$SerializeWrapper;)Ljava/lang/Object;

    move-result-object v1

    .line 47
    :goto_12
    return-object v1

    .restart local v0    # "o":Ljava/io/Serializable;
    :cond_13
    const/4 v1, 0x0

    goto :goto_12
.end method

.method public setObjectExtra(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 5
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "o"    # Ljava/lang/Object;

    .prologue
    .line 52
    invoke-virtual {p0}, Lde/robv/android/xposed/callbacks/XCallback$Param;->getExtra()Landroid/os/Bundle;

    move-result-object v0

    new-instance v1, Lde/robv/android/xposed/callbacks/XCallback$Param$SerializeWrapper;

    invoke-direct {v1, p2}, Lde/robv/android/xposed/callbacks/XCallback$Param$SerializeWrapper;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, p1, v1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 53
    return-void
.end method
