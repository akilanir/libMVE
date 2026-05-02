.class public Lcom/jcraft/jsch/JSch;
.super Ljava/lang/Object;
.source "JSch.java"


# static fields
.field private static final DEVNULL:Lcom/jcraft/jsch/Logger;

.field public static final VERSION:Ljava/lang/String; = "0.1.51"

.field static config:Ljava/util/Hashtable;

.field static logger:Lcom/jcraft/jsch/Logger;


# instance fields
.field private configRepository:Lcom/jcraft/jsch/ConfigRepository;

.field private defaultIdentityRepository:Lcom/jcraft/jsch/IdentityRepository;

.field private identityRepository:Lcom/jcraft/jsch/IdentityRepository;

.field private known_hosts:Lcom/jcraft/jsch/HostKeyRepository;

.field private sessionPool:Ljava/util/Vector;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 41
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    sput-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    .line 43
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "kex"

    const-string v2, "diffie-hellman-group1-sha1,diffie-hellman-group14-sha1,diffie-hellman-group-exchange-sha1"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "server_host_key"

    const-string v2, "ssh-rsa,ssh-dss"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "cipher.s2c"

    const-string v2, "aes128-ctr,aes128-cbc,3des-ctr,3des-cbc,blowfish-cbc,aes192-cbc,aes256-cbc"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "cipher.c2s"

    const-string v2, "aes128-ctr,aes128-cbc,3des-ctr,3des-cbc,blowfish-cbc,aes192-cbc,aes256-cbc"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "mac.s2c"

    const-string v2, "hmac-md5,hmac-sha1,hmac-sha2-256,hmac-sha1-96,hmac-md5-96"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "mac.c2s"

    const-string v2, "hmac-md5,hmac-sha1,hmac-sha2-256,hmac-sha1-96,hmac-md5-96"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "compression.s2c"

    const-string v2, "none"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "compression.c2s"

    const-string v2, "none"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "lang.s2c"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "lang.c2s"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "compression_level"

    const-string v2, "6"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "diffie-hellman-group-exchange-sha1"

    const-string v2, "com.jcraft.jsch.DHGEX"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "diffie-hellman-group1-sha1"

    const-string v2, "com.jcraft.jsch.DHG1"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "diffie-hellman-group14-sha1"

    const-string v2, "com.jcraft.jsch.DHG14"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "diffie-hellman-group-exchange-sha256"

    const-string v2, "com.jcraft.jsch.DHGEX256"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "dh"

    const-string v2, "com.jcraft.jsch.jce.DH"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "3des-cbc"

    const-string v2, "com.jcraft.jsch.jce.TripleDESCBC"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "blowfish-cbc"

    const-string v2, "com.jcraft.jsch.jce.BlowfishCBC"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "hmac-sha1"

    const-string v2, "com.jcraft.jsch.jce.HMACSHA1"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "hmac-sha1-96"

    const-string v2, "com.jcraft.jsch.jce.HMACSHA196"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "hmac-sha2-256"

    const-string v2, "com.jcraft.jsch.jce.HMACSHA256"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "hmac-md5"

    const-string v2, "com.jcraft.jsch.jce.HMACMD5"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "hmac-md5-96"

    const-string v2, "com.jcraft.jsch.jce.HMACMD596"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "sha-1"

    const-string v2, "com.jcraft.jsch.jce.SHA1"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "sha-256"

    const-string v2, "com.jcraft.jsch.jce.SHA256"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "md5"

    const-string v2, "com.jcraft.jsch.jce.MD5"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "signature.dss"

    const-string v2, "com.jcraft.jsch.jce.SignatureDSA"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "signature.rsa"

    const-string v2, "com.jcraft.jsch.jce.SignatureRSA"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "keypairgen.dsa"

    const-string v2, "com.jcraft.jsch.jce.KeyPairGenDSA"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "keypairgen.rsa"

    const-string v2, "com.jcraft.jsch.jce.KeyPairGenRSA"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "random"

    const-string v2, "com.jcraft.jsch.jce.Random"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "none"

    const-string v2, "com.jcraft.jsch.CipherNone"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "aes128-cbc"

    const-string v2, "com.jcraft.jsch.jce.AES128CBC"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "aes192-cbc"

    const-string v2, "com.jcraft.jsch.jce.AES192CBC"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "aes256-cbc"

    const-string v2, "com.jcraft.jsch.jce.AES256CBC"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "aes128-ctr"

    const-string v2, "com.jcraft.jsch.jce.AES128CTR"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "aes192-ctr"

    const-string v2, "com.jcraft.jsch.jce.AES192CTR"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "aes256-ctr"

    const-string v2, "com.jcraft.jsch.jce.AES256CTR"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "3des-ctr"

    const-string v2, "com.jcraft.jsch.jce.TripleDESCTR"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "arcfour"

    const-string v2, "com.jcraft.jsch.jce.ARCFOUR"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "arcfour128"

    const-string v2, "com.jcraft.jsch.jce.ARCFOUR128"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "arcfour256"

    const-string v2, "com.jcraft.jsch.jce.ARCFOUR256"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "userauth.none"

    const-string v2, "com.jcraft.jsch.UserAuthNone"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "userauth.password"

    const-string v2, "com.jcraft.jsch.UserAuthPassword"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "userauth.keyboard-interactive"

    const-string v2, "com.jcraft.jsch.UserAuthKeyboardInteractive"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "userauth.publickey"

    const-string v2, "com.jcraft.jsch.UserAuthPublicKey"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "userauth.gssapi-with-mic"

    const-string v2, "com.jcraft.jsch.UserAuthGSSAPIWithMIC"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "gssapi-with-mic.krb5"

    const-string v2, "com.jcraft.jsch.jgss.GSSContextKrb5"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "zlib"

    const-string v2, "com.jcraft.jsch.jcraft.Compression"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "zlib@openssh.com"

    const-string v2, "com.jcraft.jsch.jcraft.Compression"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "pbkdf"

    const-string v2, "com.jcraft.jsch.jce.PBKDF"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "StrictHostKeyChecking"

    const-string v2, "ask"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "HashKnownHosts"

    const-string v2, "no"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "PreferredAuthentications"

    const-string v2, "gssapi-with-mic,publickey,keyboard-interactive,password"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "CheckCiphers"

    const-string v2, "aes256-ctr,aes192-ctr,aes128-ctr,aes256-cbc,aes192-cbc,aes128-cbc,3des-ctr,arcfour,arcfour128,arcfour256"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "CheckKexes"

    const-string v2, "diffie-hellman-group14-sha1"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "MaxAuthTries"

    const-string v2, "6"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    const-string v1, "ClearAllForwardings"

    const-string v2, "no"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 169
    new-instance v0, Lcom/jcraft/jsch/JSch$1;

    invoke-direct {v0}, Lcom/jcraft/jsch/JSch$1;-><init>()V

    sput-object v0, Lcom/jcraft/jsch/JSch;->DEVNULL:Lcom/jcraft/jsch/Logger;

    .line 173
    sget-object v0, Lcom/jcraft/jsch/JSch;->DEVNULL:Lcom/jcraft/jsch/Logger;

    sput-object v0, Lcom/jcraft/jsch/JSch;->logger:Lcom/jcraft/jsch/Logger;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 175
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 128
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/jcraft/jsch/JSch;->sessionPool:Ljava/util/Vector;

    .line 130
    new-instance v0, Lcom/jcraft/jsch/LocalIdentityRepository;

    invoke-direct {v0, p0}, Lcom/jcraft/jsch/LocalIdentityRepository;-><init>(Lcom/jcraft/jsch/JSch;)V

    iput-object v0, p0, Lcom/jcraft/jsch/JSch;->defaultIdentityRepository:Lcom/jcraft/jsch/IdentityRepository;

    .line 133
    iget-object v0, p0, Lcom/jcraft/jsch/JSch;->defaultIdentityRepository:Lcom/jcraft/jsch/IdentityRepository;

    iput-object v0, p0, Lcom/jcraft/jsch/JSch;->identityRepository:Lcom/jcraft/jsch/IdentityRepository;

    .line 135
    iput-object v1, p0, Lcom/jcraft/jsch/JSch;->configRepository:Lcom/jcraft/jsch/ConfigRepository;

    .line 167
    iput-object v1, p0, Lcom/jcraft/jsch/JSch;->known_hosts:Lcom/jcraft/jsch/HostKeyRepository;

    .line 191
    return-void
