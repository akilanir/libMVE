.class Lcom/jcraft/jsch/OpenSSHConfig$MyConfig;
.super Ljava/lang/Object;
.source "OpenSSHConfig.java"

# interfaces
.implements Lcom/jcraft/jsch/ConfigRepository$Config;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jcraft/jsch/OpenSSHConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MyConfig"
.end annotation


# instance fields
.field private _configs:Ljava/util/Vector;

.field private host:Ljava/lang/String;

.field final synthetic this$0:Lcom/jcraft/jsch/OpenSSHConfig;


# direct methods
.method constructor <init>(Lcom/jcraft/jsch/OpenSSHConfig;Ljava/lang/String;)V
    .registers 13
    .param p2, "host"    # Ljava/lang/String;

    .prologue
    const/4 v9, 0x1

    .line 168
    iput-object p1, p0, Lcom/jcraft/jsch/OpenSSHConfig$MyConfig;->this$0:Lcom/jcraft/jsch/OpenSSHConfig;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 166
    new-instance v6, Ljava/util/Vector;

    invoke-direct {v6}, Ljava/util/Vector;-><init>()V

    iput-object v6, p0, Lcom/jcraft/jsch/OpenSSHConfig$MyConfig;->_configs:Ljava/util/Vector;

    .line 169
    iput-object p2, p0, Lcom/jcraft/jsch/OpenSSHConfig$MyConfig;->host:Ljava/lang/String;

    .line 171
    iget-object v6, p0, Lcom/jcraft/jsch/OpenSSHConfig$MyConfig;->_configs:Ljava/util/Vector;

    # getter for: Lcom/jcraft/jsch/OpenSSHConfig;->config:Ljava/util/Hashtable;
    invoke-static {p1}, Lcom/jcraft/jsch/OpenSSHConfig;->access$000(Lcom/jcraft/jsch/OpenSSHConfig;)Ljava/util/Hashtable;

    move-result-object v7

    const-string v8, ""

    invoke-virtual {v7, v8}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 173
    invoke-static {p2}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v0

    .line 174
    .local v0, "_host":[B
    # getter for: Lcom/jcraft/jsch/OpenSSHConfig;->hosts:Ljava/util/Vector;
    invoke-static {p1}, Lcom/jcraft/jsch/OpenSSHConfig;->access$100(Lcom/jcraft/jsch/OpenSSHConfig;)Ljava/util/Vector;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/Vector;->size()I

    move-result v6

    if-le v6, v9, :cond_a6

    .line 175
    const/4 v2, 0x1

    .local v2, "i":I
    :goto_2d
    # getter for: Lcom/jcraft/jsch/OpenSSHConfig;->hosts:Ljava/util/Vector;
    invoke-static {p1}, Lcom/jcraft/jsch/OpenSSHConfig;->access$100(Lcom/jcraft/jsch/OpenSSHConfig;)Ljava/util/Vector;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/Vector;->size()I

    move-result v6

    if-ge v2, v6, :cond_a6

    .line 176
    # getter for: Lcom/jcraft/jsch/OpenSSHConfig;->hosts:Ljava/util/Vector;
    invoke-static {p1}, Lcom/jcraft/jsch/OpenSSHConfig;->access$100(Lcom/jcraft/jsch/OpenSSHConfig;)Ljava/util/Vector;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    const-string v7, "[ \t]"

    invoke-virtual {v6, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 177
    .local v5, "patterns":[Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_48
    array-length v6, v5

    if-ge v3, v6, :cond_a3

    .line 178
    const/4 v4, 0x0

    .line 179
    .local v4, "negate":Z
    aget-object v6, v5, v3

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 180
    .local v1, "foo":Ljava/lang/String;
    const-string v6, "!"

    invoke-virtual {v1, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_63

    .line 181
    const/4 v4, 0x1

    .line 182
    invoke-virtual {v1, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 184
    :cond_63
    invoke-static {v1}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v6

    invoke-static {v6, v0}, Lcom/jcraft/jsch/Util;->glob([B[B)Z

    move-result v6

    if-eqz v6, :cond_89

    .line 185
    if-nez v4, :cond_86

    .line 186
    iget-object v7, p0, Lcom/jcraft/jsch/OpenSSHConfig$MyConfig;->_configs:Ljava/util/Vector;

    # getter for: Lcom/jcraft/jsch/OpenSSHConfig;->config:Ljava/util/Hashtable;
    invoke-static {p1}, Lcom/jcraft/jsch/OpenSSHConfig;->access$000(Lcom/jcraft/jsch/OpenSSHConfig;)Ljava/util/Hashtable;

    move-result-object v8

    # getter for: Lcom/jcraft/jsch/OpenSSHConfig;->hosts:Ljava/util/Vector;
    invoke-static {p1}, Lcom/jcraft/jsch/OpenSSHConfig;->access$100(Lcom/jcraft/jsch/OpenSSHConfig;)Ljava/util/Vector;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v8, v6}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v7, v6}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 177
    :cond_86
    :goto_86
    add-int/lit8 v3, v3, 0x1

    goto :goto_48

    .line 189
    :cond_89
    if-eqz v4, :cond_86

    .line 190
    iget-object v7, p0, Lcom/jcraft/jsch/OpenSSHConfig$MyConfig;->_configs:Ljava/util/Vector;

    # getter for: Lcom/jcraft/jsch/OpenSSHConfig;->config:Ljava/util/Hashtable;
    invoke-static {p1}, Lcom/jcraft/jsch/OpenSSHConfig;->access$000(Lcom/jcraft/jsch/OpenSSHConfig;)Ljava/util/Hashtable;

    move-result-object v8

    # getter for: Lcom/jcraft/jsch/OpenSSHConfig;->hosts:Ljava/util/Vector;
    invoke-static {p1}, Lcom/jcraft/jsch/OpenSSHConfig;->access$100(Lcom/jcraft/jsch/OpenSSHConfig;)Ljava/util/Vector;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v8, v6}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v7, v6}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_86

    .line 175
    .end local v1    # "foo":Ljava/lang/String;
    .end local v4    # "negate":Z
    :cond_a3
    add-int/lit8 v2, v2, 0x1

    goto :goto_2d

    .line 195
    .end local v2    # "i":I
    .end local v3    # "j":I
    .end local v5    # "patterns":[Ljava/lang/String;
    :cond_a6
    return-void
.end method

.method private find(Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 198
    # getter for: Lcom/jcraft/jsch/OpenSSHConfig;->keymap:Ljava/util/Hashtable;
    invoke-static {}, Lcom/jcraft/jsch/OpenSSHConfig;->access$200()Ljava/util/Hashtable;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_14

    .line 199
    # getter for: Lcom/jcraft/jsch/OpenSSHConfig;->keymap:Ljava/util/Hashtable;
    invoke-static {}, Lcom/jcraft/jsch/OpenSSHConfig;->access$200()Ljava/util/Hashtable;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .end local p1    # "key":Ljava/lang/String;
    check-cast p1, Ljava/lang/String;

    .line 201
    .restart local p1    # "key":Ljava/lang/String;
    :cond_14
    const/4 v4, 0x0

    .line 202
    .local v4, "value":Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_16
    iget-object v5, p0, Lcom/jcraft/jsch/OpenSSHConfig$MyConfig;->_configs:Ljava/util/Vector;

    invoke-virtual {v5}, Ljava/util/Vector;->size()I

    move-result v5

    if-ge v0, v5, :cond_44

    .line 203
    iget-object v5, p0, Lcom/jcraft/jsch/OpenSSHConfig$MyConfig;->_configs:Ljava/util/Vector;

    invoke-virtual {v5, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Vector;

    .line 204
    .local v3, "v":Ljava/util/Vector;
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_27
    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v5

    if-ge v1, v5, :cond_42

    .line 205
    invoke-virtual {v3, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Ljava/lang/String;

    move-object v2, v5

    check-cast v2, [Ljava/lang/String;

    .line 206
    .local v2, "kv":[Ljava/lang/String;
    const/4 v5, 0x0

    aget-object v5, v2, v5

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_45

    .line 207
    const/4 v5, 0x1

    aget-object v4, v2, v5

    .line 211
    .end local v2    # "kv":[Ljava/lang/String;
    :cond_42
    if-eqz v4, :cond_48

    .line 214
    .end local v1    # "j":I
    .end local v3    # "v":Ljava/util/Vector;
    :cond_44
    return-object v4

    .line 204
    .restart local v1    # "j":I
    .restart local v2    # "kv":[Ljava/lang/String;
    .restart local v3    # "v":Ljava/util/Vector;
    :cond_45
    add-int/lit8 v1, v1, 0x1

    goto :goto_27

    .line 202
    .end local v2    # "kv":[Ljava/lang/String;
    :cond_48
    add-int/lit8 v0, v0, 0x1

    goto :goto_16
.end method

.method private multiFind(Ljava/lang/String;)[Ljava/lang/String;
    .registers 10
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 218
    new-instance v6, Ljava/util/Vector;

    invoke-direct {v6}, Ljava/util/Vector;-><init>()V

    .line 219
    .local v6, "value":Ljava/util/Vector;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_6
    iget-object v7, p0, Lcom/jcraft/jsch/OpenSSHConfig$MyConfig;->_configs:Ljava/util/Vector;

    invoke-virtual {v7}, Ljava/util/Vector;->size()I

    move-result v7

    if-ge v1, v7, :cond_40

    .line 220
    iget-object v7, p0, Lcom/jcraft/jsch/OpenSSHConfig$MyConfig;->_configs:Ljava/util/Vector;

    invoke-virtual {v7, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Vector;

    .line 221
    .local v5, "v":Ljava/util/Vector;
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_17
    invoke-virtual {v5}, Ljava/util/Vector;->size()I

    move-result v7

    if-ge v2, v7, :cond_3d

    .line 222
    invoke-virtual {v5, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Ljava/lang/String;

    move-object v3, v7

    check-cast v3, [Ljava/lang/String;

    .line 223
    .local v3, "kv":[Ljava/lang/String;
    const/4 v7, 0x0

    aget-object v7, v3, v7

    invoke-virtual {v7, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3a

    .line 224
    const/4 v7, 0x1

    aget-object v0, v3, v7

    .line 225
    .local v0, "foo":Ljava/lang/String;
    if-eqz v0, :cond_3a

    .line 226
    invoke-virtual {v6, v0}, Ljava/util/Vector;->remove(Ljava/lang/Object;)Z

    .line 227
    invoke-virtual {v6, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 221
    .end local v0    # "foo":Ljava/lang/String;
    :cond_3a
    add-int/lit8 v2, v2, 0x1

    goto :goto_17

    .line 219
    .end local v3    # "kv":[Ljava/lang/String;
    :cond_3d
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 232
    .end local v2    # "j":I
    .end local v5    # "v":Ljava/util/Vector;
    :cond_40
    invoke-virtual {v6}, Ljava/util/Vector;->size()I

    move-result v7

    new-array v4, v7, [Ljava/lang/String;

    .line 233
    .local v4, "result":[Ljava/lang/String;
    invoke-virtual {v6, v4}, Ljava/util/Vector;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 234
    return-object v4
.end method


# virtual methods
.method public getHostname()Ljava/lang/String;
    .registers 2

    .prologue
    .line 237
    const-string v0, "Hostname"

    invoke-direct {p0, v0}, Lcom/jcraft/jsch/OpenSSHConfig$MyConfig;->find(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPort()I
    .registers 4

    .prologue
    .line 240
    const-string v2, "Port"

    invoke-direct {p0, v2}, Lcom/jcraft/jsch/OpenSSHConfig$MyConfig;->find(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 241
    .local v0, "foo":Ljava/lang/String;
    const/4 v1, -0x1

    .line 243
    .local v1, "port":I
    :try_start_7
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_a
    .catch Ljava/lang/NumberFormatException; {:try_start_7 .. :try_end_a} :catch_c

    move-result v1

    .line 248
    :goto_b
    return v1

    .line 245
    :catch_c
    move-exception v2

    goto :goto_b
.end method

.method public getUser()Ljava/lang/String;
    .registers 2

    .prologue
    .line 238
    const-string v0, "User"

    invoke-direct {p0, v0}, Lcom/jcraft/jsch/OpenSSHConfig$MyConfig;->find(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getValue(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 251
    const-string v1, "compression.s2c"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_10

    const-string v1, "compression.c2s"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_24

    .line 253
    :cond_10
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/OpenSSHConfig$MyConfig;->find(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 254
    .local v0, "foo":Ljava/lang/String;
    if-eqz v0, :cond_1e

    const-string v1, "no"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_21

    .line 255
    :cond_1e
    const-string v1, "none,zlib@openssh.com,zlib"

    .line 258
    .end local v0    # "foo":Ljava/lang/String;
    :goto_20
    return-object v1

    .line 256
    .restart local v0    # "foo":Ljava/lang/String;
    :cond_21
    const-string v1, "zlib@openssh.com,zlib,none"

    goto :goto_20

    .line 258
    .end local v0    # "foo":Ljava/lang/String;
    :cond_24
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/OpenSSHConfig$MyConfig;->find(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_20
.end method

.method public getValues(Ljava/lang/String;)[Ljava/lang/String;
    .registers 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 260
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/OpenSSHConfig$MyConfig;->multiFind(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
