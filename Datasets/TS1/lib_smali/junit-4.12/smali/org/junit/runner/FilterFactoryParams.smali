.class public final Lorg/junit/runner/FilterFactoryParams;
.super Ljava/lang/Object;
.source "FilterFactoryParams.java"


# instance fields
.field private final args:Ljava/lang/String;

.field private final topLevelDescription:Lorg/junit/runner/Description;


# direct methods
.method public constructor <init>(Lorg/junit/runner/Description;Ljava/lang/String;)V
    .registers 4
    .param p1, "topLevelDescription"    # Lorg/junit/runner/Description;
    .param p2, "args"    # Ljava/lang/String;

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    if-eqz p2, :cond_7

    if-nez p1, :cond_d

    .line 9
    :cond_7
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 12
    :cond_d
    iput-object p1, p0, Lorg/junit/runner/FilterFactoryParams;->topLevelDescription:Lorg/junit/runner/Description;

    .line 13
    iput-object p2, p0, Lorg/junit/runner/FilterFactoryParams;->args:Ljava/lang/String;

    .line 14
    return-void
.end method


# virtual methods
.method public getArgs()Ljava/lang/String;
    .registers 2

    .prologue
    .line 17
    iget-object v0, p0, Lorg/junit/runner/FilterFactoryParams;->args:Ljava/lang/String;

    return-object v0
.end method

.method public getTopLevelDescription()Lorg/junit/runner/Description;
    .registers 2

    .prologue
    .line 21
    iget-object v0, p0, Lorg/junit/runner/FilterFactoryParams;->topLevelDescription:Lorg/junit/runner/Description;

    return-object v0
.end method
