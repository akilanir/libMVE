.class Lorg/mozilla/javascript/tools/shell/Main$IProxy;
.super Ljava/lang/Object;
.source "Main.java"

# interfaces
.implements Lorg/mozilla/javascript/ContextAction;
.implements Lorg/mozilla/javascript/tools/shell/QuitAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/mozilla/javascript/tools/shell/Main;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "IProxy"
.end annotation


# static fields
.field private static final EVAL_INLINE_SCRIPT:I = 0x2

.field private static final PROCESS_FILES:I = 0x1

.field private static final SYSTEM_EXIT:I = 0x3


# instance fields
.field args:[Ljava/lang/String;

.field scriptText:Ljava/lang/String;

.field private type:I


# direct methods
.method constructor <init>(I)V
    .registers 2
    .param p1, "type"    # I

    .prologue
    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 91
    iput p1, p0, Lorg/mozilla/javascript/tools/shell/Main$IProxy;->type:I

    .line 92
    return-void
.end method


# virtual methods
.method public quit(Lorg/mozilla/javascript/Context;I)V
    .registers 5
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "exitCode"    # I

    .prologue
    .line 111
    iget v0, p0, Lorg/mozilla/javascript/tools/shell/Main$IProxy;->type:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_9

    .line 112
    invoke-static {p2}, Ljava/lang/System;->exit(I)V

    .line 113
    return-void

    .line 115
    :cond_9
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method public run(Lorg/mozilla/javascript/Context;)Ljava/lang/Object;
    .registers 5
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    .line 96
    sget-boolean v0, Lorg/mozilla/javascript/tools/shell/Main;->useRequire:Z

    if-eqz v0, :cond_10

    .line 97
    sget-object v0, Lorg/mozilla/javascript/tools/shell/Main;->global:Lorg/mozilla/javascript/tools/shell/Global;

    sget-object v1, Lorg/mozilla/javascript/tools/shell/Main;->modulePath:Ljava/util/List;

    sget-boolean v2, Lorg/mozilla/javascript/tools/shell/Main;->sandboxed:Z

    invoke-virtual {v0, p1, v1, v2}, Lorg/mozilla/javascript/tools/shell/Global;->installRequire(Lorg/mozilla/javascript/Context;Ljava/util/List;Z)Lorg/mozilla/javascript/commonjs/module/Require;

    move-result-object v0

    sput-object v0, Lorg/mozilla/javascript/tools/shell/Main;->require:Lorg/mozilla/javascript/commonjs/module/Require;

    .line 99
    :cond_10
    iget v0, p0, Lorg/mozilla/javascript/tools/shell/Main$IProxy;->type:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1c

    .line 100
    iget-object v0, p0, Lorg/mozilla/javascript/tools/shell/Main$IProxy;->args:[Ljava/lang/String;

    invoke-static {p1, v0}, Lorg/mozilla/javascript/tools/shell/Main;->processFiles(Lorg/mozilla/javascript/Context;[Ljava/lang/String;)V

    .line 106
    :goto_1a
    const/4 v0, 0x0

    return-object v0

    .line 101
    :cond_1c
    iget v0, p0, Lorg/mozilla/javascript/tools/shell/Main$IProxy;->type:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_27

    .line 102
    iget-object v0, p0, Lorg/mozilla/javascript/tools/shell/Main$IProxy;->scriptText:Ljava/lang/String;

    invoke-static {p1, v0}, Lorg/mozilla/javascript/tools/shell/Main;->evalInlineScript(Lorg/mozilla/javascript/Context;Ljava/lang/String;)V

    goto :goto_1a

    .line 104
    :cond_27
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method
