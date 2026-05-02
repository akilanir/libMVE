.class abstract Lcom/facebook/stetho/inspector/elements/android/MethodInvoker$TypedMethodInvoker;
.super Ljava/lang/Object;
.source "MethodInvoker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/stetho/inspector/elements/android/MethodInvoker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40a
    name = "TypedMethodInvoker"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final mArgType:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/lang/Class;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 53
    .local p0, "this":Lcom/facebook/stetho/inspector/elements/android/MethodInvoker$TypedMethodInvoker;, "Lcom/facebook/stetho/inspector/elements/android/MethodInvoker$TypedMethodInvoker<TT;>;"
    .local p1, "argType":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    iput-object p1, p0, Lcom/facebook/stetho/inspector/elements/android/MethodInvoker$TypedMethodInvoker;->mArgType:Ljava/lang/Class;

    .line 55
    return-void
.end method


# virtual methods
.method abstract convertArgument(Ljava/lang/String;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation
.end method

.method invoke(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)Z
    .registers 12
    .param p1, "receiver"    # Ljava/lang/Object;
    .param p2, "methodName"    # Ljava/lang/String;
    .param p3, "argument"    # Ljava/lang/String;

    .prologue
    .local p0, "this":Lcom/facebook/stetho/inspector/elements/android/MethodInvoker$TypedMethodInvoker;, "Lcom/facebook/stetho/inspector/elements/android/MethodInvoker$TypedMethodInvoker<TT;>;"
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 59
    :try_start_2
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    iget-object v7, p0, Lcom/facebook/stetho/inspector/elements/android/MethodInvoker$TypedMethodInvoker;->mArgType:Ljava/lang/Class;

    aput-object v7, v5, v6

    invoke-virtual {v4, p2, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 60
    .local v1, "method":Ljava/lang/reflect/Method;
    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-virtual {p0, p3}, Lcom/facebook/stetho/inspector/elements/android/MethodInvoker$TypedMethodInvoker;->convertArgument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v1, p1, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1f
    .catch Ljava/lang/NoSuchMethodException; {:try_start_2 .. :try_end_1f} :catch_75
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_2 .. :try_end_1f} :catch_20
    .catch Ljava/lang/IllegalAccessException; {:try_start_2 .. :try_end_1f} :catch_3d
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_1f} :catch_59

    .line 71
    .end local v1    # "method":Ljava/lang/reflect/Method;
    :goto_1f
    return v2

    .line 64
    :catch_20
    move-exception v0

    .line 65
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "InvocationTargetException: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/facebook/stetho/common/LogUtil;->w(Ljava/lang/String;)V

    .end local v0    # "e":Ljava/lang/reflect/InvocationTargetException;
    :goto_3b
    move v2, v3

    .line 71
    goto :goto_1f

    .line 66
    :catch_3d
    move-exception v0

    .line 67
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "IllegalAccessException: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/facebook/stetho/common/LogUtil;->w(Ljava/lang/String;)V

    goto :goto_3b

    .line 68
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_59
    move-exception v0

    .line 69
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "IllegalArgumentException: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/facebook/stetho/common/LogUtil;->w(Ljava/lang/String;)V

    goto :goto_3b

    .line 62
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :catch_75
    move-exception v2

    goto :goto_3b
.end method
