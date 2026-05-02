.class public Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;
.super Ljava/lang/Object;
.source "XposedBridge.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/robv/android/xposed/XposedBridge;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CopyOnWriteSortedSet"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private volatile transient elements:[Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 794
    .local p0, "this":Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;, "Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet<TE;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 795
    # getter for: Lde/robv/android/xposed/XposedBridge;->EMPTY_ARRAY:[Ljava/lang/Object;
    invoke-static {}, Lde/robv/android/xposed/XposedBridge;->access$0()[Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;->elements:[Ljava/lang/Object;

    .line 794
    return-void
.end method

.method private indexOf(Ljava/lang/Object;)I
    .registers 4
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 823
    .local p0, "this":Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;, "Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet<TE;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v1, p0, Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;->elements:[Ljava/lang/Object;

    array-length v1, v1

    if-lt v0, v1, :cond_8

    .line 827
    const/4 v0, -0x1

    .end local v0    # "i":I
    :cond_7
    return v0

    .line 824
    .restart local v0    # "i":I
    :cond_8
    iget-object v1, p0, Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;->elements:[Ljava/lang/Object;

    aget-object v1, v1, v0

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7

    .line 823
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method


# virtual methods
.method public declared-synchronized add(Ljava/lang/Object;)Z
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;, "Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet<TE;>;"
    .local p1, "e":Ljava/lang/Object;, "TE;"
    const/4 v2, 0x0

    .line 798
    monitor-enter p0

    :try_start_2
    invoke-direct {p0, p1}, Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;->indexOf(Ljava/lang/Object;)I
    :try_end_5
    .catchall {:try_start_2 .. :try_end_5} :catchall_27

    move-result v0

    .line 799
    .local v0, "index":I
    if-ltz v0, :cond_a

    .line 807
    :goto_8
    monitor-exit p0

    return v2

    .line 802
    :cond_a
    :try_start_a
    iget-object v2, p0, Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;->elements:[Ljava/lang/Object;

    array-length v2, v2

    add-int/lit8 v2, v2, 0x1

    new-array v1, v2, [Ljava/lang/Object;

    .line 803
    .local v1, "newElements":[Ljava/lang/Object;
    iget-object v2, p0, Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;->elements:[Ljava/lang/Object;

    const/4 v3, 0x0

    const/4 v4, 0x0

    iget-object v5, p0, Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;->elements:[Ljava/lang/Object;

    array-length v5, v5

    invoke-static {v2, v3, v1, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 804
    iget-object v2, p0, Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;->elements:[Ljava/lang/Object;

    array-length v2, v2

    aput-object p1, v1, v2

    .line 805
    invoke-static {v1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    .line 806
    iput-object v1, p0, Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;->elements:[Ljava/lang/Object;
    :try_end_25
    .catchall {:try_start_a .. :try_end_25} :catchall_27

    .line 807
    const/4 v2, 0x1

    goto :goto_8

    .line 798
    .end local v0    # "index":I
    .end local v1    # "newElements":[Ljava/lang/Object;
    :catchall_27
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public getSnapshot()[Ljava/lang/Object;
    .registers 2

    .prologue
    .line 831
    .local p0, "this":Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;, "Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet<TE;>;"
    iget-object v0, p0, Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;->elements:[Ljava/lang/Object;

    return-object v0
.end method

.method public declared-synchronized remove(Ljava/lang/Object;)Z
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;, "Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet<TE;>;"
    .local p1, "e":Ljava/lang/Object;, "TE;"
    const/4 v2, 0x0

    .line 811
    monitor-enter p0

    :try_start_2
    invoke-direct {p0, p1}, Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;->indexOf(Ljava/lang/Object;)I
    :try_end_5
    .catchall {:try_start_2 .. :try_end_5} :catchall_2a

    move-result v0

    .line 812
    .local v0, "index":I
    const/4 v3, -0x1

    if-ne v0, v3, :cond_b

    .line 819
    :goto_9
    monitor-exit p0

    return v2

    .line 815
    :cond_b
    :try_start_b
    iget-object v2, p0, Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;->elements:[Ljava/lang/Object;

    array-length v2, v2

    add-int/lit8 v2, v2, -0x1

    new-array v1, v2, [Ljava/lang/Object;

    .line 816
    .local v1, "newElements":[Ljava/lang/Object;
    iget-object v2, p0, Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;->elements:[Ljava/lang/Object;

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static {v2, v3, v1, v4, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 817
    iget-object v2, p0, Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;->elements:[Ljava/lang/Object;

    add-int/lit8 v3, v0, 0x1

    iget-object v4, p0, Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;->elements:[Ljava/lang/Object;

    array-length v4, v4

    sub-int/2addr v4, v0

    add-int/lit8 v4, v4, -0x1

    invoke-static {v2, v3, v1, v0, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 818
    iput-object v1, p0, Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;->elements:[Ljava/lang/Object;
    :try_end_28
    .catchall {:try_start_b .. :try_end_28} :catchall_2a

    .line 819
    const/4 v2, 0x1

    goto :goto_9

    .line 811
    .end local v0    # "index":I
    .end local v1    # "newElements":[Ljava/lang/Object;
    :catchall_2a
    move-exception v2

    monitor-exit p0

    throw v2
.end method
