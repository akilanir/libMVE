.class final Lorg/mozilla/javascript/NativeArray$1;
.super Ljava/lang/Object;
.source "NativeArray.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/mozilla/javascript/NativeArray;->js_sort(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$cmpBuf:[Ljava/lang/Object;

.field final synthetic val$cx:Lorg/mozilla/javascript/Context;

.field final synthetic val$funThis:Lorg/mozilla/javascript/Scriptable;

.field final synthetic val$jsCompareFunction:Lorg/mozilla/javascript/Callable;

.field final synthetic val$scope:Lorg/mozilla/javascript/Scriptable;


# direct methods
.method constructor <init>([Ljava/lang/Object;Lorg/mozilla/javascript/Callable;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;)V
    .registers 6

    .prologue
    .line 996
    iput-object p1, p0, Lorg/mozilla/javascript/NativeArray$1;->val$cmpBuf:[Ljava/lang/Object;

    iput-object p2, p0, Lorg/mozilla/javascript/NativeArray$1;->val$jsCompareFunction:Lorg/mozilla/javascript/Callable;

    iput-object p3, p0, Lorg/mozilla/javascript/NativeArray$1;->val$cx:Lorg/mozilla/javascript/Context;

    iput-object p4, p0, Lorg/mozilla/javascript/NativeArray$1;->val$scope:Lorg/mozilla/javascript/Scriptable;

    iput-object p5, p0, Lorg/mozilla/javascript/NativeArray$1;->val$funThis:Lorg/mozilla/javascript/Scriptable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 16
    .param p1, "x"    # Ljava/lang/Object;
    .param p2, "y"    # Ljava/lang/Object;

    .prologue
    const-wide/16 v11, 0x0

    const/4 v5, -0x1

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 999
    sget-object v6, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne p1, v6, :cond_10

    .line 1000
    sget-object v5, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne p2, v5, :cond_e

    .line 1019
    :cond_d
    :goto_d
    return v3

    :cond_e
    move v3, v4

    .line 1000
    goto :goto_d

    .line 1001
    :cond_10
    sget-object v6, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne p2, v6, :cond_16

    move v3, v5

    .line 1002
    goto :goto_d

    .line 1003
    :cond_16
    sget-object v6, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne p1, v6, :cond_20

    .line 1004
    sget-object v5, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-eq p2, v5, :cond_d

    move v3, v4

    goto :goto_d

    .line 1005
    :cond_20
    sget-object v6, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne p2, v6, :cond_26

    move v3, v5

    .line 1006
    goto :goto_d

    .line 1009
    :cond_26
    iget-object v6, p0, Lorg/mozilla/javascript/NativeArray$1;->val$cmpBuf:[Ljava/lang/Object;

    aput-object p1, v6, v3

    .line 1010
    iget-object v6, p0, Lorg/mozilla/javascript/NativeArray$1;->val$cmpBuf:[Ljava/lang/Object;

    aput-object p2, v6, v4

    .line 1011
    iget-object v6, p0, Lorg/mozilla/javascript/NativeArray$1;->val$jsCompareFunction:Lorg/mozilla/javascript/Callable;

    iget-object v7, p0, Lorg/mozilla/javascript/NativeArray$1;->val$cx:Lorg/mozilla/javascript/Context;

    iget-object v8, p0, Lorg/mozilla/javascript/NativeArray$1;->val$scope:Lorg/mozilla/javascript/Scriptable;

    iget-object v9, p0, Lorg/mozilla/javascript/NativeArray$1;->val$funThis:Lorg/mozilla/javascript/Scriptable;

    iget-object v10, p0, Lorg/mozilla/javascript/NativeArray$1;->val$cmpBuf:[Ljava/lang/Object;

    invoke-interface {v6, v7, v8, v9, v10}, Lorg/mozilla/javascript/Callable;->call(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 1013
    .local v2, "ret":Ljava/lang/Object;
    invoke-static {v2}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v0

    .line 1014
    .local v0, "d":D
    cmpg-double v6, v0, v11

    if-gez v6, :cond_46

    move v3, v5

    .line 1015
    goto :goto_d

    .line 1016
    :cond_46
    cmpl-double v5, v0, v11

    if-lez v5, :cond_d

    move v3, v4

    .line 1017
    goto :goto_d
.end method
