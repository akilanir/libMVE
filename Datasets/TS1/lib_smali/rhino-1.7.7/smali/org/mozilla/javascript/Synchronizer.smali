.class public Lorg/mozilla/javascript/Synchronizer;
.super Lorg/mozilla/javascript/Delegator;
.source "Synchronizer.java"


# instance fields
.field private syncObject:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lorg/mozilla/javascript/Scriptable;)V
    .registers 2
    .param p1, "obj"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 39
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/Delegator;-><init>(Lorg/mozilla/javascript/Scriptable;)V

    .line 40
    return-void
.end method

.method public constructor <init>(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V
    .registers 3
    .param p1, "obj"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "syncObject"    # Ljava/lang/Object;

    .prologue
    .line 50
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/Delegator;-><init>(Lorg/mozilla/javascript/Scriptable;)V

    .line 51
    iput-object p2, p0, Lorg/mozilla/javascript/Synchronizer;->syncObject:Ljava/lang/Object;

    .line 52
    return-void
.end method


# virtual methods
.method public call(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "args"    # [Ljava/lang/Object;

    .prologue
    .line 61
    iget-object v1, p0, Lorg/mozilla/javascript/Synchronizer;->syncObject:Ljava/lang/Object;

    if-eqz v1, :cond_1b

    iget-object v0, p0, Lorg/mozilla/javascript/Synchronizer;->syncObject:Ljava/lang/Object;

    .line 62
    .local v0, "sync":Ljava/lang/Object;
    :goto_6
    instance-of v1, v0, Lorg/mozilla/javascript/Wrapper;

    if-eqz v1, :cond_10

    check-cast v0, Lorg/mozilla/javascript/Wrapper;

    .end local v0    # "sync":Ljava/lang/Object;
    invoke-interface {v0}, Lorg/mozilla/javascript/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object v0

    :cond_10
    monitor-enter v0

    .line 63
    :try_start_11
    iget-object v1, p0, Lorg/mozilla/javascript/Synchronizer;->obj:Lorg/mozilla/javascript/Scriptable;

    check-cast v1, Lorg/mozilla/javascript/Function;

    invoke-interface {v1, p1, p2, p3, p4}, Lorg/mozilla/javascript/Function;->call(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    monitor-exit v0

    return-object v1

    :cond_1b
    move-object v0, p3

    .line 61
    goto :goto_6

    .line 64
    :catchall_1d
    move-exception v1

    monitor-exit v0
    :try_end_1f
    .catchall {:try_start_11 .. :try_end_1f} :catchall_1d

    throw v1
.end method
