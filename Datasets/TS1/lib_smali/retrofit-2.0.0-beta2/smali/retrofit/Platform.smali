.class Lretrofit/Platform;
.super Ljava/lang/Object;
.source "Platform.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lretrofit/Platform$Android;,
        Lretrofit/Platform$Java8;
    }
.end annotation


# static fields
.field private static final PLATFORM:Lretrofit/Platform;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 27
    invoke-static {}, Lretrofit/Platform;->findPlatform()Lretrofit/Platform;

    move-result-object v0

    sput-object v0, Lretrofit/Platform;->PLATFORM:Lretrofit/Platform;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    return-void
.end method

.method private static findPlatform()Lretrofit/Platform;
    .registers 1

    .prologue
    .line 35
    :try_start_0
    const-string v0, "android.os.Build"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 36
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-eqz v0, :cond_10

    .line 37
    new-instance v0, Lretrofit/Platform$Android;

    invoke-direct {v0}, Lretrofit/Platform$Android;-><init>()V
    :try_end_e
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_e} :catch_f

    .line 46
    :goto_e
    return-object v0

    .line 39
    :catch_f
    move-exception v0

    .line 42
    :cond_10
    :try_start_10
    const-string v0, "java.util.Optional"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 43
    new-instance v0, Lretrofit/Platform$Java8;

    invoke-direct {v0}, Lretrofit/Platform$Java8;-><init>()V
    :try_end_1a
    .catch Ljava/lang/ClassNotFoundException; {:try_start_10 .. :try_end_1a} :catch_1b

    goto :goto_e

    .line 44
    :catch_1b
    move-exception v0

    .line 46
    new-instance v0, Lretrofit/Platform;

    invoke-direct {v0}, Lretrofit/Platform;-><init>()V

    goto :goto_e
.end method

.method static get()Lretrofit/Platform;
    .registers 1

    .prologue
    .line 30
    sget-object v0, Lretrofit/Platform;->PLATFORM:Lretrofit/Platform;

    return-object v0
.end method


# virtual methods
.method defaultCallAdapterFactory(Ljava/util/concurrent/Executor;)Lretrofit/CallAdapter$Factory;
    .registers 3
    .param p1, "callbackExecutor"    # Ljava/util/concurrent/Executor;

    .prologue
    .line 50
    if-eqz p1, :cond_8

    .line 51
    new-instance v0, Lretrofit/ExecutorCallAdapterFactory;

    invoke-direct {v0, p1}, Lretrofit/ExecutorCallAdapterFactory;-><init>(Ljava/util/concurrent/Executor;)V

    .line 53
    :goto_7
    return-object v0

    :cond_8
    sget-object v0, Lretrofit/DefaultCallAdapter;->FACTORY:Lretrofit/CallAdapter$Factory;

    goto :goto_7
.end method

.method varargs invokeDefaultMethod(Ljava/lang/reflect/Method;Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p1, "method"    # Ljava/lang/reflect/Method;
    .param p3, "object"    # Ljava/lang/Object;
    .param p4, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Method;",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Object;",
            "[",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 62
    .local p2, "declaringClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method isDefaultMethod(Ljava/lang/reflect/Method;)Z
    .registers 3
    .param p1, "method"    # Ljava/lang/reflect/Method;

    .prologue
    .line 57
    const/4 v0, 0x0

    return v0
.end method
