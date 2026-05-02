.class public Lorg/mozilla/javascript/RhinoSecurityManager;
.super Ljava/lang/SecurityManager;
.source "RhinoSecurityManager.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/SecurityManager;-><init>()V

    return-void
.end method


# virtual methods
.method protected getCurrentScriptClass()Ljava/lang/Class;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 23
    invoke-virtual {p0}, Lorg/mozilla/javascript/RhinoSecurityManager;->getClassContext()[Ljava/lang/Class;

    move-result-object v2

    .line 24
    .local v2, "context":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    move-object v0, v2

    .local v0, "arr$":[Ljava/lang/Class;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_7
    if-ge v3, v4, :cond_23

    aget-object v1, v0, v3

    .line 25
    .local v1, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v5, Lorg/mozilla/javascript/InterpretedFunction;

    if-eq v1, v5, :cond_17

    const-class v5, Lorg/mozilla/javascript/NativeFunction;

    invoke-virtual {v5, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v5

    if-nez v5, :cond_1f

    :cond_17
    const-class v5, Lorg/mozilla/javascript/PolicySecurityController$SecureCaller;

    invoke-virtual {v5, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v5

    if-eqz v5, :cond_20

    .line 30
    .end local v1    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_1f
    :goto_1f
    return-object v1

    .line 24
    .restart local v1    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_20
    add-int/lit8 v3, v3, 0x1

    goto :goto_7

    .line 30
    .end local v1    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_23
    const/4 v1, 0x0

    goto :goto_1f
.end method
