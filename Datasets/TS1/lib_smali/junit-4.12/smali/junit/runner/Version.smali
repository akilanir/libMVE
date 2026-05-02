.class public Ljunit/runner/Version;
.super Ljava/lang/Object;
.source "Version.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    return-void
.end method

.method public static id()Ljava/lang/String;
    .registers 1

    .prologue
    .line 12
    const-string v0, "4.12"

    return-object v0
.end method

.method public static main([Ljava/lang/String;)V
    .registers 3
    .param p0, "args"    # [Ljava/lang/String;

    .prologue
    .line 16
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {}, Ljunit/runner/Version;->id()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 17
    return-void
.end method
