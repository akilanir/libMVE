.class public Lkorex/activation/CommandInfo;
.super Ljava/lang/Object;
.source "CommandInfo.java"


# instance fields
.field private className:Ljava/lang/String;

.field private verb:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "verb"    # Ljava/lang/String;
    .param p2, "className"    # Ljava/lang/String;

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    iput-object p1, p0, Lkorex/activation/CommandInfo;->verb:Ljava/lang/String;

    .line 61
    iput-object p2, p0, Lkorex/activation/CommandInfo;->className:Ljava/lang/String;

    .line 62
    return-void
.end method


# virtual methods
.method public getCommandClass()Ljava/lang/String;
    .registers 2

    .prologue
    .line 84
    iget-object v0, p0, Lkorex/activation/CommandInfo;->className:Ljava/lang/String;

    return-object v0
.end method

.method public getCommandName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 70
    iget-object v0, p0, Lkorex/activation/CommandInfo;->verb:Ljava/lang/String;

    return-object v0
.end method

.method public getCommandObject(Lkorex/activation/DataHandler;Ljava/lang/ClassLoader;)Ljava/lang/Object;
    .registers 7
    .param p1, "dh"    # Lkorex/activation/DataHandler;
    .param p2, "loader"    # Ljava/lang/ClassLoader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 119
    const/4 v1, 0x0

    .line 122
    .local v1, "new_bean":Ljava/lang/Object;
    iget-object v2, p0, Lkorex/activation/CommandInfo;->className:Ljava/lang/String;

    invoke-static {p2, v2}, Ljava/beans/Beans;->instantiate(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 125
    if-eqz v1, :cond_15

    .line 126
    instance-of v2, v1, Lkorex/activation/CommandObject;

    if-eqz v2, :cond_16

    move-object v2, v1

    .line 127
    check-cast v2, Lkorex/activation/CommandObject;

    iget-object v3, p0, Lkorex/activation/CommandInfo;->verb:Ljava/lang/String;

    invoke-interface {v2, v3, p1}, Lkorex/activation/CommandObject;->setCommandContext(Ljava/lang/String;Lkorex/activation/DataHandler;)V

    .line 139
    :cond_15
    :goto_15
    return-object v1

    .line 128
    :cond_16
    instance-of v2, v1, Ljava/io/Externalizable;

    if-eqz v2, :cond_15

    .line 129
    if-eqz p1, :cond_15

    .line 130
    invoke-virtual {p1}, Lkorex/activation/DataHandler;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    .line 131
    .local v0, "is":Ljava/io/InputStream;
    if-eqz v0, :cond_15

    move-object v2, v1

    .line 132
    check-cast v2, Ljava/io/Externalizable;

    new-instance v3, Ljava/io/ObjectInputStream;

    invoke-direct {v3, v0}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-interface {v2, v3}, Ljava/io/Externalizable;->readExternal(Ljava/io/ObjectInput;)V

    goto :goto_15
.end method
