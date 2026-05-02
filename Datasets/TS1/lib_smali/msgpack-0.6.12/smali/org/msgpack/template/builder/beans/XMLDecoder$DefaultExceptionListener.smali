.class Lorg/msgpack/template/builder/beans/XMLDecoder$DefaultExceptionListener;
.super Ljava/lang/Object;
.source "XMLDecoder.java"

# interfaces
.implements Lorg/msgpack/template/builder/beans/ExceptionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/msgpack/template/builder/beans/XMLDecoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DefaultExceptionListener"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/msgpack/template/builder/beans/XMLDecoder$1;)V
    .registers 2
    .param p1, "x0"    # Lorg/msgpack/template/builder/beans/XMLDecoder$1;

    .prologue
    .line 49
    invoke-direct {p0}, Lorg/msgpack/template/builder/beans/XMLDecoder$DefaultExceptionListener;-><init>()V

    return-void
.end method


# virtual methods
.method public exceptionThrown(Ljava/lang/Exception;)V
    .registers 4
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 52
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 53
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v1, "Continue..."

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 54
    return-void
.end method
