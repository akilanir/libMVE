.class public Lkorex/mail/Provider;
.super Ljava/lang/Object;
.source "Provider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkorex/mail/Provider$Type;
    }
.end annotation


# instance fields
.field private className:Ljava/lang/String;

.field private protocol:Ljava/lang/String;

.field private type:Lkorex/mail/Provider$Type;

.field private vendor:Ljava/lang/String;

.field private version:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lkorex/mail/Provider$Type;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "type"    # Lkorex/mail/Provider$Type;
    .param p2, "protocol"    # Ljava/lang/String;
    .param p3, "classname"    # Ljava/lang/String;
    .param p4, "vendor"    # Ljava/lang/String;
    .param p5, "version"    # Ljava/lang/String;

    .prologue
    .line 92
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 93
    iput-object p1, p0, Lkorex/mail/Provider;->type:Lkorex/mail/Provider$Type;

    .line 94
    iput-object p2, p0, Lkorex/mail/Provider;->protocol:Ljava/lang/String;

    .line 95
    iput-object p3, p0, Lkorex/mail/Provider;->className:Ljava/lang/String;

    .line 96
    iput-object p4, p0, Lkorex/mail/Provider;->vendor:Ljava/lang/String;

    .line 97
    iput-object p5, p0, Lkorex/mail/Provider;->version:Ljava/lang/String;

    .line 98
    return-void
.end method


# virtual methods
.method public getClassName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 124
    iget-object v0, p0, Lkorex/mail/Provider;->className:Ljava/lang/String;

    return-object v0
.end method

.method public getProtocol()Ljava/lang/String;
    .registers 2

    .prologue
    .line 115
    iget-object v0, p0, Lkorex/mail/Provider;->protocol:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Lkorex/mail/Provider$Type;
    .registers 2

    .prologue
    .line 106
    iget-object v0, p0, Lkorex/mail/Provider;->type:Lkorex/mail/Provider$Type;

    return-object v0
.end method

.method public getVendor()Ljava/lang/String;
    .registers 2

    .prologue
    .line 134
    iget-object v0, p0, Lkorex/mail/Provider;->vendor:Ljava/lang/String;

    return-object v0
.end method

.method public getVersion()Ljava/lang/String;
    .registers 2

    .prologue
    .line 143
    iget-object v0, p0, Lkorex/mail/Provider;->version:Ljava/lang/String;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 148
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "korex.mail.Provider["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lkorex/mail/Provider;->type:Lkorex/mail/Provider$Type;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lkorex/mail/Provider;->protocol:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lkorex/mail/Provider;->className:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 151
    .local v0, "s":Ljava/lang/String;
    iget-object v1, p0, Lkorex/mail/Provider;->vendor:Ljava/lang/String;

    if-eqz v1, :cond_4a

    .line 152
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lkorex/mail/Provider;->vendor:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 154
    :cond_4a
    iget-object v1, p0, Lkorex/mail/Provider;->version:Ljava/lang/String;

    if-eqz v1, :cond_67

    .line 155
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lkorex/mail/Provider;->version:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 157
    :cond_67
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 158
    return-object v0
.end method
