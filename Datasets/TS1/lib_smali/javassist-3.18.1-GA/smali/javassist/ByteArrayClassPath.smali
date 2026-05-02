.class public Ljavassist/ByteArrayClassPath;
.super Ljava/lang/Object;
.source "ByteArrayClassPath.java"

# interfaces
.implements Ljavassist/ClassPath;


# instance fields
.field protected classfile:[B

.field protected classname:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;[B)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "classfile"    # [B

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    iput-object p1, p0, Ljavassist/ByteArrayClassPath;->classname:Ljava/lang/String;

    .line 62
    iput-object p2, p0, Ljavassist/ByteArrayClassPath;->classfile:[B

    .line 63
    return-void
.end method


# virtual methods
.method public close()V
    .registers 1

    .prologue
    .line 68
    return-void
.end method

.method public find(Ljava/lang/String;)Ljava/net/URL;
    .registers 6
    .param p1, "classname"    # Ljava/lang/String;

    .prologue
    .line 88
    iget-object v1, p0, Ljavassist/ByteArrayClassPath;->classname:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3d

    .line 89
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v2, 0x2e

    const/16 v3, 0x2f

    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".class"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 92
    .local v0, "cname":Ljava/lang/String;
    :try_start_23
    new-instance v1, Ljava/net/URL;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "file:/ByteArrayClassPath/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_3b
    .catch Ljava/net/MalformedURLException; {:try_start_23 .. :try_end_3b} :catch_3c

    .line 97
    .end local v0    # "cname":Ljava/lang/String;
    :goto_3b
    return-object v1

    .line 94
    .restart local v0    # "cname":Ljava/lang/String;
    :catch_3c
    move-exception v1

    .line 97
    .end local v0    # "cname":Ljava/lang/String;
    :cond_3d
    const/4 v1, 0x0

    goto :goto_3b
.end method

.method public openClassfile(Ljava/lang/String;)Ljava/io/InputStream;
    .registers 4
    .param p1, "classname"    # Ljava/lang/String;

    .prologue
    .line 78
    iget-object v0, p0, Ljavassist/ByteArrayClassPath;->classname:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    .line 79
    new-instance v0, Ljava/io/ByteArrayInputStream;

    iget-object v1, p0, Ljavassist/ByteArrayClassPath;->classfile:[B

    invoke-direct {v0, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 81
    :goto_f
    return-object v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 71
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "byte[]:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Ljavassist/ByteArrayClassPath;->classname:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
