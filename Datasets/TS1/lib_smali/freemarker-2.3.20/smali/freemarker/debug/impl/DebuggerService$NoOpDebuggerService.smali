.class Lfreemarker/debug/impl/DebuggerService$NoOpDebuggerService;
.super Lfreemarker/debug/impl/DebuggerService;
.source "DebuggerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/debug/impl/DebuggerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "NoOpDebuggerService"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 116
    invoke-direct {p0}, Lfreemarker/debug/impl/DebuggerService;-><init>()V

    return-void
.end method

.method constructor <init>(Lfreemarker/debug/impl/DebuggerService$1;)V
    .registers 2
    .param p1, "x0"    # Lfreemarker/debug/impl/DebuggerService$1;

    .prologue
    .line 116
    invoke-direct {p0}, Lfreemarker/debug/impl/DebuggerService$NoOpDebuggerService;-><init>()V

    return-void
.end method


# virtual methods
.method getBreakpointsSpi(Ljava/lang/String;)Ljava/util/List;
    .registers 3
    .param p1, "templateName"    # Ljava/lang/String;

    .prologue
    .line 120
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    return-object v0
.end method

.method registerTemplateSpi(Lfreemarker/template/Template;)V
    .registers 2
    .param p1, "template"    # Lfreemarker/template/Template;

    .prologue
    .line 130
    return-void
.end method

.method shutdownSpi()V
    .registers 1

    .prologue
    .line 134
    return-void
.end method

.method suspendEnvironmentSpi(Lfreemarker/core/Environment;Ljava/lang/String;I)Z
    .registers 5
    .param p1, "env"    # Lfreemarker/core/Environment;
    .param p2, "templateName"    # Ljava/lang/String;
    .param p3, "line"    # I

    .prologue
    .line 125
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