.end method

.method public static getConfig(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "key"    # Ljava/lang/String;

    .prologue
    .line 533
    sget-object v1, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    monitor-enter v1

    .line 534
    :try_start_3
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    invoke-virtual {v0, p0}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    check-cast v0, Ljava/lang/String;

    monitor-exit v1

    return-object v0

    .line 535
    :catchall_f
    move-exception v0

    monitor-exit v1
    :try_end_11
    .catchall {:try_start_3 .. :try_end_11} :catchall_f

    throw v0
.end method

.method static getLogger()Lcom/jcraft/jsch/Logger;
    .registers 1

    .prologue
    .line 575
    sget-object v0, Lcom/jcraft/jsch/JSch;->logger:Lcom/jcraft/jsch/Logger;

    return-object v0
.end method

.method public static setConfig(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 559
    sget-object v0, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    invoke-virtual {v0, p0, p1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 560
    return-void
.end method

.method public static setConfig(Ljava/util/Hashtable;)V
    .registers 7
    .param p0, "newconf"    # Ljava/util/Hashtable;

    .prologue
    .line 544
    sget-object v4, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    monitor-enter v4

    .line 545
    :try_start_3
    invoke-virtual {p0}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v1

    .local v1, "e":Ljava/util/Enumeration;
    :goto_7
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_28

    .line 546
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    move-object v0, v3

    check-cast v0, Ljava/lang/String;

    move-object v2, v0

    .line 547
    .local v2, "key":Ljava/lang/String;
    sget-object v5, Lcom/jcraft/jsch/JSch;->config:Ljava/util/Hashtable;

    invoke-virtual {p0, v2}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v5, v2, v3}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_7

    .line 549
    .end local v1    # "e":Ljava/util/Enumeration;
    .end local v2    # "key":Ljava/lang/String;
    :catchall_25
    move-exception v3

    monitor-exit v4
    :try_end_27
    .catchall {:try_start_3 .. :try_end_27} :catchall_25

    throw v3

    .restart local v1    # "e":Ljava/util/Enumeration;
    :cond_28
    :try_start_28
    monitor-exit v4
    :try_end_29
    .catchall {:try_start_28 .. :try_end_29} :catchall_25

    .line 550
    return-void
.end method

.method public static setLogger(Lcom/jcraft/jsch/Logger;)V
    .registers 1
    .param p0, "logger"    # Lcom/jcraft/jsch/Logger;

    .prologue
    .line 570
    if-nez p0, :cond_4

    sget-object p0, Lcom/jcraft/jsch/JSch;->DEVNULL:Lcom/jcraft/jsch/Logger;

    .line 571
    :cond_4
    sput-object p0, Lcom/jcraft/jsch/JSch;->logger:Lcom/jcraft/jsch/Logger;

    .line 572
    return-void
.end method


# virtual methods
.method public addIdentity(Lcom/jcraft/jsch/Identity;[B)V
    .registers 7
    .param p1, "identity"    # Lcom/jcraft/jsch/Identity;
    .param p2, "passphrase"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 444
    if-eqz p2, :cond_12

    .line 446
    :try_start_2
    array-length v1, p2

    new-array v0, v1, [B

    .line 447
    .local v0, "goo":[B
    const/4 v1, 0x0

    const/4 v2, 0x0

    array-length v3, p2

    invoke-static {p2, v1, v0, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 448
    move-object p2, v0

    .line 449
    invoke-interface {p1, p2}, Lcom/jcraft/jsch/Identity;->setPassphrase([B)Z
    :try_end_f
    .catchall {:try_start_2 .. :try_end_f} :catchall_20

    .line 452
    invoke-static {p2}, Lcom/jcraft/jsch/Util;->bzero([B)V

    .line 456
    .end local v0    # "goo":[B
    :cond_12
    iget-object v1, p0, Lcom/jcraft/jsch/JSch;->identityRepository:Lcom/jcraft/jsch/IdentityRepository;

    instance-of v1, v1, Lcom/jcraft/jsch/LocalIdentityRepository;

    if-eqz v1, :cond_25

    .line 457
    iget-object v1, p0, Lcom/jcraft/jsch/JSch;->identityRepository:Lcom/jcraft/jsch/IdentityRepository;

    check-cast v1, Lcom/jcraft/jsch/LocalIdentityRepository;

    invoke-virtual {v1, p1}, Lcom/jcraft/jsch/LocalIdentityRepository;->add(Lcom/jcraft/jsch/Identity;)V

    .line 470
    .end local p1    # "identity":Lcom/jcraft/jsch/Identity;
    :goto_1f
    return-void

    .line 452
    .restart local p1    # "identity":Lcom/jcraft/jsch/Identity;
    :catchall_20
    move-exception v1

    invoke-static {p2}, Lcom/jcraft/jsch/Util;->bzero([B)V

    throw v1

    .line 459
    :cond_25
    instance-of v1, p1, Lcom/jcraft/jsch/IdentityFile;

    if-eqz v1, :cond_3f

    invoke-interface {p1}, Lcom/jcraft/jsch/Identity;->isEncrypted()Z

    move-result v1

    if-nez v1, :cond_3f

    .line 460
    iget-object v1, p0, Lcom/jcraft/jsch/JSch;->identityRepository:Lcom/jcraft/jsch/IdentityRepository;

    check-cast p1, Lcom/jcraft/jsch/IdentityFile;

    .end local p1    # "identity":Lcom/jcraft/jsch/Identity;
    invoke-virtual {p1}, Lcom/jcraft/jsch/IdentityFile;->getKeyPair()Lcom/jcraft/jsch/KeyPair;

    move-result-object v2

    invoke-virtual {v2}, Lcom/jcraft/jsch/KeyPair;->forSSHAgent()[B

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/jcraft/jsch/IdentityRepository;->add([B)Z

    goto :goto_1f

    .line 463
    .restart local p1    # "identity":Lcom/jcraft/jsch/Identity;
    :cond_3f
    monitor-enter p0

    .line 464
    :try_start_40
    iget-object v1, p0, Lcom/jcraft/jsch/JSch;->identityRepository:Lcom/jcraft/jsch/IdentityRepository;

    instance-of v1, v1, Lcom/jcraft/jsch/IdentityRepository$Wrapper;

    if-nez v1, :cond_50

    .line 465
    new-instance v1, Lcom/jcraft/jsch/IdentityRepository$Wrapper;

    iget-object v2, p0, Lcom/jcraft/jsch/JSch;->identityRepository:Lcom/jcraft/jsch/IdentityRepository;

    invoke-direct {v1, v2}, Lcom/jcraft/jsch/IdentityRepository$Wrapper;-><init>(Lcom/jcraft/jsch/IdentityRepository;)V

    invoke-virtual {p0, v1}, Lcom/jcraft/jsch/JSch;->setIdentityRepository(Lcom/jcraft/jsch/IdentityRepository;)V

    .line 467
    :cond_50
    monitor-exit p0
    :try_end_51
    .catchall {:try_start_40 .. :try_end_51} :catchall_59

    .line 468
    iget-object v1, p0, Lcom/jcraft/jsch/JSch;->identityRepository:Lcom/jcraft/jsch/IdentityRepository;

    check-cast v1, Lcom/jcraft/jsch/IdentityRepository$Wrapper;

    invoke-virtual {v1, p1}, Lcom/jcraft/jsch/IdentityRepository$Wrapper;->add(Lcom/jcraft/jsch/Identity;)V

    goto :goto_1f

    .line 467
    :catchall_59
    move-exception v1

    :try_start_5a
    monitor-exit p0
    :try_end_5b
    .catchall {:try_start_5a .. :try_end_5b} :catchall_59

    throw v1
.end method

.method public addIdentity(Ljava/lang/String;)V
    .registers 3
    .param p1, "prvkey"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 353
    const/4 v0, 0x0

    check-cast v0, [B

    invoke-virtual {p0, p1, v0}, Lcom/jcraft/jsch/JSch;->addIdentity(Ljava/lang/String;[B)V

    .line 354
    return-void
.end method

.method public addIdentity(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "prvkey"    # Ljava/lang/String;
    .param p2, "passphrase"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 370
    const/4 v0, 0x0

    .line 371
    .local v0, "_passphrase":[B
    if-eqz p2, :cond_7

    .line 372
    invoke-static {p2}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v0

    .line 374
    :cond_7
    invoke-virtual {p0, p1, v0}, Lcom/jcraft/jsch/JSch;->addIdentity(Ljava/lang/String;[B)V

    .line 375
    if-eqz v0, :cond_f

    .line 376
    invoke-static {v0}, Lcom/jcraft/jsch/Util;->bzero([B)V

    .line 377
    :cond_f
    return-void
.end method

.method public addIdentity(Ljava/lang/String;Ljava/lang/String;[B)V
    .registers 5
    .param p1, "prvkey"    # Ljava/lang/String;
    .param p2, "pubkey"    # Ljava/lang/String;
    .param p3, "passphrase"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 410
    invoke-static {p1, p2, p0}, Lcom/jcraft/jsch/IdentityFile;->newInstance(Ljava/lang/String;Ljava/lang/String;Lcom/jcraft/jsch/JSch;)Lcom/jcraft/jsch/IdentityFile;

    move-result-object v0

    .line 411
    .local v0, "identity":Lcom/jcraft/jsch/Identity;
    invoke-virtual {p0, v0, p3}, Lcom/jcraft/jsch/JSch;->addIdentity(Lcom/jcraft/jsch/Identity;[B)V

    .line 412
    return-void
.end method

.method public addIdentity(Ljava/lang/String;[B)V
    .registers 5
    .param p1, "prvkey"    # Ljava/lang/String;
    .param p2, "passphrase"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 393
    const/4 v1, 0x0

    invoke-static {p1, v1, p0}, Lcom/jcraft/jsch/IdentityFile;->newInstance(Ljava/lang/String;Ljava/lang/String;Lcom/jcraft/jsch/JSch;)Lcom/jcraft/jsch/IdentityFile;

    move-result-object v0

    .line 394
    .local v0, "identity":Lcom/jcraft/jsch/Identity;
    invoke-virtual {p0, v0, p2}, Lcom/jcraft/jsch/JSch;->addIdentity(Lcom/jcraft/jsch/Identity;[B)V

    .line 395
    return-void
.end method

.method public addIdentity(Ljava/lang/String;[B[B[B)V
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "prvkey"    # [B
    .param p3, "pubkey"    # [B
    .param p4, "passphrase"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 428
    invoke-static {p1, p2, p3, p0}, Lcom/jcraft/jsch/IdentityFile;->newInstance(Ljava/lang/String;[B[BLcom/jcraft/jsch/JSch;)Lcom/jcraft/jsch/IdentityFile;

    move-result-object v0

    .line 429
    .local v0, "identity":Lcom/jcraft/jsch/Identity;
    invoke-virtual {p0, v0, p4}, Lcom/jcraft/jsch/JSch;->addIdentity(Lcom/jcraft/jsch/Identity;[B)V

    .line 430
    return-void
.end method

.method protected addSession(Lcom/jcraft/jsch/Session;)V
    .registers 4
    .param p1, "session"    # Lcom/jcraft/jsch/Session;

    .prologue
    .line 265
    iget-object v1, p0, Lcom/jcraft/jsch/JSch;->sessionPool:Ljava/util/Vector;

    monitor-enter v1

    .line 266
    :try_start_3
    iget-object v0, p0, Lcom/jcraft/jsch/JSch;->sessionPool:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 267
    monitor-exit v1

    .line 268
    return-void

    .line 267
    :catchall_a
    move-exception v0

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_a

    throw v0
.end method

.method public getConfigRepository()Lcom/jcraft/jsch/ConfigRepository;
    .registers 2

    .prologue
    .line 160
    iget-object v0, p0, Lcom/jcraft/jsch/JSch;->configRepository:Lcom/jcraft/jsch/ConfigRepository;

    return-object v0
.end method

.method public getHostKeyRepository()Lcom/jcraft/jsch/HostKeyRepository;
    .registers 2

    .prologue
    .line 338
    iget-object v0, p0, Lcom/jcraft/jsch/JSch;->known_hosts:Lcom/jcraft/jsch/HostKeyRepository;

    if-nez v0, :cond_b

    new-instance v0, Lcom/jcraft/jsch/KnownHosts;

    invoke-direct {v0, p0}, Lcom/jcraft/jsch/KnownHosts;-><init>(Lcom/jcraft/jsch/JSch;)V

    iput-object v0, p0, Lcom/jcraft/jsch/JSch;->known_hosts:Lcom/jcraft/jsch/HostKeyRepository;

    .line 339
    :cond_b
    iget-object v0, p0, Lcom/jcraft/jsch/JSch;->known_hosts:Lcom/jcraft/jsch/HostKeyRepository;

    return-object v0
.end method

.method public getIdentityNames()Ljava/util/Vector;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 508
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    .line 509
    .local v0, "foo":Ljava/util/Vector;
    iget-object v4, p0, Lcom/jcraft/jsch/JSch;->identityRepository:Lcom/jcraft/jsch/IdentityRepository;

    invoke-interface {v4}, Lcom/jcraft/jsch/IdentityRepository;->getIdentities()Ljava/util/Vector;

    move-result-object v2

    .line 510
    .local v2, "identities":Ljava/util/Vector;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_c
    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v4

    if-ge v1, v4, :cond_25

    .line 511
    invoke-virtual {v2, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/jcraft/jsch/Identity;

    move-object v3, v4

    check-cast v3, Lcom/jcraft/jsch/Identity;

    .line 512
    .local v3, "identity":Lcom/jcraft/jsch/Identity;
    invoke-interface {v3}, Lcom/jcraft/jsch/Identity;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 510
    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    .line 514
    .end local v3    # "identity":Lcom/jcraft/jsch/Identity;
    :cond_25
    return-object v0
.end method

.method public declared-synchronized getIdentityRepository()Lcom/jcraft/jsch/IdentityRepository;
    .registers 2

    .prologue
    .line 156
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/jcraft/jsch/JSch;->identityRepository:Lcom/jcraft/jsch/IdentityRepository;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-object v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getSession(Ljava/lang/String;)Lcom/jcraft/jsch/Session;
    .registers 4
    .param p1, "host"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 212
    const/4 v0, 0x0

    const/16 v1, 0x16

    invoke-virtual {p0, v0, p1, v1}, Lcom/jcraft/jsch/JSch;->getSession(Ljava/lang/String;Ljava/lang/String;I)Lcom/jcraft/jsch/Session;

    move-result-object v0

    return-object v0
.end method

.method public getSession(Ljava/lang/String;Ljava/lang/String;)Lcom/jcraft/jsch/Session;
    .registers 4
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "host"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 235
    const/16 v0, 0x16

    invoke-virtual {p0, p1, p2, v0}, Lcom/jcraft/jsch/JSch;->getSession(Ljava/lang/String;Ljava/lang/String;I)Lcom/jcraft/jsch/Session;

    move-result-object v0

    return-object v0
.end method

.method public getSession(Ljava/lang/String;Ljava/lang/String;I)Lcom/jcraft/jsch/Session;
    .registers 7
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "host"    # Ljava/lang/String;
    .param p3, "port"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 257
    if-nez p2, :cond_a

    .line 258
    new-instance v1, Lcom/jcraft/jsch/JSchException;

    const-string v2, "host must not be null."

    invoke-direct {v1, v2}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 260
    :cond_a
    new-instance v0, Lcom/jcraft/jsch/Session;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/jcraft/jsch/Session;-><init>(Lcom/jcraft/jsch/JSch;Ljava/lang/String;Ljava/lang/String;I)V

    .line 261
    .local v0, "s":Lcom/jcraft/jsch/Session;
    return-object v0
.end method

.method public removeAllIdentity()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 523
    iget-object v0, p0, Lcom/jcraft/jsch/JSch;->identityRepository:Lcom/jcraft/jsch/IdentityRepository;

    invoke-interface {v0}, Lcom/jcraft/jsch/IdentityRepository;->removeAll()V

    .line 524
    return-void
.end method

.method public removeIdentity(Lcom/jcraft/jsch/Identity;)V
    .registers 4
    .param p1, "identity"    # Lcom/jcraft/jsch/Identity;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 497
    iget-object v0, p0, Lcom/jcraft/jsch/JSch;->identityRepository:Lcom/jcraft/jsch/IdentityRepository;

    invoke-interface {p1}, Lcom/jcraft/jsch/Identity;->getPublicKeyBlob()[B

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/jcraft/jsch/IdentityRepository;->remove([B)Z

    .line 498
    return-void
.end method

.method public removeIdentity(Ljava/lang/String;)V
    .registers 7
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 476
    iget-object v3, p0, Lcom/jcraft/jsch/JSch;->identityRepository:Lcom/jcraft/jsch/IdentityRepository;

    invoke-interface {v3}, Lcom/jcraft/jsch/IdentityRepository;->getIdentities()Ljava/util/Vector;

    move-result-object v1

    .line 477
    .local v1, "identities":Ljava/util/Vector;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v3

    if-ge v0, v3, :cond_3b

    .line 478
    invoke-virtual {v1, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/jcraft/jsch/Identity;

    move-object v2, v3

    check-cast v2, Lcom/jcraft/jsch/Identity;

    .line 479
    .local v2, "identity":Lcom/jcraft/jsch/Identity;
    invoke-interface {v2}, Lcom/jcraft/jsch/Identity;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_23

    .line 477
    :goto_20
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 481
    :cond_23
    iget-object v3, p0, Lcom/jcraft/jsch/JSch;->identityRepository:Lcom/jcraft/jsch/IdentityRepository;

    instance-of v3, v3, Lcom/jcraft/jsch/LocalIdentityRepository;

    if-eqz v3, :cond_31

    .line 482
    iget-object v3, p0, Lcom/jcraft/jsch/JSch;->identityRepository:Lcom/jcraft/jsch/IdentityRepository;

    check-cast v3, Lcom/jcraft/jsch/LocalIdentityRepository;

    invoke-virtual {v3, v2}, Lcom/jcraft/jsch/LocalIdentityRepository;->remove(Lcom/jcraft/jsch/Identity;)V

    goto :goto_20

    .line 485
    :cond_31
    iget-object v3, p0, Lcom/jcraft/jsch/JSch;->identityRepository:Lcom/jcraft/jsch/IdentityRepository;

    invoke-interface {v2}, Lcom/jcraft/jsch/Identity;->getPublicKeyBlob()[B

    move-result-object v4

    invoke-interface {v3, v4}, Lcom/jcraft/jsch/IdentityRepository;->remove([B)Z

    goto :goto_20

    .line 487
    .end local v2    # "identity":Lcom/jcraft/jsch/Identity;
    :cond_3b
    return-void
.end method

.method protected removeSession(Lcom/jcraft/jsch/Session;)Z
    .registers 4
    .param p1, "session"    # Lcom/jcraft/jsch/Session;

    .prologue
    .line 271
    iget-object v1, p0, Lcom/jcraft/jsch/JSch;->sessionPool:Ljava/util/Vector;

    monitor-enter v1

    .line 272
    :try_start_3
    iget-object v0, p0, Lcom/jcraft/jsch/JSch;->sessionPool:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->remove(Ljava/lang/Object;)Z

    move-result v0

    monitor-exit v1

    return v0

    .line 273
    :catchall_b
    move-exception v0

    monitor-exit v1
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_b

    throw v0
.end method

.method public setConfigRepository(Lcom/jcraft/jsch/ConfigRepository;)V
    .registers 2
    .param p1, "configRepository"    # Lcom/jcraft/jsch/ConfigRepository;

    .prologue
    .line 164
    iput-object p1, p0, Lcom/jcraft/jsch/JSch;->configRepository:Lcom/jcraft/jsch/ConfigRepository;

    .line 165
    return-void
.end method

.method public setHostKeyRepository(Lcom/jcraft/jsch/HostKeyRepository;)V
    .registers 2
    .param p1, "hkrepo"    # Lcom/jcraft/jsch/HostKeyRepository;

    .prologue
    .line 285
    iput-object p1, p0, Lcom/jcraft/jsch/JSch;->known_hosts:Lcom/jcraft/jsch/HostKeyRepository;

    .line 286
    return-void
.end method

.method public declared-synchronized setIdentityRepository(Lcom/jcraft/jsch/IdentityRepository;)V
    .registers 3
    .param p1, "identityRepository"    # Lcom/jcraft/jsch/IdentityRepository;

    .prologue
    .line 147
    monitor-enter p0

    if-nez p1, :cond_9

    .line 148
    :try_start_3
    iget-object v0, p0, Lcom/jcraft/jsch/JSch;->defaultIdentityRepository:Lcom/jcraft/jsch/IdentityRepository;

    iput-object v0, p0, Lcom/jcraft/jsch/JSch;->identityRepository:Lcom/jcraft/jsch/IdentityRepository;
    :try_end_7
    .catchall {:try_start_3 .. :try_end_7} :catchall_c

    .line 153
    :goto_7
    monitor-exit p0

    return-void

    .line 151
    :cond_9
    :try_start_9
    iput-object p1, p0, Lcom/jcraft/jsch/JSch;->identityRepository:Lcom/jcraft/jsch/IdentityRepository;
    :try_end_b
    .catchall {:try_start_9 .. :try_end_b} :catchall_c

    goto :goto_7

    .line 147
    :catchall_c
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setKnownHosts(Ljava/io/InputStream;)V
    .registers 4
    .param p1, "stream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 320
    iget-object v0, p0, Lcom/jcraft/jsch/JSch;->known_hosts:Lcom/jcraft/jsch/HostKeyRepository;

    if-nez v0, :cond_b

    new-instance v0, Lcom/jcraft/jsch/KnownHosts;

    invoke-direct {v0, p0}, Lcom/jcraft/jsch/KnownHosts;-><init>(Lcom/jcraft/jsch/JSch;)V

    iput-object v0, p0, Lcom/jcraft/jsch/JSch;->known_hosts:Lcom/jcraft/jsch/HostKeyRepository;

    .line 321
    :cond_b
    iget-object v0, p0, Lcom/jcraft/jsch/JSch;->known_hosts:Lcom/jcraft/jsch/HostKeyRepository;

    instance-of v0, v0, Lcom/jcraft/jsch/KnownHosts;

    if-eqz v0, :cond_1c

    .line 322
    iget-object v1, p0, Lcom/jcraft/jsch/JSch;->known_hosts:Lcom/jcraft/jsch/HostKeyRepository;

    monitor-enter v1

    .line 323
    :try_start_14
    iget-object v0, p0, Lcom/jcraft/jsch/JSch;->known_hosts:Lcom/jcraft/jsch/HostKeyRepository;

    check-cast v0, Lcom/jcraft/jsch/KnownHosts;

    invoke-virtual {v0, p1}, Lcom/jcraft/jsch/KnownHosts;->setKnownHosts(Ljava/io/InputStream;)V

    .line 324
    monitor-exit v1

    .line 326
    :cond_1c
    return-void

    .line 324
    :catchall_1d
    move-exception v0

    monitor-exit v1
    :try_end_1f
    .catchall {:try_start_14 .. :try_end_1f} :catchall_1d

    throw v0
.end method

.method public setKnownHosts(Ljava/lang/String;)V
    .registers 4
    .param p1, "filename"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 300
    iget-object v0, p0, Lcom/jcraft/jsch/JSch;->known_hosts:Lcom/jcraft/jsch/HostKeyRepository;

    if-nez v0, :cond_b

    new-instance v0, Lcom/jcraft/jsch/KnownHosts;

    invoke-direct {v0, p0}, Lcom/jcraft/jsch/KnownHosts;-><init>(Lcom/jcraft/jsch/JSch;)V

    iput-object v0, p0, Lcom/jcraft/jsch/JSch;->known_hosts:Lcom/jcraft/jsch/HostKeyRepository;

    .line 301
    :cond_b
    iget-object v0, p0, Lcom/jcraft/jsch/JSch;->known_hosts:Lcom/jcraft/jsch/HostKeyRepository;

    instance-of v0, v0, Lcom/jcraft/jsch/KnownHosts;

    if-eqz v0, :cond_1c

    .line 302
    iget-object v1, p0, Lcom/jcraft/jsch/JSch;->known_hosts:Lcom/jcraft/jsch/HostKeyRepository;

    monitor-enter v1

    .line 303
    :try_start_14
    iget-object v0, p0, Lcom/jcraft/jsch/JSch;->known_hosts:Lcom/jcraft/jsch/HostKeyRepository;

    check-cast v0, Lcom/jcraft/jsch/KnownHosts;

    invoke-virtual {v0, p1}, Lcom/jcraft/jsch/KnownHosts;->setKnownHosts(Ljava/lang/String;)V

    .line 304
    monitor-exit v1

    .line 306
    :cond_1c
    return-void

    .line 304
    :catchall_1d
    move-exception v0

    monitor-exit v1
    :try_end_1f
    .catchall {:try_start_14 .. :try_end_1f} :catchall_1d

    throw v0
.end method
