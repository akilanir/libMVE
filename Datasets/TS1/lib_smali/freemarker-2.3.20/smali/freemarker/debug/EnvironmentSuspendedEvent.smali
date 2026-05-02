.class public Lfreemarker/debug/EnvironmentSuspendedEvent;
.super Ljava/util/EventObject;
.source "EnvironmentSuspendedEvent.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final env:Lfreemarker/debug/DebuggedEnvironment;

.field private final line:I

.field private final name:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Ljava/lang/String;ILfreemarker/debug/DebuggedEnvironment;)V
    .registers 5
    .param p1, "source"    # Ljava/lang/Object;
    .param p2, "templateName"    # Ljava/lang/String;
    .param p3, "line"    # I
    .param p4, "env"    # Lfreemarker/debug/DebuggedEnvironment;

    .prologue
    .line 20
    invoke-direct {p0, p1}, Ljava/util/EventObject;-><init>(Ljava/lang/Object;)V

    .line 21
    iput-object p2, p0, Lfreemarker/debug/EnvironmentSuspendedEvent;->name:Ljava/lang/String;

    .line 22
    iput p3, p0, Lfreemarker/debug/EnvironmentSuspendedEvent;->line:I

    .line 23
    iput-object p4, p0, Lfreemarker/debug/EnvironmentSuspendedEvent;->env:Lfreemarker/debug/DebuggedEnvironment;

    .line 24
    return-void
.end method


# virtual methods
.method public getEnvironment()Lfreemarker/debug/DebuggedEnvironment;
    .registers 2

    .prologue
    .line 52
    iget-object v0, p0, Lfreemarker/debug/EnvironmentSuspendedEvent;->env:Lfreemarker/debug/DebuggedEnvironment;

    return-object v0
.end method

.method public getLine()I
    .registers 2

    .prologue
    .line 43
    iget v0, p0, Lfreemarker/debug/EnvironmentSuspendedEvent;->line:I

    return v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 33
    iget-object v0, p0, Lfreemarker/debug/EnvironmentSuspendedEvent;->name:Ljava/lang/String;

    return-object v0
.end method
