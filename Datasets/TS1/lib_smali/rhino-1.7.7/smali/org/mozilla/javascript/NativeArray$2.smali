.class final Lorg/mozilla/javascript/NativeArray$2;
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


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 1023
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 9
    .param p1, "x"    # Ljava/lang/Object;
    .param p2, "y"    # Ljava/lang/Object;

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    const/4 v4, -0x1

    .line 1026
    sget-object v5, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne p1, v5, :cond_e

    .line 1027
    sget-object v4, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne p2, v4, :cond_c

    .line 1038
    :cond_b
    :goto_b
    return v2

    :cond_c
    move v2, v3

    .line 1027
    goto :goto_b

    .line 1028
    :cond_e
    sget-object v5, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne p2, v5, :cond_14

    move v2, v4

    .line 1029
    goto :goto_b

    .line 1030
    :cond_14
    sget-object v5, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne p1, v5, :cond_1e

    .line 1031
    sget-object v4, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-eq p2, v4, :cond_b

    move v2, v3

    goto :goto_b

    .line 1032
    :cond_1e
    sget-object v2, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne p2, v2, :cond_24

    move v2, v4

    .line 1033
    goto :goto_b

    .line 1036
    :cond_24
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 1037
    .local v0, "a":Ljava/lang/String;
    invoke-static {p2}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 1038
    .local v1, "b":Ljava/lang/String;
    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    goto :goto_b
.end method
