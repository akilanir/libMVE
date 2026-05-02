.class public Lorg/junit/rules/TestName;
.super Lorg/junit/rules/TestWatcher;
.source "TestName.java"


# instance fields
.field private name:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 27
    invoke-direct {p0}, Lorg/junit/rules/TestWatcher;-><init>()V

    return-void
.end method


# virtual methods
.method public getMethodName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 39
    iget-object v0, p0, Lorg/junit/rules/TestName;->name:Ljava/lang/String;

    return-object v0
.end method

.method protected starting(Lorg/junit/runner/Description;)V
    .registers 3
    .param p1, "d"    # Lorg/junit/runner/Description;

    .prologue
    .line 32
    invoke-virtual {p1}, Lorg/junit/runner/Description;->getMethodName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/junit/rules/TestName;->name:Ljava/lang/String;

    .line 33
    return-void
.end method
