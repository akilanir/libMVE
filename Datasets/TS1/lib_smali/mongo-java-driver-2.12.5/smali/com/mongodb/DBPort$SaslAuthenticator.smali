.class abstract Lcom/mongodb/DBPort$SaslAuthenticator;
.super Lcom/mongodb/DBPort$Authenticator;
.source "DBPort.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/DBPort;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x400
    name = "SaslAuthenticator"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mongodb/DBPort;


# direct methods
.method constructor <init>(Lcom/mongodb/DBPort;Lcom/mongodb/Mongo;Lcom/mongodb/MongoCredential;)V
    .registers 4
    .param p2, "mongo"    # Lcom/mongodb/Mongo;
    .param p3, "credentials"    # Lcom/mongodb/MongoCredential;

    .prologue
    .line 556
    iput-object p1, p0, Lcom/mongodb/DBPort$SaslAuthenticator;->this$0:Lcom/mongodb/DBPort;

    .line 557
    invoke-direct {p0, p1, p2, p3}, Lcom/mongodb/DBPort$Authenticator;-><init>(Lcom/mongodb/DBPort;Lcom/mongodb/Mongo;Lcom/mongodb/MongoCredential;)V

    .line 558
    return-void
.end method

.method private sendSaslContinue(I[B)Lcom/mongodb/CommandResult;
    .registers 8
    .param p1, "conversationId"    # I
    .param p2, "outToken"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 605
    invoke-virtual {p0}, Lcom/mongodb/DBPort$SaslAuthenticator;->getDatabase()Lcom/mongodb/DB;

    move-result-object v0

    .line 606
    .local v0, "adminDB":Lcom/mongodb/DB;
    new-instance v2, Lcom/mongodb/BasicDBObject;

    const-string v3, "saslContinue"

    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v3, "conversationId"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/mongodb/BasicDBObject;->append(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObject;

    move-result-object v2

    const-string v3, "payload"

    invoke-virtual {v2, v3, p2}, Lcom/mongodb/BasicDBObject;->append(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObject;

    move-result-object v1

    .line 608
    .local v1, "cmd":Lcom/mongodb/DBObject;
    iget-object v2, p0, Lcom/mongodb/DBPort$SaslAuthenticator;->this$0:Lcom/mongodb/DBPort;

    invoke-virtual {v2, v0, v1}, Lcom/mongodb/DBPort;->runCommand(Lcom/mongodb/DB;Lcom/mongodb/DBObject;)Lcom/mongodb/CommandResult;

    move-result-object v2

    return-object v2
.end method

.method private sendSaslStart([B)Lcom/mongodb/CommandResult;
    .registers 6
    .param p1, "outToken"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 598
    new-instance v1, Lcom/mongodb/BasicDBObject;

    const-string v2, "saslStart"

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v2, "mechanism"

    invoke-virtual {p0}, Lcom/mongodb/DBPort$SaslAuthenticator;->getMechanismName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/mongodb/BasicDBObject;->append(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObject;

    move-result-object v1

    const-string v2, "payload"

    if-eqz p1, :cond_29

    .end local p1    # "outToken":[B
    :goto_1a
    invoke-virtual {v1, v2, p1}, Lcom/mongodb/BasicDBObject;->append(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObject;

    move-result-object v0

    .line 601
    .local v0, "cmd":Lcom/mongodb/DBObject;
    iget-object v1, p0, Lcom/mongodb/DBPort$SaslAuthenticator;->this$0:Lcom/mongodb/DBPort;

    invoke-virtual {p0}, Lcom/mongodb/DBPort$SaslAuthenticator;->getDatabase()Lcom/mongodb/DB;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lcom/mongodb/DBPort;->runCommand(Lcom/mongodb/DB;Lcom/mongodb/DBObject;)Lcom/mongodb/CommandResult;

    move-result-object v1

    return-object v1

    .line 598
    .end local v0    # "cmd":Lcom/mongodb/DBObject;
    .restart local p1    # "outToken":[B
    :cond_29
    const/4 v3, 0x0

    new-array p1, v3, [B

    goto :goto_1a
.end method


# virtual methods
.method public authenticate()Lcom/mongodb/CommandResult;
    .registers 8

    .prologue
    .line 561
    invoke-virtual {p0}, Lcom/mongodb/DBPort$SaslAuthenticator;->createSaslClient()Ljavax/security/sasl/SaslClient;

    move-result-object v4

    .line 563
    .local v4, "saslClient":Ljavax/security/sasl/SaslClient;
    :try_start_4
    invoke-interface {v4}, Ljavax/security/sasl/SaslClient;->hasInitialResponse()Z

    move-result v5

    if-eqz v5, :cond_58

    const/4 v5, 0x0

    new-array v5, v5, [B

    invoke-interface {v4, v5}, Ljavax/security/sasl/SaslClient;->evaluateChallenge([B)[B

    move-result-object v3

    .line 564
    .local v3, "response":[B
    :goto_11
    invoke-direct {p0, v3}, Lcom/mongodb/DBPort$SaslAuthenticator;->sendSaslStart([B)Lcom/mongodb/CommandResult;

    move-result-object v2

    .line 565
    .local v2, "res":Lcom/mongodb/CommandResult;
    invoke-virtual {v2}, Lcom/mongodb/CommandResult;->throwOnError()V

    .line 567
    const-string v5, "conversationId"

    invoke-virtual {v2, v5}, Lcom/mongodb/CommandResult;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 569
    .local v0, "conversationId":I
    :goto_24
    const-string v5, "done"

    invoke-virtual {v2, v5}, Lcom/mongodb/CommandResult;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-nez v5, :cond_62

    .line 570
    const-string v5, "payload"

    invoke-virtual {v2, v5}, Lcom/mongodb/CommandResult;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [B

    check-cast v5, [B

    invoke-interface {v4, v5}, Ljavax/security/sasl/SaslClient;->evaluateChallenge([B)[B

    move-result-object v3

    .line 572
    if-nez v3, :cond_5a

    .line 573
    new-instance v5, Lcom/mongodb/MongoException;

    const-string v6, "SASL protocol error: no client response to challenge"

    invoke-direct {v5, v6}, Lcom/mongodb/MongoException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_4a
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4a} :catch_4a
    .catchall {:try_start_4 .. :try_end_4a} :catchall_53

    .line 580
    .end local v0    # "conversationId":I
    .end local v2    # "res":Lcom/mongodb/CommandResult;
    .end local v3    # "response":[B
    :catch_4a
    move-exception v1

    .line 581
    .local v1, "e":Ljava/io/IOException;
    :try_start_4b
    new-instance v5, Lcom/mongodb/MongoException$Network;

    const-string v6, "IOException authenticating the connection"

    invoke-direct {v5, v6, v1}, Lcom/mongodb/MongoException$Network;-><init>(Ljava/lang/String;Ljava/io/IOException;)V

    throw v5
    :try_end_53
    .catchall {:try_start_4b .. :try_end_53} :catchall_53

    .line 583
    .end local v1    # "e":Ljava/io/IOException;
    :catchall_53
    move-exception v5

    .line 584
    :try_start_54
    invoke-interface {v4}, Ljavax/security/sasl/SaslClient;->dispose()V
    :try_end_57
    .catch Ljavax/security/sasl/SaslException; {:try_start_54 .. :try_end_57} :catch_68

    .line 587
    :goto_57
    throw v5

    .line 563
    :cond_58
    const/4 v3, 0x0

    goto :goto_11

    .line 576
    .restart local v0    # "conversationId":I
    .restart local v2    # "res":Lcom/mongodb/CommandResult;
    .restart local v3    # "response":[B
    :cond_5a
    :try_start_5a
    invoke-direct {p0, v0, v3}, Lcom/mongodb/DBPort$SaslAuthenticator;->sendSaslContinue(I[B)Lcom/mongodb/CommandResult;

    move-result-object v2

    .line 577
    invoke-virtual {v2}, Lcom/mongodb/CommandResult;->throwOnError()V
    :try_end_61
    .catch Ljava/io/IOException; {:try_start_5a .. :try_end_61} :catch_4a
    .catchall {:try_start_5a .. :try_end_61} :catchall_53

    goto :goto_24

    .line 584
    :cond_62
    :try_start_62
    invoke-interface {v4}, Ljavax/security/sasl/SaslClient;->dispose()V
    :try_end_65
    .catch Ljavax/security/sasl/SaslException; {:try_start_62 .. :try_end_65} :catch_66

    .line 587
    :goto_65
    return-object v2

    .line 585
    :catch_66
    move-exception v5

    goto :goto_65

    .end local v0    # "conversationId":I
    .end local v2    # "res":Lcom/mongodb/CommandResult;
    .end local v3    # "response":[B
    :catch_68
    move-exception v6

    goto :goto_57
.end method

.method protected abstract createSaslClient()Ljavax/security/sasl/SaslClient;
.end method

.method protected getDatabase()Lcom/mongodb/DB;
    .registers 3

    .prologue
    .line 594
    iget-object v0, p0, Lcom/mongodb/DBPort$SaslAuthenticator;->mongo:Lcom/mongodb/Mongo;

    iget-object v1, p0, Lcom/mongodb/DBPort$SaslAuthenticator;->credential:Lcom/mongodb/MongoCredential;

    invoke-virtual {v1}, Lcom/mongodb/MongoCredential;->getSource()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mongodb/Mongo;->getDB(Ljava/lang/String;)Lcom/mongodb/DB;

    move-result-object v0

    return-object v0
.end method

.method public abstract getMechanismName()Ljava/lang/String;
.end method
