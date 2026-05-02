.class final Ljavassist/JarClassPath;
.super Ljava/lang/Object;
.source "ClassPoolTail.java"

# interfaces
.implements Ljavassist/ClassPath;


# instance fields
.field jarfile:Ljava/util/jar/JarFile;

.field jarfileURL:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "pathname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 127
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 129
    :try_start_3
    new-instance v0, Ljava/util/jar/JarFile;

    invoke-direct {v0, p1}, Ljava/util/jar/JarFile;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Ljavassist/JarClassPath;->jarfile:Ljava/util/jar/JarFile;

    .line 130
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getCanonicalFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->toURI()Ljava/net/URI;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/URI;->toURL()Ljava/net/URL;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Ljavassist/JarClassPath;->jarfileURL:Ljava/lang/String;
    :try_end_21
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_21} :catch_22

    .line 132
    return-void

    .line 134
    :catch_22
    move-exception v0

    .line 135
    new-instance v0, Ljavassist/NotFoundException;

    invoke-direct {v0, p1}, Ljavassist/NotFoundException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public close()V
    .registers 2

    .prologue
    .line 168
    :try_start_0
    iget-object v0, p0, Ljavassist/JarClassPath;->jarfile:Ljava/util/jar/JarFile;

    invoke-virtual {v0}, Ljava/util/jar/JarFile;->close()V

    .line 169
    const/4 v0, 0x0

    iput-object v0, p0, Ljavassist/JarClassPath;->jarfile:Ljava/util/jar/JarFile;
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_8} :catch_9

    .line 172
    :goto_8
    return-void

    .line 171
    :catch_9
    move-exception v0

    goto :goto_8
.end method

.method public find(Ljava/lang/String;)Ljava/net/URL;
    .registers 7
    .param p1, "classname"    # Ljava/lang/String;

    .prologue
    .line 155
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v3, 0x2e

    const/16 v4, 0x2f

    invoke-virtual {p1, v3, v4}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".class"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 156
    .local v0, "jarname":Ljava/lang/String;
    iget-object v2, p0, Ljavassist/JarClassPath;->jarfile:Ljava/util/jar/JarFile;

    invoke-virtual {v2, v0}, Ljava/util/jar/JarFile;->getJarEntry(Ljava/lang/String;)Ljava/util/jar/JarEntry;

    move-result-object v1

    .line 157
    .local v1, "je":Ljava/util/jar/JarEntry;
    if-eqz v1, :cond_49

    .line 159
    :try_start_23
    new-instance v2, Ljava/net/URL;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "jar:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Ljavassist/JarClassPath;->jarfileURL:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "!/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_47
    .catch Ljava/net/MalformedURLException; {:try_start_23 .. :try_end_47} :catch_48

    .line 163
    :goto_47
    return-object v2

    .line 161
    :catch_48
    move-exception v2

    .line 163
    :cond_49
    const/4 v2, 0x0

    goto :goto_47
.end method

.method public openClassfile(Ljava/lang/String;)Ljava/io/InputStream;
    .registers 7
    .param p1, "classname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 142
    :try_start_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v3, 0x2e

    const/16 v4, 0x2f

    invoke-virtual {p1, v3, v4}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".class"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 143
    .local v0, "jarname":Ljava/lang/String;
    iget-object v2, p0, Ljavassist/JarClassPath;->jarfile:Ljava/util/jar/JarFile;

    invoke-virtual {v2, v0}, Ljava/util/jar/JarFile;->getJarEntry(Ljava/lang/String;)Ljava/util/jar/JarEntry;

    move-result-object v1

    .line 144
    .local v1, "je":Ljava/util/jar/JarEntry;
    if-eqz v1, :cond_2a

    .line 145
    iget-object v2, p0, Ljavassist/JarClassPath;->jarfile:Ljava/util/jar/JarFile;

    invoke-virtual {v2, v1}, Ljava/util/jar/JarFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;
    :try_end_28
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_28} :catch_2c

    move-result-object v2

    .line 147
    :goto_29
    return-object v2

    :cond_2a
    const/4 v2, 0x0

    goto :goto_29

    .line 149
    .end local v0    # "jarname":Ljava/lang/String;
    .end local v1    # "je":Ljava/util/jar/JarEntry;
    :catch_2c
    move-exception v2

    .line 150
    new-instance v2, Ljavassist/NotFoundException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "broken jar file?: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Ljavassist/JarClassPath;->jarfile:Ljava/util/jar/JarFile;

    invoke-virtual {v4}, Ljava/util/jar/JarFile;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljavassist/NotFoundException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 175
    iget-object v0, p0, Ljavassist/JarClassPath;->jarfile:Ljava/util/jar/JarFile;

    if-nez v0, :cond_7

    const-string v0, "<null>"

    :goto_6
    return-object v0

    :cond_7
    iget-object v0, p0, Ljavassist/JarClassPath;->jarfile:Ljava/util/jar/JarFile;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_6
.end method
