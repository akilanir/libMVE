.class public Ltk/elevenk/olapi/data/Credential;
.super Ljava/lang/Object;
.source "Credential.java"


# instance fields
.field private password:Ljava/lang/String;

.field private username:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "password"    # Ljava/lang/String;

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p1, p0, Ltk/elevenk/olapi/data/Credential;->username:Ljava/lang/String;

    .line 32
    iput-object p2, p0, Ltk/elevenk/olapi/data/Credential;->password:Ljava/lang/String;

    .line 33
    return-void
.end method


# virtual methods
.method public getPassword()Ljava/lang/String;
    .registers 2

    .prologue
    .line 40
    iget-object v0, p0, Ltk/elevenk/olapi/data/Credential;->password:Ljava/lang/String;

    return-object v0
.end method

.method public getUsername()Ljava/lang/String;
    .registers 2

    .prologue
    .line 36
    iget-object v0, p0, Ltk/elevenk/olapi/data/Credential;->username:Ljava/lang/String;

    return-object v0
.end method
