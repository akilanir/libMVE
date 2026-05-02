.class Lcom/mongodb/DBPort$PlainAuthenticator$1;
.super Ljava/lang/Object;
.source "DBPort.java"

# interfaces
.implements Ljavax/security/auth/callback/CallbackHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mongodb/DBPort$PlainAuthenticator;->createSaslClient()Ljavax/security/sasl/SaslClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/mongodb/DBPort$PlainAuthenticator;


# direct methods
.method constructor <init>(Lcom/mongodb/DBPort$PlainAuthenticator;)V
    .registers 2

    .prologue
    .line 477
    iput-object p1, p0, Lcom/mongodb/DBPort$PlainAuthenticator$1;->this$1:Lcom/mongodb/DBPort$PlainAuthenticator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handle([Ljavax/security/auth/callback/Callback;)V
    .registers 7
    .param p1, "callbacks"    # [Ljavax/security/auth/callback/Callback;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljavax/security/auth/callback/UnsupportedCallbackException;
        }
    .end annotation

    .prologue
    .line 480
    move-object v0, p1

    .local v0, "arr$":[Ljavax/security/auth/callback/Callback;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_3
    if-ge v2, v3, :cond_2d

    aget-object v1, v0, v2

    .line 481
    .local v1, "callback":Ljavax/security/auth/callback/Callback;
    instance-of v4, v1, Ljavax/security/auth/callback/PasswordCallback;

    if-eqz v4, :cond_1b

    .line 482
    check-cast v1, Ljavax/security/auth/callback/PasswordCallback;

    .end local v1    # "callback":Ljavax/security/auth/callback/Callback;
    iget-object v4, p0, Lcom/mongodb/DBPort$PlainAuthenticator$1;->this$1:Lcom/mongodb/DBPort$PlainAuthenticator;

    iget-object v4, v4, Lcom/mongodb/DBPort$PlainAuthenticator;->credential:Lcom/mongodb/MongoCredential;

    invoke-virtual {v4}, Lcom/mongodb/MongoCredential;->getPassword()[C

    move-result-object v4

    invoke-virtual {v1, v4}, Ljavax/security/auth/callback/PasswordCallback;->setPassword([C)V

    .line 480
    :cond_18
    :goto_18
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 484
    .restart local v1    # "callback":Ljavax/security/auth/callback/Callback;
    :cond_1b
    instance-of v4, v1, Ljavax/security/auth/callback/NameCallback;

    if-eqz v4, :cond_18

    .line 485
    check-cast v1, Ljavax/security/auth/callback/NameCallback;

    .end local v1    # "callback":Ljavax/security/auth/callback/Callback;
    iget-object v4, p0, Lcom/mongodb/DBPort$PlainAuthenticator$1;->this$1:Lcom/mongodb/DBPort$PlainAuthenticator;

    iget-object v4, v4, Lcom/mongodb/DBPort$PlainAuthenticator;->credential:Lcom/mongodb/MongoCredential;

    invoke-virtual {v4}, Lcom/mongodb/MongoCredential;->getUserName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljavax/security/auth/callback/NameCallback;->setName(Ljava/lang/String;)V

    goto :goto_18

    .line 488
    :cond_2d
    return-void
.end method
