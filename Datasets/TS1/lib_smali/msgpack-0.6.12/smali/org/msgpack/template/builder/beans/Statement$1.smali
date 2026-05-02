.class Lorg/msgpack/template/builder/beans/Statement$1;
.super Ljava/lang/Object;
.source "Statement.java"

# interfaces
.implements Ljava/security/PrivilegedAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/msgpack/template/builder/beans/Statement;->invokeMethod()Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/security/PrivilegedAction",
        "<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/msgpack/template/builder/beans/Statement;

.field final synthetic val$iterator:Ljava/util/Iterator;

.field final synthetic val$method:Ljava/lang/reflect/Method;


# direct methods
.method constructor <init>(Lorg/msgpack/template/builder/beans/Statement;Ljava/lang/reflect/Method;Ljava/util/Iterator;)V
    .registers 4

    .prologue
    .line 198
    iput-object p1, p0, Lorg/msgpack/template/builder/beans/Statement$1;->this$0:Lorg/msgpack/template/builder/beans/Statement;

    iput-object p2, p0, Lorg/msgpack/template/builder/beans/Statement$1;->val$method:Ljava/lang/reflect/Method;

    iput-object p3, p0, Lorg/msgpack/template/builder/beans/Statement$1;->val$iterator:Ljava/util/Iterator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()Ljava/lang/Object;
    .registers 4

    .prologue
    .line 201
    :try_start_0
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/Statement$1;->val$method:Ljava/lang/reflect/Method;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 202
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/Statement$1;->val$method:Ljava/lang/reflect/Method;

    iget-object v1, p0, Lorg/msgpack/template/builder/beans/Statement$1;->val$iterator:Ljava/util/Iterator;

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_10} :catch_12

    move-result-object v0

    .line 206
    :goto_11
    return-object v0

    .line 203
    :catch_12
    move-exception v0

    .line 206
    const/4 v0, 0x0

    goto :goto_11
.end method
