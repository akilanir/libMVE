.class public Lcom/jcraft/jsch/OpenSSHConfig;
.super Ljava/lang/Object;
.source "OpenSSHConfig.java"

# interfaces
.implements Lcom/jcraft/jsch/ConfigRepository;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/jcraft/jsch/OpenSSHConfig$MyConfig;
    }
.end annotation


# static fields
.field private static final keymap:Ljava/util/Hashtable;


# instance fields
.field private final config:Ljava/util/Hashtable;

.field private final hosts:Ljava/util/Vector;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 149
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    sput-object v0, Lcom/jcraft/jsch/OpenSSHConfig;->keymap:Ljava/util/Hashtable;

    .line 151
    sget-object v0, Lcom/jcraft/jsch/OpenSSHConfig;->keymap:Ljava/util/Hashtable;

    const-string v1, "kex"

    const-string v2, "KexAlgorithms"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 152
    sget-object v0, Lcom/jcraft/jsch/OpenSSHConfig;->keymap:Ljava/util/Hashtable;

    const-string v1, "server_host_key"

    const-string v2, "HostKeyAlgorithms"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 153
    sget-object v0, Lcom/jcraft/jsch/OpenSSHConfig;->keymap:Ljava/util/Hashtable;

    const-string v1, "cipher.c2s"

    const-string v2, "Ciphers"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 154
    sget-object v0, Lcom/jcraft/jsch/OpenSSHConfig;->keymap:Ljava/util/Hashtable;

    const-string v1, "cipher.s2c"

    const-string v2, "Ciphers"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 155
    sget-object v0, Lcom/jcraft/jsch/OpenSSHConfig;->keymap:Ljava/util/Hashtable;

    const-string v1, "mac.c2s"

    const-string v2, "Macs"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 156
    sget-object v0, Lcom/jcraft/jsch/OpenSSHConfig;->keymap:Ljava/util/Hashtable;

    const-string v1, "mac.s2c"

    const-string v2, "Macs"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 157
    sget-object v0, Lcom/jcraft/jsch/OpenSSHConfig;->keymap:Ljava/util/Hashtable;

    const-string v1, "compression.s2c"

    const-string v2, "Compression"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 158
    sget-object v0, Lcom/jcraft/jsch/OpenSSHConfig;->keymap:Ljava/util/Hashtable;

    const-string v1, "compression.c2s"

    const-string v2, "Compression"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 159
    sget-object v0, Lcom/jcraft/jsch/OpenSSHConfig;->keymap:Ljava/util/Hashtable;

    const-string v1, "compression_level"

    const-string v2, "CompressionLevel"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 160
    sget-object v0, Lcom/jcraft/jsch/OpenSSHConfig;->keymap:Ljava/util/Hashtable;

    const-string v1, "MaxAuthTries"

    const-string v2, "NumberOfPasswordPrompts"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 161
    return-void
.end method

.method constructor <init>(Ljava/io/Reader;)V
    .registers 3
    .param p1, "r"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 105
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 109
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lcom/jcraft/jsch/OpenSSHConfig;->config:Ljava/util/Hashtable;

    .line 110
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/jcraft/jsch/OpenSSHConfig;->hosts:Ljava/util/Vector;

    .line 106
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/OpenSSHConfig;->_parse(Ljava/io/Reader;)V

    .line 107
    return-void
.end method

