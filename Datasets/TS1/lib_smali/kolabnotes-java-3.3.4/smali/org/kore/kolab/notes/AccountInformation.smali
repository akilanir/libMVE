.class public final Lorg/kore/kolab/notes/AccountInformation;
.super Ljava/lang/Object;
.source "AccountInformation.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/kore/kolab/notes/AccountInformation$DefaultBuilder;,
        Lorg/kore/kolab/notes/AccountInformation$Builder;,
        Lorg/kore/kolab/notes/AccountInformation$Password;,
        Lorg/kore/kolab/notes/AccountInformation$Username;
    }
.end annotation


# instance fields
.field private folderAnnotationEnabled:Z

.field private final host:Ljava/lang/String;

.field private password:Ljava/lang/String;

.field private port:I

.field private sharedFoldersEnabled:Z

.field private sslEnabled:Z

.field private username:Ljava/lang/String;


# direct methods
.method private constructor <init>(Ljava/lang/String;)V
    .registers 4
    .param p1, "host"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    const/16 v0, 0x3e1

    iput v0, p0, Lorg/kore/kolab/notes/AccountInformation;->port:I

    .line 31
    iput-boolean v1, p0, Lorg/kore/kolab/notes/AccountInformation;->sslEnabled:Z

    .line 32
    iput-boolean v1, p0, Lorg/kore/kolab/notes/AccountInformation;->folderAnnotationEnabled:Z

    .line 33
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/kore/kolab/notes/AccountInformation;->sharedFoldersEnabled:Z

    .line 36
    iput-object p1, p0, Lorg/kore/kolab/notes/AccountInformation;->host:Ljava/lang/String;

    .line 37
    return-void
.end method

.method static synthetic access$002(Lorg/kore/kolab/notes/AccountInformation;Z)Z
    .registers 2
    .param p0, "x0"    # Lorg/kore/kolab/notes/AccountInformation;
    .param p1, "x1"    # Z

    .prologue
    .line 25
    iput-boolean p1, p0, Lorg/kore/kolab/notes/AccountInformation;->sslEnabled:Z

    return p1
.end method

.method static synthetic access$102(Lorg/kore/kolab/notes/AccountInformation;Z)Z
    .registers 2
    .param p0, "x0"    # Lorg/kore/kolab/notes/AccountInformation;
    .param p1, "x1"    # Z

    .prologue
    .line 25
    iput-boolean p1, p0, Lorg/kore/kolab/notes/AccountInformation;->folderAnnotationEnabled:Z

    return p1
.end method

.method static synthetic access$202(Lorg/kore/kolab/notes/AccountInformation;I)I
    .registers 2
    .param p0, "x0"    # Lorg/kore/kolab/notes/AccountInformation;
    .param p1, "x1"    # I

    .prologue
    .line 25
    iput p1, p0, Lorg/kore/kolab/notes/AccountInformation;->port:I

    return p1
.end method

.method static synthetic access$302(Lorg/kore/kolab/notes/AccountInformation;Z)Z
    .registers 2
    .param p0, "x0"    # Lorg/kore/kolab/notes/AccountInformation;
    .param p1, "x1"    # Z

    .prologue
    .line 25
    iput-boolean p1, p0, Lorg/kore/kolab/notes/AccountInformation;->sharedFoldersEnabled:Z

    return p1
.end method

.method static synthetic access$402(Lorg/kore/kolab/notes/AccountInformation;Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lorg/kore/kolab/notes/AccountInformation;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 25
    iput-object p1, p0, Lorg/kore/kolab/notes/AccountInformation;->password:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$502(Lorg/kore/kolab/notes/AccountInformation;Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lorg/kore/kolab/notes/AccountInformation;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 25
    iput-object p1, p0, Lorg/kore/kolab/notes/AccountInformation;->username:Ljava/lang/String;

    return-object p1
.end method

.method public static final createForHost(Ljava/lang/String;)Lorg/kore/kolab/notes/AccountInformation$Username;
    .registers 3
    .param p0, "host"    # Ljava/lang/String;

    .prologue
    .line 49
    new-instance v0, Lorg/kore/kolab/notes/AccountInformation$DefaultBuilder;

    new-instance v1, Lorg/kore/kolab/notes/AccountInformation;

    invoke-direct {v1, p0}, Lorg/kore/kolab/notes/AccountInformation;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {v0, v1}, Lorg/kore/kolab/notes/AccountInformation$DefaultBuilder;-><init>(Lorg/kore/kolab/notes/AccountInformation;)V

    return-object v0
.end method


# virtual methods
.method public getHost()Ljava/lang/String;
    .registers 2

    .prologue
    .line 65
    iget-object v0, p0, Lorg/kore/kolab/notes/AccountInformation;->host:Ljava/lang/String;

    return-object v0
.end method

.method public getPassword()Ljava/lang/String;
    .registers 2

    .prologue
    .line 61
    iget-object v0, p0, Lorg/kore/kolab/notes/AccountInformation;->password:Ljava/lang/String;

    return-object v0
.end method

.method public getPort()I
    .registers 2

    .prologue
    .line 69
    iget v0, p0, Lorg/kore/kolab/notes/AccountInformation;->port:I

    return v0
.end method

.method public getUsername()Ljava/lang/String;
    .registers 2

    .prologue
    .line 57
    iget-object v0, p0, Lorg/kore/kolab/notes/AccountInformation;->username:Ljava/lang/String;

    return-object v0
.end method

.method public isFolderAnnotationEnabled()Z
    .registers 2

    .prologue
    .line 53
    iget-boolean v0, p0, Lorg/kore/kolab/notes/AccountInformation;->folderAnnotationEnabled:Z

    return v0
.end method

.method public isSSLEnabled()Z
    .registers 2

    .prologue
    .line 73
    iget-boolean v0, p0, Lorg/kore/kolab/notes/AccountInformation;->sslEnabled:Z

    return v0
.end method

.method public isSharedFoldersEnabled()Z
    .registers 2

    .prologue
    .line 77
    iget-boolean v0, p0, Lorg/kore/kolab/notes/AccountInformation;->sharedFoldersEnabled:Z

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 82
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "AccountInformation{username="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/kore/kolab/notes/AccountInformation;->username:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", password="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/kore/kolab/notes/AccountInformation;->password:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", host="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/kore/kolab/notes/AccountInformation;->host:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", port="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lorg/kore/kolab/notes/AccountInformation;->port:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", sslEnabled="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lorg/kore/kolab/notes/AccountInformation;->sslEnabled:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", folderAnnotationEnabled="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lorg/kore/kolab/notes/AccountInformation;->folderAnnotationEnabled:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", sharedFoldersEnabled="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lorg/kore/kolab/notes/AccountInformation;->sharedFoldersEnabled:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
