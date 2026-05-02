.class public Lcom/fasterxml/jackson/core/util/VersionUtil;
.super Ljava/lang/Object;
.source "VersionUtil.java"


# static fields
.field private static final V_SEP:Ljava/util/regex/Pattern;


# instance fields
.field private final _v:Lcom/fasterxml/jackson/core/Version;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 25
    const-string v0, "[-_./;:]"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/fasterxml/jackson/core/util/VersionUtil;->V_SEP:Ljava/util/regex/Pattern;

    return-void
.end method

.method protected constructor <init>()V
    .registers 6

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    const/4 v1, 0x0

    .line 42
    .local v1, "v":Lcom/fasterxml/jackson/core/Version;
    :try_start_4
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-static {v2}, Lcom/fasterxml/jackson/core/util/VersionUtil;->versionFor(Ljava/lang/Class;)Lcom/fasterxml/jackson/core/Version;
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_b} :catch_15

    move-result-object v1

    .line 46
    :goto_c
    if-nez v1, :cond_12

    .line 47
    invoke-static {}, Lcom/fasterxml/jackson/core/Version;->unknownVersion()Lcom/fasterxml/jackson/core/Version;

    move-result-object v1

    .line 49
    :cond_12
    iput-object v1, p0, Lcom/fasterxml/jackson/core/util/VersionUtil;->_v:Lcom/fasterxml/jackson/core/Version;

    .line 50
    return-void

    .line 43
    :catch_15
    move-exception v0

    .line 44
    .local v0, "e":Ljava/lang/Exception;
    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "ERROR: Failed to load Version information from "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_c
.end method

.method private static final _close(Ljava/io/Closeable;)V
    .registers 2
    .param p0, "c"    # Ljava/io/Closeable;

    .prologue
    .line 202
    :try_start_0
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_4

    .line 204
    :goto_3
    return-void

    .line 203
    :catch_4
    move-exception v0

    goto :goto_3
.end method

