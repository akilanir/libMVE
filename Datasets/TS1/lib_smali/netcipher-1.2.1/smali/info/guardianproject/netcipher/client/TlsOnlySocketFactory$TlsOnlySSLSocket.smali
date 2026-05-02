.class Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$TlsOnlySSLSocket;
.super Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;
.source "TlsOnlySocketFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TlsOnlySSLSocket"
.end annotation


# instance fields
.field final compatible:Z

.field final synthetic this$0:Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory;


# direct methods
.method private constructor <init>(Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory;Ljavax/net/ssl/SSLSocket;Z)V
    .registers 14
    .param p2, "delegate"    # Ljavax/net/ssl/SSLSocket;
    .param p3, "compatible"    # Z

    .prologue
    const/16 v9, 0xa

    .line 126
    iput-object p1, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$TlsOnlySSLSocket;->this$0:Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory;

    .line 127
    invoke-direct {p0, p1, p2}, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;-><init>(Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory;Ljavax/net/ssl/SSLSocket;)V

    .line 128
    iput-boolean p3, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$TlsOnlySSLSocket;->compatible:Z

    .line 131
    if-eqz p3, :cond_66

    .line 132
    new-instance v7, Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljavax/net/ssl/SSLSocket;->getEnabledProtocols()[Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 134
    .local v7, "protocols":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v8, "SSLv2"

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 135
    const-string v8, "SSLv3"

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 136
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v8

    new-array v8, v8, [Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [Ljava/lang/String;

    invoke-super {p0, v8}, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->setEnabledProtocols([Ljava/lang/String;)V

    .line 142
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v9}, Ljava/util/ArrayList;-><init>(I)V

    .line 143
    .local v2, "enabled":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v8, ".*(EXPORT|NULL).*"

    invoke-static {v8}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v4

    .line 144
    .local v4, "exclude":Ljava/util/regex/Pattern;
    invoke-virtual {p2}, Ljavax/net/ssl/SSLSocket;->getEnabledCipherSuites()[Ljava/lang/String;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/String;
    array-length v6, v0

    .local v6, "len$":I
    const/4 v5, 0x0

    .local v5, "i$":I
    :goto_42
    if-ge v5, v6, :cond_56

    aget-object v1, v0, v5

    .line 145
    .local v1, "cipher":Ljava/lang/String;
    invoke-virtual {v4, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/regex/Matcher;->matches()Z

    move-result v8

    if-nez v8, :cond_53

    .line 146
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 144
    :cond_53
    add-int/lit8 v5, v5, 0x1

    goto :goto_42

    .line 149
    .end local v1    # "cipher":Ljava/lang/String;
    :cond_56
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v8

    new-array v8, v8, [Ljava/lang/String;

    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [Ljava/lang/String;

    invoke-super {p0, v8}, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->setEnabledCipherSuites([Ljava/lang/String;)V

    .line 173
    .end local v2    # "enabled":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :goto_65
    return-void

    .line 155
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v4    # "exclude":Ljava/util/regex/Pattern;
    .end local v5    # "i$":I
    .end local v6    # "len$":I
    .end local v7    # "protocols":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_66
    new-instance v7, Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljavax/net/ssl/SSLSocket;->getSupportedProtocols()[Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 157
    .restart local v7    # "protocols":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v8, "SSLv2"

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 158
    const-string v8, "SSLv3"

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 159
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v8

    new-array v8, v8, [Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [Ljava/lang/String;

    invoke-super {p0, v8}, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->setEnabledProtocols([Ljava/lang/String;)V

    .line 165
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v9}, Ljava/util/ArrayList;-><init>(I)V

    .line 166
    .local v3, "enabledCiphers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v8, ".*(_DES|DH_|DSS|EXPORT|MD5|NULL|RC4).*"

    invoke-static {v8}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v4

    .line 167
    .restart local v4    # "exclude":Ljava/util/regex/Pattern;
    invoke-virtual {p2}, Ljavax/net/ssl/SSLSocket;->getSupportedCipherSuites()[Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "arr$":[Ljava/lang/String;
    array-length v6, v0

    .restart local v6    # "len$":I
    const/4 v5, 0x0

    .restart local v5    # "i$":I
    :goto_9d
    if-ge v5, v6, :cond_b1

    aget-object v1, v0, v5

    .line 168
    .restart local v1    # "cipher":Ljava/lang/String;
    invoke-virtual {v4, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/regex/Matcher;->matches()Z

    move-result v8

    if-nez v8, :cond_ae

    .line 169
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 167
    :cond_ae
    add-int/lit8 v5, v5, 0x1

    goto :goto_9d

    .line 172
    .end local v1    # "cipher":Ljava/lang/String;
    :cond_b1
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v8

    new-array v8, v8, [Ljava/lang/String;

    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [Ljava/lang/String;

    invoke-super {p0, v8}, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->setEnabledCipherSuites([Ljava/lang/String;)V

    goto :goto_65
.end method

.method synthetic constructor <init>(Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory;Ljavax/net/ssl/SSLSocket;ZLinfo/guardianproject/netcipher/client/TlsOnlySocketFactory$1;)V
    .registers 5
    .param p1, "x0"    # Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory;
    .param p2, "x1"    # Ljavax/net/ssl/SSLSocket;
    .param p3, "x2"    # Z
    .param p4, "x3"    # Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$1;

    .prologue
    .line 122
    invoke-direct {p0, p1, p2, p3}, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$TlsOnlySSLSocket;-><init>(Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory;Ljavax/net/ssl/SSLSocket;Z)V

    return-void
.end method


# virtual methods
.method public setEnabledProtocols([Ljava/lang/String;)V
    .registers 7
    .param p1, "protocols"    # [Ljava/lang/String;

    .prologue
    const/4 v4, 0x1

    .line 180
    if-eqz p1, :cond_40

    array-length v2, p1

    if-ne v2, v4, :cond_40

    const-string v2, "SSLv3"

    const/4 v3, 0x0

    aget-object v3, p1, v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_40

    .line 182
    iget-boolean v2, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$TlsOnlySSLSocket;->compatible:Z

    if-eqz v2, :cond_44

    .line 183
    iget-object v2, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$TlsOnlySSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v2}, Ljavax/net/ssl/SSLSocket;->getEnabledProtocols()[Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    .line 187
    .local v1, "systemProtocols":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :goto_1f
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 188
    .local v0, "enabledProtocols":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-le v2, v4, :cond_4f

    .line 189
    const-string v2, "SSLv2"

    invoke-interface {v0, v2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 190
    const-string v2, "SSLv3"

    invoke-interface {v0, v2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 195
    :goto_34
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    new-array v2, v2, [Ljava/lang/String;

    invoke-interface {v0, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    .end local p1    # "protocols":[Ljava/lang/String;
    check-cast p1, [Ljava/lang/String;

    .line 197
    .end local v0    # "enabledProtocols":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v1    # "systemProtocols":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local p1    # "protocols":[Ljava/lang/String;
    :cond_40
    invoke-super {p0, p1}, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;->setEnabledProtocols([Ljava/lang/String;)V

    .line 198
    return-void

    .line 185
    :cond_44
    iget-object v2, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$TlsOnlySSLSocket;->delegate:Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v2}, Ljavax/net/ssl/SSLSocket;->getSupportedProtocols()[Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    .restart local v1    # "systemProtocols":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    goto :goto_1f

    .line 192
    .restart local v0    # "enabledProtocols":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_4f
    const-string v2, "TlsOnlySocketFactory"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "SSL stuck with protocol available for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_34
.end method
