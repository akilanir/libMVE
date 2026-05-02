.class public Lorg/mozilla/javascript/tools/shell/ShellLine;
.super Ljava/lang/Object;
.source "ShellLine.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getStream(Lorg/mozilla/javascript/Scriptable;)Ljava/io/InputStream;
    .registers 3
    .param p0, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 24
    invoke-static {}, Ljava/nio/charset/Charset;->defaultCharset()Ljava/nio/charset/Charset;

    move-result-object v1

    invoke-static {p0, v1}, Lorg/mozilla/javascript/tools/shell/ShellConsole;->getConsole(Lorg/mozilla/javascript/Scriptable;Ljava/nio/charset/Charset;)Lorg/mozilla/javascript/tools/shell/ShellConsole;

    move-result-object v0

    .line 26
    .local v0, "console":Lorg/mozilla/javascript/tools/shell/ShellConsole;
    if-eqz v0, :cond_f

    invoke-virtual {v0}, Lorg/mozilla/javascript/tools/shell/ShellConsole;->getIn()Ljava/io/InputStream;

    move-result-object v1

    :goto_e
    return-object v1

    :cond_f
    const/4 v1, 0x0

    goto :goto_e
.end method
