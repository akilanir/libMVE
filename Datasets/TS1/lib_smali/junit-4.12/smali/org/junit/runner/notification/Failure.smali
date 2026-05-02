.class public Lorg/junit/runner/notification/Failure;
.super Ljava/lang/Object;
.source "Failure.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final fDescription:Lorg/junit/runner/Description;

.field private final fThrownException:Ljava/lang/Throwable;


# direct methods
.method public constructor <init>(Lorg/junit/runner/Description;Ljava/lang/Throwable;)V
    .registers 3
    .param p1, "description"    # Lorg/junit/runner/Description;
    .param p2, "thrownException"    # Ljava/lang/Throwable;

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object p2, p0, Lorg/junit/runner/notification/Failure;->fThrownException:Ljava/lang/Throwable;

    .line 37
    iput-object p1, p0, Lorg/junit/runner/notification/Failure;->fDescription:Lorg/junit/runner/Description;

    .line 38
    return-void
.end method


# virtual methods
.method public getDescription()Lorg/junit/runner/Description;
    .registers 2

    .prologue
    .line 51
    iget-object v0, p0, Lorg/junit/runner/notification/Failure;->fDescription:Lorg/junit/runner/Description;

    return-object v0
.end method

.method public getException()Ljava/lang/Throwable;
    .registers 2

    .prologue
    .line 59
    iget-object v0, p0, Lorg/junit/runner/notification/Failure;->fThrownException:Ljava/lang/Throwable;

    return-object v0
.end method

.method public getMessage()Ljava/lang/String;
    .registers 2

    .prologue
    .line 85
    invoke-virtual {p0}, Lorg/junit/runner/notification/Failure;->getException()Ljava/lang/Throwable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTestHeader()Ljava/lang/String;
    .registers 2

    .prologue
    .line 44
    iget-object v0, p0, Lorg/junit/runner/notification/Failure;->fDescription:Lorg/junit/runner/Description;

    invoke-virtual {v0}, Lorg/junit/runner/Description;->getDisplayName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTrace()Ljava/lang/String;
    .registers 4

    .prologue
    .line 73
    new-instance v0, Ljava/io/StringWriter;

    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    .line 74
    .local v0, "stringWriter":Ljava/io/StringWriter;
    new-instance v1, Ljava/io/PrintWriter;

    invoke-direct {v1, v0}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 75
    .local v1, "writer":Ljava/io/PrintWriter;
    invoke-virtual {p0}, Lorg/junit/runner/notification/Failure;->getException()Ljava/lang/Throwable;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 76
    invoke-virtual {v0}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 64
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/junit/runner/notification/Failure;->getTestHeader()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/junit/runner/notification/Failure;->fThrownException:Ljava/lang/Throwable;

    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
