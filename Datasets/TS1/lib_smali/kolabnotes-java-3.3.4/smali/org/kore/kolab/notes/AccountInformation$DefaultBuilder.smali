.class Lorg/kore/kolab/notes/AccountInformation$DefaultBuilder;
.super Ljava/lang/Object;
.source "AccountInformation.java"

# interfaces
.implements Lorg/kore/kolab/notes/AccountInformation$Builder;
.implements Lorg/kore/kolab/notes/AccountInformation$Password;
.implements Lorg/kore/kolab/notes/AccountInformation$Username;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/kore/kolab/notes/AccountInformation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "DefaultBuilder"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/kore/kolab/notes/AccountInformation;


# direct methods
.method constructor <init>(Lorg/kore/kolab/notes/AccountInformation;)V
    .registers 2
    .param p1, "this$0"    # Lorg/kore/kolab/notes/AccountInformation;

    .prologue
    .line 109
    iput-object p1, p0, Lorg/kore/kolab/notes/AccountInformation$DefaultBuilder;->this$0:Lorg/kore/kolab/notes/AccountInformation;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public build()Lorg/kore/kolab/notes/AccountInformation;
    .registers 2

    .prologue
    .line 113
    iget-object v0, p0, Lorg/kore/kolab/notes/AccountInformation$DefaultBuilder;->this$0:Lorg/kore/kolab/notes/AccountInformation;

    return-object v0
.end method

.method public disableFolderAnnotation()Lorg/kore/kolab/notes/AccountInformation$Builder;
    .registers 3

    .prologue
    .line 124
    iget-object v0, p0, Lorg/kore/kolab/notes/AccountInformation$DefaultBuilder;->this$0:Lorg/kore/kolab/notes/AccountInformation;

    const/4 v1, 0x0

    # setter for: Lorg/kore/kolab/notes/AccountInformation;->folderAnnotationEnabled:Z
    invoke-static {v0, v1}, Lorg/kore/kolab/notes/AccountInformation;->access$102(Lorg/kore/kolab/notes/AccountInformation;Z)Z

    .line 125
    return-object p0
.end method

.method public disableSSL()Lorg/kore/kolab/notes/AccountInformation$Builder;
    .registers 3

    .prologue
    .line 118
    iget-object v0, p0, Lorg/kore/kolab/notes/AccountInformation$DefaultBuilder;->this$0:Lorg/kore/kolab/notes/AccountInformation;

    const/4 v1, 0x0

    # setter for: Lorg/kore/kolab/notes/AccountInformation;->sslEnabled:Z
    invoke-static {v0, v1}, Lorg/kore/kolab/notes/AccountInformation;->access$002(Lorg/kore/kolab/notes/AccountInformation;Z)Z

    .line 119
    return-object p0
.end method

.method public enableSharedFolders()Lorg/kore/kolab/notes/AccountInformation$Builder;
    .registers 3

    .prologue
    .line 136
    iget-object v0, p0, Lorg/kore/kolab/notes/AccountInformation$DefaultBuilder;->this$0:Lorg/kore/kolab/notes/AccountInformation;

    const/4 v1, 0x1

    # setter for: Lorg/kore/kolab/notes/AccountInformation;->sharedFoldersEnabled:Z
    invoke-static {v0, v1}, Lorg/kore/kolab/notes/AccountInformation;->access$302(Lorg/kore/kolab/notes/AccountInformation;Z)Z

    .line 137
    return-object p0
.end method

.method public password(Ljava/lang/String;)Lorg/kore/kolab/notes/AccountInformation$Builder;
    .registers 3
    .param p1, "password"    # Ljava/lang/String;

    .prologue
    .line 143
    iget-object v0, p0, Lorg/kore/kolab/notes/AccountInformation$DefaultBuilder;->this$0:Lorg/kore/kolab/notes/AccountInformation;

    # setter for: Lorg/kore/kolab/notes/AccountInformation;->password:Ljava/lang/String;
    invoke-static {v0, p1}, Lorg/kore/kolab/notes/AccountInformation;->access$402(Lorg/kore/kolab/notes/AccountInformation;Ljava/lang/String;)Ljava/lang/String;

    .line 144
    return-object p0
.end method

.method public port(I)Lorg/kore/kolab/notes/AccountInformation$Builder;
    .registers 3
    .param p1, "port"    # I

    .prologue
    .line 130
    iget-object v0, p0, Lorg/kore/kolab/notes/AccountInformation$DefaultBuilder;->this$0:Lorg/kore/kolab/notes/AccountInformation;

    # setter for: Lorg/kore/kolab/notes/AccountInformation;->port:I
    invoke-static {v0, p1}, Lorg/kore/kolab/notes/AccountInformation;->access$202(Lorg/kore/kolab/notes/AccountInformation;I)I

    .line 131
    return-object p0
.end method

.method public username(Ljava/lang/String;)Lorg/kore/kolab/notes/AccountInformation$Password;
    .registers 3
    .param p1, "user"    # Ljava/lang/String;

    .prologue
    .line 149
    iget-object v0, p0, Lorg/kore/kolab/notes/AccountInformation$DefaultBuilder;->this$0:Lorg/kore/kolab/notes/AccountInformation;

    # setter for: Lorg/kore/kolab/notes/AccountInformation;->username:Ljava/lang/String;
    invoke-static {v0, p1}, Lorg/kore/kolab/notes/AccountInformation;->access$502(Lorg/kore/kolab/notes/AccountInformation;Ljava/lang/String;)Ljava/lang/String;

    .line 150
    return-object p0
.end method
