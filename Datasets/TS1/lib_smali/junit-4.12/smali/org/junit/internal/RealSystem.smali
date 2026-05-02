.class public Lorg/junit/internal/RealSystem;
.super Ljava/lang/Object;
.source "RealSystem.java"

# interfaces
.implements Lorg/junit/internal/JUnitSystem;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public exit(I)V
    .registers 2
    .param p1, "code"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 12
    invoke-static {p1}, Ljava/lang/System;->exit(I)V

    .line 13
    return-void
.end method

.method public out()Ljava/io/PrintStream;
    .registers 2

    .prologue
    .line 16
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    return-object v0
.end method
