.class Lcom/jcraft/jsch/JSchAuthCancelException;
.super Lcom/jcraft/jsch/JSchException;
.source "JSchAuthCancelException.java"


# instance fields
.field method:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/jcraft/jsch/JSchException;-><init>()V

    .line 37
    return-void
.end method

.method constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 39
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    .line 40
    iput-object p1, p0, Lcom/jcraft/jsch/JSchAuthCancelException;->method:Ljava/lang/String;

    .line 41
    return-void
.end method


# virtual methods
.method public getMethod()Ljava/lang/String;
    .registers 2

    .prologue
    .line 43
    iget-object v0, p0, Lcom/jcraft/jsch/JSchAuthCancelException;->method:Ljava/lang/String;

    return-object v0
.end method
