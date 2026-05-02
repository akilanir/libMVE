.class public Ljavassist/bytecode/annotation/NoSuchClassError;
.super Ljava/lang/Error;
.source "NoSuchClassError.java"


# instance fields
.field private className:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/Error;)V
    .registers 4
    .param p1, "className"    # Ljava/lang/String;
    .param p2, "cause"    # Ljava/lang/Error;

    .prologue
    .line 30
    invoke-virtual {p2}, Ljava/lang/Error;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Ljava/lang/Error;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 31
    iput-object p1, p0, Ljavassist/bytecode/annotation/NoSuchClassError;->className:Ljava/lang/String;

    .line 32
    return-void
.end method


# virtual methods
.method public getClassName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 38
    iget-object v0, p0, Ljavassist/bytecode/annotation/NoSuchClassError;->className:Ljava/lang/String;

    return-object v0
.end method