.method private static doReadVersion(Ljava/io/Reader;)Lcom/fasterxml/jackson/core/Version;
    .registers 6
    .param p0, "r"    # Ljava/io/Reader;

    .prologue
    .line 119
    const/4 v3, 0x0

    .local v3, "version":Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "group":Ljava/lang/String;
    const/4 v0, 0x0

    .line 121
    .local v0, "artifact":Ljava/lang/String;
    new-instance v1, Ljava/io/BufferedReader;

    invoke-direct {v1, p0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 123
    .local v1, "br":Ljava/io/BufferedReader;
    :try_start_8
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    .line 124
    if-eqz v3, :cond_18

    .line 125
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    .line 126
    if-eqz v2, :cond_18

    .line 127
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_17
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_17} :catch_2c
    .catchall {:try_start_8 .. :try_end_17} :catchall_31

    move-result-object v0

    .line 132
    :cond_18
    invoke-static {v1}, Lcom/fasterxml/jackson/core/util/VersionUtil;->_close(Ljava/io/Closeable;)V

    .line 135
    :goto_1b
    if-eqz v2, :cond_21

    .line 136
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 138
    :cond_21
    if-eqz v0, :cond_27

    .line 139
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 141
    :cond_27
    invoke-static {v3, v2, v0}, Lcom/fasterxml/jackson/core/util/VersionUtil;->parseVersion(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/fasterxml/jackson/core/Version;

    move-result-object v4

    return-object v4

    .line 130
    :catch_2c
    move-exception v4

    .line 132
    invoke-static {v1}, Lcom/fasterxml/jackson/core/util/VersionUtil;->_close(Ljava/io/Closeable;)V

    goto :goto_1b

    :catchall_31
    move-exception v4

    invoke-static {v1}, Lcom/fasterxml/jackson/core/util/VersionUtil;->_close(Ljava/io/Closeable;)V

    throw v4
.end method

.method public static mavenVersionFor(Ljava/lang/ClassLoader;Ljava/lang/String;Ljava/lang/String;)Lcom/fasterxml/jackson/core/Version;
    .registers 11
    .param p0, "cl"    # Ljava/lang/ClassLoader;
    .param p1, "groupId"    # Ljava/lang/String;
    .param p2, "artifactId"    # Ljava/lang/String;

    .prologue
    .line 158
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "META-INF/maven/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\\."

    const-string v7, "/"

    invoke-virtual {p1, v6, v7}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/pom.properties"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Ljava/lang/ClassLoader;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    .line 160
    .local v0, "pomProperties":Ljava/io/InputStream;
    if-eqz v0, :cond_57

    .line 162
    :try_start_31
    new-instance v3, Ljava/util/Properties;

    invoke-direct {v3}, Ljava/util/Properties;-><init>()V

    .line 163
    .local v3, "props":Ljava/util/Properties;
    invoke-virtual {v3, v0}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V

    .line 164
    const-string v5, "version"

    invoke-virtual {v3, v5}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 165
    .local v4, "versionStr":Ljava/lang/String;
    const-string v5, "artifactId"

    invoke-virtual {v3, v5}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 166
    .local v1, "pomPropertiesArtifactId":Ljava/lang/String;
    const-string v5, "groupId"

    invoke-virtual {v3, v5}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 167
    .local v2, "pomPropertiesGroupId":Ljava/lang/String;
    invoke-static {v4, v2, v1}, Lcom/fasterxml/jackson/core/util/VersionUtil;->parseVersion(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/fasterxml/jackson/core/Version;
    :try_end_4e
    .catch Ljava/io/IOException; {:try_start_31 .. :try_end_4e} :catch_53
    .catchall {:try_start_31 .. :try_end_4e} :catchall_5c

    move-result-object v5

    .line 171
    invoke-static {v0}, Lcom/fasterxml/jackson/core/util/VersionUtil;->_close(Ljava/io/Closeable;)V

    .line 174
    .end local v1    # "pomPropertiesArtifactId":Ljava/lang/String;
    .end local v2    # "pomPropertiesGroupId":Ljava/lang/String;
    .end local v3    # "props":Ljava/util/Properties;
    .end local v4    # "versionStr":Ljava/lang/String;
    :goto_52
    return-object v5

    .line 168
    :catch_53
    move-exception v5

    .line 171
    invoke-static {v0}, Lcom/fasterxml/jackson/core/util/VersionUtil;->_close(Ljava/io/Closeable;)V

    .line 174
    :cond_57
    invoke-static {}, Lcom/fasterxml/jackson/core/Version;->unknownVersion()Lcom/fasterxml/jackson/core/Version;

    move-result-object v5

    goto :goto_52

    .line 171
    :catchall_5c
    move-exception v5

    invoke-static {v0}, Lcom/fasterxml/jackson/core/util/VersionUtil;->_close(Ljava/io/Closeable;)V

    throw v5
.end method

.method public static packageVersionFor(Ljava/lang/Class;)Lcom/fasterxml/jackson/core/Version;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/fasterxml/jackson/core/Version;"
        }
    .end annotation

    .prologue
    .line 104
    .local p0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Package;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ".PackageVersion"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 105
    .local v2, "versionInfoClassName":Ljava/lang/String;
    const/4 v3, 0x1

    invoke-virtual {p0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v4

    invoke-static {v2, v3, v4}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_23} :catch_49

    move-result-object v1

    .line 108
    .local v1, "vClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_24
    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/fasterxml/jackson/core/Versioned;

    invoke-interface {v3}, Lcom/fasterxml/jackson/core/Versioned;->version()Lcom/fasterxml/jackson/core/Version;
    :try_end_2d
    .catch Ljava/lang/Exception; {:try_start_24 .. :try_end_2d} :catch_2f

    move-result-object v3

    .line 113
    .end local v1    # "vClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "versionInfoClassName":Ljava/lang/String;
    :goto_2e
    return-object v3

    .line 109
    .restart local v1    # "vClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v2    # "versionInfoClassName":Ljava/lang/String;
    :catch_2f
    move-exception v0

    .line 110
    .local v0, "e":Ljava/lang/Exception;
    :try_start_30
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Failed to get Versioned out of "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_49
    .catch Ljava/lang/Exception; {:try_start_30 .. :try_end_49} :catch_49

    .line 112
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "vClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "versionInfoClassName":Ljava/lang/String;
    :catch_49
    move-exception v0

    .line 113
    .restart local v0    # "e":Ljava/lang/Exception;
    const/4 v3, 0x0

    goto :goto_2e
.end method

.method public static parseVersion(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/fasterxml/jackson/core/Version;
    .registers 12
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "groupId"    # Ljava/lang/String;
    .param p2, "artifactId"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    const/4 v8, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v3, 0x0

    .line 179
    if-eqz p0, :cond_3e

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_3e

    .line 180
    sget-object v0, Lcom/fasterxml/jackson/core/util/VersionUtil;->V_SEP:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->split(Ljava/lang/CharSequence;)[Ljava/lang/String;

    move-result-object v7

    .line 181
    .local v7, "parts":[Ljava/lang/String;
    new-instance v0, Lcom/fasterxml/jackson/core/Version;

    aget-object v1, v7, v3

    invoke-static {v1}, Lcom/fasterxml/jackson/core/util/VersionUtil;->parseVersionPart(Ljava/lang/String;)I

    move-result v1

    array-length v2, v7

    if-le v2, v5, :cond_3c

    aget-object v2, v7, v5

    invoke-static {v2}, Lcom/fasterxml/jackson/core/util/VersionUtil;->parseVersionPart(Ljava/lang/String;)I

    move-result v2

    :goto_28
    array-length v5, v7

    if-le v5, v6, :cond_31

    aget-object v3, v7, v6

    invoke-static {v3}, Lcom/fasterxml/jackson/core/util/VersionUtil;->parseVersionPart(Ljava/lang/String;)I

    move-result v3

    :cond_31
    array-length v5, v7

    if-le v5, v8, :cond_36

    aget-object v4, v7, v8

    :cond_36
    move-object v5, p1

    move-object v6, p2

    invoke-direct/range {v0 .. v6}, Lcom/fasterxml/jackson/core/Version;-><init>(IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 187
    .end local v7    # "parts":[Ljava/lang/String;
    :goto_3b
    return-object v0

    .restart local v7    # "parts":[Ljava/lang/String;
    :cond_3c
    move v2, v3

    .line 181
    goto :goto_28

    .end local v7    # "parts":[Ljava/lang/String;
    :cond_3e
    move-object v0, v4

    .line 187
    goto :goto_3b
.end method

.method protected static parseVersionPart(Ljava/lang/String;)I
    .registers 7
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 191
    const/4 v3, 0x0

    .line 192
    .local v3, "number":I
    const/4 v1, 0x0

    .local v1, "i":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .local v2, "len":I
    :goto_6
    if-ge v1, v2, :cond_14

    .line 193
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 194
    .local v0, "c":C
    const/16 v4, 0x39

    if-gt v0, v4, :cond_14

    const/16 v4, 0x30

    if-ge v0, v4, :cond_15

    .line 197
    .end local v0    # "c":C
    :cond_14
    return v3

    .line 195
    .restart local v0    # "c":C
    :cond_15
    mul-int/lit8 v4, v3, 0xa

    add-int/lit8 v5, v0, -0x30

    add-int v3, v4, v5

    .line 192
    add-int/lit8 v1, v1, 0x1

    goto :goto_6
.end method

.method public static final throwInternal()V
    .registers 2

    .prologue
    .line 213
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Internal error: this code path should never get executed"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static versionFor(Ljava/lang/Class;)Lcom/fasterxml/jackson/core/Version;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/fasterxml/jackson/core/Version;"
        }
    .end annotation

    .prologue
    .line 76
    .local p0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p0}, Lcom/fasterxml/jackson/core/util/VersionUtil;->packageVersionFor(Ljava/lang/Class;)Lcom/fasterxml/jackson/core/Version;

    move-result-object v2

    .line 77
    .local v2, "packageVersion":Lcom/fasterxml/jackson/core/Version;
    if-eqz v2, :cond_7

    .line 90
    .end local v2    # "packageVersion":Lcom/fasterxml/jackson/core/Version;
    :goto_6
    return-object v2

    .line 80
    .restart local v2    # "packageVersion":Lcom/fasterxml/jackson/core/Version;
    :cond_7
    const-string v4, "VERSION.txt"

    invoke-virtual {p0, v4}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    .line 81
    .local v1, "in":Ljava/io/InputStream;
    if-nez v1, :cond_14

    .line 82
    invoke-static {}, Lcom/fasterxml/jackson/core/Version;->unknownVersion()Lcom/fasterxml/jackson/core/Version;

    move-result-object v2

    goto :goto_6

    .line 85
    :cond_14
    :try_start_14
    new-instance v3, Ljava/io/InputStreamReader;

    const-string v4, "UTF-8"

    invoke-direct {v3, v1, v4}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 86
    .local v3, "reader":Ljava/io/InputStreamReader;
    invoke-static {v3}, Lcom/fasterxml/jackson/core/util/VersionUtil;->doReadVersion(Ljava/io/Reader;)Lcom/fasterxml/jackson/core/Version;
    :try_end_1e
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_14 .. :try_end_1e} :catch_23
    .catchall {:try_start_14 .. :try_end_1e} :catchall_2c

    move-result-object v2

    .line 90
    .end local v2    # "packageVersion":Lcom/fasterxml/jackson/core/Version;
    invoke-static {v1}, Lcom/fasterxml/jackson/core/util/VersionUtil;->_close(Ljava/io/Closeable;)V

    goto :goto_6

    .line 87
    .end local v3    # "reader":Ljava/io/InputStreamReader;
    .restart local v2    # "packageVersion":Lcom/fasterxml/jackson/core/Version;
    :catch_23
    move-exception v0

    .line 88
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    :try_start_24
    invoke-static {}, Lcom/fasterxml/jackson/core/Version;->unknownVersion()Lcom/fasterxml/jackson/core/Version;
    :try_end_27
    .catchall {:try_start_24 .. :try_end_27} :catchall_2c

    move-result-object v2

    .line 90
    .end local v2    # "packageVersion":Lcom/fasterxml/jackson/core/Version;
    invoke-static {v1}, Lcom/fasterxml/jackson/core/util/VersionUtil;->_close(Ljava/io/Closeable;)V

    goto :goto_6

    .end local v0    # "e":Ljava/io/UnsupportedEncodingException;
    .restart local v2    # "packageVersion":Lcom/fasterxml/jackson/core/Version;
    :catchall_2c
    move-exception v4

    invoke-static {v1}, Lcom/fasterxml/jackson/core/util/VersionUtil;->_close(Ljava/io/Closeable;)V

    throw v4
.end method


# virtual methods
.method public version()Lcom/fasterxml/jackson/core/Version;
    .registers 2

    .prologue
    .line 52
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/VersionUtil;->_v:Lcom/fasterxml/jackson/core/Version;

    return-object v0
.end method