.method private _parse(Ljava/io/Reader;)V
    .registers 11
    .param p1, "r"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    .line 113
    new-instance v0, Ljava/io/BufferedReader;

    invoke-direct {v0, p1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 115
    .local v0, "br":Ljava/io/BufferedReader;
    const-string v1, ""

    .line 116
    .local v1, "host":Ljava/lang/String;
    new-instance v4, Ljava/util/Vector;

    invoke-direct {v4}, Ljava/util/Vector;-><init>()V

    .line 117
    .local v4, "kv":Ljava/util/Vector;
    const/4 v5, 0x0

    .line 119
    .local v5, "l":Ljava/lang/String;
    :cond_e
    :goto_e
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_60

    .line 120
    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    .line 121
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    if-eqz v6, :cond_e

    const-string v6, "#"

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_e

    .line 124
    const-string v6, "[= \t]"

    const/4 v7, 0x2

    invoke-virtual {v5, v6, v7}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v3

    .line 125
    .local v3, "key_value":[Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2e
    array-length v6, v3

    if-ge v2, v6, :cond_3c

    .line 126
    aget-object v6, v3, v2

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v3, v2

    .line 125
    add-int/lit8 v2, v2, 0x1

    goto :goto_2e

    .line 128
    :cond_3c
    array-length v6, v3

    if-le v6, v8, :cond_e

    .line 131
    const/4 v6, 0x0

    aget-object v6, v3, v6

    const-string v7, "Host"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5c

    .line 132
    iget-object v6, p0, Lcom/jcraft/jsch/OpenSSHConfig;->config:Ljava/util/Hashtable;

    invoke-virtual {v6, v1, v4}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 133
    iget-object v6, p0, Lcom/jcraft/jsch/OpenSSHConfig;->hosts:Ljava/util/Vector;

    invoke-virtual {v6, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 134
    aget-object v1, v3, v8

    .line 135
    new-instance v4, Ljava/util/Vector;

    .end local v4    # "kv":Ljava/util/Vector;
    invoke-direct {v4}, Ljava/util/Vector;-><init>()V

    .restart local v4    # "kv":Ljava/util/Vector;
    goto :goto_e

    .line 138
    :cond_5c
    invoke-virtual {v4, v3}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_e

    .line 141
    .end local v2    # "i":I
    .end local v3    # "key_value":[Ljava/lang/String;
    :cond_60
    iget-object v6, p0, Lcom/jcraft/jsch/OpenSSHConfig;->config:Ljava/util/Hashtable;

    invoke-virtual {v6, v1, v4}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    iget-object v6, p0, Lcom/jcraft/jsch/OpenSSHConfig;->hosts:Ljava/util/Vector;

    invoke-virtual {v6, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 143
    return-void
.end method

.method static synthetic access$000(Lcom/jcraft/jsch/OpenSSHConfig;)Ljava/util/Hashtable;
    .registers 2
    .param p0, "x0"    # Lcom/jcraft/jsch/OpenSSHConfig;

    .prologue
    .line 71
    iget-object v0, p0, Lcom/jcraft/jsch/OpenSSHConfig;->config:Ljava/util/Hashtable;

    return-object v0
.end method

.method static synthetic access$100(Lcom/jcraft/jsch/OpenSSHConfig;)Ljava/util/Vector;
    .registers 2
    .param p0, "x0"    # Lcom/jcraft/jsch/OpenSSHConfig;

    .prologue
    .line 71
    iget-object v0, p0, Lcom/jcraft/jsch/OpenSSHConfig;->hosts:Ljava/util/Vector;

    return-object v0
.end method

.method static synthetic access$200()Ljava/util/Hashtable;
    .registers 1

    .prologue
    .line 71
    sget-object v0, Lcom/jcraft/jsch/OpenSSHConfig;->keymap:Ljava/util/Hashtable;

    return-object v0
.end method

.method public static parse(Ljava/lang/String;)Lcom/jcraft/jsch/OpenSSHConfig;
    .registers 3
    .param p0, "conf"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 80
    new-instance v0, Ljava/io/StringReader;

    invoke-direct {v0, p0}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    .line 82
    .local v0, "r":Ljava/io/Reader;
    :try_start_5
    new-instance v1, Lcom/jcraft/jsch/OpenSSHConfig;

    invoke-direct {v1, v0}, Lcom/jcraft/jsch/OpenSSHConfig;-><init>(Ljava/io/Reader;)V
    :try_end_a
    .catchall {:try_start_5 .. :try_end_a} :catchall_e

    .line 85
    invoke-virtual {v0}, Ljava/io/Reader;->close()V

    return-object v1

    :catchall_e
    move-exception v1

    invoke-virtual {v0}, Ljava/io/Reader;->close()V

    throw v1
.end method

.method public static parseFile(Ljava/lang/String;)Lcom/jcraft/jsch/OpenSSHConfig;
    .registers 3
    .param p0, "file"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 96
    new-instance v0, Ljava/io/FileReader;

    invoke-static {p0}, Lcom/jcraft/jsch/Util;->checkTilde(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    .line 98
    .local v0, "r":Ljava/io/Reader;
    :try_start_9
    new-instance v1, Lcom/jcraft/jsch/OpenSSHConfig;

    invoke-direct {v1, v0}, Lcom/jcraft/jsch/OpenSSHConfig;-><init>(Ljava/io/Reader;)V
    :try_end_e
    .catchall {:try_start_9 .. :try_end_e} :catchall_12

    .line 101
    invoke-virtual {v0}, Ljava/io/Reader;->close()V

    return-object v1

    :catchall_12
    move-exception v1

    invoke-virtual {v0}, Ljava/io/Reader;->close()V

    throw v1
.end method


# virtual methods
.method public getConfig(Ljava/lang/String;)Lcom/jcraft/jsch/ConfigRepository$Config;
    .registers 3
    .param p1, "host"    # Ljava/lang/String;

    .prologue
    .line 146
    new-instance v0, Lcom/jcraft/jsch/OpenSSHConfig$MyConfig;

    invoke-direct {v0, p0, p1}, Lcom/jcraft/jsch/OpenSSHConfig$MyConfig;-><init>(Lcom/jcraft/jsch/OpenSSHConfig;Ljava/lang/String;)V

    return-object v0
.end method
