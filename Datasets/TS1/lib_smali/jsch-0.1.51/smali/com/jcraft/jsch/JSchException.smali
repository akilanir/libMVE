.class public Lcom/jcraft/jsch/JSchException;
.super Ljava/lang/Exception;
.source "JSchException.java"


# instance fields
.field private cause:Ljava/lang/Throwable;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    .line 34
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/jcraft/jsch/JSchException;->cause:Ljava/lang/Throwable;

    .line 37
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 39
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 34
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/jcraft/jsch/JSchException;->cause:Ljava/lang/Throwable;

    .line 40
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 4
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 42
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 34
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/jcraft/jsch/JSchException;->cause:Ljava/lang/Throwable;

    .line 43
    iput-object p2, p0, Lcom/jcraft/jsch/JSchException;->cause:Ljava/lang/Throwable;

    .line 44
    return-void
.end method


# virtual methods
.method public getCause()Ljava/lang/Throwable;
    .registers 2

    .prologue
    .line 46
    iget-object v0, p0, Lcom/jcraft/jsch/JSchException;->cause:Ljava/lang/Throwable;

    return-object v0
.end method
